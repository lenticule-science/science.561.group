"""Conformance — admin-role authoring fixture (`t02-30f`).

Pairs with [`task:t02-30`](../../docs/dev/tasks/engineering/t02-30-v0.2a-multi-user-authoring.md)
per [decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).

This is the **per-role refinement** of the umbrella multi-user
authoring fixture
:mod:`tests.conformance.test_t02_34f_multi_user_authoring`. The umbrella
exercises admin → member → observer end-to-end; this fixture isolates
the admin slice so a future change that quietly weakens (or accidentally
widens) the admin role is the single named hypothesis on test.

The four legs map directly onto t02-30's load-bearing acceptance items:

* **Role-default capability fiber**
  (``test_admin_role_carries_default_capability_fiber``) —
  pins ``ROLE_CAPABILITIES["admin"]`` per
  [specs/filesystem/capability-permissions.md](../../docs/dev/specs/filesystem/capability-permissions.md)
  §6.4. A regression that drops ``signal:*`` (or unions it into a
  narrower role) breaks here first.

* **Boundary-projection cells**
  (``test_admin_user_boundary_emits_four_projection_cells``) — pins
  the four canonical projection cells (``projects-auth-fiber``,
  ``projects-authz-fiber``, ``projects-attention-fiber``,
  ``projects-history-fiber``) per
  [decisions/identity-is-boundary-projection.md](../../docs/dev/decisions/identity-is-boundary-projection.md)
  and the role-admin cell per
  [specs/init-boot/boot-sequence.md](../../docs/dev/specs/init-boot/boot-sequence.md)
  §4.1. The admin's ``user:<slug>`` boundary entity must carry all
  five at value ``True``.

* **Admin authority**
  (``test_admin_asserts_cell_and_drives_signal_surface``) — admin
  opens a session, asserts ``(task:demo, status-open) = TRUE``
  (resulting fiber is exactly ``TRUE``, no contradiction, no ``Both``,
  no denial), and successfully drives a ``signal:*``-gated substrate
  surface (``set_current_scope``).

* **Non-admin denial — no state advance**
  (``test_non_admin_observer_denied_signal_surface_no_state_advance``)
  — gate-ordering invariant of
  [capability-permissions.md](../../docs/dev/specs/filesystem/capability-permissions.md)
  §6.3 in load-bearing form: a non-admin (observer) attempting the
  same ``signal:*``-gated surface raises
  :data:`substrate.error_codes.PCA_SCOPE_INSUFFICIENT` and the denied
  call advances NEITHER the event log NOR any fiber. This is the
  ``⇒``-restriction-to-``⊥`` claim from t02-30 acceptance: at the
  cells the admin alone can write, the non-admin sender produces no
  event.

* **Byte-identical replay**
  (``test_admin_slice_replays_byte_identical``) — the admin slice
  runs against two fresh substrates with
  ``process.session.secrets`` monkeypatched to a deterministic
  counter; ``events.jsonl`` is byte-identical between runs. Same
  determinism pins as the umbrella ``t02-34f``.
"""

from __future__ import annotations

from pathlib import Path

import pytest

from init_boot.bootstrap_users import (
    CANONICAL_FIBERS,
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
from substrate.stdlib import assert_cell


_NODE_ID = "test-node"
_TARGET = "task:demo"
_PREDICATE = "status-open"
_ADMIN_SLUG = "user:captain"
_OBSERVER_SLUG = "user:bob"
# Identity cells (kind-user / projects-*-fiber / role-* / granted:*) live on
# the boundary surface per init_boot.bootstrap_users (see its module docstring
# + decisions/personnel-migration-sequenced-before-bootstrap-users.md).
_ADMIN_BOUNDARY = "boundary:captain"
_OBSERVER_BOUNDARY = "boundary:bob"


# ---------------------------------------------------------------------------
# Deterministic session-slug source — same shape as t02-34f
# ---------------------------------------------------------------------------


class _DeterministicSecrets:
    """Counter stand-in for ``secrets.token_hex`` — see t02-34f docstring."""

    def __init__(self) -> None:
        self._n = 0

    def token_hex(self, n: int) -> str:
        self._n += 1
        return f"{self._n:016x}"


@pytest.fixture
def deterministic_session_slugs(monkeypatch):
    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())


# ---------------------------------------------------------------------------
# Fixture builders
# ---------------------------------------------------------------------------


