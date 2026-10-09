---
kind: question
status: open
explores: [continuous-state-regime-classification, stochastic-settling, stochastic-stationary-as-settling, four-regime-dichotomy]
title: Spectral gap as a continuous invariant within asymptotic-c
description: The continuous-state regime classification theorem splits continuous-time / continuous-value settlings into four regimes (strict-c / asymptotic-c / non-asymptotic-countable / aperiodic-c).
---

# Spectral gap as a continuous invariant within asymptotic-c

The [continuous-state regime classification theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/continuous-state-regime-classification.md) splits continuous-time / continuous-value settlings into four regimes (strict-c / asymptotic-c / non-asymptotic-countable / aperiodic-c). Within asymptotic-c, the [probabilistic belief-propagation benchmark](benchmark-probabilistic-belief-propagation.md) found a quantitative gap that the regime classification doesn't see:

| Setting | Empirical $\rho$ | Iterations to tol $10^{-12}$ |
|---|---|---|
| Random walk on $K_3$ | 0.500 | 40 |
| Birth-death on 4 states | 0.736 | 87 |
| Lazy walk on 4-line | 0.940 | **444** |
| Absorbing 3-state | 0.517 | 46 |

The lazy walk takes 11× longer than $K_3$ to settle. Both are formally Scott-continuous-V / asymptotic-c — *same regime class*. But their convergence rates differ by an order of magnitude.

The discrete regime taxonomy is too coarse to see this. A finer invariant is the **spectral gap** $1 - \rho$, where $\rho$ is the second-largest eigenvalue magnitude (the [stochastic-stationary-as-settling theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/continuous-valued-settling/content/stochastic-settling/references/stochastic-stationary-as-settling.md) ties this exactly to closure rate).

## What a refinement would look like

Refine the asymptotic-c regime into a *graded* sub-regime indexed by spectral gap $\gamma \in (0, 1]$:

- $\gamma$ near 1: rapid mixing, "fast asymptotic-c."
- $\gamma$ near 0: slow mixing, "slow asymptotic-c."
- $\gamma \to 0$: degenerate, marginal between asymptotic-c and non-asymptotic-countable.

The spectral gap is a *closure-operator-level* invariant: it depends on the closure operator's eigenstructure, not just its qualitative regime class. So this isn't just "another continuous parameter" — it's the natural quantitative invariant of the closure operator's *rate*, parallel to closure ordinal $\kappa$ being the natural qualitative invariant.

## Concrete sub-questions

1. **Definition.** What's the value-category-agnostic analog of "spectral gap" for arbitrary $\mathcal{V}$-enriched closure operators? For finite-dimensional linear $T_\mathcal{V}$ it's the second eigenvalue magnitude; for general non-linear or higher-dimensional $T_\mathcal{V}$ it should be a *contraction rate* or *Lipschitz-style* invariant.

2. **Closure-rate as classifying invariant.** Does the closure rate refine the regime classification, or is it an independent invariant living *across* regime classes? Conjecture: spectral gap is a closure-operator invariant defined whenever closure is contractive in some metric, regardless of regime.

3. **Cohomological interpretation.** Does spectral gap interact with the firing-pattern cohomology? Hypothesis: in asymptotic-c, the firing skeleton is purely topological (cells fire at finite stages depending on graph reachability), and the spectral gap is *orthogonal* to this — independent of $H^1$. Empirically the lazy walk and $K_3$ have the same firing skeleton but different gaps.

4. **Mixing-time-as-physical-time.** Mixing time $T_\mathrm{mix} \approx \log(1/\epsilon)/(1-\rho)$ has a physical meaning: how long to reach within $\epsilon$ of stationary. In the corpus's framework, this becomes "how many closure stages are *practically* needed for asymptotic content." A two-tier ordinal-and-real-time structure.

## Why it matters for the program

The [continuous-state regime classification theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/continuous-state-regime-classification.md) is a *qualitative* taxonomy. For applications (Bayesian agents, Markov chains, heat flows, fuzzy reasoning), the *quantitative* convergence rate matters as much as the qualitative regime. The framework currently sees the qualitative side; quantitative refinement would let it speak to applications where mixing time is a primary observable.

Cleanest entry point: a benchmark suite computing spectral gaps on stochastic settlings of varying graph structure, plus a structural theorem identifying spectral gap with a corpus invariant (e.g., a contraction-rate of $T_\mathcal{V}$ on a $\mathcal{V}$-metric). The [continuous-valued settling object](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/continuous-valued-settling/continuous-valued-settling.md) already provides the value-category framework needed.

## Relation to existing structure

- [Continuous-state regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/continuous-state-regime-classification.md): gives the four-class qualitative taxonomy that this would refine.
- [Stochastic-stationary-as-settling](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/continuous-valued-settling/content/stochastic-settling/references/stochastic-stationary-as-settling.md): identifies $\rho$ as the closure rate via Perron-Frobenius.
- [Probabilistic belief-propagation benchmark](benchmark-probabilistic-belief-propagation.md): the empirical observation prompting the question.
