"""Mount points — closure rules that admit foreign cells under a local prefix.

Per ``specs/filesystem/mount-points.md`` (v0.2). A mount point is the
OS's ``mount()`` analogue: federation peers, host filesystems, git
repositories, and paracosms all expose themselves as cells under a local
prefix via the same primitive.

This module ships the v0.2a slice:

- The mount **registry** (per-mount entity ``mount:<slug>`` carrying the
  five spec §1 binary cells).
- ``attach_mount`` / ``detach_mount`` authoring under
  ``binary-cell-emission.md`` discipline (the same pattern as
  :func:`storage.paths.set_current_scope`).
- ``find_mount_for(layout, slug)`` — the resolver hook used by
  :func:`storage.paths.resolve` to recognise paths under an attached
  mount's local-prefix.
- ``scope_restriction`` enforcement using ``fnmatch``-style patterns
  over the foreign slug (spec §5 conformance gate 2).

What this slice does **not** ship: the per-source-type fetch backends
(peer protocol, fs driver, git driver, paracosm reader). Those are the
v0.4 federation / v0.2b driver-model slices and plug into the registry
through the same ``MountPoint.source_type`` discriminator. The v0.2a
deliverable is the substrate machinery that those backends sit on top
of, and the path-resolver wiring that makes mount-target slugs first-
class spec §3 results.
"""

from __future__ import annotations

import fnmatch
from typing import Literal

from pydantic import BaseModel, ConfigDict

from process.session import get_session, require_open
from security.capabilities import (
    SIGNAL_MOUNT_ATTACH,
    SIGNAL_MOUNT_DETACH,
    require_capability,
)
from storage.cell import Cell
from storage.cell_record import FiberSnapshot
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import (
    PCM_PAYLOAD_INVALID,
    SubstrateError,
)


KIND_PREDICATE = "kind"
KIND_VALUE = "mount-point"
SOURCE_TYPE_PREDICATE = "source-type"
SOURCE_REF_PREDICATE = "source-ref"
LOCAL_PREFIX_PREDICATE = "local-prefix"
SCOPE_RESTRICTION_PREDICATE = "scope-restriction"
ATTACHED_PREDICATE = "attached"

MOUNT_PREDICATES = (
    KIND_PREDICATE,
    SOURCE_TYPE_PREDICATE,
    SOURCE_REF_PREDICATE,
    LOCAL_PREFIX_PREDICATE,
    SCOPE_RESTRICTION_PREDICATE,
    ATTACHED_PREDICATE,
)


class MountPoint(BaseModel):
    """A mount point's resolved view per spec §1.

    ``attached`` is the latest value of the ``attached`` predicate on
    the mount entity; a detached mount keeps its definition cells but
    is invisible to :func:`find_mount_for` until re-attached.
    """

    model_config = ConfigDict(extra="forbid")

    slug: str
    source_type: str
    source_ref: str
    local_prefix: str
    scope_restriction: str | None = None
    attached: bool = True


def _mount_entity(slug: str) -> str:
    """The substrate entity slug for a mount point."""
    if not slug or "/" in slug or slug.startswith("mount:"):
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"mount slug must be a bare token without 'mount:' prefix; "
            f"got {slug!r}",
        )
    return f"mount:{slug}"


def _normalise_prefix(prefix: str) -> str:
    """Local prefixes are slug-shaped and end in ``/`` per spec §4
    examples (``remote/reach-around/``, ``host/home/``).

    The trailing ``/`` is the cue that any cell whose slug starts with
    the prefix lives under the mount; without it ``foo`` would match
    ``foobar`` and admit cells the operator never intended.
    """
    if not prefix or prefix.startswith("/") or prefix.startswith("."):
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"mount local-prefix must be a relative slug; got {prefix!r}",
        )
    return prefix if prefix.endswith("/") else prefix + "/"


# ---------------------------------------------------------------------------
# attach / detach
# ---------------------------------------------------------------------------


