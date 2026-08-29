---
kind: narrative
introduces: [spatiotemporal-knowledge-presheaf]
see-also: [aperiodic-settling, settling-continuity, settling-monotonicity, closure-ordinal, four-regime-dichotomy, strict-regime-cohomology-vanishing]
---

# Settling dynamics

Static valuations on a fixed predicate category give a snapshot of knowledge. The settling is the temporal axis: a transfinite sequence of valuations $(v_\tau)_{\tau < \lambda}$ indexed by an ordinal [settling bound](../objects/settling-bound.md) $\lambda$, with each step driven by an [increment sequence](../objects/increment-sequence.md) $U = (u_\tau)$ of external evidence and saturated by a closure operation. The fundamental dynamics: at each successor step, external evidence arrives, the closure fires until the predication state is saturated under inference, and the result is the valuation at the next ordinal.

Two structural commitments shape the dynamics:

- [**Settling monotonicity**](../concepts/settling-monotonicity.md). The orbit $(v_\tau)$ is $\leq_k$-monotone — knowledge accumulates and never retracts. Both positive and negative evidence can grow; the only state never reduced is $\top$ (told both, an irreversible record of conflict).

- [**Settling continuity**](../concepts/settling-continuity.md). At limit ordinals, the value is the $\leq_k$-supremum of all earlier values: $v_\mu = \bigvee_k\{v_\sigma : \sigma < \mu\}$. This is what makes the orbit a coalgebra rather than a discrete sequence.

Whether the settling *stabilizes* depends on the closure operator's structure. If the closure is finitely generated and the value domain is finite, stabilization occurs at a finite ordinal — the [strict regime](../theorems/strict-regime-cohomology-vanishing.md). Scott-continuous closures stabilize at $\omega$. Closures that fail Scott-continuity can run through transfinite ordinals; the [aperiodic settling](../concepts/aperiodic-settling.md) is the case where no countable ordinal stabilizes the orbit at all.

The [closure ordinal](../objects/closure-ordinal.md) of a settling — the smallest $\kappa$ at which $v_\kappa$ becomes a fixed point — is the program's central invariant of settling behavior. The [four-regime dichotomy](../theorems/four-regime-dichotomy.md) classifies settlings by the size of this ordinal, and most of the structural results in the cohomological and moduli layers stratify by regime.

The settlings over a fixed base assemble into a category — the [knowledge presheaf category](../objects/knowledge-presheaf-category.md) — which is well-behaved as an algebraic object. It has all small limits and colimits computed pointwise ([completeness and cocompleteness](../theorems/knowledge-presheaf-category-completeness.md)), and the constant-$\bot$ and constant-$\top$ presheaves serve as [initial and terminal objects](../theorems/knowledge-presheaf-category-initial-terminal.md). The pointwise $\vee_k$-merge surfaced by the completeness corollary is the algebraic underpinning of the CRDT story in the Study-and-use part.
