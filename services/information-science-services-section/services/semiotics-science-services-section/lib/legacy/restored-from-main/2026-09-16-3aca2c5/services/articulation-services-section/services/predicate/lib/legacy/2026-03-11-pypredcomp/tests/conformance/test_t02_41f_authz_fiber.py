"""Conformance — authz-fiber projection fixture (`t02-41f`).

Pairs with [`task:t02-41`](../../docs/dev/tasks/engineering/t02-41-v0.2a-kernel-frozen.md)
per [decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).

The authz fiber is the projection that answers *what this sender can
do*. Per [specs/security/user-as-boundary.md](../../docs/dev/specs/security/user-as-boundary.md)
§2.2 it indexes the boundary's capability cells; per
[specs/security/capability-model.md](../../docs/dev/specs/security/capability-model.md)
the substrate composes the sender's authz fiber with the requested
predicate via the modal restriction $\\Box_R$
([`substrate.authorization.box_R`](../../../../src/substrate/authorization.py)),
the surface form of the $\\Rightarrow$ adjoint to the Phase-3 fusion
$\\odot$ (row 2 of [`references/theory-for-developers.md`](../../docs/dev/references/theory-for-developers.md)).
The canonical *projection cell*
``(user:<slug>, projects-authz-fiber) = TRUE`` is emitted onto the
boundary entity's fiber alongside the per-capability
``(user:<slug>, granted:<cap>) = TRUE`` cells by
:func:`init_boot.bootstrap_users` per
[boot-sequence.md §4.1](../../docs/dev/specs/init-boot/boot-sequence.md).

Restriction is algebraic, NOT exceptional. Per
[decisions/capability-not-acl.md](../../docs/dev/decisions/capability-not-acl.md)
("the substrate's algebra IS the capability check") and t02-41's
acceptance, no code path in :mod:`substrate` raises on insufficient
authority — a non-TRUE Box_R outcome is the algebraic content of
"this sender's authority restricts the requested predicate to
$\\bot$" and the substrate's response is a vacuous
:class:`substrate.respond.RespondResult` (no cell, no event, fiber
unchanged) carrying the denial witness on its ``authz_decision``
field.

The four legs map directly onto t02-41's load-bearing acceptance items:

* **Authz-projection cell + per-capability grants**
  (``test_bootstrapped_user_carries_authz_projection_and_grant_cells``)
  — pins the ``projects-authz-fiber`` cell on every bootstrapped
  boundary plus at least one ``granted:<cap>`` cell sourced from
  ``ROLE_CAPABILITIES``. The authz projection is role-orthogonal (every
  boundary projects it), but the *content* of the projected grants is
  role-conditioned — exercising both is the minimum that proves the
  projection is materialising the capability-fiber content from the
  bootstrap manifest, not just the projection-marker cell.

* **$\\Rightarrow$ admits when the box says yes**
  (``test_authz_admit_composes_payload_and_advances_fiber``) — pins
  the success path of the modal restriction in load-bearing form: an
  accessibility cell with ``allowed_value=TRUE`` on the
  (sender → target) edge produces ``Box_R(TRUE) = TRUE``, the Phase-0
  gate admits, and Phases 1-4 compose the payload into the target's
  fiber. The ``authz_decision`` carried back on the
  :class:`substrate.respond.RespondResult` records ``allowed=True``
  with the licensing cell id.

* **$\\Rightarrow$ restricts when the box says nothing — no event, no fiber change**
  (``test_authz_deny_emits_no_event_and_does_not_change_target_fiber``)
  — the no-amplification claim of
  ``functional-runtime-platform/theorems/capability-non-amplification``
  in load-bearing form: a sender for whom no accessibility cell exists
  on the (sender → target) edge gets ``Box_R(TRUE) = NONE``, the
  Phase-0 gate records ``allowed=False`` on the respond context, the
  pipeline short-circuits, and the call returns a vacuous
  :class:`substrate.respond.RespondResult` — ``cell_id is None``,
  ``cell is None``, ``event_id is None``, the event log has not
  advanced, and the target fiber is byte-identical before and after.
  The substrate raises NO exception on insufficient authority per
  ``decisions/capability-not-acl.md``. An implementation that raised
  PCC_AUTHZ_DENIED, emitted a denied-attempt cell, or wrote a partial
  fiber would all fail this leg.

* **Byte-identical replay**
  (``test_authz_fiber_emission_replays_byte_identical``) — two fresh
  substrates running the same bootstrap manifest produce
  byte-identical event logs, including the authz-projection cell and
  the per-capability grants. Same determinism pinning as t02-40f
  (monkeypatch ``process.user.secrets`` to a deterministic counter).
"""