def _emit_binary_cell(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    sender: str,
    subject: str,
    predicate: str,
    object_: str,
    value: BilatticeValue,
    event_kind: str,
    event_body_extras: dict | None = None,
) -> str:
    """Emit one binary cell + event under ``binary-cell-emission.md``.

    Same discipline as :func:`storage.paths.set_current_scope`: stamp
    ``next_ord`` before append, assert ord-coherence after, write the
    fiber snapshot, append the typed event. Gate 4 (capability check)
    is the caller's responsibility — :func:`attach_mount` /
    :func:`detach_mount` discharge it via
    ``security.capabilities.require_capability`` against
    ``signal:mount:attach`` / ``signal:mount:detach`` per
    ``capability-permissions.md`` §6 before the first ord-stamp.
    """
    next_ord = event_log.height()
    cell = Cell(
        s=subject, p=predicate, o=object_, v=value,
        ord=next_ord, stratum="asserted", sender=sender,
    ).with_id()

    # Read-modify-write the mount fiber so the registry can find every
    # current predicate via ``cells_by_predicate`` without replaying.
    existing = layout.get_fiber(subject) or {
        "entity": subject,
        "predicates": {},
        "cells": [],
        "cells_by_predicate": {},
        "metadata": {"role": "mount-point"},
    }
    cells = list(existing.get("cells", []))
    cells.append(cell.model_dump(mode="json"))
    cells_by_predicate = dict(existing.get("cells_by_predicate", {}))
    cells_by_predicate[predicate] = cell.id
    predicates = dict(existing.get("predicates", {}))
    predicates[predicate] = cell.v.value

    snap = FiberSnapshot(
        entity=subject,
        predicates={cell.p: cell.v},
        cells=[cell],
        payload={"subject": subject, "predicate": predicate, "object": object_},
        metadata={"role": "mount-point-cell"},
    )
    snap_body = snap.model_dump(mode="json", exclude_none=True)
    snap_body.pop("id", None)
    snap_id, _ = layout.put_record("cells", snap_body)

    layout.put_fiber(subject, {
        "entity": subject,
        "predicates": predicates,
        "cells": cells,
        "latest_cell_id": snap_id,
        "history_event_ord": next_ord,
        "cells_by_predicate": cells_by_predicate,
        "metadata": {"role": "mount-point"},
    })

    body = {
        "subject": subject, "predicate": predicate, "object": object_,
        "value": cell.v.value, "cell_id": cell.id, "snapshot_id": snap_id,
        "sender": sender,
    }
    if event_body_extras:
        body.update(event_body_extras)
    event = event_log.append(kind=event_kind, body=body, node_id=node_id)
    if event["ord"] != next_ord:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            "ord-coherence violated: cell ord disagrees with event ord",
            cell_ord=next_ord, event_ord=event["ord"],
        )
    return cell.id  # type: ignore[return-value]


