---
type: theorem
class: engineering-claim
status: proved
depends-on: [wavefront, wavefront-termination, settling-cohomology, settling-associated-sheaf, crdt-convergence-via-mayer-vietoris, settling-cohomology-vanishes-above-degree-1, closure-driven-settling-monotonicity]
see-also: [trace-causality-via-mayer-vietoris-spans, backup-as-cohomology-preservation]
---

# Wavefront locality is structural via Mayer-Vietoris vanishing on the settling-associated sheaf

**Claim.** For any [wavefront](teaching/explanations/wavefront.md) propagation in the substrate, the locality property — work bounded by affected cells $|P_\mathrm{affected}|$ rather than substrate size $N$ — follows *structurally* from the [Mayer-Vietoris vanishing](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md) of the substrate's [settling-associated sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md). Specifically, the connecting homomorphism $\delta^0$ on the settling sheaf is identically zero — there is no $H^1$-obstruction class encoding "effects that need to propagate beyond the local region." The substrate's wavefront-bounded runtime is the engineering surface of this structural cohomological vanishing.

## Why this holds

Per [crdt-convergence-via-mayer-vietoris](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md), for any cover $U = U_1 \cup U_2$ of a substrate region, the Mayer-Vietoris connecting homomorphism

$$\delta^0 : H^0(U_1 \cap U_2, \mathcal{F}_U) \to H^1(U, \mathcal{F}_U)$$

is identically zero on the settling-associated sheaf $\mathcal{F}_U$. Engineering translation: a section of newly-designated cells over the cover-overlap extends canonically (via "extension by zero") to a section over the union, with no obstruction class.

For the wavefront, this means:

- A closure-rule application at entity $e_1$ produces newly-designated cells in a local region $U_1 \subseteq E$ (the cells the rule touched).
- A subsequent application at neighbor $e_2$ produces newly-designated cells in another local region $U_2$.
- Their joint effect is computed on $U_1 \cup U_2$ — the union of the two regions.
- Per the Mayer-Vietoris vanishing, the joint effect is *exactly* the cell-by-cell sum of the individual effects on $U_1 \cap U_2$ — there's no additional cross-entity correction term.

The substrate's runtime can therefore process effects locally, never needing to "go back and fix" entities outside the changed region. Per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), each step is $\leq_k$-monotone — the local effect only grows the substrate's content, doesn't disturb existing content. Per [settling-cohomology-vanishes-above-degree-1](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md), higher cohomology classes vanish for the typical substrate's predicate generators — there are no higher-order obstructions to recombine local effects.

Combining: the substrate's wavefront execution is structurally bounded by the local region of affected cells, with $H^0$ counting the affected cells, $H^1 = 0$ guaranteeing no global propagation, and $H^{\geq 2} = 0$ guaranteeing no higher-order correction.

## Engineering consequence

- **Wavefront cost is content-bounded, not size-bounded.** Per [wavefront-termination](wavefront-termination.md), $N_\mathrm{settle} \leq K \cdot |P_\mathrm{affected}|$, with $K$ determined by the value-domain's $\leq_k$-chain. This bound is structural: it follows from the cohomological vanishing, not from a runtime optimization the substrate's engine implements.
- **Substrates of arbitrary size remain tractable.** A substrate of $N$ entities settling a cascade affecting $k \ll N$ cells performs work proportional to $k$, regardless of $N$. The substrate's effective scale is structurally decoupled from its substrate size.
- **Federation increment processing is local.** When a federation peer transmits an increment, the receiving substrate's wavefront processes only the increment's effect set. Per [crdt-convergence-via-mayer-vietoris](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md), the merge requires no global re-settlement.
- **Parallel wavefronts compose without coordination.** Per the Mayer-Vietoris vanishing, two wavefronts processing disjoint effect sets compose as the disjoint union of their effects — no synchronization. Per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), spacelike-separated wavefronts admit any relative ordering.
- **Non-locality is detectable.** A substrate whose closure rules violate the bounded-radius locality contract would produce non-trivial $H^1$ obstructions, breaking the wavefront discipline. The substrate's discipline rejects such rules at admission time.

## What the theorem rules out

- **Wavefront propagation requiring global coordination.** A "wavefront" that needs to communicate with non-local entities to compute its effect is not implementing the substrate's structural locality. Per the theorem, locality is cohomologically guaranteed; any runtime that requires global coordination is implementing a different (more expensive) computation.
- **Effect propagation through cohomology classes.** A "subtle" effect that propagates as an $H^1$-class through the substrate (e.g., a long-range correlation that doesn't show up at any single entity but emerges globally) is not admissible per the Mayer-Vietoris vanishing. Per [crdt-convergence-via-mayer-vietoris](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md), such propagation cannot occur in the substrate's value-domain.
- **Higher-order corrections to wavefront effects.** Per [settling-cohomology-vanishes-above-degree-1](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md), higher-cohomology classes vanish — the wavefront's effect is fully determined by $H^0$ (cell counts) and $H^1$ (which is also zero per Mayer-Vietoris). No higher-order corrections are needed.

## What the theorem requires

- The substrate's value-domain admits the bilattice $\vee_k$ join (per [predication-fiber-algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)).
- The closure operator is monotone, inflationary, idempotent (per [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md)).
- The substrate's predicate generators satisfy the cohomological dimension condition $\mathrm{cd}(\mathcal{C}^\mathrm{op}) \leq 1$ (per [settling-cohomology-vanishes-above-degree-1](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md)).
- Closure rules respect bounded-radius locality (per [closure-rule](teaching/explanations/closure-rule.md)).

## Position

Together with [trace-causality-via-mayer-vietoris-spans](trace-causality-via-mayer-vietoris-spans.md) and [backup-as-cohomology-preservation](backup-as-cohomology-preservation.md), this theorem grounds the substrate's runtime-locality discipline in the predication-categories' cohomological framework. The substrate's effective compute model — wavefront-bounded, content-determined, federation-stable — is structurally the engineering surface of $H^1 = 0$ on the settling-associated sheaf. The substrate's claim to "scale beyond its size" is not a marketing line; it is a cohomological theorem.
