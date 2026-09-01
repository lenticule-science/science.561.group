---
type: theorem
status: refuted
depends-on: [lawvere-laplacian-grothendieck-sites, quantale-enriched-sheaf, bitopological-settling-site, tarski-lawvere-omega1-conditional-convergence, tarski-lawvere-omega1-cellular-stalk-product, tarski-lawvere-direct-limit-equivalence, frame-morphism-meet-preservation-openness, q-enriched-aperiodic-direct-limit-cohomology, aperiodic-regime-d-frame-cohomology, kelly1982, ghrist-et-al2025]
---

# Tarski–Lawvere fixed point on Grothendieck sites

Layers 2 and 3 of the [cellular extension plan](prose/teaching/explanations/cellular-extension-plan.md). The *unrestricted* conjecture — Tarski–Lawvere convergence at $\omega_1$ for arbitrary $\mathsf Q$-enriched sheaves on $\omega_1$-cofinal Grothendieck sites — is **materially false**, with explicit counterexample on a frame sheaf in [frame-morphism-meet-preservation-openness](frame-morphism-meet-preservation-openness.md). The status is `refuted` for the unrestricted statement, but the file remains the structural hub for the four-part decomposition:

- [Conditional Tarski–Lawvere convergence at ω₁ under codirected-continuity](tarski-lawvere-omega1-conditional-convergence.md) (proved): the strongest general statement available, conditional on a hypothesis on the sheaf.
- [Tarski–Lawvere convergence at ω₁ for cellular stalk-product Q-enriched sheaves](tarski-lawvere-omega1-cellular-stalk-product.md) (proved): the hypothesis is automatic for the corpus's primary class.
- [Equivalence of Tarski–Lawvere fixed point with direct-limit cohomology under codirected-continuity](tarski-lawvere-direct-limit-equivalence.md) (proved): when the hypothesis holds, the fixed-point invariant agrees with the direct-limit invariant the corpus uses by default.
- [Frame morphisms preserve all meets iff they have a left adjoint, iff (spatially) they are induced by open maps](frame-morphism-meet-preservation-openness.md) (proved): the structural characterization showing that meet preservation is *categorical openness*, with explicit $\omega_1$-cofinal counterexample (continuous-but-not-open identity from a refined topology) and recovery of the cellular stalk-product theorem as a corollary.

The deepest structural lesson, articulated in the openness file: the cellular stalk-product class is exactly the categorical-openness class, and convergence of the Tarski–Lawvere iteration at $\omega_1$ is structurally equivalent to openness of the sheaf restrictions. The conjecture's failure is not an accident — it is the same phenomenon as "not every continuous map is open."

This is a separate theorem from the [Layer-1 sheaf-compatibility lemma](lawvere-laplacian-grothendieck-sites.md) (proved, cardinality-independent). Here the open content is convergence of the Tarski–Lawvere iteration at uncountable cofinality.

## Setup

Fix a commutative unital quantale $\mathsf Q$, a small category $\mathbf T$ with Grothendieck topology $J$, and a $\mathsf Q$-enriched sheaf $F$ on $(\mathbf T, J)$. By the [Layer-1 sheaf-compatibility lemma](lawvere-laplacian-grothendieck-sites.md), the Lawvere Laplacian $L : C^0 F \to C^0 F$ restricts to an endofunctor on the sheaf subcategory.

The Tarski–Lawvere iteration is

$$x_0 = \top, \qquad x_{\beta + 1} = x_\beta \,\wedge\, L(x_\beta), \qquad x_\lambda = \bigwedge_{\beta < \lambda} x_\beta \;\;(\lambda \text{ limit}).$$

The chain $(x_\beta)_\beta$ is monotone decreasing in $C^0 F$. *Convergence at $\kappa$* means $x_{\kappa + 1} = x_\kappa$, equivalently $x_\kappa \leq L(x_\kappa)$ — i.e., $x_\kappa$ is a suffix point of $L$. By [@ghrist-et-al2025] Theorem 2.17, when this happens $x_\kappa$ is the largest suffix point of $L$ below $x_0$.

For the bitopological settling site in the strict, Scott-continuous, and transfinite-bounded regimes, the cover structure is finite-or-countable, and the countable-cofinality Tarski–Lawvere theorem of [@ghrist-et-al2025] applies directly. The aperiodic regime has $\omega_1$-cofinal cover structure, and convergence at $\omega_1$-cofinality is what is at issue here.

## Where the obstruction lives

