"""Conformance — inter-session messaging fixture (`t02-33f`).

Pairs with `task:t02-33` ("Inter-session messaging plumbing") per
[milestones/v0.2a-multi-user-single-node.md](../../docs/dev/milestones/v0.2a-multi-user-single-node.md)
§"Freeze gates" #5 and
[decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).

The freeze gate this fixture proves:

    "Inter-session messaging round-trips: typed envelope authored,
     surfacing rule fires on the next tick, recipient marks read,
     surfacing rule no longer fires; capability-bounded send and
     per-recipient broadcast read-state hold; the full sequence
     replays byte-identically across two boots."

Concretely the scenario walks the full v0.2a inter-session-messaging
surface end-to-end against the role-default capability fibers from
[`init_boot.bootstrap_users.ROLE_CAPABILITIES`][src.init_boot.bootstrap_users]
(authority:
[specs/process/inter-session-messaging.md](../../docs/dev/specs/process/inter-session-messaging.md)
§11):

* **§11.2 Typed kinds.** All five canonical ``msg-type`` values
  (``task-handoff``, ``query``, ``response``, ``completed``,
  ``conflict``) round-trip with their required content-cell
  predicates; an unknown ``msg-type`` is rejected with
  :data:`substrate.error_codes.PCS_MESSAGE_TYPE_UNKNOWN`.
* **§11.3 Capability-bounded send.** A sender holding only
  ``signal:session-message:query`` is permitted to send a ``query``
  but denied a ``task-handoff`` with
  :data:`substrate.error_codes.PCA_SCOPE_INSUFFICIENT`; the gate-
  ordering invariant of capability-permissions §6.3 means the denied
  call writes neither an event nor a fiber.
* **§11.4 Broadcast.** A message addressed to a list of recipients
  surfaces independently per-recipient; marking one recipient's copy
  read leaves the other recipient's ``has-unread-message`` cell in
  place (per-recipient ``read`` cells do not interfere).
* **§11.5 Threading.** A ``response`` referencing a prior ``query``
  via ``responds-to`` is reachable by projecting the closure-rule
  predicate ``(p="responds-to", o=<query.slug>, v="True")``.
* **§11.1 + §11.7 Round-trip + replay.** The round-trip itself
  (author → surface → mark read → surface idempotent) is exercised
  in the scenario; the byte-identical replay leg
  (``test_scenario_replays_byte_identical``) reruns the full
  provision + scenario sequence against fresh substrates and
  asserts ``events.jsonl`` is bit-for-bit identical.

Sources of non-determinism are pinned exactly as in
``test_t02_34f_multi_user_authoring.py``:

* The event log is initialized **without** ``wall_clock_ns`` so the
  genesis event's canonical bytes are stable.
* :func:`process.session._new_slug` reads ``secrets.token_hex`` — we
  monkeypatch the module-level ``secrets`` attribute to a deterministic
  counter so session slugs match across runs.
* :func:`process.session_messaging._new_msg_slug` reads
  ``secrets.token_hex(8)`` separately — we monkeypatch
  ``process.session_messaging.secrets`` with its own counter so
  message slugs also match across runs.
* :func:`process.session_messaging.send_message`,
  :func:`process.session_messaging.mark_read`, and
  :func:`process.session_messaging.surface_unread_messages` each pass
  ``time.time_ns()`` to ``event_log.append``, and the event log
  *does* include ``wall_clock_ns`` in canonical bytes when it is
  non-``None`` (see :func:`storage.event_log.make_event`). We
  monkeypatch the module-level ``time`` attribute on
  ``process.session_messaging`` with a deterministic counter so
  every messaging-emitted event records a fixed clock reading.

Comparing ``events.jsonl`` byte-for-byte across the two runs proves
the freeze gate: the inter-session-messaging surface is fully
deterministic over its inputs, which is the substrate property that
makes the v0.2a "every event replays" claim load-bearing for v0.4
federation diversity (per
[`decisions/trusting-trust-bootstrap-path.md`](../../docs/dev/decisions/trusting-trust-bootstrap-path.md)).
"""

from __future__ import annotations

from pathlib import Path

import pytest

from init_boot.bootstrap_users import (
    ROLE_CAPABILITIES,
    BootstrapManifest,
    BootstrapUserEntry,
    ensure_users_from_manifest,
)
from process import session as session_mod
from process import session_messaging as session_messaging_mod
from process.session import open_session
from process.session_messaging import (
    CANONICAL_MSG_TYPES,
    MSG_TYPE_REQUIRED_CONTENT,
    list_unread,
    mark_read,
    send_message,
    surface_unread_messages,
)
from storage.event_log import EVENT_LOG_FILENAME, EventLog
from storage.storage_layout import StorageLayout
from substrate import stdlib
from substrate.error_codes import (
    PCA_SCOPE_INSUFFICIENT,
    PCS_MESSAGE_TYPE_UNKNOWN,
    SubstrateError,
)


