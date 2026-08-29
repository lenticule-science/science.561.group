---
title: "Stability Dynamics in Cognitive Systems"
aliases:
  - "Stability Dynamics in Cognitive Systems"
date-created: 2025-10-11
type: paper
authors:
  - emsenn
keywords:
  - information-geometry
  - free-energy-principle
  - predictive-processing
  - cognition
  - research
status: draft
defines:
  - equivalence-of-stability-reward-and-free-energy-descent
  - affect-as-temporal-curvature-of-stability-reward
  - hierarchical-stability-as-precision-weighted-sum
extends:
  - information-theoretic-stability-as-reward-function
  - free-energy-principle-as-unified-brain-theory
requires:
  - predictive-processing-generative-model
  - variational-free-energy-bound
  - fisher-rao-metric
acts-on: cognitive-system-adapting-to-sensory-environment
produces:
  - mathematical-equivalence-of-stability-reward-and-free-energy-descent
  - affect-as-second-derivative-of-environmental-coupling
analogous-to: describing-stability-optimization-in-artificial-agents
contrasts-with: stability-as-intrinsic-cognitive-property
references:
  amari2016:
    authors: ["S. Amari"]
    title: "Information Geometry and Its Applications"
    publication: "Springer"
    year: 2016
  clark2013:
    authors: ["A. Clark"]
    title: "Whatever Next? Predictive Brains, Situated Agents, and the Future of Cognitive Science"
    publication: "Behavioral and Brain Sciences"
    year: 2013
  crooks1999:
    authors: ["G. E. Crooks"]
    title: "Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation"
    publication: "Physical Review E"
    year: 1999
  dayan2001:
    authors: ["P. Dayan", "L. F. Abbott"]
    title: "Theoretical Neuroscience"
    publication: "MIT Press"
    year: 2001
  feldman2010:
    authors: ["H. Feldman", "K. J. Friston"]
    title: "Attention, Uncertainty, and Free-Energy"
    publication: "Frontiers in Human Neuroscience"
    year: 2010
  friston2008:
    authors: ["K. Friston"]
    title: "Hierarchical Models in the Brain"
    publication: "PLoS Computational Biology"
    year: 2008
  friston2010:
    authors: ["K. Friston"]
    title: "The Free-Energy Principle: A Unified Brain Theory?"
    publication: "Nature Reviews Neuroscience"
    year: 2010
  friston2012:
    authors: ["K. Friston", "P. Ao"]
    title: "Free-Energy, Value, and Attractor Dynamics in the Brain"
    publication: "Physical Review E"
    year: 2012
  friston2017:
    authors: ["K. Friston"]
    title: "Precision Psychiatry: Free-Energy and the Bayesian Brain"
    publication: "Comprehensive Psychiatry"
    year: 2017
  hohwy2013:
    authors: ["J. Hohwy"]
    title: "The Predictive Mind"
    publication: "Oxford University Press"
    year: 2013
  jaynes1957:
    authors: ["E. T. Jaynes"]
    title: "Information Theory and Statistical Mechanics"
    publication: "Physical Review"
    year: 1957
  rao1999:
    authors: ["R. P. N. Rao", "D. H. Ballard"]
    title: "Predictive Coding in the Visual Cortex"
    publication: "Nature Neuroscience"
    year: 1999
cites:
  - amari2016
  - clark2013
  - crooks1999
  - dayan2001
  - feldman2010
  - friston2008
  - friston2010
  - friston2012
  - friston2017
  - hohwy2013
  - jaynes1957
  - rao1999
  - "Information-Theoretic Stability as Reward Function"
---

# Abstract

A cognitive system adapts to its sensory environment. This is the asymmetric stability setting: the environment ($B$) is fixed (or slowly changing), and the cognitive system ($A$) adapts to it. The system's stability reward — the rate of divergence minimization between successive belief states — is a function of its coupling to the environment, not an intrinsic property.

We show that this stability reward corresponds exactly to the negative time derivative of variational free energy in predictive-processing models (Friston 2010). The two-channel decomposition of *Information-Theoretic Stability as Reward Function* maps onto predictive processing: behavioral convergence is the reduction of prediction error, and informational coupling is the increase of mutual information between internal model and environment. The cognitive system's stability is its grip on the world.

# 1. Introduction

Predictive-processing theory describes perception and action as dual aspects of Bayesian inference (Rao & Ballard 1999; Friston 2010). A cognitive system maintains an internal generative model of observations and latent causes; through recursive updating, it seeks to minimize surprise or free energy. The system adapts; the sensory environment (at the timescale of inference) does not.

This is the asymmetric stability setting of *Information-Theoretic Stability as Reward Function*. The cognitive system is $A$. The sensory environment is $B$. The system's stability reward is a function of how well it couples to $B$ — how well its internal states track the environment's structure.

# 2. Background

## 2.1 Cognitive State Space

Let the cognitive state at time $t$ be a distribution over latent causes,
$$
q_t(s) = p(s_t | o_{1:t}),
$$
where $o_{1:t}$ denotes all observations up to $t$. The generative model specifies likelihood $p(o_t|s_t)$ and prior dynamics $p(s_t|s_{t-1})$. The manifold $\mathcal{Q} = \{q_t(s)\}$ carries the Fisher–Rao metric (Amari 2016).

## 2.2 Variational Free Energy

Following Friston (2010):
$$
F(q_t) = D_{\mathrm{KL}}(q_t(s)\,||\,p(s_t|o_t)) - \ln p(o_t).
$$
Minimizing $F$ reduces the divergence between the system's internal state and the true posterior — it is the mechanism by which $A$ adapts to $B$.