def attach_mount(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    session_slug: str,
    slug: str,
    source_type: str,
    source_ref: str,
    local_prefix: str,
    scope_restriction: str | None = None,
) -> MountPoint:
    """Author the spec §1 mount cells and mark the mount attached.

    Per spec §3, attach is conceptually a ``respond`` invocation. The
    v0.2a slice emits the underlying binary cells directly because the
    closure rules that would back the respond surface are not yet
    wired (binary-cell-emission §3 ``s != o`` discipline applies).

    First attach (no prior mount fiber) emits the full sequence —
    kind, source-type, source-ref, local-prefix, optional
    scope-restriction, and ``attached=True`` — as separate typed
    events so the log carries cell-grain ordinals for the
    federation-merge surface (``federation-merge.md``).

    Re-attach of an existing slug whose definition cells match emits
    a single ``attached=True`` binary cell per spec §1: definition
    cells are preserved across detach so re-attach is a single
    binary-cell write. If the operator passes definition arguments
    that diverge from the existing fiber, the divergent predicates
    are re-emitted (latest wins) — this is how operators relocate a
    mount or change its source-ref without losing the slug.

    **Non-atomic for v0.2a**: each per-predicate emission is a
    separate event. A crash mid-sequence on first attach can leave
    partially authored mount state (e.g. kind + source-type written,
    local-prefix not). The mount-fiber consistency check
    (``_read_mount_fiber`` returning ``None`` when any required
    predicate is missing) keeps such partial state out of the
    registry — ``find_mount_for`` will not surface it. Atomic
    multi-cell authoring is the v0.4 federation slice's problem.
    """
    sess = require_open(get_session(layout, session_slug))
    require_capability(sess, SIGNAL_MOUNT_ATTACH)
    entity = _mount_entity(slug)
    prefix = _normalise_prefix(local_prefix)

    if not source_type or ":" in source_type:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"mount source-type must be a bare token; got {source_type!r}",
        )
    if not source_ref:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID, "mount source-ref must be non-empty",
        )

    existing = _read_mount_fiber(layout, entity)
    desired = {
        KIND_PREDICATE: KIND_VALUE,
        SOURCE_TYPE_PREDICATE: source_type,
        SOURCE_REF_PREDICATE: source_ref,
        LOCAL_PREFIX_PREDICATE: prefix,
    }
    if scope_restriction is not None:
        desired[SCOPE_RESTRICTION_PREDICATE] = scope_restriction

    event_kinds = {
        KIND_PREDICATE: "mount-attach-kind",
        SOURCE_TYPE_PREDICATE: "mount-attach-source-type",
        SOURCE_REF_PREDICATE: "mount-attach-source-ref",
        LOCAL_PREFIX_PREDICATE: "mount-attach-local-prefix",
        SCOPE_RESTRICTION_PREDICATE: "mount-attach-scope-restriction",
    }

    if existing is None:
        pairs = [(p, desired[p], event_kinds[p]) for p in (
            KIND_PREDICATE, SOURCE_TYPE_PREDICATE,
            SOURCE_REF_PREDICATE, LOCAL_PREFIX_PREDICATE,
        )]
        if scope_restriction is not None:
            pairs.append(
                (SCOPE_RESTRICTION_PREDICATE, scope_restriction,
                 event_kinds[SCOPE_RESTRICTION_PREDICATE]),
            )
    else:
        # Re-attach: spec §1 single-cell write, plus any divergent
        # definition predicates (latest wins).
        existing_obj = {
            KIND_PREDICATE: KIND_VALUE,
            SOURCE_TYPE_PREDICATE: existing.source_type,
            SOURCE_REF_PREDICATE: existing.source_ref,
            LOCAL_PREFIX_PREDICATE: existing.local_prefix,
        }
        if existing.scope_restriction is not None:
            existing_obj[SCOPE_RESTRICTION_PREDICATE] = existing.scope_restriction
        pairs = [
            (p, desired[p], event_kinds[p])
            for p in desired
            if existing_obj.get(p) != desired[p]
        ]
        # If scope_restriction is being cleared on re-attach (caller
        # passed None but a previous binding had one), the spec gives
        # no retraction primitive — leave the prior cell in place;
        # operators clear by passing scope_restriction="*".

    pairs.append((ATTACHED_PREDICATE, "True", "mount-attached"))

    for predicate, object_, event_kind in pairs:
        _emit_binary_cell(
            layout=layout, event_log=event_log, node_id=node_id,
            sender=sess.owner, subject=entity, predicate=predicate,
            object_=object_, value=BilatticeValue.TRUE,
            event_kind=event_kind, event_body_extras={"mount_slug": slug},
        )

    # Re-attach with no scope_restriction argument leaves any prior
    # restriction in place (the spec gives no retraction primitive
    # for the optional cell). The returned MountPoint reflects
    # effective state, not just the call's arguments, so callers
    # see what `find_mount_for` will surface.
    effective_restriction = scope_restriction
    if existing is not None and scope_restriction is None:
        effective_restriction = existing.scope_restriction

    return MountPoint(
        slug=slug, source_type=source_type, source_ref=source_ref,
        local_prefix=prefix, scope_restriction=effective_restriction,
        attached=True,
    )


def detach_mount(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    session_slug: str,
    slug: str,
) -> None:
    """Mark a mount detached.

    Spec §5 gate 3: detach removes foreign cells from local visibility.
    The definition cells (kind, source-type, etc.) are preserved so
    re-attach is a single binary-cell write that flips the
    ``attached`` predicate back to ``True`` — the OS retains the
    history of every binding the operator ever made.
    """
    sess = require_open(get_session(layout, session_slug))
    require_capability(sess, SIGNAL_MOUNT_DETACH)
    entity = _mount_entity(slug)

    fiber = layout.get_fiber(entity)
    if fiber is None:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID, f"mount {slug!r} was never attached",
        )

    _emit_binary_cell(
        layout=layout, event_log=event_log, node_id=node_id,
        sender=sess.owner, subject=entity, predicate=ATTACHED_PREDICATE,
        object_="False", value=BilatticeValue.TRUE,
        event_kind="mount-detached", event_body_extras={"mount_slug": slug},
    )


# ---------------------------------------------------------------------------
# registry
# ---------------------------------------------------------------------------


