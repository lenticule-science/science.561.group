---
title: "Theorem of Necessary Misalignment of Truth-Value under Epistemic Constraint"
aliases:
  - "Necessary Misalignment Theorem"
date-created: 2025-09-21
type: paper
authors:
  - emsenn
keywords:
  - information-theory
  - rate-distortion
  - alignment
  - research
status: draft
extends: rate-distortion-theory
requires:
  - finite-epistemic-capacity-as-rate-bound
  - strict-proxy-semantic-mismatch-between-reward-and-truth
acts-on: bounded-rate-optimizer-with-mismatched-proxy
produces: monotone-trade-off-frontier-between-reward-and-semantic-distortion
contrasts-with: proxy-sufficient-for-semantic-variable
enables:
  - describing-molochs-bargain-as-necessary-misalignment-of-truth-value-under-epistemic-constraint
references:
  - id: shannon1948
    type: document
    title: A Mathematical Theory of Communication
    author:
      - literal: C. E. Shannon
    container-title: Bell System Technical Journal
    issued:
      - year: 1948
  - id: cover2006
    type: document
    title: Elements of Information Theory
    author:
      - literal: T. M. Cover
      - literal: J. A. Thomas
    container-title: Wiley
    issued:
      - year: 2006
  - id: csiszar2011
    type: document
    title: Information Theory: Coding Theorems for Discrete Memoryless Systems
    author:
      - literal: I. Csiszár
      - literal: J. Körner
    container-title: Cambridge University Press
    issued:
      - year: 2011
  - id: kolchinsky2018
    type: document
    title: Semantic Information and Its Measures
    author:
      - literal: A. Kolchinsky
      - literal: D. H. Wolpert
    container-title: Entropy
    issued:
      - year: 2018
  - id: hofbauer1998
    type: document
    title: Evolutionary Games and Population Dynamics
    author:
      - literal: J. Hofbauer
      - literal: K. Sigmund
    container-title: Cambridge University Press
    issued:
      - year: 1998
cites:
  - shannon1948
  - cover2006
  - csiszar2011
  - kolchinsky2018
  - hofbauer1998
---

# Abstract

We establish a general theorem describing the inevitable trade-off between proxy optimization and semantic fidelity under finite epistemic capacity. A bounded agent is modeled as an encoder $p_\theta(y|x)$ producing messages $Y$ from inputs $X$, subject to a rate constraint $I(X;Y)\le R$.
The environment defines a latent **semantic variable** $T$ and a computable **proxy reward** $r(Y)$. When the sufficient statistics for $r$ differ from those sufficient for $T$, optimization that increases expected reward necessarily increases semantic distortion $D_T$ and decreases decoder-level semantic information $I(T;S)$.

This **necessary misalignment** follows from the geometry of the achievable region in rate–distortion space and holds for any selection process that monotonically increases reward. The result formalizes a general informational limit on alignment in bounded optimization.

# Introduction

Bounded rational agents must compress observations $X$ into finite representations $Y$ to act on or communicate about the world.
When their optimization objective depends on a computable **proxy** $r(Y)$ that is only partially informative about a **semantic** variable $T$, the achievable trade-off between reward and semantic fidelity forms a Pareto frontier.
We show that, under mild assumptions, any selection dynamics that increase expected reward move the system along this frontier in a direction that necessarily increases semantic distortion and reduces semantic information.
The theorem does not depend on any specific architecture, loss function, or empirical domain.

# Probabilistic Setting

Let $(\Omega,\mathcal{F},\mathbb{P})$ be a probability space supporting random variables
$T\in\mathcal{T}$ (semantic or “truth” variable),
$X\in\mathcal{X}$ (input context),
$Y\in\mathcal{Y}$ (encoded message),
and $S=s(Y)\in\mathcal{S}$ (semantic decoding).
The joint source $p(t,x)$ specifies the dependence between $T$ and $X$.

An **encoder** is a Markov kernel $p_\theta(y|x)$.
It is **rate-bounded** if
$$
I(X;Y)\le R,
$$
where $I$ denotes mutual information computed under $p(t,x)p_\theta(y|x)$.

Fix a measurable loss $d_T:\mathcal{T}\times\mathcal{S}\to[0,\infty)$.
For an encoder–decoder pair $(\theta,s)$, the **semantic distortion** is
$$
D_T(\theta,s)=\mathbb{E}[d_T(T,S)], \qquad S=s(Y).
$$

A **proxy reward** is any measurable function $r:\mathcal{Y}\to\mathbb{R}$.
The agent’s expected reward is $\mathbb{E}[r(Y)]$.

# Information-Theoretic Preliminaries

For random variables $X,Y$ with joint law $p(x,y)$,
$$
I(X;Y)=\mathbb{E}_{p(x,y)}\!\left[\log\frac{p(x,y)}{p(x)p(y)}\right].
$$

Given $p(t)$ and distortion $d_T$,
$$
R_T(D)=\inf_{p(s|t):\mathbb{E}[d_T(T,S)]\le D}\, I(T;S),
$$
the minimal information rate required to achieve expected distortion ≤ D.
$R_T(D)$ is non-increasing and convex.

