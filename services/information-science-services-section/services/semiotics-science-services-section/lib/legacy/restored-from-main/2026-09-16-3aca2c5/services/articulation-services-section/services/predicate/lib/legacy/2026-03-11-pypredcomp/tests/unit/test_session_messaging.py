"""Inter-session messaging — unit tests covering spec §11 conformance.

Spec: ``operations/command/projects/replit-sprint/specs/process/inter-session-messaging.md``
"""

from __future__ import annotations

import json
from pathlib import Path

import pytest

from process.session import close_session, open_session
from process.session_messaging import (
    CANONICAL_MSG_TYPES,
    list_unread,
    mark_read,
    send_message,
    surface_unread_messages,
)
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.error_codes import (
    PCA_SCOPE_INSUFFICIENT,
    PCS_MESSAGE_RECIPIENT_CLOSED,
    PCS_MESSAGE_RECIPIENT_INVALID,
    PCS_MESSAGE_RESPONDS_TO_INVALID,
    PCS_MESSAGE_TYPE_UNKNOWN,
    PCS_RECORD_CORRUPT,
    SubstrateError,
)


NODE = "node:test"
SEND_CAP = "signal:session-message:*"


@pytest.fixture
def store(tmp_path: Path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id=NODE)
    return layout, log


def _open(layout, log, owner: str = "user:alice", caps=None):
    if caps is None:
        caps = [SEND_CAP]
    return open_session(
        layout=layout, event_log=log, node_id=NODE,
        owner=owner, capabilities=list(caps),
    )


# ---------------------------------------------------------------------------
# §11.1 — Round-trip: send → unread surfaces → mark read → no longer unread.
# ---------------------------------------------------------------------------


def test_round_trip_task_handoff(store):
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")

    msg = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=recipient.slug,
        msg_type="task-handoff",
        content={"task-id": "task:abc", "handoff-reason": "needs review"},
    )
    assert msg.from_session == sender.slug
    assert msg.to_sessions == [recipient.slug]
    assert msg.msg_type == "task-handoff"

    unread = list_unread(layout, recipient.slug)
    assert len(unread) == 1
    assert unread[0]["msg_slug"] == msg.slug
    assert unread[0]["msg_type"] == "task-handoff"

    surfaced = surface_unread_messages(
        layout=layout, event_log=log, node_id=NODE,
    )
    assert len(surfaced) == 1
    assert surfaced[0]["recipient"] == recipient.slug
    assert msg.slug in surfaced[0]["msg_slugs"]

    # Idempotent: re-running surface writes nothing.
    again = surface_unread_messages(
        layout=layout, event_log=log, node_id=NODE,
    )
    assert again == []

    mark_read(
        layout=layout, event_log=log, node_id=NODE,
        msg_slug=msg.slug, reader_session=recipient.slug,
    )
    assert list_unread(layout, recipient.slug) == []


# ---------------------------------------------------------------------------
# §11.2 — Each canonical msg-type round-trips with its required predicates;
# unknown msg-type rejected with PCS_MESSAGE_TYPE_UNKNOWN.
# ---------------------------------------------------------------------------


def test_each_canonical_msg_type_round_trips(store):
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")

    contents = {
        "task-handoff": {"task-id": "t:1", "handoff-reason": "r"},
        "query":        {"question-cell": "cell:q1"},
        "completed":    {"task-id": "t:1", "completion-cell": "cell:c1"},
        "conflict":     {
            "conflict-on": "cell:x", "claimed-value": "True",
            "observed-value": "False",
        },
    }
    sent = []
    for mtype, content in contents.items():
        sent.append(send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=recipient.slug,
            msg_type=mtype, content=content,
        ))
    # Response must come from the original query's recipient back to
    # the asker (spec §9 attribution gate).
    query = next(m for m in sent if m.msg_type == "query")
    response = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=recipient.slug, to_session=sender.slug,
        msg_type="response",
        content={"responds-to": query.slug, "answer-cell": "cell:a1"},
    )
    sent.append(response)

    types_sent = {m.msg_type for m in sent}
    assert types_sent == set(CANONICAL_MSG_TYPES)

    # The recipient sees 4 inbound (handoff/query/completed/conflict);
    # the sender sees 1 inbound (the response from recipient).
    assert len(list_unread(layout, recipient.slug)) == 4
    assert len(list_unread(layout, sender.slug)) == 1


