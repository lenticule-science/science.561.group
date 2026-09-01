"""Paths and resolution — hierarchical alias paths to cells.

Per ``specs/filesystem/paths-and-resolution.md`` (v0.2). The OS does not
have files; it has cells. A path is a sequence of aliases that resolves
to a cell-id, an entity slug, or an alias target.

Path syntax (spec §1)::

    /aliases/<name>           — absolute alias path
    ./<name>                  — relative to current-scope
    ../<name>                 — relative to parent-scope
    <entity-slug>             — direct entity reference
    cell:<id>                 — direct content-addressed reference

The current-scope predicate (spec §2) is a binary cell::

    {"subject": "session:<id>", "predicate": "current-scope",
     "object": "<scope-slug>", "value": "True"}

Binary-cell authoring follows ``specs/kernel/binary-cell-emission.md``
(``s != o`` cells bypass ``respond._emit_asserted_cells`` and write
through :class:`StorageLayout` + :class:`EventLog` directly, at
``stratum = "asserted"``).

Resolution (spec §3) is deterministic: same path + same substrate state
→ same target. Conformance gates are exercised by
``tests/conformance/test_paths_and_resolution.py``.
"""

from __future__ import annotations

from typing import Literal

from pydantic import BaseModel, ConfigDict

from process.session import get_session, require_open
from security.capabilities import SIGNAL_SESSION_SCOPE_SET, require_capability
from storage.aliases import AliasStore
from storage.cell import Cell
from storage.cell_record import FiberSnapshot
from storage.event_log import EventLog
from storage.mounts import find_mount_for, project_through_mount
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import (
    PCM_PAYLOAD_INVALID,
    PCS_RECORD_NOT_FOUND,
    SubstrateError,
)


CURRENT_SCOPE_PREDICATE = "current-scope"


def _scope_entity(session_slug: str) -> str:
    """Per-session fiber key for current-scope cells.

    Kept separate from the session entity's own fiber (which holds
    ``opened`` / ``closed`` unary cells emitted via ``respond``) so
    binary current-scope cells live in their own per-session presheaf.
    """
    return f"session-scope:{session_slug}"


# ---------------------------------------------------------------------------
# set / get current-scope
# ---------------------------------------------------------------------------


def set_current_scope(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    session_slug: str,
    scope: str,
) -> str:
    """Bind ``current-scope`` to ``scope`` on ``session_slug``.

    Emits one binary cell ``(session_slug, current-scope, scope, True)``
    per ``binary-cell-emission.md`` discipline (§2 gates 1-6):

    - same StorageLayout + EventLog as ``respond``;
    - ``next_ord`` stamped before append; ord-coherence asserted after;
    - ``stratum = "asserted"``, no derivation chain;
    - typed event ``session-current-scope`` in the log;
    - per-entity fiber on ``session-scope:<id>`` with
      ``cells_by_predicate`` populated.

    Gate 4 (capability check) of ``binary-cell-emission.md`` §2 is
    discharged by ``security.capabilities.require_capability`` against
    the ``signal:session-scope:set`` capability per
    ``specs/filesystem/capability-permissions.md`` §6. Sessions opened
    without that grant (or a covering wildcard) raise
    ``PCA_SCOPE_INSUFFICIENT`` before any cell ord is stamped.

    Returns the new cell id.
    """
    sess = require_open(get_session(layout, session_slug))
    require_capability(sess, SIGNAL_SESSION_SCOPE_SET)
    if not scope or scope.startswith("/") or scope.startswith("."):
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"current-scope must be a slug, not a path; got {scope!r}",
        )

    next_ord = event_log.height()
    cell = Cell(
        s=session_slug,
        p=CURRENT_SCOPE_PREDICATE,
        o=scope,
        v=BilatticeValue.TRUE,
        ord=next_ord,
        stratum="asserted",
        sender=sess.owner,
    ).with_id()

    snap = FiberSnapshot(
        entity=_scope_entity(session_slug),
        predicates={cell.p: cell.v},
        cells=[cell],
        payload={"session": session_slug, "scope": scope},
        metadata={"role": "session-current-scope"},
    )
    snap_body = snap.model_dump(mode="json", exclude_none=True)
    snap_body.pop("id", None)
    snap_id, _ = layout.put_record("cells", snap_body)

    layout.put_fiber(_scope_entity(session_slug), {
        "entity": _scope_entity(session_slug),
        "predicates": {cell.p: cell.v.value},
        "cells": [cell.model_dump(mode="json")],
        "latest_cell_id": snap_id,
        "history_event_ord": next_ord,
        "cells_by_predicate": {cell.p: cell.id},
        "metadata": {
            "role": "session-current-scope",
            "session": session_slug,
        },
    })

    event = event_log.append(
        kind="session-current-scope",
        body={
            "session": session_slug,
            "scope": scope,
            "cell_id": cell.id,
            "snapshot_id": snap_id,
            "sender": sess.owner,
        },
        node_id=node_id,
    )
    if event["ord"] != next_ord:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            "ord-coherence violated: cell ord disagrees with event ord",
            cell_ord=next_ord, event_ord=event["ord"],
        )
    return cell.id  # type: ignore[return-value]


