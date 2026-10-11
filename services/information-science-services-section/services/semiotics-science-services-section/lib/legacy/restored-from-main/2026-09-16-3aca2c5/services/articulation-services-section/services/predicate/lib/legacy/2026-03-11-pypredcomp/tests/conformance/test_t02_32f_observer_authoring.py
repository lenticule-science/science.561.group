"""Conformance — observer-role authoring fixture (`t02-32f`).

Pairs with [`task:t02-32`](../../docs/dev/tasks/engineering/t02-32-v0.2a-multi-user-authoring.md)
per [decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).

This is the **per-role refinement** of the umbrella multi-user authoring
fixture :mod:`tests.conformance.test_t02_34f_multi_user_authoring`,
following the slicing pattern established by
:mod:`tests.conformance.test_t02_30f_admin_authoring` (admin slice) and
:mod:`tests.conformance.test_t02_31f_member_authoring` (member slice).
The umbrella exercises admin → member → observer end-to-end; this
fixture isolates the **observer slice** so a future change that
quietly weakens (or accidentally widens) the observer role is the
single named hypothesis on test.

The observer is the most-restricted of the three v0.2a roles. The §6.4
role-default capability fiber is exactly ``{shell:read, audit:read}``
— no ``respond:*``, no ``signal:*`` of any flavour. Every gated
substrate-action surface (``set_current_scope``, ``attach_mount``,
``record_snapshot``, …) raises :data:`PCA_SCOPE_INSUFFICIENT` for an
observer-sender; every read surface (``project``, ``get_cell``,
``get_fiber``) succeeds. The two together are the load-bearing
content of t02-32.

The legs map directly onto t02-32's load-bearing acceptance items:

* **Role-default capability fiber**
  (``test_observer_role_carries_default_capability_fiber``) — pins
  the observer's persisted ``granted:*`` cells against the §6.4 spec
  literal ``{shell:read, audit:read}``. We assert against the
  persisted cells on the boundary entity, not against the runtime
  ``ROLE_CAPABILITIES["observer"]`` constant — same anti-tautology
  discipline as the admin and member slices. The negative-side check
  on this leg is load-bearing for the non-amplification claims
  (legs 4a–4c): the observer must NOT carry ``respond:*`` nor any
  ``signal:*`` grant whatsoever.

* **Boundary-projection cells**
  (``test_observer_user_boundary_emits_four_projection_cells``) — the
  four canonical projection cells (``projects-auth-fiber``,
  ``projects-authz-fiber``, ``projects-attention-fiber``,
  ``projects-history-fiber``) plus ``kind-user`` and ``role-observer``
  are all present at value ``True`` per
  [decisions/identity-is-boundary-projection.md](../../docs/dev/decisions/identity-is-boundary-projection.md)
  and
  [specs/init-boot/boot-sequence.md](../../docs/dev/specs/init-boot/boot-sequence.md)
  §4.1. Per row 8 of
  [references/theory-for-developers.md](../../docs/dev/references/theory-for-developers.md):
  *all four fibers project, even on the read-only role* — the observer
  is restricted by an empty authz fiber, not by an absent boundary.

* **Observer reads succeed under the attention fiber**
  (``test_observer_projects_admin_asserted_cell``) — an admin
  pre-asserts a cell; the observer opens its own session and
  :func:`substrate.stdlib.project`-s the entity's atoms. The atom is
  visible, its sender is the admin (not the observer), and the read
  did not advance the event log. This is the positive control for
  the attention fiber.

* **Non-amplification — observer denied every gated signal surface**
  (three legs, one per surface, so a per-surface regression is the
  single named hypothesis):

  - ``test_observer_denied_signal_session_scope_set_no_state_advance``
    — :func:`storage.paths.set_current_scope` (gated on
    ``signal:session-scope:set``).
  - ``test_observer_denied_signal_mount_attach_no_state_advance`` —
    :func:`storage.mounts.attach_mount` (gated on
    ``signal:mount:attach``).
  - ``test_observer_denied_signal_snapshot_record_no_state_advance``
    — :func:`storage.snapshots.record_snapshot` (gated on
    ``signal:snapshot:record``).

  Each leg pins the gate-ordering invariant of
  [capability-permissions.md §6.3](../../docs/dev/specs/filesystem/capability-permissions.md):
  the denial code is :data:`PCA_SCOPE_INSUFFICIENT` with
  ``needed`` naming the specific signal surface, AND the denied call
  advances NEITHER the event log NOR the per-surface fiber. Three
  surfaces — three different action namespaces — are tested rather
  than relying on the umbrella's single ``set_current_scope`` leg
  because t02-32's claim is that the observer's restriction is
  *structural* (empty authz fiber) rather than per-surface; three
  surfaces is the smallest convincing witness of structural absence.

* **Byte-identical replay**
  (``test_observer_slice_replays_byte_identical``) — the observer
  slice (admin pre-seeds + observer opens + observer reads) runs
  against two fresh substrates with ``process.session.secrets``
  monkeypatched to a deterministic counter; ``events.jsonl`` is
  byte-identical between runs. Same determinism pins as the admin
  and member slices and the umbrella ``t02-34f``.

**Note on "algebraic vs raised" restriction.** t02-32's prose says
the observer's restriction is *algebraic* (every authoring payload
restricts to ⊥ via ⇒) rather than raised. In the v0.2a code path the
gated substrate-action surfaces use a thin
:func:`security.capabilities.require_capability` guard that raises
:data:`PCA_SCOPE_INSUFFICIENT` rather than running a Phase-2 box_R
restriction (which is wired but not yet load-bearing on the
``signal:*`` surfaces). This fixture follows the implemented surface
(raised denial without state advance) — the same pattern the
umbrella ``t02-34f`` and the admin/member slices use. The structural
claim is witnessed by the role-default fiber leg above: the observer
holds *no* ``signal:*`` cell of any kind, so the denials are the
algebra's image regardless of where in the call stack they
materialise.
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
from storage.mounts import attach_mount
from storage.paths import set_current_scope
from storage.snapshots import record_snapshot
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCA_SCOPE_INSUFFICIENT, SubstrateError
from substrate.stdlib import CellPattern, assert_cell, project


_NODE_ID = "test-node"
_TARGET = "task:demo"
_PREDICATE = "status-open"
_ADMIN_SLUG = "user:captain"
_OBSERVER_SLUG = "user:bob"
# Identity cells live on the boundary surface (see init_boot.bootstrap_users
# module docstring + decisions/personnel-migration-sequenced-before-bootstrap-users.md).
_ADMIN_BOUNDARY = "boundary:captain"
_OBSERVER_BOUNDARY = "boundary:bob"
_MOUNT_SLUG = "m-forbidden"


# ---------------------------------------------------------------------------
# Deterministic session-slug source — same shape as t02-30f / t02-31f / t02-34f
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
    """Minimum manifest for the observer slice: admin foil + observer.

    The admin is the *foil* for the read-positive-control leg
    (observer projects an admin-asserted cell). Two roles is the
    minimum that proves the observer can read content authored by
    another role — pinning observer reads against an observer-only
    manifest would require the observer to author the cell first,
    which contradicts the very claim under test (observer cannot
    author).
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
    """Open layout + log + provision the manifest. Mirrors t02-30f / t02-31f."""
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


