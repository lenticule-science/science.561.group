---
title: "Information-Theoretic Stability as Reward Function"
aliases:
  - "Stability as Reward Function"
date-created: 2025-10-11
type: paper
authors:
  - emsenn
keywords:
  - information-theory
  - information-geometry
  - stability
  - research
status: draft
defines:
  - information-theoretic-stability-reward
  - coupled-reward-decomposition-into-behavioral-and-informational-channels
  - two-channel-convergence-constraint
  - mutual-information-dominates-marginal-inequality
extends:
  - fisher-rao-metric
  - kullback-leibler-divergence
requires: asymmetric-informational-coupling-between-adapting-and-reference-system
acts-on: system-adapting-to-fixed-reference
produces:
  - two-channel-decomposition-of-stability-into-behavioral-and-informational
  - mutual-information-dominates-marginal-inequality
contrasts-with: stability-as-intrinsic-system-property
enables:
  - describing-stability-optimization-in-artificial-agents
  - stability-dynamics-in-cognitive-systems
  - information-curvature-conservation-law
  - describing-black-holes-as-informational-stability-optimizers
references:
  - id: amari2016
    type: document
    title: Information Geometry and Its Applications
    author:
      - literal: S. Amari
    container-title: Springer
    issued:
      - year: 2016
  - id: amari2021
    type: document
    title: Information Geometry and Its Role in Statistical Inference
    author:
      - literal: S. Amari
    container-title: Entropy
    issued:
      - year: 2021
  - id: cover2006
    type: document
    title: Elements of Information Theory
    author:
      - literal: T. M. Cover
      - literal: J. A. Thomas
    container-title: Wiley
    issued:
      - year: 2006
  - id: crooks1999
    type: document
    title: Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation
    author:
      - literal: G. E. Crooks
    container-title: Physical Review E
    issued:
      - year: 1999
  - id: csiszar2004
    type: document
    title: Information Theory and Statistics: A Tutorial
    author:
      - literal: I. Csiszár
      - literal: P. Shields
    container-title: Foundations and Trends in Communications and Information Theory
    issued:
      - year: 2004
  - id: jaynes1957
    type: document
    title: Information Theory and Statistical Mechanics
    author:
      - literal: E. T. Jaynes
    container-title: Physical Review
    issued:
      - year: 1957
  - id: shannon1948
    type: document
    title: A Mathematical Theory of Communication
    author:
      - literal: C. E. Shannon
    container-title: Bell System Technical Journal
    issued:
      - year: 1948
cites:
  - amari2016
  - amari2021
  - cover2006
  - crooks1999
  - csiszar2004
  - jaynes1957
  - shannon1948
---

## Abstract

Consider a system $A$ adapting to a fixed reference system $B$. We define the **stability reward** of $A$ as the rate of divergence minimization between successive states of $A$, and show that this quantity decomposes into two terms: the rate at which $A$'s marginal behavior converges to target, and the rate at which $A$'s mutual information with $B$ increases. Both terms are functions of the coupling between $A$ and $B$. The stability of $A$ is not an intrinsic property of $A$ — it is a reward function of $A$'s relationship to $B$.

When $A$ evolves by gradient descent on the joint divergence from equilibrium, the composite divergence decreases monotonically, and the two channels of convergence — behavioral and informational — must sum to that monotonic decrease at every instant. Neither can stall without the other compensating. Mutual information between $A$ and $B$ converges to the equilibrium value.

## 1. Introduction

Information theory measures uncertainty and its reduction in probabilistic terms. This paper asks a specific question: when a system $A$ adapts toward a fixed reference $B$, what governs the rate at which $A$ stabilizes?

The answer has a clean form. $A$'s stability — the rate at which its successive states become less divergent — decomposes into exactly two components: convergence of $A$'s marginal distribution toward target, and increase of mutual information between $A$ and $B$. Both are functions of the relationship between $A$ and $B$. $A$ has no stability independent of $B$; its stability reward *is* a reward function of the coupling.

