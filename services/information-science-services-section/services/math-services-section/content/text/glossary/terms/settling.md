---
name: Settling
description: "The fourth stage of the language spine: the morphism out of the knowledge-least valuation that iterates the modal closure until nothing changes. Termination is Knaster–Tarski; on the four readings every closure settles by step three, so settling's regime is strict-finite. Settling is where order itself is generated."
aliases: [settle, settles, stabilizing, stabilization]
---
**Settling** is the fourth and last stage of the language spine, after [articulating](articulating.md), [predicating](predication.md) and [positing](positing.md): the morphism out of the knowledge-least valuation that brings a trace to its fixed point ([`Language/Settling.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Settling.lean)). It iterates the modal closure $\Diamond \circ \Box$ until the valuation stops changing. Each step is monotone in the bounded knowledge lattice, so by Knaster–Tarski the orbit reaches a least fixed point (`settle_fixed`, `settle_least`). Settling is a closure's least fixed point, not truth evaluation.

**Settling generates order.** Because the closure is monotone and its fixed point a least upper bound, settling is where order theory is derived: the knowledge relation is proved a partial order with $\vee_k$ and $\wedge_k$ its least upper and greatest lower bounds, making the readings a bounded lattice. Order is not filed near settling by resemblance; it is the structure settling is.

**Strict-finite.** On the four readings no ascending chain has four distinct elements (`kchain_height`), so every inflationary endomap settles by step three (`settles_by_three`, `strict_finite`, [`Closure/Ordinal/Finite.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Ordinal/Finite.lean)): settling's [regime](regime.md) is strict-finite. The closure is a Kock–Zöberlein, lax-idempotent 2-monad, and on the antisymmetric knowledge order lax-idempotence is exactly strict idempotence (`kz_iff_strict`, [`Closure/Monad.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Monad.lean)).

**Driven settling.** Evidence arrives over time as an increment sequence $U = (u_\tau)$, and the settling endofunctor saturates then merges, $F_U(v) = \mathrm{Cl}(v) \vee_k u_\tau$. The driven orbit is monotone and fixes where the increments stop (`drive_monotone`, `drive_at_settle_fixed`, [`Dynamics/Flow/ClosureFlowDynamics.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Dynamics/Flow/ClosureFlowDynamics.lean)); a settling-equipped predication hyperdoctrine is a coalgebra for this endofunctor ([`Closure/Coalgebra.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Coalgebra.lean)). This driven motion is the [flow](flow.md).

**Stability.** In the acts derivation settling is reached through the stability stratum: traces, terms, judgements, observations and contexts are each stabilized, fixed so that they can be revisited without drift, and a stabilized judgement witnessed and observed along its trace is the ground for the [nucleus](nucleus.md) and the flow.

**Implementing it.** A settle operation closes a posited valuation to its settlement; it does not articulate, predicate or posit. An evaluator that settles under a fuel bound reports failure to settle rather than looping, which is the runtime face of the strict-finite bound.

## Related

- [Settlement](settlement.md) — the four-cornered position a settled reading holds
- [Closure operator](closure-operator.md)
- [Nucleus](nucleus.md)
- [Flow](flow.md)
- [Regime](regime.md)