from __future__ import annotations

import hashlib
from pathlib import Path

from init_boot.bootstrap_users import (
    ROLE_CAPABILITIES,
    BootstrapManifest,
    BootstrapUserEntry,
    ensure_users_from_manifest,
)
from storage.event_log import EVENT_LOG_FILENAME, EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.authorization import AccessibilityCell, write_accessibility
from substrate.respond import respond


_NODE_ID = "test-node"
_ADMIN_SLUG = "user:captain"
_MEMBER_SLUG = "user:alice"
_OBSERVER_SLUG = "user:bob"
_TARGET = "task:demo"
_PREDICATE = "status-open"


# ---------------------------------------------------------------------------
# Deterministic token source for the replay leg
# ---------------------------------------------------------------------------


class _DeterministicSecrets:
    def __init__(self) -> None:
        self._n = 0

    def token_hex(self, n: int) -> str:
        self._n += 1
        return f"{self._n:016x}"

    def token_urlsafe(self, nbytes: int) -> str:
        self._n += 1
        return f"det-token-{self._n:016x}"


# ---------------------------------------------------------------------------
# Fixture builders
# ---------------------------------------------------------------------------


def _three_role_manifest() -> BootstrapManifest:
    """One user per role — the authz projection is role-orthogonal but
    its *content* is role-conditioned, so all three roles must
    exercise the per-capability ``granted:<cap>`` emission."""
    return BootstrapManifest(users=[
        BootstrapUserEntry(slug=_ADMIN_SLUG,    display_name="Captain", role="admin"),
        BootstrapUserEntry(slug=_MEMBER_SLUG,   display_name="Alice",   role="member"),
        BootstrapUserEntry(slug=_OBSERVER_SLUG, display_name="Bob",     role="observer"),
    ])


def _provision(root: Path) -> tuple[StorageLayout, EventLog]:
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id=_NODE_ID)
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id=_NODE_ID,
        manifest=_three_role_manifest(),
    )
    return layout, log


# ---------------------------------------------------------------------------
# Leg 1 — projection cell + per-capability grants on every role
# ---------------------------------------------------------------------------


def test_bootstrapped_user_carries_authz_projection_and_grant_cells(tmp_path):
    """Every bootstrapped user carries ``projects-authz-fiber`` + grants.

    The authz projection cell is the boundary's marker that this fiber
    is materialised; the ``granted:<cap>`` cells ARE the materialised
    fiber content. Pins both per
    [decisions/identity-is-boundary-projection.md](../../docs/dev/decisions/identity-is-boundary-projection.md)
    and [boot-sequence.md §4.1](../../docs/dev/specs/init-boot/boot-sequence.md).
    Iterating across all three roles catches a regression that
    accidentally role-gates the projection cell, drops a role-default
    grant, or de-syncs ``ROLE_CAPABILITIES`` from the persisted
    fiber content.
    """
    layout, _log = _provision(tmp_path)

    # Identity cells (kind-user / projects-*-fiber / role-* / granted:*)
    # land on the boundary surface — see init_boot.bootstrap_users module
    # docstring + decisions/personnel-migration-sequenced-before-bootstrap-users.md.
    for slug, role in (
        (_ADMIN_SLUG, "admin"),
        (_MEMBER_SLUG, "member"),
        (_OBSERVER_SLUG, "observer"),
    ):
        boundary_slug = "boundary:" + slug.split(":", 1)[1]
        fiber = layout.get_fiber(boundary_slug) or {}
        predicates = fiber.get("predicates", {})

        assert predicates.get("projects-authz-fiber") == BilatticeValue.TRUE.value, (
            f"missing projects-authz-fiber cell on {boundary_slug} (role={role}); "
            f"have: {sorted(predicates)}"
        )

        # Every role-default capability must appear as a granted:<cap>
        # cell at TRUE on the boundary's fiber.
        for cap in ROLE_CAPABILITIES[role]:
            pred = f"granted:{cap}"
            assert predicates.get(pred) == BilatticeValue.TRUE.value, (
                f"missing {pred!r} cell on {boundary_slug} (role={role}); "
                f"have: {sorted(p for p in predicates if p.startswith('granted:'))}"
            )


