---
type: example
status: verified
depends-on: [bigraded-realizability-refinement, bigraded-aperiodic-regime-trichotomy, mixed-stratum-two-firing-settling, paraconsistent-classification, inconsistency-sheaf]
instantiates: [bigraded-realizability-refinement, bigraded-aperiodic-regime-trichotomy]
lineage: 4
title: Bigraded refinement of the mixed-stratum two-firing settling
description: The L4 instance of the bigraded refinement of realizability.
---

# Bigraded refinement of the mixed-stratum two-firing settling

The L4 instance of the [bigraded refinement of realizability](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/bigraded-realizability-refinement.md). **Lineage 4** instance computing the bigraded $H^1$ explicitly on a settling with both truth-side and inconsistency-side firings.

## Setup

The [mixed-stratum two-firing settling](../../research/2026/07/31/lenticule-import/from-predicate-category/mixed-stratum-two-firing-settling.md): $E = \omega + 1$, $\Pi = \{P, Q\}$, with two closure rules:

- Rule T (truth-side): $(\forall \alpha < \beta. v(P)(\alpha, \alpha) \geq_k \mathbf{t}) \Rightarrow v(P)(\beta, \beta) \geq_k \mathbf{t}$.
- Rule TOP (inconsistency-side): $(\forall \alpha < \beta. v(Q)(\alpha, \alpha) \geq_k \top) \Rightarrow v(Q)(\beta, \beta) \geq_k \top$.

Increments at $\tau = 0$: $u_0(P)(0, 0) = \mathbf{t}$, $u_0(Q)(0, 0) = \top$.

Closure ordinal $\kappa = \omega + 1$. NSC firing ordinal $L_{\mathrm{ns}}(\kappa) = \{\omega\}$ (both rules fire at $\omega$).

## Bigraded $H^1$

The bigraded cohomology splits by sheaf:

- **Truth-side** ($\mathcal{F}^{(t)}_v$): one generator at the new $\mathbf{t}$-cell $(P, \omega, \omega)$. $H^1_t = \mathbb{Z}$.
- **Inconsistency-side** ($\mathcal{F}^{(\top)}_v$): one generator at the new $\top$-cell $(Q, \omega, \omega)$. $H^1_\top = \mathbb{Z}$.

So:

$$H^1(\text{bigraded}) \;=\; H^1_t \oplus H^1_\top \;=\; \mathbb{Z} \oplus \mathbb{Z}.$$

## Bigraded classifying invariant

$$\mathrm{cl}\text{-}\mathrm{inv}^{(t, \top)}(v) \;=\; (e_\omega^{(t)},\; e_\omega^{(\top)}) \;\in\; \mathbb{Z} \oplus \mathbb{Z}.$$

Both components are non-zero. By the [bigraded aperiodic-regime trichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/bigraded-aperiodic-regime-trichotomy.md), this places the settling in the **mixed sub-stratum**: $\mathrm{cl}\text{-}\mathrm{inv}^{(t)} \neq 0$ AND $\mathrm{cl}\text{-}\mathrm{inv}^{(\top)} \neq 0$.

## What this exhibits

Three observations:

**1. Bigraded refinement distinguishes mixed-stratum from pure strata.** The settling has both truth-side and inconsistency-side content; the bigraded refinement records both, where the unrefined $H^1$ would just give a single $\mathbb{Z}^2$ without identifying which generator is which.

**2. The two firing types are independently realizable.** The two closure rules act on disjoint predicates ($P$ vs $Q$); they don't interact. This is why the bigraded class is a *direct sum* (not a tensor) — independence at the rule level.

**3. The L4 setting makes the trichotomy visible.** Pure-truth (only Rule T) → $(e^{(t)}, 0)$, consistent stratum. Pure-paraconsistent (only Rule TOP) → $(0, e^{(\top)})$, paraconsistent stratum. Mixed (both rules) → $(e^{(t)}, e^{(\top)})$, mixed stratum. All three strata are realized; the bigraded refinement is the natural classifier.

## Position in Lineage 4

The L4 bigraded-refinement instance. Companion to [transfinite-induction-strong-mld-exchange-orbit](../../research/2026/07/31/lenticule-import/from-predicate-category/transfinite-induction-strong-mld-exchange-orbit.md) (which uses strong-MLD orbit-type) — both refinements distinguish settlings at the same level, but they're *different* refinements: bigraded splits truth/inconsistency, strong-MLD splits truth-only/falsity-only/⊤. They compose into a finer multi-axis refinement.