## 2.3 Stability Reward

The stability reward of the cognitive system is
$$
R_s(t) = -\frac{1}{\delta t}\, D_{\mathrm{KL}}(q_{t+\delta}||q_t).
$$
This measures how fast successive belief states are converging. It is not a property of the cognitive system alone — it depends on the structure of the sensory input $B$ that the system is adapting to.

# 3. Stability Reward Equals Free-Energy Descent

## 3.1 Equivalence

Under natural gradient descent on free energy,
$$
\dot q_t = -\mathrm{grad}_g\, F(q_t),
$$
the free energy decreases monotonically:
$$
\partial_t F = -\|\mathrm{grad}_g F\|^2_g \le 0.
$$
Comparing with the stability reward,
$$
R_s(t) \approx \langle \dot q_t, \nabla_q \ln q_t \rangle_g,
$$
shows that maximizing stability reward is equivalent to minimizing free energy. The cognitive system's stability IS its free-energy descent.

## 3.2 Two-Channel Reading

In the asymmetric framing, free-energy minimization decomposes into two channels:
- **Behavioral convergence**: reduction of prediction error ($A$'s marginal approaching target).
- **Informational coupling**: increase of mutual information between $A$'s internal model and $B$'s structure.

Prediction error reduction is the cognitive system's behavior becoming more appropriate. MI increase is the system's internal model becoming a better map of the environment. Free-energy descent drives both simultaneously, and the accounting identity holds: whatever free-energy reduction isn't going to prediction error reduction must be going to model improvement.

# 4. Affect as Stability Curvature

Define **affect** as the time derivative of stability reward:
$$
A(t) = \partial_t R_s(t).
$$
Positive $A(t)$ indicates acceleration toward stability — the system is getting better at getting better. Negative $A(t)$ indicates deceleration — uncertainty is amplifying.

In predictive coding, precision $\pi_t = (\mathrm{Var}[\epsilon_t])^{-1}$ modulates update rate (Feldman & Friston 2010):
$$
\dot q_t = -\pi_t\, \mathrm{grad}_g F(q_t),
$$
so $A(t) \propto \partial_t \pi_t$. Affective change tracks the system's changing confidence in its coupling to the environment.

# 5. Hierarchical Stability

Cognitive systems are hierarchical: higher levels encode slower, more abstract causes; lower levels encode faster, sensory features (Friston 2008; Clark 2013). Each level $l$ has its own stability reward:
$$
R_s^{(l)}(t) = -\frac{1}{\delta t}\, D_{\mathrm{KL}}(q_{t+\delta}^{(l)}||q_t^{(l)}).
$$
Total stability is the weighted sum $R_s^{\mathrm{total}} = \sum_l w_l\, R_s^{(l)}$, with weights $w_l$ corresponding to precision expectations. **Attention** is the adaptive modulation of $w_l$ — allocating resources to levels where the coupling to the environment is changing fastest (Dayan & Abbott 2001).

# 6. Discussion

1. **Cognitive stability is environmental coupling.** The cognitive system has no intrinsic stability. Its stability reward is a function of its relationship to the sensory environment. A brain in a jar with no input has $R_s = 0$ — perfect stationarity, zero coupling.

2. **Disorders as coupling failures.** Excessive rigidity (over-stabilization) means the system stops adapting to new environmental structure. Volatility (under-stabilization) means the system can't maintain coupling. Both are failures of the stability-environment relationship, consistent with neurocomputational accounts of schizophrenia and anxiety (Hohwy 2013; Friston 2017).

3. **Affect tracks coupling dynamics.** Pleasure and displeasure mark acceleration or deceleration of environmental coupling — the felt quality of getting better or worse at tracking the world.

# 7. Conclusion

A cognitive system's stability reward is its rate of coupling to the sensory environment. This is mathematically identical to free-energy descent. The two-channel decomposition separates prediction error reduction from model improvement. Affect tracks the second derivative of coupling. The cognitive system is not a thing that has stability — it is a process of stabilizing to its environment.

# References

- Amari, S. (2016). *Information Geometry and Its Applications*. Springer.
- Clark, A. (2013). "Whatever Next? Predictive Brains, Situated Agents, and the Future of Cognitive Science." *Behavioral and Brain Sciences*, 36(3), 181–204.
- Crooks, G. E. (1999). "Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation." *Physical Review E*, 60(3), 2721–2726.
- Dayan, P., & Abbott, L. F. (2001). *Theoretical Neuroscience*. MIT Press.
- Feldman, H., & Friston, K. J. (2010). "Attention, Uncertainty, and Free-Energy." *Frontiers in Human Neuroscience*, 4, 215.
- Friston, K. (2008). "Hierarchical Models in the Brain." *PLoS Computational Biology*, 4(11), e1000211.
- Friston, K. (2010). "The Free-Energy Principle: A Unified Brain Theory?" *Nature Reviews Neuroscience*, 11(2), 127–138.
- Friston, K., & Ao, P. (2012). "Free-Energy, Value, and Attractor Dynamics in the Brain." *Physical Review E*, 85(1), 011907.
- Friston, K. (2017). "Precision Psychiatry: Free-Energy and the Bayesian Brain." *Comprehensive Psychiatry*, 79, 5–16.
- Hohwy, J. (2013). *The Predictive Mind*. Oxford University Press.
- Jaynes, E. T. (1957). "Information Theory and Statistical Mechanics." *Physical Review*, 106(4), 620–630.
- Rao, R. P. N., & Ballard, D. H. (1999). "Predictive Coding in the Visual Cortex." *Nature Neuroscience*, 2(1), 79–87.