def test_unknown_msg_type_rejected(store):
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")

    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=recipient.slug,
            msg_type="not-a-thing", content={},
        )
    assert ei.value.code == PCS_MESSAGE_TYPE_UNKNOWN


def test_missing_required_content_rejected(store):
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")

    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=recipient.slug,
            msg_type="task-handoff",
            content={"task-id": "t:1"},  # missing handoff-reason
        )
    assert ei.value.code == PCS_MESSAGE_TYPE_UNKNOWN


# ---------------------------------------------------------------------------
# §11.3 — Capability-bounded send.
# ---------------------------------------------------------------------------


def test_capability_required_for_send(store):
    layout, log = store
    sender = _open(layout, log, caps=[])  # NO send capability
    recipient = _open(layout, log, owner="user:bob")

    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=recipient.slug,
            msg_type="task-handoff",
            content={"task-id": "t:1", "handoff-reason": "r"},
        )
    assert ei.value.code == PCA_SCOPE_INSUFFICIENT


def test_per_type_capability_grant(store):
    layout, log = store
    sender = _open(layout, log, caps=["signal:session-message:query"])
    recipient = _open(layout, log, owner="user:bob")

    # Allowed: query
    send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=recipient.slug,
        msg_type="query", content={"question-cell": "cell:q"},
    )
    # Denied: task-handoff
    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=recipient.slug,
            msg_type="task-handoff",
            content={"task-id": "t", "handoff-reason": "r"},
        )
    assert ei.value.code == PCA_SCOPE_INSUFFICIENT


# ---------------------------------------------------------------------------
# Recipient validation
# ---------------------------------------------------------------------------


def test_invalid_recipient_rejected(store):
    layout, log = store
    sender = _open(layout, log)

    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session="not-a-session",
            msg_type="query", content={"question-cell": "cell:q"},
        )
    assert ei.value.code == PCS_MESSAGE_RECIPIENT_INVALID

    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session="session:deadbeefdeadbeef",
            msg_type="query", content={"question-cell": "cell:q"},
        )
    assert ei.value.code == PCS_MESSAGE_RECIPIENT_INVALID


def test_closed_recipient_rejected(store):
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")
    close_session(
        layout=layout, event_log=log, node_id=NODE, slug=recipient.slug,
    )

    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=recipient.slug,
            msg_type="query", content={"question-cell": "cell:q"},
        )
    assert ei.value.code == PCS_MESSAGE_RECIPIENT_CLOSED


def test_responds_to_requires_sender_was_query_recipient(store):
    """Spec §9 attribution gate: a third party cannot respond to a query
    they were not the recipient of."""
    layout, log = store
    asker = _open(layout, log, owner="user:alice")
    answerer = _open(layout, log, owner="user:bob")
    intruder = _open(layout, log, owner="user:eve")

    q = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=asker.slug, to_session=answerer.slug,
        msg_type="query", content={"question-cell": "cell:q1"},
    )
    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=intruder.slug, to_session=asker.slug,
            msg_type="response",
            content={"responds-to": q.slug, "answer-cell": "cell:hijack"},
        )
    assert ei.value.code == PCS_MESSAGE_RESPONDS_TO_INVALID


def test_responds_to_must_target_a_query(store):
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")

    # Bogus target.
    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=recipient.slug,
            msg_type="response",
            content={"responds-to": "session-message:nope",
                     "answer-cell": "cell:a"},
        )
    assert ei.value.code == PCS_MESSAGE_RESPONDS_TO_INVALID

    # Target exists but is not a query.
    handoff = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=recipient.slug,
        msg_type="task-handoff",
        content={"task-id": "t", "handoff-reason": "r"},
    )
    with pytest.raises(SubstrateError) as ei:
        send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=recipient.slug,
            msg_type="response",
            content={"responds-to": handoff.slug, "answer-cell": "cell:a"},
        )
    assert ei.value.code == PCS_MESSAGE_RESPONDS_TO_INVALID


