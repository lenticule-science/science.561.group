"""Conformance — member-role authoring fixture (`t02-31f`).

Pairs with [`task:t02-31`](../../docs/dev/tasks/engineering/t02-31-v0.2a-multi-user-authoring.md)
per [decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).

This is the **per-role refinement** of the umbrella multi-user authoring
fixture :mod:`tests.conformance.test_t02_34f_multi_user_authoring`,
following the slicing pattern established by
:mod:`tests.conformance.test_t02_30f_admin_authoring` for the admin
slice. The umbrella exercises admin → member → observer end-to-end;
this fixture isolates the member slice so a future change that quietly
weakens (or accidentally widens) the member role is the single named
hypothesis on test.

The six legs map directly onto t02-31's load-bearing acceptance items:

* **Role-default capability fiber**
  (``test_member_role_carries_default_capability_fiber``) — pins the
  member's persisted ``granted:*`` cells against the §6.4 spec literal
  ``{respond:*, shell:read, shell:write, signal:session-scope:set,
  signal:session-message:*}``. We assert against the persisted cells
  on the boundary entity, not against the runtime
  ``ROLE_CAPABILITIES["member"]`` constant — same anti-tautology
  discipline as the admin slice.

* **Boundary-projection cells**
  (``test_member_user_boundary_emits_four_projection_cells``) — the
  four canonical projection cells (``projects-auth-fiber``,
  ``projects-authz-fiber``, ``projects-attention-fiber``,
  ``projects-history-fiber``) plus ``kind-user`` and ``role-member``
  are all present at value ``True`` on the member's ``user:<slug>``
  entity per
  [decisions/identity-is-boundary-projection.md](../../docs/dev/decisions/identity-is-boundary-projection.md)
  and
  [specs/init-boot/boot-sequence.md](../../docs/dev/specs/init-boot/boot-sequence.md)
  §4.1.

* **Member assert + retract = monotonic Both**
  (``test_member_asserts_then_retracts_own_cell_yields_both``) — the
  load-bearing claim of t02-31's acceptance: a member can retract a
  cell it previously asserted. The post-retract fiber value is
  exactly ``Both`` (paraconsistent retention rather than overwrite),
  which is the cell-record monotonicity rule per
  :func:`substrate.stdlib.retract_cell`'s docstring. Both cell ids
  are real and distinct.

* **Member positive-control on the signal:session-scope:set surface**
  (``test_member_drives_signal_session_scope_set_surface``) — the
  member's ``signal:session-scope:set`` grant covers
  :func:`storage.paths.set_current_scope`. This is the per-role
  positive control that distinguishes member from observer (observer
  has no ``signal:*`` grant — proven by the admin slice's leg 4).

* **Non-amplification: member denied an admin-only signal surface**
  (``test_member_denied_signal_mount_attach_no_state_advance``) —
  capability non-amplification per row 8 of
  [references/theory-for-developers.md](../../docs/dev/references/theory-for-developers.md):
  the member algebra cannot grant authority it does not hold. Member
  attempting :func:`storage.mounts.attach_mount` (which gates on
  ``signal:mount:attach``, not in the member's role-default fiber)
  raises :data:`substrate.error_codes.PCA_SCOPE_INSUFFICIENT` and
  the denied call advances NEITHER the event log NOR the mount
  fiber. ``signal:mount:attach`` is the load-bearing target here
  because the admin's ``signal:*`` super-grant covers it but the
  member's ``signal:session-scope:set`` + ``signal:session-message:*``
  grants do not — same shape of capability, different prefix
  coverage, exactly the non-amplification claim t02-31 makes.

* **Byte-identical replay**
  (``test_member_slice_replays_byte_identical``) — the member slice
  runs against two fresh substrates with ``process.session.secrets``
  monkeypatched to a deterministic counter; ``events.jsonl`` is
  byte-identical between runs. Same determinism pins as the admin
  slice and the umbrella ``t02-34f``.

**Explicitly out of scope.** The t02-31 description text mentions
"a member cannot read other users' history-fiber cells", but that
claim is **not** in the formal acceptance items list and is **not**
gated in the v0.2a code path: :meth:`storage.storage_layout.StorageLayout.get_fiber`
performs no capability check, and there is no ``require_capability``
on any fiber-read surface in v0.2a. Per-fiber read gates are scheduled
for the v0.4 federation slice (when the attention-fiber projection
becomes a discriminating capability per
[decisions/identity-is-boundary-projection.md](../../docs/dev/decisions/identity-is-boundary-projection.md)).
A fixture leg here would have to either (a) test absence of a gate
that does not exist (tautology against an empty path), or (b) ratify
a not-yet-shipped surface. We pick neither.
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
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCA_SCOPE_INSUFFICIENT, SubstrateError
from substrate.stdlib import assert_cell, retract_cell


_NODE_ID = "test-node"
_TARGET = "task:demo"
_PREDICATE = "status-open"
_MEMBER_SLUG = "user:alice"
# Identity cells live on the boundary surface (see init_boot.bootstrap_users
# module docstring + decisions/personnel-migration-sequenced-before-bootstrap-users.md).
_MEMBER_BOUNDARY = "boundary:alice"
_MOUNT_SLUG = "m-forbidden"


# ---------------------------------------------------------------------------
# Deterministic session-slug source — same shape as t02-30f / t02-34f
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


def _member_only_manifest() -> BootstrapManifest:
    """Single-member manifest. The member is the role under test.

    No admin or observer is provisioned: the member slice's claims are
    self-contained — assertion, retraction, signal:session-scope:set,
    signal:mount:attach denial, byte-identical replay. The cross-role
    interaction (admin asserts → member retracts → observer reads)
    lives in the umbrella ``t02-34f``.
    """
    return BootstrapManifest(users=[
        BootstrapUserEntry(
            slug=_MEMBER_SLUG, display_name="Alice", role="member",
        ),
    ])


def _provision(root: Path) -> tuple[StorageLayout, EventLog]:
    """Open layout + log + provision the manifest. Mirrors t02-30f."""
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    # NOTE: no wall_clock_ns — the genesis event must be deterministic.
    log.initialize(node_id=_NODE_ID)
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id=_NODE_ID,
        manifest=_member_only_manifest(),
    )
    return layout, log


def _open_member(layout, log):
    return open_session(
        layout=layout, event_log=log, node_id=_NODE_ID,
        owner=_MEMBER_SLUG, capabilities=ROLE_CAPABILITIES["member"],
    )


# ---------------------------------------------------------------------------
# Leg 1 — role-default capability fiber
# ---------------------------------------------------------------------------


def test_member_role_carries_default_capability_fiber(tmp_path):
    """``bootstrap_users`` emits the member's authz fiber as ``granted:*`` cells.

    Pins capability-permissions.md §6.4 — the member role-default fiber
    is exactly ``{respond:*, shell:read, shell:write,
    signal:session-scope:set, signal:session-message:*}`` *as persisted
    on the boundary entity*. Asserted against the literal §6.4 spec
    set, not against the runtime ``ROLE_CAPABILITIES["member"]``
    constant. The negative-side check on this leg is load-bearing for
    the non-amplification claim (leg 4): the member must NOT carry
    ``signal:mount:attach`` (or the ``signal:*`` super-grant), because
    leg 4 proves the consequence of that absence.
    """
    layout, _log = _provision(tmp_path)
    member_fiber = layout.get_fiber(_MEMBER_BOUNDARY) or {}
    predicates = member_fiber.get("predicates", {})

    # Persisted grants — the spec literal, not the runtime constant.
    expected_grants = {
        "granted:respond:*",
        "granted:shell:read",
        "granted:shell:write",
        "granted:signal:session-scope:set",
        "granted:signal:session-message:*",
    }
    actual_grants = {
        p for p, v in predicates.items()
        if p.startswith("granted:") and v == BilatticeValue.TRUE.value
    }
    assert actual_grants == expected_grants, (
        f"member's persisted grant fiber differs from the §6.4 spec "
        f"literal; missing={expected_grants - actual_grants}, "
        f"unexpected={actual_grants - expected_grants}"
    )

    # Negative-side check — load-bearing for leg 4. The member must
    # NOT carry signal:mount:attach (specifically) or signal:*
    # (super-grant) — those are admin-only. A widening regression
    # would surface here before leg 4 stops failing.
    assert "granted:signal:mount:attach" not in actual_grants
    assert "granted:signal:*" not in actual_grants

    # Belt-and-braces: the runtime constant matches the spec literal.
    assert set(ROLE_CAPABILITIES["member"]) == {
        "respond:*", "shell:read", "shell:write",
        "signal:session-scope:set", "signal:session-message:*",
    }


# ---------------------------------------------------------------------------
# Leg 2 — boundary-projection cells
# ---------------------------------------------------------------------------


def test_member_user_boundary_emits_four_projection_cells(tmp_path):
    """The member's ``user:<slug>`` entity carries the boundary's projection cells.

    Same boundary-projection contract as the admin slice's leg 2,
    here applied to the member role: the four canonical projection
    cells (auth, authz, attention, history) plus ``kind-user`` and
    ``role-member`` are all present at value ``True``. A regression
    that elided a fiber emission for the non-admin roles (e.g. an
    over-eager idempotence check that skipped any role other than
    admin) would break here.
    """
    layout, _log = _provision(tmp_path)
    member_fiber = layout.get_fiber(_MEMBER_BOUNDARY) or {}
    predicates = member_fiber.get("predicates", {})

    assert predicates.get("kind-user") == BilatticeValue.TRUE.value, (
        f"missing kind-user cell on {_MEMBER_BOUNDARY}; "
        f"have: {sorted(predicates)}"
    )

    for fiber in CANONICAL_FIBERS:
        pred = f"projects-{fiber}-fiber"
        assert predicates.get(pred) == BilatticeValue.TRUE.value, (
            f"missing projection cell {pred!r} on {_MEMBER_BOUNDARY}; "
            f"have: {sorted(predicates)}"
        )

    assert predicates.get("role-member") == BilatticeValue.TRUE.value, (
        f"missing role-member cell on {_MEMBER_BOUNDARY}; "
        f"have: {sorted(predicates)}"
    )

    # Spot-check the member-distinguishing grant — proves the role
    # actually projected onto granted:* cells, not just the role-member
    # marker. We pick signal:session-scope:set because it's the
    # member-positive-control surface tested in leg 3.
    assert (
        predicates.get("granted:signal:session-scope:set")
        == BilatticeValue.TRUE.value
    )


# ---------------------------------------------------------------------------
# Leg 3a — assert + retract: monotonic Both
# ---------------------------------------------------------------------------


def test_member_asserts_then_retracts_own_cell_yields_both(
    tmp_path, deterministic_session_slugs,
):
    """Member asserts a cell, then retracts it; fiber value is Both.

    The load-bearing claim of t02-31's acceptance: a member can retract
    a cell it previously asserted. Per the cell-record monotonicity
    rule (``substrate.stdlib.retract_cell`` docstring), the post-retract
    fiber value is the join ``TRUE ⊔ FALSE = Both`` — paraconsistent
    retention, not overwrite. This is the bilattice-algebraic surface
    that distinguishes the substrate's retraction discipline from a
    naive delete.

    Both cell ids must be real and distinct (the retract is a fresh
    cell, not a mutation of the assert).
    """
    layout, log = _provision(tmp_path)
    member = _open_member(layout, log)

    assert_result = assert_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, v=BilatticeValue.TRUE,
        sender=member.owner,
    )
    # Mid-state: fiber is exactly TRUE before the retract.
    fiber = layout.get_fiber(_TARGET) or {}
    assert (
        fiber.get("predicates", {}).get(_PREDICATE)
        == BilatticeValue.TRUE.value
    )

    retract_result = retract_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, sender=member.owner,
    )
    # Post-state: the join collapsed to Both per monotonicity.
    fiber = layout.get_fiber(_TARGET) or {}
    fiber_value = fiber.get("predicates", {}).get(_PREDICATE)
    assert fiber_value == BilatticeValue.BOTH.value, (
        f"member retract of own cell produced fiber value {fiber_value!r}, "
        f"expected BOTH (TRUE ⊔ FALSE per monotonicity)"
    )

    # Both cell ids are real and distinct — the retract is a fresh
    # cell, not a mutation of the assert.
    assert assert_result.cell_id
    assert retract_result.cell_id
    assert assert_result.cell_id != retract_result.cell_id


# ---------------------------------------------------------------------------
# Leg 3b — member positive-control on signal:session-scope:set
# ---------------------------------------------------------------------------


def test_member_drives_signal_session_scope_set_surface(
    tmp_path, deterministic_session_slugs,
):
    """Member's ``signal:session-scope:set`` grant covers ``set_current_scope``.

    Positive control: the member's role-default fiber DOES include
    ``signal:session-scope:set``, so the gate-ordering invariant
    succeeds for this surface — the call advances the event log AND
    writes the binary cell to the member's session-scope fiber.

    This is the load-bearing positive-side claim that distinguishes
    member from observer: the observer has NO ``signal:*`` grant of
    any kind (proven by the admin slice's leg 4); the member has the
    one specific ``signal:session-scope:set`` grant. Same surface,
    different outcome, gated by the role-default fiber alone.
    """
    layout, log = _provision(tmp_path)
    member = _open_member(layout, log)

    height_before = log.height()
    set_current_scope(
        layout=layout, event_log=log, node_id=_NODE_ID,
        session_slug=member.slug, scope="scope:reading-room",
    )
    height_after = log.height()
    assert height_after > height_before, (
        "member's set_current_scope did not advance the event log — "
        "the signal:session-scope:set gate may have wrongly denied "
        "the member"
    )

    scope_entity = f"session-scope:{member.slug}"
    scope_fiber = layout.get_fiber(scope_entity) or {}
    assert scope_fiber.get("predicates"), (
        f"member's set_current_scope did not write to {scope_entity}; "
        f"got fiber: {scope_fiber!r}"
    )


# ---------------------------------------------------------------------------
# Leg 4 — non-amplification: member denied admin-only signal surface
# ---------------------------------------------------------------------------


def test_member_denied_signal_mount_attach_no_state_advance(
    tmp_path, deterministic_session_slugs,
):
    """Member attempting ``attach_mount`` is denied — no state advance.

    Capability non-amplification per row 8 of
    ``references/theory-for-developers.md``: the member algebra cannot
    grant authority it does not hold. ``attach_mount`` gates on
    ``signal:mount:attach`` per :func:`storage.mounts.attach_mount`;
    the member's role-default fiber carries ``signal:session-scope:set``
    and ``signal:session-message:*`` but neither covers
    ``signal:mount:attach`` (the token-aligned wildcard discipline of
    :func:`security.capabilities.grants` requires either an exact
    match, the ``signal:mount:*`` action-wildcard, or the ``signal:*``
    super-grant).

    Load-bearing post-conditions: the denial code is
    ``PCA_SCOPE_INSUFFICIENT`` with ``needed = signal:mount:attach``,
    AND the denied call advances NEITHER the event log NOR the mount
    fiber. An implementation that wrote a partial mount-fiber (kind +
    source-type) before the gate fired would pass a code-only check
    but fail this leg — exactly the gate-ordering invariant that
    binary-cell-emission §2 enforces.
    """
    layout, log = _provision(tmp_path)
    member = _open_member(layout, log)

    mount_entity = f"mount:{_MOUNT_SLUG}"
    height_before = log.height()
    fiber_before = layout.get_fiber(mount_entity)

    denied: SubstrateError | None = None
    try:
        attach_mount(
            layout=layout, event_log=log, node_id=_NODE_ID,
            session_slug=member.slug, slug=_MOUNT_SLUG,
            source_type="peer", source_ref="peer:p.local",
            local_prefix="remote/p",
        )
    except SubstrateError as e:
        denied = e

    assert denied is not None, (
        "member's attach_mount unexpectedly succeeded — the "
        "signal:mount:attach gate was not enforced for the member role"
    )
    assert denied.code == PCA_SCOPE_INSUFFICIENT, (
        f"member's denial code was {denied.code!r}, "
        f"expected PCA_SCOPE_INSUFFICIENT"
    )
    assert denied.details.get("needed") == "signal:mount:attach", (
        f"member's denial named needed={denied.details.get('needed')!r}, "
        f"expected 'signal:mount:attach'"
    )

    # Load-bearing: the denied call advanced NEITHER the event log NOR
    # the mount fiber.
    height_after = log.height()
    fiber_after = layout.get_fiber(mount_entity)
    assert height_after == height_before, (
        f"denied attach_mount advanced the event log "
        f"({height_before} -> {height_after})"
    )
    assert fiber_after == fiber_before, (
        "denied attach_mount mutated the mount fiber"
    )

    # And the member's session is still in `open` state — denial
    # does not transition the session.
    assert member.state == "open"


# ---------------------------------------------------------------------------
# Leg 5 — byte-identical replay of the member slice
# ---------------------------------------------------------------------------


def _member_slice(layout: StorageLayout, log: EventLog) -> None:
    """The member authority slice, factored for replay.

    Mirrors the substantive sub-set of legs 3a + 3b (assert +
    retract + scope-set) without the denial leg — a denial is by
    definition not an event source, so including it would not
    contribute observable bytes for the byte-identity comparison.
    """
    member = _open_member(layout, log)
    assert_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, v=BilatticeValue.TRUE,
        sender=member.owner,
    )
    retract_cell(
        layout=layout, event_log=log, node_id=_NODE_ID,
        s=_TARGET, p=_PREDICATE, sender=member.owner,
    )
    set_current_scope(
        layout=layout, event_log=log, node_id=_NODE_ID,
        session_slug=member.slug, scope="scope:reading-room",
    )


def test_member_slice_replays_byte_identical(tmp_path, monkeypatch):
    """Two fresh substrates running the member slice produce identical events.

    Same determinism pinning as the admin slice and the umbrella
    ``t02-34f``: ``process.session._new_slug`` is monkeypatched to a
    counter; the event log is initialised without ``wall_clock_ns``
    so the genesis event's canonical bytes are stable. Member-side
    determinism is critical for the v0.4 federation diversity claim
    because member sessions outnumber admin sessions by construction.
    """
    root_a = tmp_path / "run-a"
    root_b = tmp_path / "run-b"

    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    layout_a, log_a = _provision(root_a)
    _member_slice(layout_a, log_a)

    monkeypatch.setattr(session_mod, "secrets", _DeterministicSecrets())
    layout_b, log_b = _provision(root_b)
    _member_slice(layout_b, log_b)

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