def _admin_plus_observer_manifest() -> BootstrapManifest:
    """Minimum manifest for the admin slice: admin + a non-admin foil.

    The observer is the *foil* for the gate-ordering invariant leg
    (denial without state advance). Two roles is the minimum that
    proves the admin-only ``signal:*`` claim — pinning admin against a
    hypothetical-only no-grant role would not exercise the actual
    role-default fiber emitted by ``bootstrap_users``.
    """
    return BootstrapManifest(users=[
        BootstrapUserEntry(
            slug=_ADMIN_SLUG, display_name="Captain", role="admin",
        ),
        BootstrapUserEntry(
            slug=_OBSERVER_SLUG, display_name="Bob", role="observer",
        ),
    ])


def _provision(root: Path) -> tuple[StorageLayout, EventLog]:
    """Open layout + log + provision the manifest. Mirrors t02-34f."""
    import time
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    # NOTE: no wall_clock_ns — the genesis event must be deterministic.
    log.initialize(node_id=_NODE_ID)
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id=_NODE_ID,
        manifest=_admin_plus_observer_manifest(),
    )
    return layout, log


def _open_admin(layout, log):
    return open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner=_ADMIN_SLUG, capabilities=ROLE_CAPABILITIES["admin"],
    )


def _open_observer(layout, log):
    return open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner=_OBSERVER_SLUG, capabilities=ROLE_CAPABILITIES["observer"],
    )


# ---------------------------------------------------------------------------
# Leg 1 — role-default capability fiber
# ---------------------------------------------------------------------------


def test_admin_role_carries_default_capability_fiber(tmp_path):
    """``bootstrap_users`` emits the admin's authz fiber as ``granted:*`` cells.

    Pins capability-permissions.md §6.4 — the admin role-default fiber
    is exactly ``{respond:*, shell:*, runlevel:*, audit:*, signal:*}``
    — *as persisted on the boundary entity*. We assert against the
    ``granted:<cap>`` cells materialised on ``user:<slug>``'s fiber by
    :func:`init_boot.bootstrap_users._emit_user_cells`, not against
    the session's ``capabilities`` list (which would only echo whatever
    the test passed into :func:`open_session`). The expected set is
    spelled out as a literal here so a future weakening (drop
    ``signal:*``) or accidental widening (union an extra grant into
    the admin role) of ``ROLE_CAPABILITIES["admin"]`` is the single
    named hypothesis on test.
    """
    layout, _log = _provision(tmp_path)
    admin_fiber = layout.get_fiber(_ADMIN_BOUNDARY) or {}
    predicates = admin_fiber.get("predicates", {})

    # The admin's persisted grants — the spec literal, not the runtime
    # constant. If ROLE_CAPABILITIES["admin"] is changed without a
    # paired §6.4 spec change, this assertion is the fence.
    expected_grants = {
        "granted:respond:*",
        "granted:shell:*",
        "granted:runlevel:*",
        "granted:audit:*",
        "granted:signal:*",
    }
    actual_grants = {
        p for p, v in predicates.items()
        if p.startswith("granted:") and v == BilatticeValue.TRUE.value
    }
    assert actual_grants == expected_grants, (
        f"admin's persisted grant fiber differs from the §6.4 spec "
        f"literal; missing={expected_grants - actual_grants}, "
        f"unexpected={actual_grants - expected_grants}"
    )

    # Cross-check the runtime constant matches the spec literal.
    # Belt-and-braces: catches a code-only change to ROLE_CAPABILITIES
    # that escaped the persisted-grant check above (e.g. a duplicated
    # entry that set-collapsed away).
    assert set(ROLE_CAPABILITIES["admin"]) == {
        "respond:*", "shell:*", "runlevel:*", "audit:*", "signal:*",
    }


# ---------------------------------------------------------------------------
# Leg 2 — boundary-projection cells
# ---------------------------------------------------------------------------