def test_observer_role_carries_default_capability_fiber(tmp_path):
    """``bootstrap_users`` emits the observer's authz fiber as ``granted:*`` cells.

    Pins capability-permissions.md §6.4 — the observer role-default
    fiber is exactly ``{shell:read, audit:read}`` *as persisted on the
    boundary entity*. Asserted against the literal §6.4 spec set, not
    against the runtime ``ROLE_CAPABILITIES["observer"]`` constant.

    The negative-side checks are load-bearing for the non-amplification
    legs (4a–4c): the observer must NOT carry ``respond:*`` (or it
    could author cells through the respond pipeline) nor any
    ``signal:*`` grant (or one of the gated substrate-action surfaces
    would silently permit it). A widening regression — e.g. unioning
    ``audit:write`` or ``signal:session-message:*`` into the observer
    — would surface here before the per-surface denial legs stop
    failing.
    """
    layout, _log = _provision(tmp_path)
    observer_fiber = layout.get_fiber(_OBSERVER_BOUNDARY) or {}
    predicates = observer_fiber.get("predicates", {})

    # Persisted grants — the spec literal, not the runtime constant.
    expected_grants = {
        "granted:shell:read",
        "granted:audit:read",
    }
    actual_grants = {
        p for p, v in predicates.items()
        if p.startswith("granted:") and v == BilatticeValue.TRUE.value
    }
    assert actual_grants == expected_grants, (
        f"observer's persisted grant fiber differs from the §6.4 spec "
        f"literal; missing={expected_grants - actual_grants}, "
        f"unexpected={actual_grants - expected_grants}"
    )

    # Negative-side checks — load-bearing for legs 4a–4c. The observer
    # must NOT carry respond:*, signal:*, or any narrower signal grant.
    forbidden = {
        "granted:respond:*",
        "granted:signal:*",
        "granted:signal:session-scope:set",
        "granted:signal:mount:attach",
        "granted:signal:snapshot:record",
        "granted:signal:session-message:*",
        "granted:shell:write",
        "granted:audit:write",
        "granted:runlevel:*",
    }
    leaked = forbidden & actual_grants
    assert not leaked, (
        f"observer carries forbidden grants: {sorted(leaked)} — "
        f"non-amplification (row 8 of theory-for-developers.md) violated"
    )

    # Belt-and-braces: the runtime constant matches the spec literal.
    assert set(ROLE_CAPABILITIES["observer"]) == {
        "shell:read", "audit:read",
    }


