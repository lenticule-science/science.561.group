"""Per-stratum presheaf projection materialisation.

Per ``specs/filesystem/presheaf-storage.md`` §3 + §4.2 + §10,
``specs/kernel/stratified-facts.md`` §1 + §6, and
``specs/kernel/projection-naturality.md`` (the v0.2a kernel spec
recording the naturality square ``π_c ∘ μ = μ ∘ π_c`` that lets the
on-disk by-stratum cache stay byte-equal to a fresh recompute without
invalidation): the substrate stores its fiber data as a presheaf
indexed by ``(stratum, peer, session, ord)``, and materialised reads
at a given context are projections of that presheaf.

The spec §3 distinguishes two stratum projection operators:

* :func:`project_stratum` — **exact-match**: cells whose ``stratum``
  field equals the requested stratum string. Default stratum is
  ``"settled"`` (the public read surface per ``stratified-facts.md``
  §6: "the settled projection: only cells at stratum 'settled'").
* :func:`project_stratum_at_or_below` — **cumulative** in the
  ``asserted ⊑ saturated ⊑ settled`` lattice (per
  ``stratified-facts.md`` §1): cells whose stratum is ``≤`` the
  requested stratum. Used as σ/Δ engine input where a higher-stratum
  pass needs to see lower-stratum premises.

Three exact-match by-stratum projections are materialised on disk as
fiber-snapshot files at ``$ROOT/fibers/<entity>/by-stratum/<stratum>.json``
after every respond that touches the entity (per ``presheaf-storage.md``
§4.2 + §10 gate 1). Each file IS the disk form of one projection at the
entity's current event-ordinal cursor; identical inputs produce
identical bytes (gate-9 byte-identity per §5).
"""

from __future__ import annotations

from typing import Any

from substrate.algebra import BilatticeValue, knowledge_join
from substrate.error_codes import (
    PCC_PROJECTION_UNKNOWN_INDEX,
    PCS_RECORD_NOT_FOUND,
    SubstrateError,
)
from storage.cell import Cell
from storage.cell_record import FiberSnapshot
from storage.storage_layout import StorageLayout

# The three named strata per ``specs/kernel/stratified-facts.md`` §1.
KNOWN_STRATA: frozenset[str] = frozenset({"asserted", "saturated", "settled"})

# Stratum lattice order per ``stratified-facts.md`` §1:
# ``asserted ⊑ saturated ⊑ settled``. ``STRATUM_AT_OR_BELOW`` maps
# each stratum ``t`` to the set of strata ``s`` with ``s ⊑ t`` — the
# visibility set used by :func:`project_stratum_at_or_below`.
STRATUM_AT_OR_BELOW: dict[str, frozenset[str]] = {
    "asserted": frozenset({"asserted"}),
    "saturated": frozenset({"asserted", "saturated"}),
    "settled": frozenset({"asserted", "saturated", "settled"}),
}

# Strata materialised on disk after every respond. Order is irrelevant
# to correctness (each lives in its own file); listed here so callers
# iterate the canonical set.
PROJECTED_STRATA: tuple[str, ...] = ("asserted", "saturated", "settled")


def _check_known_stratum(stratum: str) -> None:
    if stratum not in KNOWN_STRATA:
        raise SubstrateError(
            PCC_PROJECTION_UNKNOWN_INDEX,
            f"unknown stratum projection {stratum!r} "
            f"(must be one of asserted/saturated/settled)",
            stratum=stratum,
        )


def _collect_history_cells(
    *,
    layout: StorageLayout,
    fiber: dict[str, Any],
) -> list[Cell]:
    """Walk an entity's history; return every cell atom ever emitted.

    The fiber dict's ``history`` list carries one entry per respond
    round; each entry's ``cell_id`` points at the FiberSnapshot
    persisted under ``cells/``. Each snapshot's ``cells:[]`` holds the
    atoms emitted in that round (asserted + saturated + settled in
    iteration-cell order). We flatten the lot, parse each atom as a
    :class:`Cell`, and sort by ``(ord, id)`` so projection output is
    deterministic regardless of cache iteration order.

    A missing or corrupt snapshot is a hard error: silently dropping
    atoms would produce a projection that disagrees byte-wise with
    the canonical re-projection from the event log, violating the
    determinism gate (``presheaf-storage.md`` §5). The underlying
    :class:`SubstrateError` (typically :data:`PCS_RECORD_NOT_FOUND` or
    :data:`PCS_RECORD_CORRUPT`) propagates unchanged so the caller can
    distinguish cache-loss from projection-logic bugs.
    """
    out: list[Cell] = []
    for entry in fiber.get("history", []):
        snap_id = entry.get("cell_id")
        if not snap_id:
            continue
        snap_body = layout.get_record("cells", snap_id)
        for atom_body in snap_body.get("cells", []):
            out.append(Cell(**atom_body))
    out.sort(key=lambda c: (c.ord, c.id or ""))
    return out


def _build_projection_snapshot(
    *,
    cells: list[Cell],
    entity_slug: str,
) -> FiberSnapshot:
    """Build a content-addressed FiberSnapshot from a filtered cell list.

    Predicates are the knowledge-join of every cell's value per
    predicate; ``⊙`` is commutative + associative so the join is
    order-independent. Cells are emitted in their input order
    (callers sort by ``(ord, id)`` upstream for determinism).
    """
    preds: dict[str, BilatticeValue] = {}
    for c in cells:
        cur = preds.get(c.p, BilatticeValue.NONE)
        preds[c.p] = knowledge_join(cur, c.v)
    return FiberSnapshot(
        entity=entity_slug,
        predicates=preds,
        cells=cells,
    ).with_id()