def get_current_scope(
    layout: StorageLayout, session_slug: str,
) -> str | None:
    """Return the latest ``current-scope`` value for ``session_slug``.

    ``None`` if never set. Reads the per-session-scope fiber's
    ``cells_by_predicate`` then materialises the named cell.
    """
    fiber = layout.get_fiber(_scope_entity(session_slug))
    if fiber is None:
        return None
    cell_id = fiber.get("cells_by_predicate", {}).get(CURRENT_SCOPE_PREDICATE)
    if not cell_id:
        return None
    # The fiber is mutable cache; the cell record is the canonical
    # source. Walk the cells array to find the matching one.
    for raw in fiber.get("cells", []):
        if raw.get("id") == cell_id and raw.get("p") == CURRENT_SCOPE_PREDICATE:
            o = raw.get("o")
            v = raw.get("v")
            if v == BilatticeValue.TRUE.value:
                return o
    return None


# ---------------------------------------------------------------------------
# resolution
# ---------------------------------------------------------------------------


ResolutionKind = Literal["cell", "entity", "alias-target", "mount-target"]


class ResolutionResult(BaseModel):
    """The result of resolving a path against substrate state.

    - ``kind="cell"``: ``target`` is a content-addressed ``cell:<id>``.
    - ``kind="alias-target"``: ``target`` is whatever slug the alias
      mapped to (which may itself be a ``cell:<id>``, an entity slug,
      or another path-like value — resolution does not chase aliases
      transitively in v0.2).
    - ``kind="entity"``: ``target`` is an entity slug (no cells loaded).
    - ``kind="mount-target"``: the path lay under an attached mount's
      local-prefix per ``mount-points.md`` §2; ``target`` is the
      foreign slug as the source-type backend would see it (the local
      prefix has been stripped). ``mount_slug`` is the mount that
      claimed the path; the source-type backend (peer / fs / git /
      paracosm) is whatever ``MountPoint.source_type`` is on that
      mount.
    """

    model_config = ConfigDict(extra="forbid")

    kind: ResolutionKind
    target: str
    via: str
    """Free-form trace of which spec §3 branch fired (``cell:``,
    ``alias``, ``entity``, ``relative``, ``parent``, ``mount``)."""
    mount_slug: str | None = None
    """When ``kind == "mount-target"``, the slug of the mount that
    claimed the path. ``None`` for every other resolution kind."""


