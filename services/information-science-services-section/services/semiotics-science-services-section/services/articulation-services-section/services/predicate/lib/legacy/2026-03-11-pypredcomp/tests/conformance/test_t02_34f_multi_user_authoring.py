"""Conformance — multi-user authoring fixture (`t02-34f`).

Pairs with `task:t02-34` ("admin asserts, member retracts, observer reads —
byte-identical replay") per
[milestones/v0.2a-multi-user-single-node.md](../../docs/dev/milestones/v0.2a-multi-user-single-node.md)
§"Freeze gates" #4 and
[decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).

The freeze gate this fixture proves:

    "Multi-user respond fixtures (admin asserts, member retracts,
     observer reads) pass."

Concretely, the scenario walks the full v0.2a multi-user authoring
surface end-to-end against the role-default capability fibers from
[`init_boot.bootstrap_users.ROLE_CAPABILITIES`][src.init_boot.bootstrap_users]
(authority:
[specs/filesystem/capability-permissions.md](../../docs/dev/specs/filesystem/capability-permissions.md)
§6.4):

* **admin** (carries ``signal:*`` + ``respond:*``) — opens a session,
  asserts ``(task:demo, status-open) = TRUE``, and successfully exercises
  a gated substrate-action surface (``set_current_scope``).
* **member** (carries ``respond:*`` + ``signal:session-scope:set`` +
  ``signal:session-message:*`` + ``shell:read/write``) — opens a session
  and retracts the same predicate. Per the cell-record monotonicity rule
  (``stdlib.retract_cell`` docstring), the post-retract fiber value is
  ``Both`` — paraconsistent retention rather than overwrite.
* **observer** (carries only ``shell:read`` + ``audit:read``, **no**
  ``signal:*``) — opens a session, projects the contested predicate
  read-only via :func:`substrate.stdlib.project`, and is *denied*
  ``set_current_scope`` with :data:`substrate.error_codes.PCA_SCOPE_INSUFFICIENT`
  — the gate-ordering invariant of capability-permissions §6.3 means
  the denied call writes neither an event nor a fiber.

The byte-identical replay leg (``test_scenario_replays_byte_identical``)
runs the full provision → scenario sequence twice against fresh
substrates. Sources of non-determinism are pinned:

* The event log is initialized **without** ``wall_clock_ns`` so the
  genesis event's canonical bytes are stable.
* :func:`process.session._new_slug` reads ``secrets.token_hex`` — we
  monkeypatch that module attribute to a deterministic counter so
  session slugs match across runs.
* :func:`substrate.respond.respond` does not pass ``wall_clock_ns`` to
  ``event_log.append`` (verified by inspection of ``PersistPhase.run``),
  so respond-emitted events are wall-clock-free by construction.

Comparing ``events.jsonl`` byte-for-byte across the two runs proves
the freeze gate: the multi-user authoring surface is fully
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
from process.session import open_session
from storage.event_log import EVENT_LOG_FILENAME, EventLog
from storage.paths import set_current_scope
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCA_SCOPE_INSUFFICIENT, SubstrateError
from substrate.stdlib import CellPattern, assert_cell, project, retract_cell


_NODE_ID = "test-node"
_TARGET = "task:demo"
_PREDICATE = "status-open"


# ---------------------------------------------------------------------------
# Deterministic session-slug source
# ---------------------------------------------------------------------------


class _DeterministicSecrets:
    """Stand-in for ``secrets.token_hex`` that yields a deterministic counter.

    ``process.session._new_slug`` is the only call that needs pinning for
    byte-identical replay; we monkeypatch the module-level ``secrets``
    attribute so the production code path is exercised unchanged.
    """

    def __init__(self) -> None:
        self._n = 0

    def token_hex(self, n: int) -> str:  # signature mirrors secrets.token_hex
        self._n += 1
        # 16-hex-char fixed-width counter — matches token_hex(8)'s output width.
        return f"{self._n:016x}"


@pytest.fixture
def deterministic_session_slugs(monkeypatch):
    """Pin ``process.session._new_slug`` to a deterministic counter."""
    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())


# ---------------------------------------------------------------------------
# Fixture builders — provisioning + scenario
# ---------------------------------------------------------------------------


def _three_role_manifest() -> BootstrapManifest:
    """admin / member / observer in ROLE_CAPABILITIES default fibers."""
    return BootstrapManifest(
        users=[
            BootstrapUserEntry(
                slug="user:captain", display_name="Captain", role="admin",
            ),
            BootstrapUserEntry(
                slug="user:alice", display_name="Alice", role="member",
            ),
            BootstrapUserEntry(
                slug="user:bob", display_name="Bob", role="observer",
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
    """Execute admin-asserts → member-retracts → observer-reads.

    Returns a summary dict the caller can assert against.
    """
    admin_sess = open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner="user:captain", capabilities=ROLE_CAPABILITIES["admin"],
    )
    member_sess = open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner="user:alice", capabilities=ROLE_CAPABILITIES["member"],
    )
    observer_sess = open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner="user:bob", capabilities=ROLE_CAPABILITIES["observer"],
    )

    # admin asserts (task:demo, status-open) = TRUE
    admin_assert = assert_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, v=BilatticeValue.TRUE,
        sender=admin_sess.owner,
    )
    # admin can drive a gated substrate-action surface — proves signal:*.
    set_current_scope(
        layout=layout, event_log=log, node_id=_NODE_ID,
        session_slug=admin_sess.slug, scope="scope:engineering",
    )

    # member retracts the same predicate. Monotonicity → TRUE ⊔ FALSE = Both.
    member_retract = retract_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, sender=member_sess.owner,
    )
    # member's signal:session-scope:set grant covers the scope-action.
    set_current_scope(
        layout=layout, event_log=log, node_id=_NODE_ID,
        session_slug=member_sess.slug, scope="scope:reading-room",
    )

    # observer projects the contested predicate read-only.
    observed = project(
        layout, CellPattern(s=_TARGET, p=_PREDICATE),
        scope=f"entity:{_TARGET}",
    )

    # observer is denied the gated scope-action surface. Capture the
    # event-log height and the observer's session-scope fiber state
    # *before* the denied call so the caller can prove the §6.3
    # gate-ordering invariant: a denied call advances NEITHER the event
    # log NOR any fiber.
    height_before_deny = log.height()
    observer_scope_entity = f"session-scope:{observer_sess.slug}"
    fiber_before_deny = layout.get_fiber(observer_scope_entity)
    observer_denied: SubstrateError | None = None
    try:
        set_current_scope(
            layout=layout, event_log=log, node_id=_NODE_ID,
            session_slug=observer_sess.slug, scope="scope:forbidden",
        )
    except SubstrateError as e:
        observer_denied = e
    height_after_deny = log.height()
    fiber_after_deny = layout.get_fiber(observer_scope_entity)

    fiber = layout.get_fiber(_TARGET) or {}
    return {
        "admin_session": admin_sess,
        "member_session": member_sess,
        "observer_session": observer_sess,
        "admin_assert_cell_id": admin_assert.cell_id,
        "member_retract_cell_id": member_retract.cell_id,
        "observed_atoms": observed,
        "observer_denied": observer_denied,
        "fiber_value": fiber.get("predicates", {}).get(_PREDICATE),
        "height_before_deny": height_before_deny,
        "height_after_deny": height_after_deny,
        "observer_scope_fiber_before_deny": fiber_before_deny,
        "observer_scope_fiber_after_deny": fiber_after_deny,
    }


# ---------------------------------------------------------------------------
# Test 1: scenario semantics — the actual freeze-gate behaviour
# ---------------------------------------------------------------------------


def test_admin_asserts_member_retracts_observer_reads(
    tmp_path, deterministic_session_slugs,
):
    """Walk the multi-user authoring surface and pin every observable.

    This is the freeze-gate-#4 acceptance: the three role projections
    each succeed at their own authority level and fail predictably
    where the §6.4 capability fibers say they should.
    """
    layout, log = _provision(tmp_path)
    out = _run_scenario(layout, log)

    # admin's session is owned by user:captain and carries the admin
    # role-default capability fiber verbatim.
    assert out["admin_session"].owner == "user:captain"
    assert set(out["admin_session"].capabilities) == set(
        ROLE_CAPABILITIES["admin"]
    )
    assert set(out["member_session"].capabilities) == set(
        ROLE_CAPABILITIES["member"]
    )
    assert set(out["observer_session"].capabilities) == set(
        ROLE_CAPABILITIES["observer"]
    )

    # admin's assert + member's retract each produced a real cell id.
    assert out["admin_assert_cell_id"]
    assert out["member_retract_cell_id"]
    assert out["admin_assert_cell_id"] != out["member_retract_cell_id"]

    # Monotonicity: TRUE ⊔ FALSE = Both. The contested predicate is
    # paraconsistently retained, not overwritten — per stdlib.retract_cell.
    assert out["fiber_value"] == BilatticeValue.BOTH.value

    # Observer's read-only project sees both atoms and the senders are
    # exactly the two authoring users.
    senders = sorted(c.sender for c in out["observed_atoms"] if c.sender)
    assert senders == ["user:alice", "user:captain"]

    # Observer was denied the gated surface — capability-permissions §6.3
    # gate-ordering invariant: the denial code is PCA_SCOPE_INSUFFICIENT
    # and the call advanced no on-disk state for the observer.
    assert isinstance(out["observer_denied"], SubstrateError)
    assert out["observer_denied"].code == PCA_SCOPE_INSUFFICIENT

    # The §6.3 gate-ordering invariant in load-bearing form: the denied
    # call must advance NEITHER the event log NOR any fiber. An
    # implementation that emitted a denied-attempt event or wrote a
    # partial scope fiber would pass the code-check above but fail
    # here — the assertion that catches the ratifying-fixture failure
    # mode flagged in decisions/fixture-authoring-paired-task.md §"Why".
    assert out["height_after_deny"] == out["height_before_deny"], (
        "denied set_current_scope advanced the event log "
        f"({out['height_before_deny']} -> {out['height_after_deny']})"
    )
    assert out["observer_scope_fiber_after_deny"] == out[
        "observer_scope_fiber_before_deny"
    ], "denied set_current_scope mutated the observer's session-scope fiber"

    # The observer's session is still in `open` state — denial does not
    # transition the session.
    assert out["observer_session"].state == "open"

    # §6.4 anchor: the observer holds NO signal:* capability — neither a
    # specific cap nor the namespace wildcard nor the super-grant. This
    # pins the role-default fiber definition so a future bootstrap-users
    # change that quietly unioned signal:* into observer would be caught.
    assert not any(
        c == "signal:*" or c.startswith("signal:")
        for c in out["observer_session"].capabilities
    )


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

    # Each leg gets its OWN deterministic-secrets counter, restored on
    # exit, so the two runs draw from identical slug streams.
    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    layout_a, log_a = _provision(root_a)
    _run_scenario(layout_a, log_a)

    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    layout_b, log_b = _provision(root_b)
    _run_scenario(layout_b, log_b)

    bytes_a = (root_a / EVENT_LOG_FILENAME).read_bytes()
    bytes_b = (root_b / EVENT_LOG_FILENAME).read_bytes()
    assert bytes_a == bytes_b, (
        f"event-log divergence at byte {next((i for i, (x, y) in enumerate(zip(bytes_a, bytes_b)) if x != y), min(len(bytes_a), len(bytes_b)))}; "
        f"len(a)={len(bytes_a)} len(b)={len(bytes_b)}"
    )

    # Sanity: the log actually grew (the scenario emitted events) — a
    # bug that produced empty event logs in both runs would otherwise
    # also be byte-identical.
    assert log_a.height() > 5
    assert log_a.height() == log_b.height()