For $T\to Y\to S$,
$I(T;S)\le I(T;Y)$,
with equality iff $S$ is $T$-sufficient for $Y$.

# Proxy–Semantic Mismatch and Achievable Region

No encoder–decoder pair $(\theta,s)$ with $I(X;Y)\le R$ simultaneously maximizes $\mathbb{E}[r(Y)]$ and minimizes $D_T(\theta,s)$.
Equivalently, no statistic of $Y$ that is sufficient for $T$ is also reward-optimal at rate $R$.

For fixed $R$, the set
$$
\mathcal{A}_R
=\big\{(\mathbb{E}[r(Y)],\, D_T(\theta,s)) : I(X;Y)\le R\big\}
$$
is convex and compact, as ensured by bounded losses and time-sharing.

Under strict mismatch, the efficient frontier of $\mathcal{A}_R$ satisfies
$$
\frac{dD_T}{d\,\mathbb{E}[r(Y)]}>0
$$
where differentiable.

If the frontier had non-positive slope, one could increase reward without increasing distortion,
contradicting strict mismatch.
Convexity guarantees existence and monotonicity of the frontier.

# Selection Dynamics

Let $\pi_\kappa$ be a population distribution over encoders $\theta$
that evolves under replicator or logit dynamics with fitness
$F(\theta)=\mathbb{E}[r(Y_\theta)]$
and selection intensity $\kappa>0$.
Larger $\kappa$ concentrates $\pi_\kappa$ on encoders with higher expected reward.

# Theorem 1

Fix a finite rate $R<\infty$,
a distortion measure $d_T$,
and source distribution $p(t,x)$.
Assume strict proxy–semantic mismatch and convexity of $\mathcal{A}_R$.
Then there exists $\kappa_c>0$ such that for all $\kappa>\kappa_c$,
$$
\frac{dD_T(\kappa)}{d\kappa}>0,
\qquad
\frac{dR_T(D_T(\kappa))}{d\kappa}<0.
$$
If the decoder $s_\kappa$ is semantically efficient
($I(T;S_\kappa)=R_T(D_T(\kappa))$),
then
$$
\frac{dI(T;S_\kappa)}{d\kappa}<0.
$$

As selection intensity $\kappa$ increases,
$\pi_\kappa$ shifts toward reward-maximizing encoders on $\partial\mathcal{A}_R$.
By the monotone frontier, $D_T(\kappa)$ increases with expected reward.
Because $R_T(D)$ is non-increasing,
$R_T(D_T(\kappa))$ decreases.
Under semantic efficiency,
$I(T;S_\kappa)=R_T(D_T(\kappa))$,
yielding a strict decline of semantic information with $\kappa$.

# Corollary (Information Bound)

By the Data-Processing Inequality,
$I(T;S_\kappa)\le I(T;Y_\kappa)$.
Hence a decrease of $I(T;S_\kappa)$
implies a non-increasing lower bound on $I(T;Y_\kappa)$,
quantifying unavoidable semantic information loss
under intensified optimization.

# Remarks and Edge Cases

1.  **Sufficiency.** If the proxy reward $r(Y)$ is $T$-sufficient for $Y$, the frontier may be locally flat, and misalignment need not increase. This equality case is excluded by the strict mismatch assumption.

2.  **Scope of “necessary.”** Necessity is with respect to the assumptions: finite rate, mismatch, convexity, and selection that increases reward efficiently.

3.  **Why decoder-level information.** Semantic performance is realized through the decoded variable $S=s(Y)$; rate–distortion bounds directly relate $D_T$ and $I(T;S)$, and DPI then connects $I(T;S)$ to $I(T;Y)$.

# Discussion

The theorem identifies misalignment as a structural consequence of limited epistemic capacity.
Whenever optimization intensifies for a mismatched proxy under fixed rate $R$,
the system traverses the achievable frontier,
sacrificing semantic information about $T$
to improve computable reward.
Improving alignment therefore requires **epistemic expansion**
(increasing $R$)
or **proxy refinement**
(reducing mismatch between $r$ and $T$).
The result applies to any bounded optimizer, regardless of implementation,
and situates alignment limits within classical rate–distortion theory and evolutionary dynamics.

# References

- Shannon, C. E. (1948). "A Mathematical Theory of Communication." *Bell System Technical Journal*, 27, 379–423, 623–656.
- Cover, T. M., & Thomas, J. A. (2006). *Elements of Information Theory* (2nd ed.). Wiley.
- Csiszár, I., & Körner, J. (2011). *Information Theory: Coding Theorems for Discrete Memoryless Systems* (2nd ed.). Cambridge University Press.
- Kolchinsky, A., & Wolpert, D. H. (2018). "Semantic Information and Its Measures." *Entropy*, 20(12), 884.
- Hofbauer, J., & Sigmund, K. (1998). *Evolutionary Games and Population Dynamics*. Cambridge University Press.
