---
name: probabilistic-computation
description: The realizability topos RT(K₁^r) over a random-oracle extension of Kleene's first algebra. A sibling of Eff connected by a change-of-PCA geometric morphism. The theoretical home of randomized algorithms, average-case complexity, and probabilistic programming.
component-of: computing
title: probabilistic-computation
---

# Probabilistic Computation

$RT(\mathcal{K}_1^r)$, the realizability topos over a random-oracle extension of $\mathcal{K}_1$ (adding a halting-problem oracle or a random bit oracle). Connected to $\mathbf{Eff}$ by a change-of-PCA geometric morphism (an ordered applicative morphism $\mathcal{K}_1 \to \mathcal{K}_1^r$). A sibling of $\mathbf{Eff}$, not a subtopos: $\mathcal{K}_1^r$-computation can decide the halting problem with positive probability, which $\mathcal{K}_1$-computation cannot.

The theoretical home for randomized algorithms (BPP, RP, ZPP complexity classes), Monte Carlo methods, probabilistic programming languages, and Bayesian computation. The internal logic of $RT(\mathcal{K}_1^r)$ is intuitionistic but with additional probabilistic principles that fail in $\mathbf{Eff}$: "if a proposition holds with probability 1 under uniform oracle selection, it has a realizer" is an instance of such a principle.
