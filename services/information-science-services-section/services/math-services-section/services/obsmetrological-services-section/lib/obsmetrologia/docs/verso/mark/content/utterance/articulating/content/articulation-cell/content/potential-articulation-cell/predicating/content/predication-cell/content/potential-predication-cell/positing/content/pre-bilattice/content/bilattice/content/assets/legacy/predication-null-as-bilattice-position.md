---
type: concept
class: data-access-discipline
depends-on: [predication-fiber-algebra, four-bilattice, twist-product, knowledge-order, settling-quiescence]
see-also: [where-clause-as-paraconsistent-comprehension, transaction-isolation-level, transaction-isolation-as-knowledge-order-position]
---

# NULL as a bilattice position

The *substrate-recorded reading of SQL `NULL` (and its cognates: `MISSING`, `UNDEFINED`, the empty cell of a relational tuple) as a position in the predication fiber algebra*, replacing the SQL standard's three-valued logic with a structurally well-founded bilattice account.

The standard SQL story collapses three distinct engineering situations onto one token `NULL`:

1. *No information has been recorded yet* — the substrate has not admitted any predication on this cell.
2. *The recorded information is in flight and not yet resolved* — admissions exist but the closure cascade has not reached a definite truth value.
3. *The recorded information is contradictory* — two admissions disagree and no closure rule has chosen between them.

A predicated database substrate distinguishes these by their bilattice position on the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), per the [twist-product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) decomposition $\mathbf{L}^\bowtie = \mathbf{L} \times \mathbf{L}$ of (positive evidence, negative evidence):

| Situation | Twist-product position | $\mathbf{FOUR}$-name | $\leq_k$-rank |
|---|---|---|---|
| no information recorded | $\langle 0, 0\rangle$ | $\bot$ | $\leq_k$-bottom |
| only positive evidence | $\langle 1, 0\rangle$ | $\mathbf{t}$ | $\leq_k$-mid |
| only negative evidence | $\langle 0, 1\rangle$ | $\mathbf{f}$ | $\leq_k$-mid |
| contradictory evidence | $\langle 1, 1\rangle$ | $\top$ | $\leq_k$-top |

The substrate's discipline:

- **`NULL`-by-absence is $\bot$.** A column with no admitted predication on a tuple sits at the [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) bottom. Reads at $\bot$ return the substrate's *no-information* witness, distinguishable in the witness chain from any other reading.
- **In-flight `NULL` is $\top$ on a non-quiescent cell.** Per [transaction-isolation-as-knowledge-order-position](../theorems/transaction-isolation-as-knowledge-order-position.md), an in-flight admission whose resolving cascade has not completed registers as $\top_k$ on a cell whose [settling-quiescence](../../../../../../valuation/content/knowledge-least-valuation/settling/content/settling-quiescence/settling-quiescence.md) predicate is false. The substrate refuses to surface this position to a `read-committed`-or-stronger transaction.
- **Persistent contradiction is $\top$ at quiescence.** A cell quiescent at $\top$ is a recorded substrate disagreement, not a missing value. Per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), the substrate keeps the cell at $\top$ rather than collapsing to a phantom `NULL`, and exposes it through the inconsistency-sheaf-record so that repair operators can act.

## Why this is structural, not stylistic

SQL's three-valued logic was an attempt to make `NULL` propagate consistently through Boolean expressions. It fails because three values are not enough: the standard's `UNKNOWN` is asked to mean both "we do not know which Boolean this is" and "this expression has no Boolean reading at all", and the conflation produces the well-known surprises (`NULL = NULL` is `UNKNOWN`; `WHERE x = NULL` matches nothing; aggregate functions silently drop `NULL`). The bilattice's four positions separate the two readings — $\bot$ for "no reading recorded" and $\top$ for "two incompatible readings recorded" — and each becomes a structurally distinct cell-state with its own admissible operations.

The classical SQL `NULL` is recovered as the substrate's *truth-order projection* of the bilattice: a cell at $\bot$ projects to "no truth value" and a cell at $\top$ projects to "no truth value", and the surface relational engine can render either as the legacy token `NULL` for backwards compatibility while the substrate continues to distinguish them in its own representation. The two cells take different repair paths, register differently in [audit-content-via-inconsistency-sheaf-cohomology](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/audit-content-via-inconsistency-sheaf-cohomology.md), and respect different isolation-level filters.

## Composability with other database-platform constructs

- **Transaction isolation.** Per [transaction-isolation-as-knowledge-order-position](../theorems/transaction-isolation-as-knowledge-order-position.md), `read-committed`-and-stronger filter the in-flight $\top$ off the substrate's read surface; only `read-uncommitted` may observe an in-flight cell at $\top$.
- **WHERE clauses.** Per [where-clause-as-paraconsistent-comprehension](../theorems/where-clause-as-paraconsistent-comprehension.md), a WHERE predicate's *designated truth value* — classical $\mathbf{t}$ vs information $\top$ — selects which positions count as a match; the SQL standard's "WHERE x = NULL matches nothing" is the $\mathbf{t}$-designated reading and the substrate also exposes the $\top$-designated reading for queries that genuinely want "every cell that has any information."
- **Materialized views.** A view computed at [settling-quiescence](../../../../../../valuation/content/knowledge-least-valuation/settling/content/settling-quiescence/settling-quiescence.md) per [materialized-view-as-functorial-projection-cache](../theorems/materialized-view-as-functorial-projection-cache.md) sees only quiescent positions; its `NULL`-cells are unambiguously $\bot$ or $\top$ at quiescence, never the in-flight $\top$ of a non-quiescent cascade.
- **Constraints.** A `NOT NULL` constraint reads, in the bilattice setting, as the substrate predicate "this cell is at neither $\bot$ nor $\top$" — a refinement of the legacy reading "this cell is not $\bot$", since a contradiction is also a constraint violation under the bilattice account.
- **Aggregates.** SQL's "ignore NULL in aggregates" silently conflates the two `NULL` positions; the substrate's aggregate operators take an explicit per-position policy (typically: drop $\bot$, raise on $\top$, document the choice in the query-plan witness).

The point is not to replace `NULL` at the surface SQL syntax — applications continue to write the legacy token — but to give the substrate a structurally sound representation underneath that the substrate's own operators (closure cascade, repair, audit, federation) can act on without the surprises of three-valued logic.