# ---------------------------------------------------------------------------
# Leg 2 — Box_R admits → respond composes
# ---------------------------------------------------------------------------


def test_authz_admit_composes_payload_and_advances_fiber(tmp_path):
    """An accessibility grant on the (sender → target) edge admits the respond.

    Pins the success path of the modal restriction:
    ``Box_R(TRUE) = TRUE`` along an accessible edge per
    ``modal-necessity-basic-properties`` (constant-true preservation).
    With a single TRUE accessibility cell on the
    ``(user:captain, task:demo)`` edge, the Phase-0 gate auto-enables
    (because at least one authentication-surface cell exists on disk)
    and admits; Phases 1-4 compose the payload into the target fiber;
    the ``authz_decision`` records ``allowed=True`` with the licensing
    cell's id in ``matched_cells``.
    """
    layout, log = _provision(tmp_path)

    cell_id, _path = write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from=_ADMIN_SLUG,
        world_to=_TARGET,
        allowed_value=BilatticeValue.TRUE,
    ))

    height_before = log.height()
    fiber_before = layout.get_fiber(_TARGET)

    result = respond(
        target=_TARGET,
        payload={_PREDICATE: "True"},
        sender=_ADMIN_SLUG,
        layout=layout,
        event_log=log,
        node_id=_NODE_ID,
        active_rule_ids=[],
    )

    # Gate fired and admitted.
    assert result.authz_decision is not None, (
        "authz gate did not fire; expected auto-enable because an "
        "accessibility cell exists on the authentication surface"
    )
    assert result.authz_decision["allowed"] is True
    assert cell_id in result.authz_decision.get("matched_cells", []), (
        f"licensing cell id {cell_id!r} not in matched_cells; got "
        f"{result.authz_decision.get('matched_cells')!r}"
    )

    # Phases 1-4 ran: cell emitted, event-log advanced, target fiber
    # carries the predicate.
    assert result.cell_id, "respond returned no cell id on admit"
    assert log.height() > height_before
    fiber_after = layout.get_fiber(_TARGET) or {}
    assert fiber_after.get("predicates", {}).get(_PREDICATE) == BilatticeValue.TRUE.value
    assert fiber_after != fiber_before


# ---------------------------------------------------------------------------
# Leg 3 — Box_R denies → no event, no fiber change
# ---------------------------------------------------------------------------