def test_admin_user_boundary_emits_four_projection_cells(tmp_path):
    """The admin's ``user:<slug>`` entity carries the boundary's projection cells.

    Per ``decisions/identity-is-boundary-projection.md`` and
    ``specs/init-boot/boot-sequence.md`` §4.1, every bootstrapped user
    is a boundary entity that projects four canonical fibers — auth,
    authz, attention, history. The bootstrap routine emits one cell
    per fiber plus the kind-user cell and the role-admin cell. All
    six must resolve to ``True`` on the admin's fiber.
    """
    layout, _log = _provision(tmp_path)
    admin_fiber = layout.get_fiber(_ADMIN_BOUNDARY) or {}
    predicates = admin_fiber.get("predicates", {})

    # The boundary kind cell.
    assert predicates.get("kind-user") == BilatticeValue.TRUE.value, (
        f"missing kind-user cell on {_ADMIN_BOUNDARY}; have: {sorted(predicates)}"
    )

    # The four projection cells — load-bearing for identity-as-boundary.
    for fiber in CANONICAL_FIBERS:
        pred = f"projects-{fiber}-fiber"
        assert predicates.get(pred) == BilatticeValue.TRUE.value, (
            f"missing projection cell {pred!r} on {_ADMIN_BOUNDARY}; "
            f"have: {sorted(predicates)}"
        )

    # The role assignment — bootstrap_users §4.1 step 4.
    assert predicates.get("role-admin") == BilatticeValue.TRUE.value, (
        f"missing role-admin cell on {_ADMIN_BOUNDARY}; have: {sorted(predicates)}"
    )

    # Spot-check one of the per-capability grants — proves the role
    # actually projected onto granted:* cells, not just the role-admin
    # marker. We pick signal:* because it's the admin-only grant.
    assert predicates.get("granted:signal:*") == BilatticeValue.TRUE.value


# ---------------------------------------------------------------------------
# Leg 3 — admin authority: assert + drive signal surface
# ---------------------------------------------------------------------------


def test_admin_asserts_cell_and_drives_signal_surface(
    tmp_path, deterministic_session_slugs,
):
    """The admin asserts a cell and drives a ``signal:*``-gated surface.

    Two claims fused into one leg because they share a session and
    fixture cost:

    1. ``assert_cell(task:demo, status-open) = TRUE`` succeeds and the
       resulting fiber value is exactly ``TRUE`` — no contradiction,
       no ``Both``, no denial. This is the ``respond:*`` admin power.
    2. ``set_current_scope(admin_session, scope:engineering)`` succeeds
       — which proves the ``signal:session-scope:set`` capability is
       covered by the admin's ``signal:*`` wildcard. This is the
       admin-only substrate-action surface.
    """
    layout, log = _provision(tmp_path)
    admin = _open_admin(layout, log)

    # (1) Admin asserts a cell within its scope.
    cell = assert_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, v=BilatticeValue.TRUE,
        sender=admin.owner,
    )
    assert cell.cell_id  # the assert produced a real cell id

    fiber = layout.get_fiber(_TARGET) or {}
    fiber_value = fiber.get("predicates", {}).get(_PREDICATE)
    assert fiber_value == BilatticeValue.TRUE.value, (
        f"admin assert produced {fiber_value!r}, expected TRUE; "
        f"contradiction or unexpected join under admin's own assertion"
    )

    # (2) Admin drives the signal:*-gated scope-set surface.
    height_before = log.height()
    set_current_scope(
        layout=layout, event_log=log, node_id=_NODE_ID,
        session_slug=admin.slug, scope="scope:engineering",
    )
    height_after = log.height()
    # The signal surface succeeded → at least one event appended.
    assert height_after > height_before, (
        "admin's set_current_scope did not advance the event log — "
        "the signal:* gate may have wrongly denied the admin"
    )

    scope_entity = f"session-scope:{admin.slug}"
    scope_fiber = layout.get_fiber(scope_entity) or {}
    # The binary cell encodes the scope as the predicate-keyed value;
    # we just confirm SOMETHING landed on the admin's scope fiber.
    assert scope_fiber.get("predicates"), (
        f"admin's set_current_scope did not write to {scope_entity}; "
        f"got fiber: {scope_fiber!r}"
    )


# ---------------------------------------------------------------------------
# Leg 4 — non-admin denial without state advance
# ---------------------------------------------------------------------------


