---
type: theorem
class: engineering-claim
depends-on: [wavefront, fuel-bound, closure-rule, predication-fiber-algebra, closure-operator, scott-continuous-closure, settling-convergence, four-regime-dichotomy, closure-driven-settling-monotonicity]
---

# Wavefront cost is bounded by content, not by graph size

**Claim.** For a [closure-driven](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md) predication substrate whose [closure rules](teaching/explanations/closure-rule.md) respect bounded-radius locality, the [settle](../morphisms/settle.md) operator's [wavefront](teaching/explanations/wavefront.md) performs work bounded by

$$N_{\text{settle}} \;\le\; K \cdot |P_{\text{affected}}|$$

where $|P_{\text{affected}}|$ is the number of [predication cells](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) whose values change during the settlement and $K$ is determined by the value-domain's $\leq_k$-chain structure. The total cost is independent of the substrate's overall size — the substrate's predication graph may contain millions of unaffected predications without contributing to the bound.

The number of closure-rule application *layers* — and hence the absolute number of stages of work — depends on the substrate's regime in the [four-regime dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md). The size-independent bound holds in all four regimes; the layer count is finite in the strict regime, $\omega$ in the Scott-continuous regime, and transfinite in the non-Scott-continuous regimes.

## Why this holds

The argument decomposes into three regime-independent sub-claims plus a regime-dependent layer bound.

**Sub-claim 1: Each cell's value rises a bounded number of times in $\leq_k$.** Per [closure-driven settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), the sequence $(v_\tau(p)(s, o))_{\tau}$ at any cell is $\leq_k$-monotone in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p$. The number of distinct values a cell can take is bounded by the length of the longest $\leq_k$-ascending chain in $\mathbf{L}^\bowtie$. For the four-valued bilattice $\mathbf{FOUR}$, this length is at most 3 ($\bot \to \mathbf{t}$ or $\mathbf{f} \to \top$). For larger residuated lattices $\mathbf{L}$, the per-cell transition bound is the chain length in $\mathbf{L}^\bowtie$.

**Sub-claim 2: Each closure-rule application examines a bounded radius.** Per [closure-rule](teaching/explanations/closure-rule.md), every admissible closure rule declares a bounded match radius $r$. A rule applied at an anchor entity examines at most $O(d^r)$ cells where $d$ is the substrate's average degree at the anchor. The per-application cost is independent of the substrate's total size; it scales with the local neighborhood's structure.

**Sub-claim 3: Wavefront width is bounded by the cascade's effect set.** A wavefront's width at any moment is the number of entities currently to be examined for closure-rule applicability. By construction, an entity enters the wavefront only when one of its cells has been changed by a recent rule application (per [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md), the increment $u_{\tau+1}$ together with the previous state is what closure operates on). An entity that no rule application has touched does not enter the wavefront. So the wavefront width is bounded by the size of the cascade's effect set, not by the substrate's total entity count.

Combining the three: the total per-cell work is bounded by `(cells affected) × (transitions per cell) × (rule applications per transition)`, with the second and third factors independent of substrate size.

## Layer count is regime-determined

The *number of layers* of closure-rule application — equivalently, the closure ordinal $\kappa$ of the local cascade — depends on the substrate's regime:

- **[Strict regime](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md)** (finite $\mathbf{L}, E_{\text{local}}, \mathcal{C}_{\text{local}}$). Per [settling-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-convergence.md), the cascade stabilizes in finitely many layers. The total work is $O(|P_{\text{affected}}|)$.
- **Scott-continuous regime** (infinite local base, quantifier-free closure rules). Layers are bounded by $\omega$; each finite prefix admits a finite-cost computation. The substrate's [fuel-bound](teaching/explanations/fuel-bound.md) discipline must allow $\omega$-bounded wavefront expansion, but each layer's cost remains $O(|P_{\text{affected, layer}}|)$.
- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$). Layers reach beyond $\omega$ at [non-Scott-continuous firing ordinals](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/non-scott-continuous-firing-ordinal.md). At each such ordinal, a single layer admits the entire $\forall$-block antecedent's worth of evidence. The substrate's [fuel-bound](teaching/explanations/fuel-bound.md) must permit transfinite expansion, or the engine must abort with a witnessed fuel-exhaustion at the limit ordinal.
- **Aperiodic regime** ($\kappa \geq \omega_1$). Layers reach $\omega_1$ or beyond. The fuel-bound discipline cannot provide a finite cap; the engine must either accept transfinite running, or scope the substrate to a bounded prefix of the closure ordinal.

The locality bound (Sub-claims 1–3) is uniform across regimes; the engine's *runtime* obligation is regime-determined.

## Engineering consequence

A substrate of $N$ entities settling a cascade affecting $k \ll N$ cells performs work that scales with $k$, not $N$. The predicated computer's effective scale is structurally decoupled from its substrate size. Per [wavefront-and-locality](teaching/explanations/wavefront-and-locality.md), this is the engineering content of "locality is a substrate commitment, not a performance optimization."

The locality bound is what lets a federated substrate process incremental changes without re-settling unaffected regions: when a federation-bridge admits a foreign-substrate's increment, only the cascade's effect set is touched. This composes with [federation-convergence](federation-convergence.md): the merge step ships the increment, and the local settle bounds its work by the affected region.

## What the theorem rules out

A closure rule whose effective match radius is unbounded — a rule whose premises range over the whole substrate, or a rule whose effect set is the whole substrate — is not admissible substrate content per the locality contract. Per [unbounded-radius-rules](questions/unbounded-radius-rules.md), the substrate's response is to reject such rules at admission time or to factor them into bounded-radius rules whose composition produces the same conclusions.

A substrate whose value-domain has no $\leq_k$-chain bound — a fiber algebra over an unbounded $\mathbf{L}$ where individual cells can rise without bound — violates Sub-claim 1, and the per-cell transition factor becomes unbounded. The substrate's [fuel-bound](teaching/explanations/fuel-bound.md) discipline applies as a runtime safety net for substrates whose value-domain or rule structure deviates from these conditions.

## What the theorem requires

- The substrate is closure-driven (per [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md)).
- The closure operator satisfies the four [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axioms (monotone in $\leq_k$, inflationary, idempotent, $\mathcal{C}$-natural).
- Closure rules respect bounded-radius locality (per [closure-rule](teaching/explanations/closure-rule.md)).
- The value-domain $\mathbf{L}^\bowtie$ has bounded $\leq_k$-chains in the local fiber.
- The substrate's [fuel-bound](teaching/explanations/fuel-bound.md) discipline is sized for the regime: finite for strict, $\omega$ for Scott-continuous, regime-aware for the non-Scott-continuous regimes.
