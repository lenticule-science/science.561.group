---
kind: question
status: open
explores: [value-agnostic-void-cone, lorentzian-causal-settling, lorentzian-apex-void-as-timelike-spacelike, void-cone-cohomology]
title: The void-cone apex as a dimension estimator
description: "The Lorentzian causal-set benchmark showed that for sprinklings of 1+1 Minkowski, the spacelike fraction (size of $V\\infty$ relative to total pair count) tracks the region's aspect ratio:"
---

# The void-cone apex as a dimension estimator

The [Lorentzian causal-set benchmark](benchmark-lorentzian-causal-set.md) showed that for sprinklings of 1+1 Minkowski, the spacelike fraction (size of $V_\infty$ relative to total pair count) tracks the region's aspect ratio:

| Region | Aspect $T : 2X$ | Spacelike fraction |
|---|---|---|
| Tall | $8 : 2$ | 0.217 |
| Square | $4 : 4$ | 0.517 |
| Wide | $2 : 8$ | 0.825 |

The wider the region (more spatial extent per unit of temporal extent), the more pairs are spacelike. This is exactly what Lorentzian geometry predicts — the spacelike fraction is the lightcone-volume / total-volume ratio.

In the corpus's framework, this means **the void-cone apex $|V_\infty|$ is a dimension-detecting invariant**. The size of $V_\infty$ scales with spatial volume relative to lightcone volume, capturing the spatial dimensionality of the underlying spacetime.

The causal-set physics literature has its own dimension estimators — most notably the *Myrheim-Meyer* estimator (counting pairs of nested intervals to extract dimension). Open: how does the void-cone-apex estimator relate?

## Concrete sub-questions

1. **Exact comparison.** For sprinkled Minkowski regions of varying dimensionality (1+1, 2+1, 3+1) and aspect ratios, do the void-cone-apex estimator and the Myrheim-Meyer estimator give the same answer in the continuum limit? Same up to an explicit conversion factor? Or genuinely different invariants?

2. **Non-Minkowski causal sets.** For sprinklings of curved spacetimes (de Sitter, Schwarzschild, FRW cosmologies), the Myrheim-Meyer estimator can be miscalibrated. Does the void-cone-apex estimator have the same blind spots, or does it extract *different* geometric content?

3. **Generalization to non-Lorentzian settlings.** Per [the value-agnostic void-cone theorem](value-agnostic-void-cone.md), $V_\infty$ is well-defined for any value-category. For stochastic settlings (Markov chains), $V_\infty$ counts unreachable transitions. Is there an analog "dimensionality" of a Markov chain's reachability structure that this measures?

4. **Higher-dimensional Minkowski.** Sprinkling $D + 1$-dimensional Minkowski with $N$ events: the spacelike fraction theoretically scales as a function of $D$ and aspect ratio. Does the void-apex estimator extract $D$ correctly? At what computational cost (polynomial in $N$ or worse)?

## What a benchmark would look like

A computational study comparing both estimators on:
- 1+1 Minkowski sprinklings (already done for void-apex; need Myrheim-Meyer).
- 2+1 and 3+1 Minkowski.
- de Sitter and Schwarzschild metrics.

For each: compute $|V_\infty|$ (void-apex), compute Myrheim-Meyer, compare. The question of whether they agree, disagree systematically, or extract different geometric content is concretely answerable.

## Relation to existing structure

- [Value-agnostic void-cone theorem](value-agnostic-void-cone.md): provides the value-category-independent void-cone definition that this estimator uses.
- [Lorentzian apex/void as timelike/spacelike](lorentzian-apex-void-as-timelike-spacelike.md): identifies the void apex as the spacelike content.
- [Lorentzian causal-set benchmark](benchmark-lorentzian-causal-set.md): the empirical observation.

A clean experimental benchmark would close the connection to causal-set physics literature concretely, identifying the corpus's framework as either equivalent to existing causal-set-physics tools or genuinely complementary.
