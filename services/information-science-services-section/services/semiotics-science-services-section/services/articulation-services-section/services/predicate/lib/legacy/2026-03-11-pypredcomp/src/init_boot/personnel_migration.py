"""Personnel → boundary migration on first boot.

Per `pt-08-personnel-to-boundary-migration` and the `identity-is-boundary-projection`
decision: v0.1 substrates emitted ``personnel-record`` cells; v0.2 promotes
identity to *boundary* entities that project four canonical fibers (auth, authz,
attention, history) per :mod:`init_boot.bootstrap_users`. The migration is a
one-shot natural transformation from the ``personnel-record`` presheaf to the
``boundary`` presheaf.

The routine is invoked as a boot phase **before** ``bootstrap_users`` and
before ``runlevel_promote`` (per pt-08 acceptance: any v0.1 personnel records
must be promoted onto the v0.2 boundary scheme before the bootstrap-user
routine starts provisioning ``boundary:*`` entities, so the substrate never
holds two parallel identity universes at once). It walks the event log, finds
every ``personnel:<slug>`` entity, and for each whose fiber lacks a
``migrated-to-boundary-at-ord:<ord>`` predicate it:

1. Emits ``(boundary:<slug>, kind-user) = t``.
2. Emits the four canonical projection cells
   ``(boundary:<slug>, projects-<auth|authz|attention|history>-fiber) = t``
   per spec §4.1.
3. Carries any role / capability cells found on the personnel fiber forward to
   the boundary fiber (``role-*`` and ``granted:*`` predicates). Other
   predicates (and any non-TRUE bilattice values) are intentionally NOT carried
   — see :func:`legacy_view` for the read-side contract.
4. Records ``(personnel:<slug>, migrated-to-boundary-at-ord:<ord>) = t`` on the
   personnel fiber as the audit cell — the ``<ord>`` suffix is the event ordinal
   of the migration so re-boot is idempotent (the predicate is already True for
   the migrated personnel) and the audit trail is replayable.
5. Records ``(personnel:<slug>, migrated-with-scheme:<version>) = t`` pinning
   the boundary-scheme version under which the migration was performed. A
   later boot whose code carries a *different* :data:`BOUNDARY_SCHEME_VERSION`
   raises :class:`SubstrateError` ``PCB_BOUNDARY_SCHEME_DIVERGED`` and the
   boot phase records failure (boot transitions to degraded) rather than
   silently re-deriving against incompatible code.

A "personnel-record" cell is identified by a fiber whose entity slug starts
with ``personnel:`` AND whose fiber carries a ``kind-personnel-record``
predicate set to True. Fresh v0.2a substrates have no such cells → the routine
is a no-op and reports ``migrated=[]``.

This is a v0.2a freeze-gate-3 adjacency: bootstrap-users and personnel-migration
share the boundary-projection machinery and must reconcile divergence-free
together.
"""

from __future__ import annotations

import logging
from typing import Any

from init_boot.bootstrap_users import CANONICAL_FIBERS
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCB_BOUNDARY_SCHEME_DIVERGED, SubstrateError
from substrate.stdlib import assert_cell

log = logging.getLogger("substrate.boot.personnel-migration")

PERSONNEL_PREFIX = "personnel:"
BOUNDARY_PREFIX = "boundary:"
KIND_PREDICATE = "kind-personnel-record"
MIGRATED_PREDICATE_PREFIX = "migrated-to-boundary-at-ord:"
SCHEME_PREDICATE_PREFIX = "migrated-with-scheme:"

# The boundary-scheme version a migration commits to. Per pt-08 the
# migration is a deterministic function of (legacy personnel set,
# boundary scheme version); the version is recorded on the personnel
# side at migration time and re-checked on every subsequent boot.
# Bumping this constant requires a captain decision plus a re-migration
# pass that emits the new scheme cells; until then, a pre-existing
# migration carrying a different version raises
# ``PCB_BOUNDARY_SCHEME_DIVERGED`` rather than silently re-deriving.
BOUNDARY_SCHEME_VERSION = "v0.2-four-fiber"