# ---------------------------------------------------------------------------
# §11.4 — Broadcast: per-recipient read state.
# ---------------------------------------------------------------------------


def test_broadcast_per_recipient_read(store):
    layout, log = store
    sender = _open(layout, log)
    a = _open(layout, log, owner="user:a")
    b = _open(layout, log, owner="user:b")

    msg = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=[a.slug, b.slug],
        msg_type="task-handoff",
        content={"task-id": "t:1", "handoff-reason": "fanout"},
    )
    assert set(msg.to_sessions) == {a.slug, b.slug}

    assert len(list_unread(layout, a.slug)) == 1
    assert len(list_unread(layout, b.slug)) == 1

    mark_read(
        layout=layout, event_log=log, node_id=NODE,
        msg_slug=msg.slug, reader_session=a.slug,
    )
    assert list_unread(layout, a.slug) == []
    # B unaffected.
    assert len(list_unread(layout, b.slug)) == 1


# ---------------------------------------------------------------------------
# §11.5 — Threading via responds-to is reachable from the query.
# ---------------------------------------------------------------------------


def test_threading_via_responds_to(store):
    layout, log = store
    asker = _open(layout, log)
    answerer = _open(layout, log, owner="user:bob")

    q = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=asker.slug, to_session=answerer.slug,
        msg_type="query",
        content={"question-cell": "cell:q1"},
    )
    r = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=answerer.slug, to_session=asker.slug,
        msg_type="response",
        content={"responds-to": q.slug, "answer-cell": "cell:a1"},
    )
    # The response's content-cell carries responds-to=<q.slug> as a
    # binary cell on the content entity; project it.
    from substrate import stdlib
    hits = stdlib.project(
        layout,
        stdlib.CellPattern(p="responds-to", o=q.slug, v="True"),
    )
    assert len(hits) == 1
    # Hit subject is the response's content entity (msg-slug:content).
    assert hits[0].s.startswith(r.slug)


# ---------------------------------------------------------------------------
# §11.7 — Replay: every emitted cell is on disk and re-readable.
# ---------------------------------------------------------------------------


def test_replay_event_log_replays_envelope(store):
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")
    msg = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=recipient.slug,
        msg_type="completed",
        content={"task-id": "t:1", "completion-cell": "cell:c1"},
    )
    # Find the session-message event.
    matched = [
        ev for ev in log.iter_events()
        if ev.get("kind") == "session-message"
    ]
    assert len(matched) == 1
    body = matched[0]["body"]
    assert body["msg_slug"] == msg.slug
    assert body["from_session"] == sender.slug
    assert body["to_sessions"] == [recipient.slug]
    # Snapshot is fetchable by id and parses back to the same envelope.
    snap_bytes = layout.get_record_bytes("cells", body["snapshot_id"])
    snap = json.loads(snap_bytes.decode("utf-8"))
    assert snap["entity"] == msg.slug
    # Find the kind cell and verify binary EAVT shape.
    kind_cells = [c for c in snap["cells"] if c["p"] == "kind"]
    assert len(kind_cells) == 1
    assert kind_cells[0]["o"] == "session-message"
    assert kind_cells[0]["v"] == "True"


# ---------------------------------------------------------------------------
# Authorization gates on read paths — closes architect finding #2.
# ---------------------------------------------------------------------------


def test_mark_read_requires_message_capability(store):
    layout, log = store
    sender = _open(layout, log)
    # Recipient is opened with NO messaging capability.
    recipient = _open(layout, log, owner="user:bob", caps=[])
    msg = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=recipient.slug,
        msg_type="task-handoff",
        content={"task-id": "t:x", "handoff-reason": "fyi"},
    )
    with pytest.raises(SubstrateError) as ei:
        mark_read(
            layout=layout, event_log=log, node_id=NODE,
            msg_slug=msg.slug, reader_session=recipient.slug,
        )
    assert ei.value.code == PCA_SCOPE_INSUFFICIENT