def _join_scope(scope: str, name: str) -> str:
    """Spec §3.4: prepend current-scope to a relative segment.

    Scopes are slug-shaped (``scope:engineering/tasks``); names append
    with ``/``. Trailing slashes on the scope are tolerated.
    """
    base = scope.rstrip("/")
    if not name:
        return base
    # The bare top-level prefix ``scope:`` joins without ``/`` so that
    # ``_join_scope("scope:", "tasks") == "scope:tasks"`` per spec §4
    # worked example (../tasks at current-scope=scope:engineering →
    # scope:tasks).
    if base.endswith(":"):
        return f"{base}{name}"
    return f"{base}/{name}"


def _parent_scope(scope: str) -> str:
    """Spec §3.5: walk up one level in the scope hierarchy.

    ``scope:engineering/tasks`` → ``scope:engineering``.
    ``scope:engineering`` → ``scope:`` (root).
    Empty / root scope has no parent and resolves to itself; callers
    that need to detect "above root" should compare the result.
    """
    if "/" not in scope.rstrip("/"):
        # No '/' means we're at a top-level scope; parent is the bare
        # ``scope:`` prefix.
        if ":" in scope:
            head, _, _ = scope.partition(":")
            return f"{head}:"
        return scope
    head, _, _ = scope.rstrip("/").rpartition("/")
    return head


def resolve(
    path: str,
    *,
    layout: StorageLayout,
    session_slug: str | None = None,
) -> ResolutionResult:
    """Resolve ``path`` per spec §3.

    Branches:

    1. ``cell:<id>``           → ``ResolutionResult(kind="cell")``
    2. ``/aliases/<name>``     → ``ResolutionResult(kind="alias-target")``
    3. ``./<name>``            → recurse with ``current-scope`` prefix
    4. ``../<name>``           → recurse with ``parent-scope`` prefix
    5. ``<entity-slug>``       → ``ResolutionResult(kind="entity")``

    Capability scoping (spec §5 gate 2) is intentionally NOT enforced
    here in v0.2a. Per ``specs/filesystem/capability-permissions.md``
    §1 a cell's effective capability scope composes from per-subject /
    per-predicate / per-object capability cells; that surface is the
    capability-fiber projection, owned by t02-112. Wiring path
    resolution through that gate is deferred to t02-112 and tracked
    as a one-line addition here.

    Bare-name disambiguation (spec §3.2 vs §3.4): a bare token
    containing ``:`` is a §3.2 entity slug (``task:write-spec``); a
    bare token without ``:``, ``/``, or leading ``.`` is treated as
    ``./<name>`` *iff* a current-scope is bound, else falls through to
    §3.2.

    Multi-segment relative resolution (spec §4 example
    ``./tasks/write-spec → task:write-spec``) uses the existing alias
    substrate (``alias-mapping.md`` §5 already conventionalises
    ``office:<n>``, ``views/<module>``, etc. as alias names): the
    sub-scope-to-entity-kind binding is an alias whose name is the
    sub-scope path and whose target ends in ``:``. For
    ``./tasks/write-spec`` under ``scope:engineering`` the alias
    ``scope:engineering/tasks → task:`` yields ``task:write-spec``.
    Without such an alias, the joined slug is returned. Bootstrapping
    the canonical ERP-module bindings (``tasks``, ``messages``,
    ``ledger-entries``, ...) is the v0.3 / v0.7 productivity-stack
    surface's job; the substrate just resolves whatever's registered.
    """
    if not path:
        raise SubstrateError(PCM_PAYLOAD_INVALID, "empty path")

    # §3.1 — cell:<id>
    if path.startswith("cell:"):
        return ResolutionResult(kind="cell", target=path, via="cell:")

    # §3.3 — /aliases/<name>
    if path.startswith("/aliases/"):
        name = path[len("/aliases/"):]
        if not name:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                "alias path /aliases/ requires a name",
            )
        store = AliasStore(layout.root)
        try:
            target = store.get(name)
        except SubstrateError as e:
            # Re-raise with the path context so REPL output names the
            # path the user typed, not just the alias name.
            raise SubstrateError(
                PCS_RECORD_NOT_FOUND,
                f"path {path!r}: alias {name!r} not found",
                path=path, alias=name,
            ) from e
        return ResolutionResult(
            kind="alias-target", target=target, via="alias",
        )

    # §3.4 — ./<name> (relative to current-scope)
    if path.startswith("./"):
        if session_slug is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                f"relative path {path!r} requires a bound session",
            )
        scope = get_current_scope(layout, session_slug)
        if scope is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                f"relative path {path!r}: session {session_slug!r} "
                "has no current-scope set (use :cd first)",
                path=path, session=session_slug,
            )
        return _resolve_relative(scope, path[2:], layout, via="relative")

    # §3.5 — ../<name> (parent scope)
    if path.startswith("../"):
        if session_slug is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                f"parent-relative path {path!r} requires a bound session",
            )
        scope = get_current_scope(layout, session_slug)
        if scope is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                f"parent-relative path {path!r}: session "
                f"{session_slug!r} has no current-scope set",
                path=path, session=session_slug,
            )
        parent = _parent_scope(scope)
        return _resolve_relative(parent, path[3:], layout, via="parent")

    # §3.4 — bare ``<name>`` with current-scope set: same as ``./<name>``.
    # Disambiguated from §3.2 entity-slug by token shape: an entity slug
    # carries its kind prefix (``task:write-spec``); a bare relative
    # name does not. Multi-segment ``a/b`` and dotted ``.foo`` forms
    # never enter this branch.
    if (
        ":" not in path
        and "/" not in path
        and not path.startswith(".")
        and session_slug is not None
    ):
        scope = get_current_scope(layout, session_slug)
        if scope is not None:
            return _resolve_relative(scope, path, layout, via="relative")

    # §3.2 — <entity-slug>, with a mount-points.md §2 detour: if the
    # slug lies under an attached mount's local-prefix, return the
    # foreign slug + mount metadata so callers can dispatch to the
    # source-type backend instead of the local fiber.
    mount = find_mount_for(layout, path)
    if mount is not None:
        return ResolutionResult(
            kind="mount-target",
            target=project_through_mount(mount, path),
            via="mount",
            mount_slug=mount.slug,
        )
    return ResolutionResult(kind="entity", target=path, via="entity")