# ---------------------------------------------------------------------------
# Leg 2 — boundary-projection cells
# ---------------------------------------------------------------------------


def test_observer_user_boundary_emits_four_projection_cells(tmp_path):
    """The observer's ``user:<slug>`` entity carries the boundary's projection cells.

    Per row 8 of ``references/theory-for-developers.md``: identity is
    boundary projection — *all four fibers project*, even on the
    read-only role. The observer is restricted by an empty authz
    fiber (no authoring grants), not by an absent boundary. A
    regression that elided fiber emission for the observer (e.g. an
    over-eager "skip if no authoring grants" optimisation) would
    break here.
    """
    layout, _log = _provision(tmp_path)
    observer_fiber = layout.get_fiber(_OBSERVER_BOUNDARY) or {}
    predicates = observer_fiber.get("predicates", {})

    assert predicates.get("kind-user") == BilatticeValue.TRUE.value, (
        f"missing kind-user cell on {_OBSERVER_BOUNDARY}; "
        f"have: {sorted(predicates)}"
    )

    for fiber in CANONICAL_FIBERS:
        pred = f"projects-{fiber}-fiber"
        assert predicates.get(pred) == BilatticeValue.TRUE.value, (
            f"missing projection cell {pred!r} on {_OBSERVER_BOUNDARY}; "
            f"have: {sorted(predicates)}"
        )

    assert predicates.get("role-observer") == BilatticeValue.TRUE.value, (
        f"missing role-observer cell on {_OBSERVER_BOUNDARY}; "
        f"have: {sorted(predicates)}"
    )

    # Spot-check an observer-distinguishing grant — proves the role
    # actually projected onto granted:* cells, not just the role-observer
    # marker. We pick shell:read because it's one of the two grants
    # that defines the observer profile.
    assert (
        predicates.get("granted:shell:read")
        == BilatticeValue.TRUE.value
    )


# ---------------------------------------------------------------------------
# Leg 3 — observer reads an admin-asserted cell
# ---------------------------------------------------------------------------


