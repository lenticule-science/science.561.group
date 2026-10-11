---
type: morphism
class: primitive-operator
realizes: [operator]
depends-on: [predication-graph-store, repair, settling-monotonicity, closure-operator, application-sublocale]
see-also: [insertion, traversal]
---

# Retraction

The second of the three primitive [operators](teaching/explanations/operator.md). Retraction removes a [predication cell](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) $(s, p, o)$ from the [predication-graph store](../objects/predication-graph-store.md) — the only operator on the [predication substrate](teaching/explanations/predication-substrate.md) that *lowers* a cell's value in the [knowledge order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md), and therefore the only operator that on its face conflicts with the math [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) axiom.

Retraction is admissible only under one of two declared conditions, each of which preserves settling-monotonicity at the appropriate level of analysis:

- **Repair retraction.** A [repair](teaching/explanations/repair.md) declared in the substrate's repair catalog has retraction in its recipe — typically the gluing of conflicting sections produces one canonical section by retracting the others. The retraction's [witness](../objects/witness.md) entry cites the declared repair code; an auditor checking the witness verifies the repair is in the catalog and the recipe was followed. Per the substrate's discipline, repair retractions form a *new settling* indexed by post-repair ordinals — the original settling ends at the repair point, and the post-repair valuation is the start of a new settling. Settling-monotonicity holds *within* each settling; the boundary is a substrate-content event.

- **Sublocale-bounded retraction.** A retraction within a particular [application sublocale](../objects/application-sublocale.md) is the application's nucleus deciding that a cell is no longer visible to the application. The retraction is recorded as a *change to the nucleus*, not a deletion from the underlying [predication-graph store](../objects/predication-graph-store.md): the cell still exists in the substrate's storage and may still be visible to other applications. The sublocale's own settling continues monotonically; the visibility-boundary is where the sublocale-projection meets the substrate-storage. The witness records the nucleus change, not a substrate-level delete.

Retraction outside these two declared cases is forbidden. The reason is structural: arbitrary retraction violates the [knowledge-order monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) the math program rests on, which in turn means the [closure operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md)'s convergence guarantees no longer apply (the closure 2-monad's lax-idempotence depends on inflationarity, and inflationarity fails when retraction is unrestricted). A computer that admits unrestricted retraction is not a predicated computer in this corpus's sense; it is some other kind of computer with a graph-shaped store.

The [event log](../objects/event-log.md) treatment of retraction is asymmetric to insertion: the event log does *not* erase the original insertion event. Both events are recorded; the resulting state is the application of both events in order under the substrate's closure machinery (with the second event being a repair-retraction or a sublocale-nucleus change). An auditor replaying the log applies the insertion, then the retraction; the resulting predication graph matches the live store. The event log is append-only even when the practical effect is removal — preserving the substrate's audit-trail completeness despite the apparent monotonicity exception.