def _is_already_migrated(personnel_fiber: dict[str, Any]) -> bool:
    """A personnel fiber is migrated iff some ``migrated-to-boundary-at-ord:*``
    predicate is asserted True."""
    preds = personnel_fiber.get("predicates") or {}
    for k, v in preds.items():
        if k.startswith(MIGRATED_PREDICATE_PREFIX) and BilatticeValue(v) == BilatticeValue.TRUE:
            return True
    return False


def _enumerate_personnel(event_log: EventLog) -> list[str]:
    """All distinct personnel slugs touched by any respond event in the log.

    Sorted so emission order is deterministic across runs.
    """
    seen: set[str] = set()
    for ev in event_log.iter_events():
        if ev.get("kind") != "respond":
            continue
        body = ev.get("body") or {}
        target = body.get("target")
        if isinstance(target, str) and target.startswith(PERSONNEL_PREFIX):
            seen.add(target)
    return sorted(seen)


def _carry_forward_predicates(
    personnel_fiber: dict[str, Any],
) -> dict[str, BilatticeValue]:
    """Predicates from the personnel fiber to re-emit on the boundary.

    Carries ``role-*`` and ``granted:*`` cells whose value is True. Discards
    bookkeeping predicates (``kind-personnel-record``, ``migrated-*``,
    ``provisioned``) — they describe the personnel record, not the boundary.
    """
    out: dict[str, BilatticeValue] = {}
    for k, v in (personnel_fiber.get("predicates") or {}).items():
        if not (k.startswith("role-") or k.startswith("granted:")):
            continue
        if BilatticeValue(v) == BilatticeValue.TRUE:
            out[k] = BilatticeValue.TRUE
    return out


def migrate_personnel_to_boundary(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
) -> dict[str, Any]:
    """Migrate every un-migrated ``personnel:*`` entity to a ``boundary:*`` entity.

    Returns a summary dict::

        {
            "scanned":  <int>,    # personnel:* entities seen
            "migrated": [<slug>],  # newly-migrated personnel slugs
            "skipped":  [<slug>],  # already migrated; no-op
        }

    Idempotent: a personnel whose fiber already carries
    ``migrated-to-boundary-at-ord:<ord>`` is skipped. Re-running on a fully
    migrated store appends zero events.
    """
    scanned = _enumerate_personnel(event_log)
    migrated: list[str] = []
    skipped: list[str] = []

    for slug in scanned:
        fiber = layout.get_fiber(slug) or {}
        if _is_already_migrated(fiber):
            _check_recorded_scheme(slug, fiber)
            skipped.append(slug)
            continue
        # Personnel without a kind-personnel-record predicate aren't legacy
        # personnel records — they were emitted under a different shape and
        # don't need migration. The substrate quietly skips them.
        preds = fiber.get("predicates") or {}
        if BilatticeValue(preds.get(KIND_PREDICATE, BilatticeValue.NONE.value)) != BilatticeValue.TRUE:
            skipped.append(slug)
            continue

        bare = slug[len(PERSONNEL_PREFIX):]
        boundary = f"{BOUNDARY_PREFIX}{bare}"

        # 1. Boundary kind.
        assert_cell(
            layout=layout, event_log=event_log, node_id=node_id,
            s=boundary, p="kind-user", v=BilatticeValue.TRUE, sender="system",
        )
        # 2. Four canonical projection fibers per spec §4.1.
        for fname in CANONICAL_FIBERS:
            assert_cell(
                layout=layout, event_log=event_log, node_id=node_id,
                s=boundary, p=f"projects-{fname}-fiber",
                v=BilatticeValue.TRUE, sender="system",
            )
        # 3. Carry forward role + capability grants.
        for k, v in sorted(_carry_forward_predicates(fiber).items()):
            assert_cell(
                layout=layout, event_log=event_log, node_id=node_id,
                s=boundary, p=k, v=v, sender="system",
            )
        # 4. Audit the migration on the personnel side. The ord suffix is the
        #    event_log height at the moment of audit; replayable because the
        #    suffix is captured in the predicate name and persists across boots.
        audit_ord = event_log.height()
        assert_cell(
            layout=layout, event_log=event_log, node_id=node_id,
            s=slug, p=f"{MIGRATED_PREDICATE_PREFIX}{audit_ord}",
            v=BilatticeValue.TRUE, sender="system",
        )
        # 5. Pin the boundary-scheme version so a future re-boot under a
        #    bumped scheme is detected (PCB_BOUNDARY_SCHEME_DIVERGED) rather
        #    than silently re-deriving against incompatible code.
        assert_cell(
            layout=layout, event_log=event_log, node_id=node_id,
            s=slug, p=f"{SCHEME_PREDICATE_PREFIX}{BOUNDARY_SCHEME_VERSION}",
            v=BilatticeValue.TRUE, sender="system",
        )
        migrated.append(slug)
        log.info(
            "personnel-migration: %s → %s (audit ord=%d, %d carried predicates)",
            slug, boundary, audit_ord, len(_carry_forward_predicates(fiber)),
        )

    return {
        "scanned": len(scanned),
        "migrated": migrated,
        "skipped": skipped,
    }