_NODE_ID = "test-node"


# ---------------------------------------------------------------------------
# Deterministic slug sources — for both session._new_slug and
# session_messaging._new_msg_slug. Each module reads ``secrets.token_hex``
# off its own module-level ``secrets`` import, so we monkeypatch each.
# ---------------------------------------------------------------------------


class _DeterministicSecrets:
    """Stand-in for ``secrets.token_hex`` that yields a deterministic counter.

    Each instance keeps its own counter — the replay leg constructs one
    instance per run so both runs draw from identical streams.
    """

    def __init__(self) -> None:
        self._n = 0

    def token_hex(self, n: int) -> str:  # signature mirrors secrets.token_hex
        self._n += 1
        # 16-hex-char fixed-width counter — matches token_hex(8)'s output
        # width (used by both session and session_messaging).
        return f"{self._n:016x}"


class _DeterministicTime:
    """Stand-in for ``time.time_ns`` that yields a deterministic counter.

    ``process.session_messaging`` passes ``time.time_ns()`` to every
    ``event_log.append`` call; the event log embeds ``wall_clock_ns``
    in canonical event bytes when it is non-``None`` (see
    :func:`storage.event_log.make_event`), so this must be pinned for
    byte-identical replay.
    """

    def __init__(self) -> None:
        self._n = 0

    def time_ns(self) -> int:  # signature mirrors time.time_ns
        self._n += 1
        return self._n


@pytest.fixture
def deterministic_slugs(monkeypatch):
    """Pin both slug streams and the messaging clock to counters."""
    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    monkeypatch.setattr(
        session_messaging_mod, "secrets", _DeterministicSecrets(),
    )
    monkeypatch.setattr(
        session_messaging_mod, "time", _DeterministicTime(),
    )


# ---------------------------------------------------------------------------
# Fixture builders — provisioning + scenario
# ---------------------------------------------------------------------------


def _three_role_manifest() -> BootstrapManifest:
    """admin (sender) / member (recipient) / member (broadcast peer).

    All three roles need a ``signal:session-message:*`` cap to participate
    — admin gets it via ``signal:*``, members get it explicitly per
    ``ROLE_CAPABILITIES``. (An observer carries neither, and is excluded
    from this fixture by design — its denial path is anchored in the
    spec §11.3 capability-bounded test below using an explicit narrow
    cap, not the observer role.)
    """
    return BootstrapManifest(
        users=[
            BootstrapUserEntry(
                slug="user:captain", display_name="Captain", role="admin",
            ),
            BootstrapUserEntry(
                slug="user:alice", display_name="Alice", role="member",
            ),
            BootstrapUserEntry(
                slug="user:bob", display_name="Bob", role="member",
            ),
        ]
    )


def _provision(root: Path) -> tuple[StorageLayout, EventLog]:
    """Stand up a fresh substrate with the 3-user manifest provisioned.

    The event log is initialized without ``wall_clock_ns`` so its
    canonical bytes are deterministic.
    """
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id=_NODE_ID)
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id=_NODE_ID,
        manifest=_three_role_manifest(),
    )
    return layout, log


