"""Fiber snapshot — the materialised presheaf projection at one event-ord.

Per ``specs/filesystem/cell-record.md`` §1.5: a fiber snapshot bundles
the cell atoms whose ``(s, p, o)`` falls within one
``(entity, stratum, peer, session)`` projection at one event-ordinal
cursor, in a single object. Snapshots carry an entity slug, the
``cells: [...]`` array of :class:`storage.cell.Cell` atoms emitted in
this snapshot's respond round (each carrying its own stratum tag and
witness chain), a predicate-keyed convenience index over those atoms,
optional payload / metadata / parent-snapshot-ids forming a DAG, and
driver-attested signatures.

The ``id`` field is the SHA-256 of the canonical bytes of the record
WITHOUT ``id`` (then the ``id`` is re-included in the materialised
form).
"""

from __future__ import annotations

from typing import Any

from pydantic import BaseModel, ConfigDict, Field

from substrate.algebra import BilatticeValue, knowledge_join, knowledge_leq
from substrate.canonicalization import canonical, cid
from substrate.error_codes import PCC_HASH_MISMATCH, PCC_MONOTONICITY_FAIL, SubstrateError
from storage.cell import Cell


def _model_dump_canonical(model: BaseModel, *, exclude: set[str] | None = None) -> dict[str, Any]:
    """Dump a pydantic model dropping ``None`` defaults, ready for canonicalization."""
    excluded = exclude or set()
    return {k: v for k, v in model.model_dump(mode="json").items() if k not in excluded and v is not None}


class FiberSnapshot(BaseModel):
    """Materialised fiber snapshot at one event-ordinal cursor.

    Per ``specs/filesystem/cell-record.md`` §1.5. The ``id`` is computed
    from the canonical bytes of the record without ``id``. The
    per-atom truth lives in ``cells: [...]`` (each carrying its own
    stratum tag and witness chain); ``predicates`` is a convenience
    index keyed by predicate slug, valued at the bilattice value the
    snapshot's atoms collectively justify (the σ-pass closure result).
    """

    model_config = ConfigDict(extra="forbid", frozen=False)

    id: str | None = Field(default=None, description="SHA-256 of canonical(record without id).")
    entity: str = Field(description="lower-kebab slug of the entity this cell pertains to.")
    predicates: dict[str, BilatticeValue] = Field(default_factory=dict)
    # Cell atoms in this snapshot's projection, in emission order
    # (asserted first, then saturated by σ-pass cycle). Per
    # specs/filesystem/cell-record.md §1.5.
    cells: list[Cell] = Field(default_factory=list)
    payload: dict[str, Any] | None = None
    metadata: dict[str, Any] | None = None
    parents: list[str] = Field(default_factory=list)
    signatures: list[dict[str, Any]] | None = None

    def canonical_without_id(self) -> bytes:
        return canonical(_model_dump_canonical(self, exclude={"id"}))

    def compute_id(self) -> str:
        return cid(_model_dump_canonical(self, exclude={"id"}))

    def with_id(self) -> "FiberSnapshot":
        """Return a copy with ``id`` populated from the canonical hash."""
        body = _model_dump_canonical(self, exclude={"id"})
        body_id = cid(body)
        return FiberSnapshot(id=body_id, **{k: v for k, v in body.items()})

    def canonical(self) -> bytes:
        """Canonical bytes of the FULL record including ``id``."""
        body = _model_dump_canonical(self, exclude={"id"})
        body_id = self.id or cid(body)
        return canonical({"id": body_id, **body})

    def verify_id(self) -> None:
        if self.id is None:
            return
        expected = self.compute_id()
        if expected != self.id:
            raise SubstrateError(
                PCC_HASH_MISMATCH,
                "cell id does not match canonical hash",
                expected=expected,
                actual=self.id,
            )


def merge_snapshots_kjoin(prev: FiberSnapshot, incoming: FiberSnapshot) -> FiberSnapshot:
    """Merge ``incoming`` into ``prev`` under settling-monotonic ⊙ (knowledge_join).

    Predicate values rise; never fall. Parent snapshot ids accumulate.
    Payload/metadata are left-merged (incoming wins for keys it
    specifies). Raises ``PCC_MONOTONICITY_FAIL`` if an incoming predicate
    value would lower the existing one (i.e. ``incoming.value`` ≰_k
    ``merged.value``).

    Note: merging snapshots is a derived convenience — the per-predication
    truth is in the underlying cell atoms (the ``cells: [...]`` array
    plus the event-log entries that emitted them). This helper is for
    callers that operate at the materialised-snapshot level.
    """
    if prev.entity != incoming.entity:
        raise SubstrateError(
            PCC_MONOTONICITY_FAIL,
            "snapshot merge across entities",
            prev_entity=prev.entity,
            incoming_entity=incoming.entity,
        )
    merged_preds: dict[str, BilatticeValue] = dict(prev.predicates)
    for k, v in incoming.predicates.items():
        cur = merged_preds.get(k, BilatticeValue.NONE)
        joined = knowledge_join(cur, v)
        if not knowledge_leq(cur, joined):
            raise SubstrateError(PCC_MONOTONICITY_FAIL, f"predicate {k} non-monotonic")
        merged_preds[k] = joined

    merged_parents = list(dict.fromkeys([*prev.parents, *incoming.parents, prev.id] if prev.id else prev.parents))
    merged_payload = {**(prev.payload or {}), **(incoming.payload or {})} or None
    merged_metadata = {**(prev.metadata or {}), **(incoming.metadata or {})} or None
    sigs = (prev.signatures or []) + (incoming.signatures or [])
    merged_sigs = sigs if sigs else None

    return FiberSnapshot(
        entity=prev.entity,
        predicates=merged_preds,
        payload=merged_payload,
        metadata=merged_metadata,
        parents=merged_parents,
        signatures=merged_sigs,
    ).with_id()