def _check_recorded_scheme(slug: str, personnel_fiber: dict[str, Any]) -> None:
    """Raise ``PCB_BOUNDARY_SCHEME_DIVERGED`` when a migrated personnel
    record carries a ``migrated-with-scheme:*`` version that disagrees
    with the running code's :data:`BOUNDARY_SCHEME_VERSION`.

    A personnel record migrated by an *older* substrate that did not yet
    emit the scheme predicate at all is silently accepted (legacy data
    pre-dating the scheme-pinning addition); only an *explicit* mismatch
    is fatal.
    """
    preds = personnel_fiber.get("predicates") or {}
    recorded: list[str] = []
    for k, v in preds.items():
        if not k.startswith(SCHEME_PREDICATE_PREFIX):
            continue
        if BilatticeValue(v) != BilatticeValue.TRUE:
            continue
        recorded.append(k[len(SCHEME_PREDICATE_PREFIX):])
    if not recorded:
        return
    if BOUNDARY_SCHEME_VERSION in recorded:
        return
    raise SubstrateError(
        PCB_BOUNDARY_SCHEME_DIVERGED,
        f"personnel {slug!r} was migrated under boundary-scheme {recorded!r}; "
        f"running code expects {BOUNDARY_SCHEME_VERSION!r}",
        personnel=slug, recorded=recorded, expected=BOUNDARY_SCHEME_VERSION,
    )


def legacy_view(
    *,
    layout: StorageLayout,
    boundary_slug: str,
) -> dict[str, Any]:
    """Reconstruct the v0.1 personnel-record fiber from a migrated boundary.

    Given a ``boundary:<bare>`` slug whose paired ``personnel:<bare>`` has
    been migrated, return a dict shaped like the pre-migration personnel
    fiber: ``{"slug": "personnel:<bare>", "kind-personnel-record": True,
    "predicates": {<carried-forward role/grant predicates>}}``. This is
    the read-side of the natural transformation — call sites that still
    speak v0.1 vocabulary can ask the substrate "what would the personnel
    record have looked like" without needing the legacy projection live.

    Raises :class:`SubstrateError` (``PCB_BOUNDARY_NOT_FOUND``) when the
    boundary doesn't exist.
    """
    from substrate.error_codes import PCB_BOUNDARY_NOT_FOUND  # local: avoid cycle

    if not boundary_slug.startswith(BOUNDARY_PREFIX):
        raise SubstrateError(
            PCB_BOUNDARY_NOT_FOUND,
            f"{boundary_slug!r} is not a boundary slug",
            slug=boundary_slug,
        )
    bare = boundary_slug[len(BOUNDARY_PREFIX):]
    personnel_slug = f"{PERSONNEL_PREFIX}{bare}"

    boundary_fiber = layout.get_fiber(boundary_slug)
    if boundary_fiber is None:
        raise SubstrateError(
            PCB_BOUNDARY_NOT_FOUND,
            f"boundary {boundary_slug!r} has no fiber",
            slug=boundary_slug,
        )

    carried: dict[str, str] = {}
    for k, v in (boundary_fiber.get("predicates") or {}).items():
        if not (k.startswith("role-") or k.startswith("granted:")):
            continue
        if BilatticeValue(v) == BilatticeValue.TRUE:
            carried[k] = BilatticeValue.TRUE.value

    return {
        "slug": personnel_slug,
        KIND_PREDICATE: True,
        "predicates": carried,
    }