def _run_scenario(layout: StorageLayout, log: EventLog) -> dict:
    """Execute the §11 messaging surface and capture every observable.

    Sequence:

    1. Open three sessions (sender admin, recipient_a member,
       recipient_b member). Sender carries ``signal:*``; recipients
       carry ``signal:session-message:*`` per ``ROLE_CAPABILITIES``.
    2. §11.2: send each canonical ``msg-type`` (handoff/query/
       completed/conflict from sender; response from recipient_a back
       to sender). Reject an unknown ``msg-type``.
    3. §11.4: broadcast a single handoff to both recipients.
    4. §11.1: surface unread for all recipients; recipient_a marks
       its broadcast copy read; surface again confirms
       (recipient_a clean, recipient_b still has the broadcast).
    5. §11.5: project ``(*, responds-to, query.slug, True)`` to confirm
       the response is reachable from the query.
    6. §11.3: a narrow-cap session is denied a wider msg-type; the
       gate-ordering invariant is captured by recording the event-log
       height before/after the denied call.
    """
    sender_sess = open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner="user:captain", capabilities=ROLE_CAPABILITIES["admin"],
    )
    recipient_a = open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner="user:alice", capabilities=ROLE_CAPABILITIES["member"],
    )
    recipient_b = open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner="user:bob", capabilities=ROLE_CAPABILITIES["member"],
    )

    # §11.2 — every canonical msg-type round-trips with its required content.
    handoff = send_message(
        layout=layout, event_log=log, node_id=_NODE_ID,
        from_session=sender_sess.slug, to_session=recipient_a.slug,
        msg_type="task-handoff",
        content={"task-id": "task:demo", "handoff-reason": "review"},
    )
    query = send_message(
        layout=layout, event_log=log, node_id=_NODE_ID,
        from_session=sender_sess.slug, to_session=recipient_a.slug,
        msg_type="query",
        content={"question-cell": "cell:question-1"},
    )
    response = send_message(
        layout=layout, event_log=log, node_id=_NODE_ID,
        # Per spec §9 attribution gate: the response must come from
        # the query's recipient back to the asker.
        from_session=recipient_a.slug, to_session=sender_sess.slug,
        msg_type="response",
        content={"responds-to": query.slug, "answer-cell": "cell:answer-1"},
    )
    completed = send_message(
        layout=layout, event_log=log, node_id=_NODE_ID,
        from_session=sender_sess.slug, to_session=recipient_a.slug,
        msg_type="completed",
        content={"task-id": "task:demo", "completion-cell": "cell:done-1"},
    )
    conflict = send_message(
        layout=layout, event_log=log, node_id=_NODE_ID,
        from_session=sender_sess.slug, to_session=recipient_a.slug,
        msg_type="conflict",
        content={
            "conflict-on": "cell:disputed",
            "claimed-value": "True",
            "observed-value": "False",
        },
    )

    # §11.2 — unknown msg-type is rejected; record the failure
    # observable for the scenario test to assert against.
    height_before_unknown = log.height()
    unknown_error: SubstrateError | None = None
    try:
        send_message(
            layout=layout, event_log=log, node_id=_NODE_ID,
            from_session=sender_sess.slug, to_session=recipient_a.slug,
            msg_type="not-a-canonical-kind",
            content={"any": "thing"},
        )
    except SubstrateError as e:
        unknown_error = e
    height_after_unknown = log.height()

    # §11.4 — broadcast to both recipients in one envelope.
    broadcast = send_message(
        layout=layout, event_log=log, node_id=_NODE_ID,
        from_session=sender_sess.slug,
        to_session=[recipient_a.slug, recipient_b.slug],
        msg_type="task-handoff",
        content={"task-id": "task:fanout", "handoff-reason": "broadcast"},
    )

    # §11.1 — surface unread; recipients see has-unread-message cells.
    surfaced_first = surface_unread_messages(
        layout=layout, event_log=log, node_id=_NODE_ID,
    )

    unread_a_before = list_unread(layout, recipient_a.slug)
    unread_b_before = list_unread(layout, recipient_b.slug)

    # recipient_a marks ONLY the broadcast read; per-recipient read state
    # means recipient_b's broadcast copy is still unread.
    mark_read(
        layout=layout, event_log=log, node_id=_NODE_ID,
        msg_slug=broadcast.slug, reader_session=recipient_a.slug,
    )

    # Re-surface — recipient_b still surfaces the broadcast, recipient_a
    # only surfaces what it had not yet read.
    surfaced_second = surface_unread_messages(
        layout=layout, event_log=log, node_id=_NODE_ID,
    )

    unread_a_after = list_unread(layout, recipient_a.slug)
    unread_b_after = list_unread(layout, recipient_b.slug)

    # §11.5 — threading: the response is reachable from the query via
    # the responds-to predicate on the response's content-cell entity.
    threading_hits = stdlib.project(
        layout,
        stdlib.CellPattern(p="responds-to", o=query.slug, v="True"),
    )

    # §11.3 — capability-bounded send. Open a session that holds only
    # signal:session-message:query. Sending a query succeeds; sending a
    # task-handoff is denied. Capture the event-log height around the
    # denied call to anchor the §6.3 gate-ordering invariant: a denial
    # advances neither an event nor a fiber.
    narrow_sess = open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner="user:alice",
        capabilities=["signal:session-message:query"],
    )
    narrow_allowed = send_message(
        layout=layout, event_log=log, node_id=_NODE_ID,
        from_session=narrow_sess.slug, to_session=recipient_a.slug,
        msg_type="query",
        content={"question-cell": "cell:question-narrow"},
    )
    height_before_denied = log.height()
    narrow_denied: SubstrateError | None = None
    try:
        send_message(
            layout=layout, event_log=log, node_id=_NODE_ID,
            from_session=narrow_sess.slug, to_session=recipient_a.slug,
            msg_type="task-handoff",
            content={"task-id": "task:should-not-land",
                     "handoff-reason": "denied"},
        )
    except SubstrateError as e:
        narrow_denied = e
    height_after_denied = log.height()

    return {
        "sender_session": sender_sess,
        "recipient_a": recipient_a,
        "recipient_b": recipient_b,
        "narrow_session": narrow_sess,
        "handoff": handoff,
        "query": query,
        "response": response,
        "completed": completed,
        "conflict": conflict,
        "broadcast": broadcast,
        "narrow_allowed": narrow_allowed,
        "unknown_error": unknown_error,
        "height_before_unknown": height_before_unknown,
        "height_after_unknown": height_after_unknown,
        "narrow_denied": narrow_denied,
        "height_before_denied": height_before_denied,
        "height_after_denied": height_after_denied,
        "surfaced_first": surfaced_first,
        "surfaced_second": surfaced_second,
        "unread_a_before": unread_a_before,
        "unread_b_before": unread_b_before,
        "unread_a_after": unread_a_after,
        "unread_b_after": unread_b_after,
        "threading_hits": threading_hits,
    }


