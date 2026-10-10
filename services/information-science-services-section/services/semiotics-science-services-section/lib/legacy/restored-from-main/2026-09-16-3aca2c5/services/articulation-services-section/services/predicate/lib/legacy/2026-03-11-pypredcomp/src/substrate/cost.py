"""Cost ledger: per-emission :class:`CostCell` records folded under a quantale.

Per ``specs/kernel/computational-model.md`` §9 (the per-respond cost
envelope and the "reads are free" discipline) and
``specs/kernel/fuel-composition.md`` (the single Lawvere-quantale
composition law over the five fuel boundaries — ``f_red``, ``f_σ``,
``f_Δ``, ``f_outer``, and the per-respond ceiling ``F``).

The default quantale is :class:`AdditiveCostQuantale` — ([0, ∞], +, min)
with unit 0. Reads contribute the unit; admissions and settlements
contribute positive values. :func:`emit_cost` writes one cell per
emission under ``$ROOT/cost/<entity>/<id>.json``;
:func:`query_total_cost` folds them via the quantale's compose op.

A non-additive quantale (e.g. :class:`ReliabilityQuantale`,
([0, 1], ·, max), unit 1) is selected by passing it to
:func:`query_total_cost`. Cells must all carry the same quantale tag —
mixed-quantale folds raise.
"""

from __future__ import annotations

import json
import math
from pathlib import Path
from typing import Any, Literal

from pydantic import BaseModel, ConfigDict, Field

from substrate.canonicalization import canonical, cid

CostClass = Literal["read", "admission", "settlement"]


# ---------------------------------------------------------------------------
# Quantales
# ---------------------------------------------------------------------------


class LawvereQuantale:
    """Quantale interface: ``unit``, ``compose``, ``join``, ``fold``."""

    name: str = "abstract"

    def unit(self) -> float:
        raise NotImplementedError

    def compose(self, a: float, b: float) -> float:
        """Sequential composition (the ⊗ op)."""
        raise NotImplementedError

    def join(self, a: float, b: float) -> float:
        """Parallel-branch combination."""
        raise NotImplementedError

    def fold(self, values: list[float]) -> float:
        """Compose-fold: total cost along a causal sequence."""
        acc = self.unit()
        for v in values:
            acc = self.compose(acc, v)
        return acc

    def is_unit(self, v: float) -> bool:
        return v == self.unit()


class AdditiveCostQuantale(LawvereQuantale):
    """([0, ∞], +, min), unit 0. The default."""

    name = "additive"

    def unit(self) -> float:
        return 0.0

    def compose(self, a: float, b: float) -> float:
        if a == math.inf or b == math.inf:
            return math.inf
        return a + b

    def join(self, a: float, b: float) -> float:
        return min(a, b)


class ReliabilityQuantale(LawvereQuantale):
    """([0, 1], ·, max), unit 1. Independent failures multiply."""

    name = "reliability"

    def unit(self) -> float:
        return 1.0

    def compose(self, a: float, b: float) -> float:
        return a * b

    def join(self, a: float, b: float) -> float:
        return max(a, b)


DEFAULT_QUANTALE = AdditiveCostQuantale()


# ---------------------------------------------------------------------------
# Cost cell
# ---------------------------------------------------------------------------


class CostCell(BaseModel):
    """One cost-emission record."""

    model_config = ConfigDict(extra="forbid")

    id: str | None = None
    entity: str
    cost_class: CostClass = "settlement"
    value: float = 0.0
    quantale: str = "additive"
    event_ord: int
    source_op: str = "respond"
    metadata: dict[str, Any] | None = None

    def canonical_body(self) -> dict[str, Any]:
        body = self.model_dump(mode="json")
        body.pop("id", None)
        return body

    def with_id(self) -> "CostCell":
        return self.model_copy(update={"id": cid(self.canonical_body())})


# ---------------------------------------------------------------------------
# Storage
# ---------------------------------------------------------------------------


def emit_cost(*, layout: Any, cell: CostCell) -> Path:
    """Atomically write a cost cell under ``$ROOT/cost/<entity>/<id>.json``."""
    if cell.id is None:
        cell = cell.with_id()
    path = layout.cost_cell_path(cell.entity, cell.id)
    body = {"id": cell.id, **cell.canonical_body()}
    layout._atomic_write(path, canonical(body))
    return path


def read_costs(layout: Any, entity_slug: str) -> list[CostCell]:
    """Load all cost cells for ``entity_slug``, ordered by (event_ord, id)."""
    d: Path = layout.cost_dir(entity_slug)
    if not d.exists():
        return []
    out: list[CostCell] = []
    for f in sorted(d.iterdir()):
        if not f.is_file() or not f.name.endswith(".json"):
            continue
        body = json.loads(f.read_bytes().decode("utf-8"))
        out.append(CostCell(**body))
    out.sort(key=lambda c: (c.event_ord, c.id or ""))
    return out


# ---------------------------------------------------------------------------
# Query
# ---------------------------------------------------------------------------


class CostSummary(BaseModel):
    """Output of :func:`query_total_cost`: total + per-class subtotals."""

    model_config = ConfigDict(extra="forbid")

    quantale: str
    total: float
    by_class: dict[str, float]
    cell_count: int


def query_total_cost(
    *,
    layout: Any,
    entity_slug: str,
    quantale: LawvereQuantale | None = None,
) -> CostSummary:
    """Quantale-fold an entity's cost cells. Read-only; no state advance.

    Raises ``ValueError`` if cells carry a quantale tag different from
    ``quantale`` — composing across quantales would require an explicit
    homomorphism that this layer does not provide.
    """
    q = quantale or DEFAULT_QUANTALE
    cells = read_costs(layout, entity_slug)

    foreign = [c.quantale for c in cells if c.quantale != q.name]
    if foreign:
        raise ValueError(
            f"cost cells under entity {entity_slug!r} carry foreign quantale "
            f"tags {set(foreign)!r}, but query quantale is {q.name!r}; "
            "cross-quantale composition needs an explicit homomorphism"
        )

    by_class: dict[str, float] = {}
    for c in cells:
        prev = by_class.get(c.cost_class, q.unit())
        by_class[c.cost_class] = q.compose(prev, c.value)

    total = q.fold([c.value for c in cells])

    return CostSummary(
        quantale=q.name,
        total=total,
        by_class=by_class,
        cell_count=len(cells),
    )