def _resolve_relative(
    scope: str, rest: str, layout: StorageLayout, *, via: str,
) -> ResolutionResult:
    """Spec §3.4 / §3.5 multi-segment relative resolution.

    For a single-segment ``rest`` (``./tasks`` or bare ``write-spec``):
    return the joined scope slug — the path names a sub-scope or a
    same-scope entity by alias-table convention. The §4 example
    ``../tasks → scope:tasks`` lives in this branch.

    For a multi-segment ``rest`` (``./tasks/write-spec``): split into
    ``dir_part`` + ``leaf``, join ``dir_part`` to ``scope`` to form a
    candidate kind-alias name, look it up in the substrate alias store.
    If the alias target ends in ``:`` it names an entity-kind, and the
    leaf is bound as ``<kind>:<leaf>`` (the §4 worked example). If no
    such alias exists, fall through to the joined slug — the substrate
    resolves what it can and tells the truth about what's registered.
    """
    if not rest:
        return ResolutionResult(kind="entity", target=scope, via=via)

    segs = [s for s in rest.split("/") if s]
    if not segs:
        return ResolutionResult(kind="entity", target=scope, via=via)

    if len(segs) == 1:
        return ResolutionResult(
            kind="entity", target=_join_scope(scope, segs[0]), via=via,
        )

    dir_part = "/".join(segs[:-1])
    leaf = segs[-1]
    joined_dir = _join_scope(scope, dir_part)

    store = AliasStore(layout.root)
    try:
        target = store.get(joined_dir)
    except SubstrateError:
        target = None
    if target and target.endswith(":"):
        return ResolutionResult(
            kind="entity", target=f"{target}{leaf}", via=f"{via}-kind",
        )

    return ResolutionResult(
        kind="entity", target=_join_scope(joined_dir, leaf), via=via,
    )