# ---------------------------------------------------------------------------
# Test 1: scenario semantics — the actual freeze-gate behaviour
# ---------------------------------------------------------------------------


def test_inter_session_messaging_full_surface(
    tmp_path, deterministic_slugs,
):
    """Walk every §11 conformance point and pin every observable.

    This is the freeze-gate-#5 acceptance: the messaging surface
    exhibits typed-kinds, capability-bounded send, broadcast with
    per-recipient read state, and threading exactly as the spec
    claims.
    """
    layout, log = _provision(tmp_path)
    out = _run_scenario(layout, log)

    # §11.2 — every canonical msg-type was successfully authored.
    typed = {out["handoff"].msg_type, out["query"].msg_type,
             out["response"].msg_type, out["completed"].msg_type,
             out["conflict"].msg_type}
    assert typed == set(CANONICAL_MSG_TYPES), (
        "all five canonical msg-types must round-trip"
    )

    # §11.2 — unknown msg-type was rejected with PCS_MESSAGE_TYPE_UNKNOWN
    # AND the denial advanced no event-log state (gate-ordering).
    assert isinstance(out["unknown_error"], SubstrateError)
    assert out["unknown_error"].code == PCS_MESSAGE_TYPE_UNKNOWN
    assert out["height_after_unknown"] == out["height_before_unknown"], (
        "denied unknown-msg-type advanced the event log"
    )

    # §11.4 — broadcast envelope addressed both recipients.
    assert set(out["broadcast"].to_sessions) == {
        out["recipient_a"].slug, out["recipient_b"].slug,
    }

    # §11.1 — surfacing fired and emitted has-unread-message cells.
    surfaced_recipients = {s["recipient"] for s in out["surfaced_first"]}
    assert out["recipient_a"].slug in surfaced_recipients
    assert out["recipient_b"].slug in surfaced_recipients

    # recipient_a's pre-mark-read inbox: handoff + query + completed +
    # conflict + broadcast = 5. recipient_b's: only the broadcast = 1.
    assert len(out["unread_a_before"]) == 5
    assert len(out["unread_b_before"]) == 1
    assert out["unread_b_before"][0]["msg_slug"] == out["broadcast"].slug

    # §11.4 — per-recipient read state. recipient_a marked the broadcast
    # read; recipient_a's unread shrinks by one (to 4); recipient_b
    # is unchanged (still 1).
    assert len(out["unread_a_after"]) == 4
    assert all(
        u["msg_slug"] != out["broadcast"].slug
        for u in out["unread_a_after"]
    )
    assert len(out["unread_b_after"]) == 1
    assert out["unread_b_after"][0]["msg_slug"] == out["broadcast"].slug

    # The second surface tick must NOT re-surface recipient_a's
    # broadcast (it is now read on recipient_a's side); it MAY surface
    # nothing for recipient_b (the existing has-unread-message cell is
    # still in place — surfacing is idempotent under §4).
    second_surfaced = {s["recipient"] for s in out["surfaced_second"]}
    assert out["recipient_a"].slug not in second_surfaced or all(
        out["broadcast"].slug not in s["msg_slugs"]
        for s in out["surfaced_second"]
        if s["recipient"] == out["recipient_a"].slug
    )

    # §11.5 — the response is reachable from the query via responds-to.
    # Spec-level claim: AT LEAST ONE projected hit must map to the
    # response's content entity referencing the query slug. We do not
    # over-constrain to exact cardinality — future closure rules may
    # legitimately surface additional equivalent hits.
    response_thread_hits = [
        h for h in out["threading_hits"]
        if h.s.startswith(out["response"].slug)
    ]
    assert response_thread_hits, (
        "threading: response's content-cell must carry "
        "(p='responds-to', o=<query>, v='True')"
    )

    # §11.2 — each canonical msg-type must persist its required content
    # predicates on the message's content entity. Send-time validation
    # is anchored in the unit suite; here we anchor the on-disk
    # post-condition that the spec's §2 "Required predicates on
    # content-cell" column actually appears in the substrate cells.
    for msg in (out["handoff"], out["query"], out["response"],
                out["completed"], out["conflict"]):
        required = MSG_TYPE_REQUIRED_CONTENT[msg.msg_type]
        content_entity = f"{msg.slug}:content"
        for predicate in required:
            hits = stdlib.project(
                layout,
                stdlib.CellPattern(
                    s=content_entity, p=predicate, v="True",
                ),
            )
            assert hits, (
                f"msg-type {msg.msg_type!r} (slug={msg.slug!r}) is "
                f"missing required content predicate {predicate!r} on "
                f"its content entity — spec §2 Required predicates "
                f"column"
            )

    # §11.3 — narrow-cap sender succeeded at its allowed kind.
    assert out["narrow_allowed"].msg_type == "query"

    # §11.3 — narrow-cap sender was denied the wider kind with
    # PCA_SCOPE_INSUFFICIENT, AND the §6.3 gate-ordering invariant
    # holds: the denied call advanced no event-log state.
    assert isinstance(out["narrow_denied"], SubstrateError)
    assert out["narrow_denied"].code == PCA_SCOPE_INSUFFICIENT
    assert out["height_after_denied"] == out["height_before_denied"], (
        "denied capability-bounded send advanced the event log "
        f"({out['height_before_denied']} -> {out['height_after_denied']})"
    )

    # The narrow session is still open — denial does not transition it.
    assert out["narrow_session"].state == "open"