def test_list_unread_requires_message_capability(store):
    layout, log = store
    recipient = _open(layout, log, owner="user:bob", caps=[])
    with pytest.raises(SubstrateError) as ei:
        list_unread(layout, recipient.slug)
    assert ei.value.code == PCA_SCOPE_INSUFFICIENT


def test_list_unread_internal_bypass(store):
    """System-internal callers can opt out of the capability gate."""
    layout, log = store
    recipient = _open(layout, log, owner="user:bob", caps=[])
    # Should not raise — the surfacing tick uses this path.
    out = list_unread(layout, recipient.slug, require_capability=False)
    assert out == []


def test_mark_read_cas_detects_concurrent_fiber_mutation(store):
    """If the message fiber's latest_cell_id changes between the read
    and write inside mark_read, the optimistic-concurrency guard must
    fail loud rather than silently dropping the colliding update."""
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")
    msg = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=recipient.slug,
        msg_type="task-handoff",
        content={"task-id": "t:1", "handoff-reason": "x"},
    )
    # Monkey-patch get_fiber to simulate a concurrent writer that bumps
    # latest_cell_id between the baseline read and the CAS write.
    real_get = layout.get_fiber
    state = {"calls": 0}
    def racing_get(slug):
        body = real_get(slug)
        state["calls"] += 1
        if slug == msg.slug and state["calls"] == 2 and body is not None:
            mutated = dict(body)
            mutated["latest_cell_id"] = "cell:racer-wrote-this"
            return mutated
        return body
    layout.get_fiber = racing_get  # type: ignore[assignment]
    try:
        with pytest.raises(SubstrateError) as ei:
            mark_read(
                layout=layout, event_log=log, node_id=NODE,
                msg_slug=msg.slug, reader_session=recipient.slug,
            )
        assert ei.value.code == PCS_RECORD_CORRUPT
    finally:
        layout.get_fiber = real_get  # type: ignore[assignment]


def test_surface_unread_cas_detects_concurrent_fiber_mutation(store):
    """Same fail-loud guarantee as mark_read, on the surfacing path."""
    layout, log = store
    sender = _open(layout, log)
    recipient = _open(layout, log, owner="user:bob")
    send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=recipient.slug,
        msg_type="task-handoff",
        content={"task-id": "t:1", "handoff-reason": "x"},
    )
    real_get = layout.get_fiber
    state = {"calls": 0}
    def racing_get(slug):
        body = real_get(slug)
        state["calls"] += 1
        # Race the recipient's fiber re-read inside surface.
        if slug == recipient.slug and state["calls"] >= 2 and body is not None:
            mutated = dict(body)
            mutated["latest_cell_id"] = "cell:racer-wrote-this"
            return mutated
        return body
    layout.get_fiber = racing_get  # type: ignore[assignment]
    try:
        with pytest.raises(SubstrateError) as ei:
            surface_unread_messages(
                layout=layout, event_log=log, node_id=NODE,
            )
        assert ei.value.code == PCS_RECORD_CORRUPT
    finally:
        layout.get_fiber = real_get  # type: ignore[assignment]


def test_mark_read_capability_wildcards_accepted(store):
    layout, log = store
    sender = _open(layout, log)
    # Substrate super-grant.
    recipient_a = _open(layout, log, owner="user:b", caps=["signal:*"])
    # Per-action wildcard.
    recipient_b = _open(layout, log, owner="user:c",
                        caps=["signal:session-message:*"])
    # Specific kind only.
    recipient_c = _open(layout, log, owner="user:d",
                        caps=["signal:session-message:task-handoff"])
    for r in (recipient_a, recipient_b, recipient_c):
        msg = send_message(
            layout=layout, event_log=log, node_id=NODE,
            from_session=sender.slug, to_session=r.slug,
            msg_type="task-handoff",
            content={"task-id": "t:1", "handoff-reason": "ok"},
        )
        mark_read(
            layout=layout, event_log=log, node_id=NODE,
            msg_slug=msg.slug, reader_session=r.slug,
        )
