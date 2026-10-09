---
type: theorem
status: proved
depends-on: [tarski-lawvere-omega1-conditional-convergence, tarski-lawvere-fixed-point-grothendieck-sites, aperiodic-regime-d-frame-cohomology, aperiodic-regime-cohomology-via-direct-limit, q-enriched-aperiodic-direct-limit-cohomology, ghrist-et-al2025]
---

# Equivalence of Tarski–Lawvere fixed point with direct-limit cohomology under codirected-continuity

For Q-enriched sheaves on $\omega_1$-cofinal Grothendieck sites satisfying the [conditional convergence theorem](tarski-lawvere-omega1-conditional-convergence.md)'s hypothesis, the two natural constructions of unbounded settling cohomology — the Tarski–Lawvere fixed point on the unbounded site and the direct limit of fixed points on countable truncations — yield the same invariant. This is the certifying lemma that lets the corpus *use* the direct-limit definition (per [aperiodic-regime d-frame cohomology](../../../../aperiodic-settling/references/aperiodic-regime-d-frame-cohomology.md)) without losing any information that would have been recovered by the fixed-point construction.

## Setup

Fix a commutative unital quantale $\mathsf Q$, a Grothendieck site $(\mathbf T, J)$ with $\omega_1$-cofinal covers, and a $\mathsf Q$-enriched sheaf $F$ on $(\mathbf T, J)$. Write $\mathbf T^*_{\leq \tau}$ for the truncation of $\mathbf T$ at countable ordinal $\tau < \omega_1$; each truncation has countable cofinality and the standard Tarski–Lawvere theorem of [@ghrist-et-al2025] (Theorem 2.17) applies, giving a fixed-point invariant $x_\tau^{(\leq \tau)}$ at each truncation.

The corpus's direct-limit construction (per [aperiodic-regime cohomology via direct limit](../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md)) takes the cohomology to be

$$H^n_{\mathbf{dFrm}}(\mathbf T^*_{\leq \omega_1}, \mathbb F_v) \;:=\; \varinjlim_{\tau < \omega_1} H^n_{\mathbf{dFrm}}(\mathbf T^*_{\leq \tau}, \mathbb F_v),$$

which at the chain level corresponds to taking the direct limit $\varinjlim_\tau x_\tau^{(\leq \tau)}$ of fixed points on truncations.

The fixed-point construction takes $x_{\omega_1}$ on the unbounded site, available under the codirected-continuity hypothesis by the [conditional convergence theorem](tarski-lawvere-omega1-conditional-convergence.md).

## Theorem

**Theorem (equivalence under the hypothesis).** *If $F$ is $\omega_1$-codirected-continuous, then the Tarski–Lawvere fixed point $x_{\omega_1}$ on the unbounded site agrees with the direct limit of fixed points on the truncations:*

$$x_{\omega_1} \;=\; \varinjlim_{\tau < \omega_1} x_\tau^{(\leq \tau)}.$$

*Proof.* Both sides are suffix points of $L$ on $C^0 F$:

- The left side $x_{\omega_1}$ is a suffix point by the [conditional convergence theorem](tarski-lawvere-omega1-conditional-convergence.md), using the hypothesis.

- The right side $\varinjlim_\tau x_\tau^{(\leq \tau)}$ is a suffix point because each $x_\tau^{(\leq \tau)}$ is a suffix point of the truncated Laplacian, the truncations are cofinal in $\mathbf T^*_{\leq \omega_1}$, and the direct limit of suffix points along generator-extending transitions is a suffix point of the unbounded Laplacian (per [aperiodic-regime cohomology via direct limit](../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) §"Proof"; the underlying lemma is that filtered $\mathsf V$-colimits commute with the finite $\mathsf V$-limits assembling $L$ at each $\sigma$, per [Q-enriched aperiodic direct-limit cohomology](q-enriched-aperiodic-direct-limit-cohomology.md) Pass 1).

Both are below $x_0 = \top$. By Tarski–Lawvere uniqueness of the *largest* suffix point ([@ghrist-et-al2025] Theorem 2.17 applied at $\omega_1$ on the unbounded site, valid by the conditional convergence theorem), they coincide. $\square$

## What this certifies

When the hypothesis holds, the direct-limit definition and the fixed-point definition agree, and either may be used. The corpus's choice to define unbounded settling cohomology via direct limit (rather than fixed point) on cellular stalk-product sheaves loses no information: the resulting invariant is the same one the fixed-point construction would have produced.

When the hypothesis fails — outside the cellular stalk-product class, in particular for arbitrary frame-valued sheaves with frame-morphism restrictions — the direct-limit definition remains well-defined while the fixed-point iteration's $\omega_1$-stage value $\bigwedge_\beta x_\beta$ exists as a meet but is *not* a suffix point. In this regime the two constructions are not in general equal; characterizing their relationship is item (3) of the [parent sketch](tarski-lawvere-fixed-point-grothendieck-sites.md) §"What's open".

## Net effect on the cellular extension plan

Composing this theorem with the [conditional convergence theorem](tarski-lawvere-omega1-conditional-convergence.md) and the [cellular stalk-product theorem](tarski-lawvere-omega1-cellular-stalk-product.md), Layer 3 of the [cellular extension plan](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cellular-extension-plan.md) closes via two compatible chains:

- *Direct-limit chain:* finite-stage Tarski–Lawvere on each truncation $\to$ direct limit. Already in use as the corpus's default.
- *Fixed-point chain:* cellular stalk-product structure $\to$ ω₁-codirected-continuity $\to$ conditional convergence at $\omega_1$ $\to$ this equivalence theorem certifies the result agrees with the direct-limit invariant.

Cohomology of unbounded-settling cellular d-frame sheaves on the bitopological settling site therefore has a single invariant, with both constructions providing access.