def test_observer_projects_admin_asserted_cell(
    tmp_path, deterministic_session_slugs,
):
    """Observer projects a cell asserted by the admin.

    Positive control for the observer's read surface. The admin
    pre-asserts ``(task:demo, status-open) = TRUE``; the observer
    opens its own session and :func:`substrate.stdlib.project`-s the
    entity. The atom is visible to the observer; the recorded sender
    is the admin (not the observer); the observer's read did not
    advance the event log.

    This is the load-bearing "observer reads succeed" claim — the
    counterpart to the per-surface denial legs below. Without this
    leg the observer slice would only prove what the observer
    *cannot* do, not what it *can*.
    """
    layout, log = _provision(tmp_path)

    admin = _open_admin(layout, log)
    assert_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, v=BilatticeValue.TRUE,
        sender=admin.owner,
    )

    # Observer opens its own session and reads — the read must not
    # advance the event log (project is read-only).
    observer = _open_observer(layout, log)
    height_before_read = log.height()
    atoms = project(
        layout, CellPattern(s=_TARGET, p=_PREDICATE),
        scope=f"entity:{_TARGET}",
    )
    height_after_read = log.height()

    assert height_after_read == height_before_read, (
        f"observer's project advanced the event log "
        f"({height_before_read} -> {height_after_read}) — "
        f"project must be a read-only operation"
    )
    assert len(atoms) == 1, (
        f"observer projected {len(atoms)} atoms, expected exactly 1 "
        f"(the admin's assert); atoms={atoms!r}"
    )
    atom = atoms[0]
    assert atom.s == _TARGET
    assert atom.p == _PREDICATE
    assert atom.v == BilatticeValue.TRUE
    assert atom.sender == _ADMIN_SLUG, (
        f"projected atom's sender was {atom.sender!r}, expected "
        f"{_ADMIN_SLUG!r} — observer must see the original author, "
        f"not be substituted as sender"
    )

    # And the observer's session is still in `open` state — reading
    # does not transition the session.
    assert observer.state == "open"


# ---------------------------------------------------------------------------
# Leg 4a — non-amplification: observer denied signal:session-scope:set
# ---------------------------------------------------------------------------


def test_observer_denied_signal_session_scope_set_no_state_advance(
    tmp_path, deterministic_session_slugs,
):
    """Observer attempting ``set_current_scope`` is denied — no state advance.

    Capability non-amplification per row 8 of
    ``references/theory-for-developers.md``: the observer's empty
    authz-for-authoring fiber gives no authority to drive
    ``signal:session-scope:set``-gated surfaces. The denial code is
    ``PCA_SCOPE_INSUFFICIENT`` with ``needed = signal:session-scope:set``,
    AND the denied call advances NEITHER the event log NOR the
    observer's session-scope fiber — the gate-ordering invariant of
    capability-permissions §6.3.

    This is one of three per-surface denial legs (4a–4c) — three
    different action namespaces are exercised so that a regression
    on any one of them is the single named hypothesis on test.
    """
    layout, log = _provision(tmp_path)
    observer = _open_observer(layout, log)

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
        "the signal:session-scope:set gate was not enforced for "
        "the observer role"
    )
    assert denied.code == PCA_SCOPE_INSUFFICIENT, (
        f"observer's denial code was {denied.code!r}, "
        f"expected PCA_SCOPE_INSUFFICIENT"
    )
    assert denied.details.get("needed") == "signal:session-scope:set", (
        f"observer's denial named needed={denied.details.get('needed')!r}, "
        f"expected 'signal:session-scope:set'"
    )

    height_after = log.height()
    fiber_after = layout.get_fiber(scope_entity)
    assert height_after == height_before, (
        f"denied set_current_scope advanced the event log "
        f"({height_before} -> {height_after})"
    )
    assert fiber_after == fiber_before, (
        "denied set_current_scope mutated the observer's session-scope fiber"
    )
    assert observer.state == "open"


# ---------------------------------------------------------------------------
# Leg 4b — non-amplification: observer denied signal:mount:attach
# ---------------------------------------------------------------------------


def test_observer_denied_signal_mount_attach_no_state_advance(
    tmp_path, deterministic_session_slugs,
):
    """Observer attempting ``attach_mount`` is denied — no state advance.

    Same shape as leg 4a but on a different signal surface. Pins that
    the observer's restriction extends across the ``signal:*``
    namespace, not just the ``session-scope:set`` action — three
    surfaces is the smallest convincing witness that the restriction
    is *structural* (empty authz fiber) rather than per-surface.
    """
    layout, log = _provision(tmp_path)
    observer = _open_observer(layout, log)

    mount_entity = f"mount:{_MOUNT_SLUG}"
    height_before = log.height()
    fiber_before = layout.get_fiber(mount_entity)

    denied: SubstrateError | None = None
    try:
        attach_mount(
            layout=layout, event_log=log, node_id=_NODE_ID,
            session_slug=observer.slug, slug=_MOUNT_SLUG,
            source_type="peer", source_ref="peer:p.local",
            local_prefix="remote/p",
        )
    except SubstrateError as e:
        denied = e

    assert denied is not None
    assert denied.code == PCA_SCOPE_INSUFFICIENT
    assert denied.details.get("needed") == "signal:mount:attach", (
        f"observer's denial named needed={denied.details.get('needed')!r}, "
        f"expected 'signal:mount:attach'"
    )

    height_after = log.height()
    fiber_after = layout.get_fiber(mount_entity)
    assert height_after == height_before
    assert fiber_after == fiber_before
    assert observer.state == "open"