def project_stratum(
    *,
    cells: list[Cell],
    entity_slug: str,
    stratum: str,
) -> FiberSnapshot:
    """Pure exact-match stratum projection.

    Per ``specs/filesystem/presheaf-storage.md`` §3:
    ``project_stratum(fiber, s)`` returns cells whose ``stratum`` field
    equals ``s`` (exact match). Default ``s`` per the spec is
    ``"settled"``; this function takes the stratum explicitly.

    The returned :class:`FiberSnapshot` carries:

    * ``cells: [...]`` — atoms whose stratum equals ``stratum``,
      preserving the input ``(ord, id)`` ordering.
    * ``predicates: {...}`` — the knowledge-join of those cells'
      values per predicate.

    For the lattice-cumulative variant (cells whose stratum ⊑ the
    requested stratum) see :func:`project_stratum_at_or_below`.

    Raises :class:`SubstrateError` with code
    :data:`PCC_PROJECTION_UNKNOWN_INDEX` for an unknown stratum string.
    """
    _check_known_stratum(stratum)
    projected: list[Cell] = [c for c in cells if c.stratum == stratum]
    return _build_projection_snapshot(cells=projected, entity_slug=entity_slug)


def project_stratum_at_or_below(
    *,
    cells: list[Cell],
    entity_slug: str,
    stratum: str,
) -> FiberSnapshot:
    """Pure cumulative stratum projection per the §1 lattice order.

    Per ``specs/filesystem/presheaf-storage.md`` §3:
    ``project_stratum_at_or_below(fiber, s)`` returns cells whose
    stratum is ``≤ s`` in the ``asserted ⊑ saturated ⊑ settled``
    order (per ``stratified-facts.md`` §1). Spec note: "useful for
    σ/Δ engine input" — a higher-stratum pass needs to see lower-
    stratum premises.

    For exact-match (cells whose stratum equals ``s``) see
    :func:`project_stratum`.

    Raises :class:`SubstrateError` with code
    :data:`PCC_PROJECTION_UNKNOWN_INDEX` for an unknown stratum string.
    """
    _check_known_stratum(stratum)
    visible = STRATUM_AT_OR_BELOW[stratum]
    projected: list[Cell] = [c for c in cells if c.stratum in visible]
    return _build_projection_snapshot(cells=projected, entity_slug=entity_slug)


def _projection_body(snap: FiberSnapshot) -> dict[str, Any]:
    """Serialise a projection snapshot for on-disk write.

    Drop ``None`` defaults so canonical bytes match a fresh recompute
    (an absent optional vs an explicit ``null`` would diverge).
    """
    body = snap.model_dump(mode="json")
    body_no_id = {k: v for k, v in body.items() if k != "id" and v is not None}
    return {"id": snap.id, **body_no_id}


def materialize_by_stratum_projections(
    *,
    layout: StorageLayout,
    entity_slug: str,
    fiber: dict[str, Any],
) -> dict[str, str]:
    """Materialise the three by-stratum projection files for an entity.

    Per ``specs/filesystem/presheaf-storage.md`` §10 gate 1: the σ/Δ
    engine MUST materialise ``asserted.json``, ``saturated.json``, and
    ``settled.json`` for every entity touched in a respond invocation.

    Implementation walks the entity's full history (the chain of
    snapshot ids on the fiber dict), collects every cell atom across
    every respond round, then projects per stratum. Discarding the
    files and re-invoking this function MUST reproduce byte-identical
    bytes (per ``presheaf-storage.md`` §5 + §10 gate 4); the
    determinism is guaranteed by:

    1. Cells are sorted ``(ord, id)`` before projection.
    2. Projections include only cells whose stratum is in the
       visibility set; filtering preserves order.
    3. Predicates are knowledge-joined; ``⊙`` is commutative and
       associative so the join is order-independent.
    4. The output ``FiberSnapshot.id`` is the canonical-hash of its
       canonical bytes (which sort dict keys), so byte-identical
       inputs hash to byte-identical ids.

    Returns a dict mapping stratum → projection snapshot id (the
    SHA-256 of the projection's canonical bytes).
    """
    cells = _collect_history_cells(layout=layout, fiber=fiber)
    out: dict[str, str] = {}
    for stratum in PROJECTED_STRATA:
        snap = project_stratum(cells=cells, entity_slug=entity_slug, stratum=stratum)
        layout.put_fiber_projection(entity_slug, stratum, _projection_body(snap))
        out[stratum] = snap.id or ""
    return out


def read_fiber_projection(
    *,
    layout: StorageLayout,
    entity_slug: str,
    stratum: str = "settled",
) -> FiberSnapshot | None:
    """Read-surface API per ``stratified-facts.md`` §6.

    Returns the materialised by-stratum projection at ``stratum``
    (default ``"settled"`` — the public read surface; the global
    section ``Γ(H*)`` per ``stratified-facts.md`` §6). The default is
    exact-match ``project_stratum(..., "settled")`` per
    ``presheaf-storage.md`` §3, NOT the cumulative
    ``project_stratum_at_or_below``: the OS publicly commits to cells
    whose Δ-pass has stabilized them, not to in-flight asserted /
    saturated evidence.

    Returns ``None`` when the entity has no materialised projection
    (no respond has touched it yet).

    Raises :data:`PCC_PROJECTION_UNKNOWN_INDEX` for an unknown stratum.
    """
    _check_known_stratum(stratum)
    body = layout.get_fiber_projection(entity_slug, stratum)
    if body is None:
        return None
    return FiberSnapshot(**body)