def _read_mount_fiber(
    layout: StorageLayout, entity: str,
) -> MountPoint | None:
    fiber = layout.get_fiber(entity)
    if fiber is None:
        return None

    by_predicate = fiber.get("cells_by_predicate", {})
    cells_by_id = {c.get("id"): c for c in fiber.get("cells", [])}

    def _latest_object(predicate: str) -> str | None:
        cid = by_predicate.get(predicate)
        if not cid:
            return None
        cell = cells_by_id.get(cid)
        if cell is None or cell.get("v") != BilatticeValue.TRUE.value:
            return None
        return cell.get("o")

    if _latest_object(KIND_PREDICATE) != KIND_VALUE:
        return None

    source_type = _latest_object(SOURCE_TYPE_PREDICATE)
    source_ref = _latest_object(SOURCE_REF_PREDICATE)
    local_prefix = _latest_object(LOCAL_PREFIX_PREDICATE)
    if not (source_type and source_ref and local_prefix):
        return None

    attached_obj = _latest_object(ATTACHED_PREDICATE)
    # ``attached`` must be explicit; missing or malformed means the
    # fiber was authored partially (crash mid-attach) and has not
    # been completed. Per spec §1 the lifecycle marker is part of
    # the mount's identity — without it we cannot tell whether the
    # operator ever finished binding the mount, so we keep it out
    # of the registry surface entirely.
    if attached_obj not in ("True", "False"):
        return None
    attached = attached_obj == "True"

    if not entity.startswith("mount:"):
        return None
    return MountPoint(
        slug=entity[len("mount:"):],
        source_type=source_type,
        source_ref=source_ref,
        local_prefix=local_prefix,
        scope_restriction=_latest_object(SCOPE_RESTRICTION_PREDICATE),
        attached=attached,
    )


def list_mounts(
    layout: StorageLayout, *, include_detached: bool = False,
) -> list[MountPoint]:
    """Return every mount whose fiber lives in the substrate.

    Sorted by slug for determinism. Detached mounts are excluded by
    default; pass ``include_detached=True`` to see the full history of
    bindings.
    """
    fiber_dir = layout.root / "fibers"
    if not fiber_dir.exists():
        return []
    mounts: list[MountPoint] = []
    for child in fiber_dir.iterdir():
        if not child.is_dir():
            continue
        name = child.name
        if not name.startswith("mount:"):
            continue
        mp = _read_mount_fiber(layout, name)
        if mp is None:
            continue
        if include_detached or mp.attached:
            mounts.append(mp)
    mounts.sort(key=lambda m: m.slug)
    return mounts


def find_mount_for(
    layout: StorageLayout, slug_or_path: str,
) -> MountPoint | None:
    """Return the attached mount whose ``local_prefix`` covers
    ``slug_or_path``, or ``None``.

    A slug is covered when it starts with ``local_prefix`` *and* — if
    the mount declares a ``scope_restriction`` — the foreign slug
    (the part after ``local_prefix``) matches the restriction
    pattern. Spec §5 gate 2: scope-restriction limits which foreign
    cells are admitted.

    Multiple mounts may share a prefix; the longest matching prefix
    wins (Plan-9-style longest-match), making it safe to layer a
    restricted child mount under a permissive parent without changing
    parent behaviour.
    """
    candidates: list[MountPoint] = []
    for mp in list_mounts(layout):
        if not slug_or_path.startswith(mp.local_prefix):
            continue
        foreign_slug = slug_or_path[len(mp.local_prefix):]
        if mp.scope_restriction is not None:
            if not fnmatch.fnmatchcase(foreign_slug, mp.scope_restriction):
                continue
        candidates.append(mp)
    if not candidates:
        return None
    candidates.sort(key=lambda m: len(m.local_prefix), reverse=True)
    return candidates[0]


def project_through_mount(
    mount: MountPoint, slug_or_path: str,
) -> str:
    """Strip ``mount.local_prefix`` from ``slug_or_path``; return the
    foreign slug as the source backend would see it.

    Pure function: no I/O, no fetch. The fetch is the source-type
    backend's job (peer protocol, fs driver, git driver, paracosm
    reader). This separation is what lets v0.2a ship the mount
    machinery before any backend exists.
    """
    if not slug_or_path.startswith(mount.local_prefix):
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"slug {slug_or_path!r} does not lie under mount "
            f"{mount.slug!r} prefix {mount.local_prefix!r}",
        )
    return slug_or_path[len(mount.local_prefix):]


__all__ = [
    "MountPoint",
    "attach_mount",
    "detach_mount",
    "list_mounts",
    "find_mount_for",
    "project_through_mount",
    "ATTACHED_PREDICATE",
    "KIND_PREDICATE",
    "KIND_VALUE",
    "LOCAL_PREFIX_PREDICATE",
    "SCOPE_RESTRICTION_PREDICATE",
    "SOURCE_REF_PREDICATE",
    "SOURCE_TYPE_PREDICATE",
    "MOUNT_PREDICATES",
]
