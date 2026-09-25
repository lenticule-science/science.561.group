---
title: "Information-Theoretic Stability as Reward Function"
type: "paper"
date-created: 2025-10-11
description: Consider a system $A$ adapting to a fixed reference system $B$.
---

Table of contents

- [Abstract](#abstract)

- [1. Introduction](#1-introduction)

- [2. Setting](#2-setting)

[2.1 The Adapting System](#21-the-adapting-system)

- [2.2 Target Equilibrium](#22-target-equilibrium)

- [3. Stability Reward](#3-stability-reward)

[3.1 Definition](#31-definition)

- [3.2 Decomposition](#32-decomposition)

- [3.3 Accounting Identity](#33-accounting-identity)

- [3.4 Interpretation](#34-interpretation)

- [4. Convergence](#4-convergence)

[4.1 Theorem](#41-theorem)

- [4.2 What Part (d) Says](#42-what-part-d-says)

- [5. Related Work and Positioning](#5-related-work-and-positioning)

- [6. Limitations](#6-limitations)

- [7. Conclusion](#7-conclusion)

- [References](#references)

## Abstract

Consider a system $A$ adapting to a fixed reference system $B$. We define the **stability reward** of $A$ as the rate of divergence minimization between successive states of $A$, and show that this quantity decomposes into two terms: the rate at which AA&rsquo;s marginal behavior converges to target, and the rate at which AA&rsquo;s mutual information with $B$ increases. Both terms are functions of the coupling between $A$ and $B$. The stability of $A$ is not an intrinsic property of $A$ — it is a reward function of AA&rsquo;s relationship to $B$.

When $A$ evolves by gradient descent on the joint divergence from equilibrium, the composite divergence decreases monotonically, and the two channels of convergence — behavioral and informational — must sum to that monotonic decrease at every instant. Neither can stall without the other compensating. Mutual information between $A$ and $B$ converges to the equilibrium value.

## 1. Introduction

Information theory measures uncertainty and its reduction in probabilistic terms. This paper asks a specific question: when a system $A$ adapts toward a fixed reference $B$, what governs the rate at which $A$ stabilizes?

The answer has a clean form. AA&rsquo;s stability — the rate at which its successive states become less divergent — decomposes into exactly two components: convergence of AA&rsquo;s marginal distribution toward target, and increase of mutual information between $A$ and $B$. Both are functions of the relationship between $A$ and $B$. $A$ has no stability independent of $B$; its stability reward *is* a reward function of the coupling.

This derivation uses the Fisher–Rao structure of probability manifolds (Amari 2016, 2021) and the chain rule for KL divergence (Csiszár & Shields 2004). It requires no assumptions regarding semantics or intentionality.

## 2. Setting

### 2.1 The Adapting System

Let $A$ have state distribution pA(x)p_A(x) over a finite alphabet $\mathcal{X}$, and let $B$ have a fixed distribution pB(y)p_B(y) over $\mathcal{Y}$. The joint distribution is pt(x,y)=pt(x∣y) pB(y)p_t(x,y) = p_t(x|y)\,p_B(y), where only AA&rsquo;s conditional response pt(x∣y)p_t(x|y) changes over time.

The space of joint distributions, $\mathcal{P}(\mathcal{X} \times \mathcal{Y})$, carries the Fisher–Rao metric

gij(p)=∂i∂jD(p∣∣q)∣q=p,
g_{ij}(p) = \partial_i \partial_j D(p||q)\big|_{q=p},

where D(p∣∣q)D(p||q) denotes the Kullback–Leibler divergence (Amari 2016).

### 2.2 Target Equilibrium

Let p∗(x,y)=p∗(x∣y) pB(y)p^*(x,y) = p^*(x|y)\,p_B(y) be a target joint distribution sharing BB&rsquo;s marginal. The equilibrium mutual information is I∗=Ip∗(A;B)I^* = I_{p^*}(A;B).

## 3. Stability Reward

### 3.1 Definition

Define the instantaneous **stability reward** of the composite system as

Rs(t)=−1δt D(pt+δ∣∣pt),
R_s(t) = -\frac{1}{\delta t}\, D(p_{t+\delta}||p_t),

expressed in nats per timestep. This is nonpositive, with Rs=0R_s = 0 at distributional stationarity.

### 3.2 Decomposition

Because $B$ is fixed, D(pt(y)∣∣p∗(y))=0D(p_t(y)||p^*(y)) = 0 for all $t$. The chain rule for KL divergence (Csiszár & Shields 2004) applied to the joint gives:

D(pt∣∣p∗)=D(pt(x)∣∣p∗(x))+I∗−It,
D(p_t||p^*) = D(p_t(x)||p^*(x)) + I^* - I_t,

where It=Ipt(A;B)I_t = I_{p_t}(A;B). The joint divergence has exactly **two nonnegative moving parts**: the marginal divergence of $A$, and the mutual information gap I∗−ItI^* - I_t.

**Proof.** The general chain rule gives D(p∣∣q)=D(p(x)∣∣q(x))+D(p(y)∣∣q(y))+Iq(X;Y)−Ip(X;Y)D(p||q) = D(p(x)||q(x)) + D(p(y)||q(y)) + I_q(X;Y) - I_p(X;Y). Since pt(y)=p∗(y)=pB(y)p_t(y) = p^*(y) = p_B(y), the second term vanishes, yielding the stated identity. $\square$

### 3.3 Accounting Identity

Taking the time derivative of the decomposition:

∂tD(pt∣∣p∗)=∂tD(pt(x)∣∣p∗(x))−∂tIt.
\partial_t D(p_t||p^*) = \partial_t D(p_t(x)||p^*(x)) - \partial_t I_t.

Rearranging:

∂tIt=∂tD(pt(x)∣∣p∗(x))−∂tD(pt∣∣p∗).
\boxed{\partial_t I_t = \partial_t D(p_t(x)||p^*(x)) - \partial_t D(p_t||p^*).}

This is the **accounting identity**: the rate of mutual information change equals the rate of marginal divergence change minus the rate of joint divergence change.

### 3.4 Interpretation

The stability reward of $A$ decomposes into two channels:

−∂tD(pt∣∣p∗)⏟composite convergence=−∂tD(pt(x)∣∣p∗(x))⏟behavioral convergence+∂tIt⏟informational coupling.
\underbrace{-\partial_t D(p_t||p^*)}_{\text{composite convergence}} = \underbrace{-\partial_t D(p_t(x)||p^*(x))}_{\text{behavioral convergence}} + \underbrace{\partial_t I_t}_{\text{informational coupling}}.

Both terms on the right describe aspects of AA&rsquo;s relationship to $B$. Behavioral convergence measures how AA&rsquo;s marginal approaches target. Informational coupling measures how responsive $A$ is becoming to $B$. Their sum — the composite convergence — is the stability reward of the coupled system, which is monotonically nonneg under gradient descent (Section 4).

AA&rsquo;s stability is not a property of $A$ alone. It is a reward function of AA&rsquo;s coupling to $B$.

## 4. Convergence

### 4.1 Theorem

Let ptp_t evolve by Fisher–Rao gradient descent on D(pt∣∣p∗)D(p_t||p^*). Then:

**(a) Monotone composite convergence.** ∂tD(pt∣∣p∗)=−∥gradgD∥g2≤0.\partial_t D(p_t||p^*) = -\|\mathrm{grad}_g D\|_g^2 \le 0.

**(b) Convergence of all components.** D(pt(x)∣∣p∗(x))→0D(p_t(x)||p^*(x)) \to 0 and It→I∗I_t \to I^* as $t \to \infty$.

**(c) Two-channel constraint.** At every instant, behavioral convergence and MI improvement must sum to the (nonneg) composite convergence rate. Neither can stall without the other compensating.

**(d) MI dominates marginal.** ∂tIt≥∂tD(pt(x)∣∣p∗(x))\partial_t I_t \ge \partial_t D(p_t(x)||p^*(x)) at all times, with the gap equal to the composite convergence rate.

**Proof.** Part (a) is the standard property of gradient flow on a convex functional.

For (b): since D(pt∣∣p∗)=Dx(t)+(I∗−It)D(p_t||p^*) = D_x(t) + (I^* - I_t) and all terms are nonneg, D(pt∣∣p∗)→0D(p_t||p^*) \to 0 forces each to vanish.

Part (c) restates the accounting identity under the constraint −∂tD(pt∣∣p∗)≥0-\partial_t D(p_t||p^*) \ge 0.

For (d): from the accounting identity, ∂tIt−∂tDx=−∂tD(pt∣∣p∗)≥0\partial_t I_t - \partial_t D_x = -\partial_t D(p_t||p^*) \ge 0. $\square$

### 4.2 What Part (d) Says

MI can never be doing worse than AA&rsquo;s marginal. If AA&rsquo;s marginal is converging, MI might dip, but by at most the same amount. If AA&rsquo;s marginal is getting worse, MI must be improving by at least as much. The worst case for MI relative to the marginal is $\partial_t I = \partial_t D_x$, which occurs only at equilibrium ($\partial_t D_{\text{joint}} = 0$).

## 5. Related Work and Positioning

The tools — KL divergence, Fisher–Rao metric, natural gradient descent — are standard information geometry (Amari 2016). The chain rule is textbook (Cover & Thomas 2006; Csiszár & Shields 2004). The connection between divergence minimization and entropy production is established in nonequilibrium thermodynamics (Crooks 1999; Jaynes 1957).

The contribution is the specific framing:

- **Stability as coupling.** By fixing one system and watching the other adapt, the stability reward becomes a function of the relationship, not of either system in isolation. The definition of stability reward is the negative entropy production rate by another name, but framing it as a reward of coupling orients the analysis differently.

- **Two-channel decomposition.** The asymmetric chain rule gives exactly two channels (behavioral + informational). This is tighter than the symmetric case, which has three components and allows more complex fluctuation.

- **The MI-dominates-marginal inequality.** Part (d) of the theorem — that MI improvement is always at least as large as marginal improvement — is a structural constraint on the path of adaptation, not just on its endpoint.

## 6. Limitations

The framework assumes $B$ is fixed. When both systems adapt simultaneously, the decomposition has three moving parts and the MI-dominates-marginal inequality does not hold. The framework does not explain why $A$ would minimize divergence — that is an external constraint (physical, biological, or engineered). Bounding the magnitude of temporary MI dips in terms of system parameters remains open.

## 7. Conclusion

When a system adapts to a fixed reference, its stability reward is a function of the coupling between them. The joint divergence decomposes into marginal convergence and mutual information change — two channels that must sum to the monotonically nonneg composite convergence at every instant. MI improvement always matches or exceeds marginal improvement. The stability of one system is the reward function of its relationship to the other.

## References

- Amari, S. (2016). *Information Geometry and Its Applications*. Springer.

- Amari, S. (2021). &ldquo;Information Geometry and Its Role in Statistical Inference.&rdquo; *Entropy*, 23(1), 110.

- Cover, T. M., & Thomas, J. A. (2006). *Elements of Information Theory* (2nd ed.). Wiley.

- Crooks, G. E. (1999). &ldquo;Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation.&rdquo; *Physical Review E*, 60(3), 2721–2726.

- Csiszár, I., & Shields, P. (2004). &ldquo;Information Theory and Statistics: A Tutorial.&rdquo; *Foundations and Trends in Communications and Information Theory*, 1(4), 417–528.

- Jaynes, E. T. (1957). &ldquo;Information Theory and Statistical Mechanics.&rdquo; *Physical Review*, 106(4), 620–630.

- Shannon, C. E. (1948). &ldquo;A Mathematical Theory of Communication.&rdquo; *Bell System Technical Journal*, 27, 379–423, 623–656.

## References

[amari2016]
S. Amari.
(2016).
Information Geometry and Its Applications.
*Springer*.

[amari2021]
S. Amari.
(2021).
Information Geometry and Its Role in Statistical Inference.
*Entropy*.

[cover2006]
T. M. Cover, J. A. Thomas.
(2006).
Elements of Information Theory.
*Wiley*.

[crooks1999]
G. E. Crooks.
(1999).
Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation.
*Physical Review E*.

[csiszar2004]
I. Csiszár, P. Shields.
(2004).
Information Theory and Statistics: A Tutorial.
*Foundations and Trends in Communications and Information Theory*.

[jaynes1957]
E. T. Jaynes.
(1957).
Information Theory and Statistical Mechanics.
*Physical Review*.

[shannon1948]
C. E. Shannon.
(1948).
A Mathematical Theory of Communication.
*Bell System Technical Journal*.