def test_authz_deny_emits_no_event_and_does_not_change_target_fiber(tmp_path):
    """A sender with no accessibility grant is restricted to $\\bot$ — no event, no raise.

    The accessibility relation is installed (one TRUE cell exists on
    *some* edge so the gate auto-enables), but the requested
    ``(user:bob, task:demo)`` edge has no matching cell —
    ``Box_R(TRUE)`` reduces to ``truth_meet(TRUE, NONE) = NONE`` per
    [`substrate.authorization.box_R`](../../../../src/substrate/authorization.py).
    The Phase-0 gate records ``allowed=False`` with ``box_value=NONE``
    on the respond context, the pipeline short-circuits, and the call
    returns a *vacuous* :class:`substrate.respond.RespondResult`:
    ``cell_id`` / ``cell`` / ``event_id`` are all None, the event log
    is at exactly the same height as before the call, and
    ``RespondResult.fiber`` echoes the unchanged target fiber
    byte-for-byte.

    The substrate does NOT raise on insufficient authority — that's
    the load-bearing acceptance item from t02-41 per
    ``decisions/capability-not-acl.md`` ("the algebra IS the
    capability check"). An implementation that raised
    :data:`PCC_AUTHZ_DENIED`, emitted a denied-attempt cell, or wrote
    a partial fiber would all fail this leg.
    """
    layout, log = _provision(tmp_path)

    # Install a grant on an UNRELATED edge to enable the gate without
    # licensing the (observer → task:demo) call we're about to make.
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from=_ADMIN_SLUG,
        world_to="task:other",
        allowed_value=BilatticeValue.TRUE,
    ))

    height_before = log.height()
    fiber_before = layout.get_fiber(_TARGET)

    result = respond(
        target=_TARGET,
        payload={_PREDICATE: "True"},
        sender=_OBSERVER_SLUG,
        layout=layout,
        event_log=log,
        node_id=_NODE_ID,
        active_rule_ids=[],
    )

    # Vacuous outcome: gate denied, pipeline short-circuited, no
    # cell/event materialised. The witness records the boxed value at
    # NONE — the algebraic content of "restrict to $\\bot$".
    assert result.authz_decision is not None
    assert result.authz_decision["allowed"] is False
    assert result.authz_decision["box_value"] == BilatticeValue.NONE.value
    assert result.cell_id is None
    assert result.cell is None
    assert result.event_id is None
    assert result.event_ord is None

    # Load-bearing: no state advance.
    assert log.height() == height_before, (
        f"denied respond advanced the event log "
        f"({height_before} -> {log.height()})"
    )
    fiber_after = layout.get_fiber(_TARGET)
    assert fiber_after == fiber_before, (
        "denied respond mutated the target fiber"
    )
    # And the RespondResult.fiber echoes the unchanged target so a
    # caller doesn't have to re-read.
    assert result.fiber == (fiber_before or {
        "entity": _TARGET,
        "latest_cell_id": None,
        "predicates": {},
        "cells_by_predicate": {},
        "history": [],
    })


# ---------------------------------------------------------------------------
# Leg 4 — byte-identical replay of bootstrap (authz emission included)
# ---------------------------------------------------------------------------


def test_authz_fiber_emission_replays_byte_identical(tmp_path, monkeypatch):
    """Two fresh substrates produce byte-identical bootstraps.

    The authz-projection cell and every ``granted:<cap>`` cell go through
    the event log on bootstrap; if any of them carried non-deterministic
    bytes (e.g. an unmasked timestamp on the user-creation audit), this
    leg would catch it. Determinism pin matches t02-40f: monkeypatch
    ``process.user.secrets`` to a counter so the per-user bearer
    tokens (and thus the persisted token_hash echoed on the User
    record) are stable across runs.
    """
    from process import user as user_mod

    root_a = tmp_path / "run-a"
    root_b = tmp_path / "run-b"

    monkeypatch.setattr(user_mod, "secrets", _DeterministicSecrets())
    layout_a, log_a = _provision(root_a)

    monkeypatch.setattr(user_mod, "secrets", _DeterministicSecrets())
    layout_b, log_b = _provision(root_b)

    bytes_a = (root_a / EVENT_LOG_FILENAME).read_bytes()
    bytes_b = (root_b / EVENT_LOG_FILENAME).read_bytes()
    assert bytes_a == bytes_b, (
        f"event-log divergence at byte "
        f"{next((i for i, (x, y) in enumerate(zip(bytes_a, bytes_b)) if x != y), min(len(bytes_a), len(bytes_b)))}; "
        f"len(a)={len(bytes_a)} len(b)={len(bytes_b)}"
    )

    # Sanity: the logs grew well past the genesis event — bootstrap of
    # three users emits dozens of cells (provisioned + kind + four
    # projections + role + per-capability grants).
    assert log_a.height() > 10
    assert log_a.height() == log_b.height()

    # Belt-and-braces independence check: the SHA-256 of the two logs
    # also matches. A divergence in non-canonical ordering would fail
    # the byte equality above; the hash check is cheap insurance.
    assert hashlib.sha256(bytes_a).hexdigest() == hashlib.sha256(bytes_b).hexdigest()