def test_non_admin_observer_denied_signal_surface_no_state_advance(
    tmp_path, deterministic_session_slugs,
):
    """An observer attempting the admin's ``signal:*`` surface is denied — no state advance.

    The gate-ordering invariant of capability-permissions §6.3 in
    load-bearing form: the denial code is ``PCA_SCOPE_INSUFFICIENT``
    and the call advances NEITHER the event log NOR the observer's
    session-scope fiber. An implementation that emitted a denied-attempt
    event or wrote a partial scope fiber would pass a code-only check
    but fail this leg — the ratifying-fixture failure mode flagged in
    ``decisions/fixture-authoring-paired-task.md`` §"Why".

    This is the ``⇒``-restriction-to-``⊥`` claim from t02-30
    acceptance: at the cells the admin alone can write, the non-admin
    sender produces no event.
    """
    layout, log = _provision(tmp_path)
    observer = _open_observer(layout, log)

    # Pre-conditions: observer holds NO signal:* capability. Pins the
    # role-default fiber so a future bootstrap_users change that
    # quietly unioned signal:* into observer would be caught.
    assert not any(
        c == "signal:*" or c.startswith("signal:")
        for c in observer.capabilities
    ), (
        f"observer carries unexpected signal capability: "
        f"{[c for c in observer.capabilities if c.startswith('signal:')]}"
    )

    scope_entity = f"session-scope:{observer.slug}"
    height_before = log.height()
    fiber_before = layout.get_fiber(scope_entity)

    denied: SubstrateError | None = None
    try:
        set_current_scope(
            layout=layout, event_log=log, node_id=_NODE_ID,
            session_slug=observer.slug, scope="scope:forbidden",
        )
    except SubstrateError as e:
        denied = e

    assert denied is not None, (
        "observer's set_current_scope unexpectedly succeeded — "
        "the signal:* gate was not enforced for the observer role"
    )
    assert denied.code == PCA_SCOPE_INSUFFICIENT, (
        f"observer's denial code was {denied.code!r}, "
        f"expected PCA_SCOPE_INSUFFICIENT"
    )

    # Load-bearing: the denied call advanced NEITHER the event log NOR
    # the observer's session-scope fiber.
    height_after = log.height()
    fiber_after = layout.get_fiber(scope_entity)
    assert height_after == height_before, (
        f"denied set_current_scope advanced the event log "
        f"({height_before} -> {height_after})"
    )
    assert fiber_after == fiber_before, (
        "denied set_current_scope mutated the observer's session-scope fiber"
    )

    # And the observer's session is still in `open` state — denial
    # does not transition the session.
    assert observer.state == "open"


# ---------------------------------------------------------------------------
# Leg 5 — byte-identical replay of the admin slice
# ---------------------------------------------------------------------------


def _admin_slice(layout: StorageLayout, log: EventLog) -> None:
    """The admin authority slice, factored for replay."""
    admin = _open_admin(layout, log)
    assert_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, v=BilatticeValue.TRUE,
        sender=admin.owner,
    )
    set_current_scope(
        layout=layout, event_log=log, node_id=_NODE_ID,
        session_slug=admin.slug, scope="scope:engineering",
    )


def test_admin_slice_replays_byte_identical(tmp_path, monkeypatch):
    """Two fresh substrates running the admin slice produce identical events.

    Same determinism pinning as the umbrella ``t02-34f`` — the only
    non-deterministic source is ``process.session._new_slug``'s call
    to ``secrets.token_hex``, which we monkeypatch to a counter. The
    event log is initialised without ``wall_clock_ns`` so the genesis
    event's canonical bytes are stable; ``substrate.respond.respond``
    does not pass ``wall_clock_ns`` to ``event_log.append`` so all
    respond-emitted events are wall-clock-free by construction.
    """
    root_a = tmp_path / "run-a"
    root_b = tmp_path / "run-b"

    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    layout_a, log_a = _provision(root_a)
    _admin_slice(layout_a, log_a)

    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    layout_b, log_b = _provision(root_b)
    _admin_slice(layout_b, log_b)

    bytes_a = (root_a / EVENT_LOG_FILENAME).read_bytes()
    bytes_b = (root_b / EVENT_LOG_FILENAME).read_bytes()
    assert bytes_a == bytes_b, (
        f"event-log divergence at byte "
        f"{next((i for i, (x, y) in enumerate(zip(bytes_a, bytes_b)) if x != y), min(len(bytes_a), len(bytes_b)))}; "
        f"len(a)={len(bytes_a)} len(b)={len(bytes_b)}"
    )

    # Sanity: the log actually grew (the slice emitted events) — a
    # bug that produced empty event logs in both runs would otherwise
    # also be byte-identical.
    assert log_a.height() > 5
    assert log_a.height() == log_b.height()