# ---------------------------------------------------------------------------
# Leg 4c — non-amplification: observer denied signal:snapshot:record
# ---------------------------------------------------------------------------


def test_observer_denied_signal_snapshot_record_no_state_advance(
    tmp_path, deterministic_session_slugs,
):
    """Observer attempting ``record_snapshot`` is denied — no state advance.

    Third per-surface denial leg. ``record_snapshot`` is gated on
    ``signal:snapshot:record`` per
    :func:`storage.snapshots.record_snapshot`; the observer's
    ``{shell:read, audit:read}`` fiber covers neither the specific
    grant nor any wildcard that would subsume it.
    """
    layout, log = _provision(tmp_path)
    observer = _open_observer(layout, log)

    height_before = log.height()

    denied: SubstrateError | None = None
    try:
        record_snapshot(
            layout=layout, event_log=log, node_id=_NODE_ID,
            sess=observer,
        )
    except SubstrateError as e:
        denied = e

    assert denied is not None, (
        "observer's record_snapshot unexpectedly succeeded — "
        "the signal:snapshot:record gate was not enforced for "
        "the observer role"
    )
    assert denied.code == PCA_SCOPE_INSUFFICIENT
    assert denied.details.get("needed") == "signal:snapshot:record", (
        f"observer's denial named needed={denied.details.get('needed')!r}, "
        f"expected 'signal:snapshot:record'"
    )

    height_after = log.height()
    assert height_after == height_before, (
        f"denied record_snapshot advanced the event log "
        f"({height_before} -> {height_after})"
    )
    assert observer.state == "open"


# ---------------------------------------------------------------------------
# Leg 5 — byte-identical replay of the observer slice
# ---------------------------------------------------------------------------


def _observer_slice(layout: StorageLayout, log: EventLog) -> None:
    """The observer slice, factored for replay.

    Mirrors the substantive event-emitting sub-set: admin pre-seeds
    a cell, observer opens a session, observer reads. Denials are
    excluded because by definition they do not append events — they
    would not contribute observable bytes for the byte-identity
    comparison.
    """
    admin = _open_admin(layout, log)
    assert_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, v=BilatticeValue.TRUE,
        sender=admin.owner,
    )
    observer = _open_observer(layout, log)
    project(
        layout, CellPattern(s=_TARGET, p=_PREDICATE),
        scope=f"entity:{_TARGET}",
    )
    # Touch the observer to keep the symbol alive — assertions on
    # observer-side state belong in legs 3 and 4a–4c, not here.
    assert observer.owner == _OBSERVER_SLUG


def test_observer_slice_replays_byte_identical(tmp_path, monkeypatch):
    """Two fresh substrates running the observer slice produce identical events.

    Same determinism pinning as the admin and member slices and the
    umbrella ``t02-34f``: ``process.session.secrets`` is monkeypatched
    to a counter; the event log is initialised without
    ``wall_clock_ns`` so the genesis event's canonical bytes are
    stable. Observer-side determinism is critical for v0.4 federation
    diversity because read-only sessions outnumber authoring sessions
    by construction in any real deployment.
    """
    root_a = tmp_path / "run-a"
    root_b = tmp_path / "run-b"

    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    layout_a, log_a = _provision(root_a)
    _observer_slice(layout_a, log_a)

    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    layout_b, log_b = _provision(root_b)
    _observer_slice(layout_b, log_b)

    bytes_a = (root_a / EVENT_LOG_FILENAME).read_bytes()
    bytes_b = (root_b / EVENT_LOG_FILENAME).read_bytes()
    assert bytes_a == bytes_b, (
        f"event-log divergence at byte "
        f"{next((i for i, (x, y) in enumerate(zip(bytes_a, bytes_b)) if x != y), min(len(bytes_a), len(bytes_b)))}; "
        f"len(a)={len(bytes_a)} len(b)={len(bytes_b)}"
    )

    # Sanity: the log actually grew.
    assert log_a.height() > 5
    assert log_a.height() == log_b.height()