# ---------------------------------------------------------------------------
# Test 2: byte-identical replay — the freeze gate's determinism leg
# ---------------------------------------------------------------------------


def test_scenario_replays_byte_identical(tmp_path, monkeypatch):
    """Two fresh substrates running the same scenario produce identical events.

    The byte-equality compares ``events.jsonl`` raw bytes. Sources of
    non-determinism are pinned in the fixture's docstring; if either
    leg drifts, this assertion is the fence.
    """
    root_a = tmp_path / "run-a"
    root_b = tmp_path / "run-b"

    # Each leg gets its OWN counters for both slug streams, restored on
    # exit, so the two runs draw from identical slug streams.
    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    monkeypatch.setattr(
        session_messaging_mod, "secrets", _DeterministicSecrets(),
    )
    monkeypatch.setattr(
        session_messaging_mod, "time", _DeterministicTime(),
    )
    layout_a, log_a = _provision(root_a)
    _run_scenario(layout_a, log_a)

    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    monkeypatch.setattr(
        session_messaging_mod, "secrets", _DeterministicSecrets(),
    )
    monkeypatch.setattr(
        session_messaging_mod, "time", _DeterministicTime(),
    )
    layout_b, log_b = _provision(root_b)
    _run_scenario(layout_b, log_b)

    bytes_a = (root_a / EVENT_LOG_FILENAME).read_bytes()
    bytes_b = (root_b / EVENT_LOG_FILENAME).read_bytes()
    assert bytes_a == bytes_b, (
        "event-log divergence at byte "
        f"{next((i for i, (x, y) in enumerate(zip(bytes_a, bytes_b)) if x != y), min(len(bytes_a), len(bytes_b)))}; "
        f"len(a)={len(bytes_a)} len(b)={len(bytes_b)}"
    )

    # Sanity: the log actually grew (the scenario emitted events) — a
    # bug that produced empty event logs in both runs would otherwise
    # also be byte-identical.
    assert log_a.height() > 10
    assert log_a.height() == log_b.height()

    # Both runs must also pass the hash-chain integrity check — replay
    # determinism without chain integrity would not constitute the
    # spec §11.7 conformance gate.
    log_a.verify()
    log_b.verify()