This derivation uses the Fisher–Rao structure of probability manifolds (Amari 2016, 2021) and the chain rule for KL divergence (Csiszár & Shields 2004). It requires no assumptions regarding semantics or intentionality.

## 2. Setting

### 2.1 The Adapting System

Let $A$ have state distribution $p_A(x)$ over a finite alphabet $\mathcal{X}$, and let $B$ have a fixed distribution $p_B(y)$ over $\mathcal{Y}$. The joint distribution is $p_t(x,y) = p_t(x|y)\,p_B(y)$, where only $A$'s conditional response $p_t(x|y)$ changes over time.

The space of joint distributions, $\mathcal{P}(\mathcal{X} \times \mathcal{Y})$, carries the Fisher–Rao metric
$$
g_{ij}(p) = \partial_i \partial_j D(p||q)\big|_{q=p},
$$
where $D(p||q)$ denotes the Kullback–Leibler divergence (Amari 2016).

### 2.2 Target Equilibrium

Let $p^*(x,y) = p^*(x|y)\,p_B(y)$ be a target joint distribution sharing $B$'s marginal. The equilibrium mutual information is $I^* = I_{p^*}(A;B)$.

## 3. Stability Reward

### 3.1 Definition

Define the instantaneous **stability reward** of the composite system as
$$
R_s(t) = -\frac{1}{\delta t}\, D(p_{t+\delta}||p_t),
$$
expressed in nats per timestep. This is nonpositive, with $R_s = 0$ at distributional stationarity.

### 3.2 Decomposition

Because $B$ is fixed, $D(p_t(y)||p^*(y)) = 0$ for all $t$. The chain rule for KL divergence (Csiszár & Shields 2004) applied to the joint gives:
$$
D(p_t||p^*) = D(p_t(x)||p^*(x)) + I^* - I_t,
$$
where $I_t = I_{p_t}(A;B)$. The joint divergence has exactly **two nonnegative moving parts**: the marginal divergence of $A$, and the mutual information gap $I^* - I_t$.

**Proof.** The general chain rule gives $D(p||q) = D(p(x)||q(x)) + D(p(y)||q(y)) + I_q(X;Y) - I_p(X;Y)$. Since $p_t(y) = p^*(y) = p_B(y)$, the second term vanishes, yielding the stated identity. $\square$

### 3.3 Accounting Identity

Taking the time derivative of the decomposition:

$$
\partial_t D(p_t||p^*) = \partial_t D(p_t(x)||p^*(x)) - \partial_t I_t.
$$

Rearranging:

$$
\boxed{\partial_t I_t = \partial_t D(p_t(x)||p^*(x)) - \partial_t D(p_t||p^*).}
$$

This is the **accounting identity**: the rate of mutual information change equals the rate of marginal divergence change minus the rate of joint divergence change.

### 3.4 Interpretation

The stability reward of $A$ decomposes into two channels:

$$
\underbrace{-\partial_t D(p_t||p^*)}_{\text{composite convergence}} = \underbrace{-\partial_t D(p_t(x)||p^*(x))}_{\text{behavioral convergence}} + \underbrace{\partial_t I_t}_{\text{informational coupling}}.
$$

Both terms on the right describe aspects of $A$'s relationship to $B$. Behavioral convergence measures how $A$'s marginal approaches target. Informational coupling measures how responsive $A$ is becoming to $B$. Their sum — the composite convergence — is the stability reward of the coupled system, which is monotonically nonneg under gradient descent (Section 4).

$A$'s stability is not a property of $A$ alone. It is a reward function of $A$'s coupling to $B$.

## 4. Convergence

### 4.1 Theorem

Let $p_t$ evolve by Fisher–Rao gradient descent on $D(p_t||p^*)$. Then:

**(a) Monotone composite convergence.** $\partial_t D(p_t||p^*) = -\|\mathrm{grad}_g D\|_g^2 \le 0.$