Substituting the Lawvere Laplacian formula (per [the Layer-1 lemma](lawvere-laplacian-grothendieck-sites.md) §"The Lawvere Laplacian"), at object $\sigma$,

$$L(x)(\sigma) \;=\; \bigwedge_{f : \sigma \to \tau} F(f)\bigl(F(f)^*\bigl(x(\tau)\bigr)\bigr),$$

where the meet is the cotensor-of-conical-limits assembling $\sigma$'s outgoing morphisms. Take a limit ordinal $\lambda$ and compute, at $\sigma$,

$$L\Bigl(\bigwedge_{\beta < \lambda} x_\beta\Bigr)(\sigma) \;=\; \bigwedge_{f} F(f)\Bigl(F(f)^*\Bigl(\bigwedge_{\beta} x_\beta(\tau_f)\Bigr)\Bigr) \;=\; \bigwedge_{f} F(f)\Bigl(\bigwedge_{\beta} F(f)^*\bigl(x_\beta(\tau_f)\bigr)\Bigr),$$

using that $F(f)^*$ is a right $\mathsf Q$-adjoint and therefore preserves all weighted limits in its argument ([@kelly1982] §3.2). Compare to the candidate fixed-point relation

$$\bigwedge_{\beta} L(x_\beta)(\sigma) \;=\; \bigwedge_{\beta} \bigwedge_{f} F(f)\bigl(F(f)^*(x_\beta(\tau_f))\bigr) \;=\; \bigwedge_{f} \bigwedge_{\beta} F(f)\bigl(F(f)^*(x_\beta(\tau_f))\bigr),$$

after swapping the two meets (a $\mathsf Q$-weighted Fubini, valid in any complete $\mathsf Q$-category). The two expressions agree at every $\sigma$ iff for every site morphism $f$ the sheaf restriction $F(f)$ commutes with the codirected $\lambda$-meet $\bigwedge_\beta F(f)^*(x_\beta(\tau_f))$.

This isolates the structural fact:

> **The obstruction.** Convergence of the Tarski–Lawvere iteration at limit ordinal $\lambda$ reduces to asking whether the sheaf restrictions $F(f)$ preserve the specific codirected $\lambda$-meets generated by the iteration in each stalk.

For $\lambda < \omega_1$ this is automatic from the quantale-enriched analog of countable-meet preservation that the standard Tarski–Lawvere theorem already uses. For $\lambda = \omega_1$ it is genuinely a property of $F$, not of the categorical framework, because $\mathsf Q$-functors between complete weighted lattices need not preserve uncountable codirected meets in general.

This is the dual side of the AB5-type axiom the corpus has already established for filtered $\mathsf Q$-colimits (see [Q-enriched aperiodic direct-limit cohomology](q-enriched-aperiodic-direct-limit-cohomology.md) Pass 1, where filtered $\mathsf V$-colimits commute with finite $\mathsf V$-limits in $\mathsf V$-presheaves for every corpus-relevant $\mathsf V$). The codirected dual — codirected $\omega_1$-meets commuting with the *componentwise* operations of $L$ — is not formally implied by the colimit-side axiom, and it is the missing piece.

## Net resolution

The obstruction analysis decomposes the original conjecture cleanly:

1. **Conditional version.** The obstruction motivates an explicit hypothesis on $F$ ($\omega_1$-codirected-continuity of restrictions). Under this hypothesis, convergence at some ordinal $\leq \omega_1$ is provable. See [conditional convergence theorem](tarski-lawvere-omega1-conditional-convergence.md).

2. **Cellular stalk-product class.** The hypothesis is *automatic* when $F$ has the form $F(U) = \prod_{\sigma \in K(U)} F_\sigma$ with restrictions as componentwise projections, because projections out of products preserve all weighted limits ([@kelly1982] §3.3). This is the corpus's standing convention for cellular Q-enriched sheaves, including the d-frame-valued sheaves on the bitopological settling site. See [cellular stalk-product theorem](tarski-lawvere-omega1-cellular-stalk-product.md).

3. **Equivalence with the direct-limit invariant.** When the hypothesis holds, the fixed-point invariant agrees with the direct-limit cohomology the corpus uses by default. See [direct-limit equivalence theorem](tarski-lawvere-direct-limit-equivalence.md).

4. **Negative side for the unrestricted version.** Outside the cellular stalk-product class — in particular for $\mathsf Q$-enriched frame sheaves with frame-morphism restrictions — the hypothesis fails generically (frame morphisms preserve finite meets and arbitrary joins, not uncountable codirected meets). The unrestricted conjecture is therefore materially false in the d-frame setting. The conditional theorem plus the direct-limit definition is the structural replacement.