**(b) Convergence of all components.** $D(p_t(x)||p^*(x)) \to 0$ and $I_t \to I^*$ as $t \to \infty$.

**(c) Two-channel constraint.** At every instant, behavioral convergence and MI improvement must sum to the (nonneg) composite convergence rate. Neither can stall without the other compensating.

**(d) MI dominates marginal.** $\partial_t I_t \ge \partial_t D(p_t(x)||p^*(x))$ at all times, with the gap equal to the composite convergence rate.

**Proof.** Part (a) is the standard property of gradient flow on a convex functional.

For (b): since $D(p_t||p^*) = D_x(t) + (I^* - I_t)$ and all terms are nonneg, $D(p_t||p^*) \to 0$ forces each to vanish.

Part (c) restates the accounting identity under the constraint $-\partial_t D(p_t||p^*) \ge 0$.

For (d): from the accounting identity, $\partial_t I_t - \partial_t D_x = -\partial_t D(p_t||p^*) \ge 0$. $\square$

### 4.2 What Part (d) Says

MI can never be doing worse than $A$'s marginal. If $A$'s marginal is converging, MI might dip, but by at most the same amount. If $A$'s marginal is getting worse, MI must be improving by at least as much. The worst case for MI relative to the marginal is $\partial_t I = \partial_t D_x$, which occurs only at equilibrium ($\partial_t D_{\text{joint}} = 0$).

## 5. Related Work and Positioning

The tools — KL divergence, Fisher–Rao metric, natural gradient descent — are standard information geometry (Amari 2016). The chain rule is textbook (Cover & Thomas 2006; Csiszár & Shields 2004). The connection between divergence minimization and entropy production is established in nonequilibrium thermodynamics (Crooks 1999; Jaynes 1957).

The contribution is the specific framing:

1. **Stability as coupling.** By fixing one system and watching the other adapt, the stability reward becomes a function of the relationship, not of either system in isolation. The definition of stability reward is the negative entropy production rate by another name, but framing it as a reward of coupling orients the analysis differently.
2. **Two-channel decomposition.** The asymmetric chain rule gives exactly two channels (behavioral + informational). This is tighter than the symmetric case, which has three components and allows more complex fluctuation.
3. **The MI-dominates-marginal inequality.** Part (d) of the theorem — that MI improvement is always at least as large as marginal improvement — is a structural constraint on the path of adaptation, not just on its endpoint.

## 6. Limitations

The framework assumes $B$ is fixed. When both systems adapt simultaneously, the decomposition has three moving parts and the MI-dominates-marginal inequality does not hold. The framework does not explain why $A$ would minimize divergence — that is an external constraint (physical, biological, or engineered). Bounding the magnitude of temporary MI dips in terms of system parameters remains open.

## 7. Conclusion

When a system adapts to a fixed reference, its stability reward is a function of the coupling between them. The joint divergence decomposes into marginal convergence and mutual information change — two channels that must sum to the monotonically nonneg composite convergence at every instant. MI improvement always matches or exceeds marginal improvement. The stability of one system is the reward function of its relationship to the other.

## References

- Amari, S. (2016). *Information Geometry and Its Applications*. Springer.
- Amari, S. (2021). "Information Geometry and Its Role in Statistical Inference." *Entropy*, 23(1), 110.
- Cover, T. M., & Thomas, J. A. (2006). *Elements of Information Theory* (2nd ed.). Wiley.
- Crooks, G. E. (1999). "Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation." *Physical Review E*, 60(3), 2721–2726.
- Csiszár, I., & Shields, P. (2004). "Information Theory and Statistics: A Tutorial." *Foundations and Trends in Communications and Information Theory*, 1(4), 417–528.
- Jaynes, E. T. (1957). "Information Theory and Statistical Mechanics." *Physical Review*, 106(4), 620–630.
- Shannon, C. E. (1948). "A Mathematical Theory of Communication." *Bell System Technical Journal*, 27, 379–423, 623–656.