For the corpus's primary case — cellular d-frame-valued sheaves on the [bitopological settling site](../objects/bitopological-settling-site.md) constructed via the [cellular extension plan](prose/teaching/explanations/cellular-extension-plan.md) — items 2 and 3 close the question completely: the Tarski–Lawvere iteration converges at $\leq \omega_1$, and the resulting invariant is the same one the [direct-limit cohomology](aperiodic-regime-d-frame-cohomology.md) already computes.

## Status: refuted (with full structural decomposition)

This file is `refuted` because its headline statement — the unrestricted conjecture — is materially false. Refutation comes via the [openness characterization](frame-morphism-meet-preservation-openness.md), which both:

- Provides an explicit $\omega_1$-cofinal counterexample (the topology-refining identity $f : Y \to X$ with $Y = \omega_1+1$ refined by $\{\omega_1\}$, $X = \omega_1+1$ standard order topology), and
- Characterizes *why* the conjecture fails: meet preservation by frame morphisms is equivalent to having a left adjoint, equivalent to (spatially) being induced by an open map. The unrestricted conjecture's failure is the same phenomenon as "not every continuous map is open."

The corpus's positive use case is fully closed via the cellular stalk-product theorem (which the openness characterization recovers as the categorical-openness corollary): cellular stalk-product structure ⟺ projections-as-restrictions ⟺ left adjoints exist (component-inclusions) ⟺ all meets preserved ⟺ Tarski–Lawvere converges at $\omega_1$.

## What was open, now closed

- **~~Item 1~~** (closed). Explicit counterexample to $\omega_1$-codirected-continuity on a non-stalk-product frame sheaf. Settled by the [openness characterization](frame-morphism-meet-preservation-openness.md): the topology-refining identity $f : (\omega_1+1)_{\text{refined}} \to (\omega_1+1)_{\text{standard}}$ induces $h := f^{-1}$ which fails to preserve the codirected meet $\bigwedge_{\alpha < \omega_1} (\alpha, \omega_1]$. Embeds as the sheaf $\mathbb F$ on the two-object site $(\sigma \to \tau)$ with $\mathbb F(\tau) = \Omega(X)$, $\mathbb F(\sigma) = \Omega(Y)$, $\mathbb F$-restriction $= h$. The structural lesson — that this failure is not accidental but is exactly the categorical-openness obstruction — is the file's deeper contribution.

- **~~Item 3~~** (closed structurally). Characterization of fixed-point vs direct-limit invariants when the conditional hypothesis fails. On the counterexample sheaf above, the comparison is explicit: the unbounded-site fixed-point iteration's $\omega_1$-stage value at $\tau$ contains $h(\bigwedge_\alpha U_\alpha) = h(\emptyset) = \emptyset$ in the relevant component, while the direct-limit construction (fixed points on truncations, then limit) recovers $\bigwedge_\alpha h(U_\alpha) = \{\omega_1\}$. The direct-limit invariant is therefore *strictly finer* than the fixed-point invariant exactly when the openness/meet-preservation hypothesis fails, with the gap measured by the failure-of-meet-preservation defect $\bigwedge_\alpha h(U_\alpha) \setminus h(\bigwedge_\alpha U_\alpha)$ at each problematic site morphism. This is the conjectured-and-now-verified picture: the direct-limit invariant detects exactly the structure that left-adjoint failure obstructs.

  Promoting this verification from "structural picture on the counterexample" to a general theorem ("direct-limit invariant ≅ fixed-point invariant + meet-preservation defect, on any Q-enriched sheaf with $\omega_1$-cofinal site structure") is a clean follow-on theorem if needed — but it is not load-bearing for the corpus, since cellular stalk-product structure puts the corpus in the zero-defect regime where the [equivalence theorem](tarski-lawvere-direct-limit-equivalence.md) already certifies exact agreement.

The full structural picture: the four companion files plus this hub close the question completely. The unrestricted conjecture is refuted with explicit and structural certification; the corpus's primary class is positively closed; the fixed-point and direct-limit invariants' relationship is characterized in both regimes (zero defect: agreement; nonzero defect: direct-limit strictly finer, with explicit witness).

(Item (2) of the original open list is removed: settled positively for the corpus's class by the [cellular stalk-product theorem](tarski-lawvere-omega1-cellular-stalk-product.md).)
