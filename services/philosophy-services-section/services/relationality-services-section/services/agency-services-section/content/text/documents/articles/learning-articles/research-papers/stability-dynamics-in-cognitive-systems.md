---
title: "Stability Dynamics in Cognitive Systems"
type: "paper"
date-created: 2025-10-11
description: A cognitive system adapts to its sensory environment.
---

Table of contents

- [2.1 Cognitive State Space](#21-cognitive-state-space)

- [2.2 Variational Free Energy](#22-variational-free-energy)

- [2.3 Stability Reward](#23-stability-reward)

- [3.1 Equivalence](#31-equivalence)

- [3.2 Two-Channel Reading](#32-two-channel-reading)

# Abstract

A cognitive system adapts to its sensory environment. This is the asymmetric stability setting: the environment (BB) is fixed (or slowly changing), and the cognitive system (AA) adapts to it. The system&rsquo;s stability reward — the rate of divergence minimization between successive belief states — is a function of its coupling to the environment, not an intrinsic property.

We show that this stability reward corresponds exactly to the negative time derivative of variational free energy in predictive-processing models (Friston 2010). The two-channel decomposition of *Information-Theoretic Stability as Reward Function* maps onto predictive processing: behavioral convergence is the reduction of prediction error, and informational coupling is the increase of mutual information between internal model and environment. The cognitive system&rsquo;s stability is its grip on the world.

# 1. Introduction

Predictive-processing theory describes perception and action as dual aspects of Bayesian inference (Rao & Ballard 1999; Friston 2010). A cognitive system maintains an internal generative model of observations and latent causes; through recursive updating, it seeks to minimize surprise or free energy. The system adapts; the sensory environment (at the timescale of inference) does not.

This is the asymmetric stability setting of *Information-Theoretic Stability as Reward Function*. The cognitive system is AA. The sensory environment is BB. The system&rsquo;s stability reward is a function of how well it couples to BB — how well its internal states track the environment&rsquo;s structure.

# 2. Background

## 2.1 Cognitive State Space

Let the cognitive state at time tt be a distribution over latent causes,

qt(s)=p(st∣o1:t),
q_t(s) = p(s_t | o_{1:t}),

where o1:to_{1:t} denotes all observations up to tt. The generative model specifies likelihood p(ot∣st)p(o_t|s_t) and prior dynamics p(st∣st−1)p(s_t|s_{t-1}). The manifold Q={qt(s)}\mathcal{Q} = \{q_t(s)\} carries the Fisher–Rao metric (Amari 2016).

## 2.2 Variational Free Energy

Following Friston (2010):

F(qt)=DKL(qt(s) ∣∣ p(st∣ot))−ln⁡p(ot).
F(q_t) = D_{\mathrm{KL}}(q_t(s)\,||\,p(s_t|o_t)) - \ln p(o_t).

Minimizing FF reduces the divergence between the system&rsquo;s internal state and the true posterior — it is the mechanism by which AA adapts to BB.

## 2.3 Stability Reward

The stability reward of the cognitive system is

Rs(t)=−1δt DKL(qt+δ∣∣qt).
R_s(t) = -\frac{1}{\delta t}\, D_{\mathrm{KL}}(q_{t+\delta}||q_t).

This measures how fast successive belief states are converging. It is not a property of the cognitive system alone — it depends on the structure of the sensory input BB that the system is adapting to.

# 3. Stability Reward Equals Free-Energy Descent

## 3.1 Equivalence

Under natural gradient descent on free energy,

q˙t=−gradg F(qt),
\dot q_t = -\mathrm{grad}_g\, F(q_t),

the free energy decreases monotonically:

∂tF=−∥gradgF∥g2≤0.
\partial_t F = -\|\mathrm{grad}_g F\|^2_g \le 0.

Comparing with the stability reward,

Rs(t)≈⟨q˙t,∇qln⁡qt⟩g,
R_s(t) \approx \langle \dot q_t, \nabla_q \ln q_t \rangle_g,

shows that maximizing stability reward is equivalent to minimizing free energy. The cognitive system&rsquo;s stability IS its free-energy descent.

## 3.2 Two-Channel Reading

In the asymmetric framing, free-energy minimization decomposes into two channels:

- **Behavioral convergence**: reduction of prediction error (AA&rsquo;s marginal approaching target).

- **Informational coupling**: increase of mutual information between AA&rsquo;s internal model and BB&rsquo;s structure.

Prediction error reduction is the cognitive system&rsquo;s behavior becoming more appropriate. MI increase is the system&rsquo;s internal model becoming a better map of the environment. Free-energy descent drives both simultaneously, and the accounting identity holds: whatever free-energy reduction isn&rsquo;t going to prediction error reduction must be going to model improvement.

# 4. Affect as Stability Curvature

Define **affect** as the time derivative of stability reward:

A(t)=∂tRs(t).
A(t) = \partial_t R_s(t).

Positive A(t)A(t) indicates acceleration toward stability — the system is getting better at getting better. Negative A(t)A(t) indicates deceleration — uncertainty is amplifying.

In predictive coding, precision πt=(Var[ϵt])−1\pi_t = (\mathrm{Var}[\epsilon_t])^{-1} modulates update rate (Feldman & Friston 2010):

q˙t=−πt gradgF(qt),
\dot q_t = -\pi_t\, \mathrm{grad}_g F(q_t),

so A(t)∝∂tπtA(t) \propto \partial_t \pi_t. Affective change tracks the system&rsquo;s changing confidence in its coupling to the environment.

# 5. Hierarchical Stability

Cognitive systems are hierarchical: higher levels encode slower, more abstract causes; lower levels encode faster, sensory features (Friston 2008; Clark 2013). Each level ll has its own stability reward:

Rs(l)(t)=−1δt DKL(qt+δ(l)∣∣qt(l)).
R_s^{(l)}(t) = -\frac{1}{\delta t}\, D_{\mathrm{KL}}(q_{t+\delta}^{(l)}||q_t^{(l)}).

Total stability is the weighted sum Rstotal=∑lwl Rs(l)R_s^{\mathrm{total}} = \sum_l w_l\, R_s^{(l)}, with weights wlw_l corresponding to precision expectations. **Attention** is the adaptive modulation of wlw_l — allocating resources to levels where the coupling to the environment is changing fastest (Dayan & Abbott 2001).

# 6. Discussion

- **Cognitive stability is environmental coupling.** The cognitive system has no intrinsic stability. Its stability reward is a function of its relationship to the sensory environment. A brain in a jar with no input has Rs=0R_s = 0 — perfect stationarity, zero coupling.

- **Disorders as coupling failures.** Excessive rigidity (over-stabilization) means the system stops adapting to new environmental structure. Volatility (under-stabilization) means the system can&rsquo;t maintain coupling. Both are failures of the stability-environment relationship, consistent with neurocomputational accounts of schizophrenia and anxiety (Hohwy 2013; Friston 2017).

- **Affect tracks coupling dynamics.** Pleasure and displeasure mark acceleration or deceleration of environmental coupling — the felt quality of getting better or worse at tracking the world.

# 7. Conclusion

A cognitive system&rsquo;s stability reward is its rate of coupling to the sensory environment. This is mathematically identical to free-energy descent. The two-channel decomposition separates prediction error reduction from model improvement. Affect tracks the second derivative of coupling. The cognitive system is not a thing that has stability — it is a process of stabilizing to its environment.

# References

- Amari, S. (2016). *Information Geometry and Its Applications*. Springer.

- Clark, A. (2013). &ldquo;Whatever Next? Predictive Brains, Situated Agents, and the Future of Cognitive Science.&rdquo; *Behavioral and Brain Sciences*, 36(3), 181–204.

- Crooks, G. E. (1999). &ldquo;Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation.&rdquo; *Physical Review E*, 60(3), 2721–2726.

- Dayan, P., & Abbott, L. F. (2001). *Theoretical Neuroscience*. MIT Press.

- Feldman, H., & Friston, K. J. (2010). &ldquo;Attention, Uncertainty, and Free-Energy.&rdquo; *Frontiers in Human Neuroscience*, 4, 215.

- Friston, K. (2008). &ldquo;Hierarchical Models in the Brain.&rdquo; *PLoS Computational Biology*, 4(11), e1000211.

- Friston, K. (2010). &ldquo;The Free-Energy Principle: A Unified Brain Theory?&rdquo; *Nature Reviews Neuroscience*, 11(2), 127–138.

- Friston, K., & Ao, P. (2012). &ldquo;Free-Energy, Value, and Attractor Dynamics in the Brain.&rdquo; *Physical Review E*, 85(1), 011907.

- Friston, K. (2017). &ldquo;Precision Psychiatry: Free-Energy and the Bayesian Brain.&rdquo; *Comprehensive Psychiatry*, 79, 5–16.

- Hohwy, J. (2013). *The Predictive Mind*. Oxford University Press.

- Jaynes, E. T. (1957). &ldquo;Information Theory and Statistical Mechanics.&rdquo; *Physical Review*, 106(4), 620–630.

- Rao, R. P. N., & Ballard, D. H. (1999). &ldquo;Predictive Coding in the Visual Cortex.&rdquo; *Nature Neuroscience*, 2(1), 79–87.

## References

[amari2016]
S. Amari.
(2016).
Information Geometry and Its Applications.
*Springer*.

[clark2013]
A. Clark.
(2013).
Whatever Next? Predictive Brains, Situated Agents, and the Future of Cognitive Science.
*Behavioral and Brain Sciences*.

[crooks1999]
G. E. Crooks.
(1999).
Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation.
*Physical Review E*.

[dayan2001]
P. Dayan, L. F. Abbott.
(2001).
Theoretical Neuroscience.
*MIT Press*.

[feldman2010]
H. Feldman, K. J. Friston.
(2010).
Attention, Uncertainty, and Free-Energy.
*Frontiers in Human Neuroscience*.

[friston2008]
K. Friston.
(2008).
Hierarchical Models in the Brain.
*PLoS Computational Biology*.

[friston2010]
K. Friston.
(2010).
The Free-Energy Principle: A Unified Brain Theory?.
*Nature Reviews Neuroscience*.

[friston2012]
K. Friston, P. Ao.
(2012).
Free-Energy, Value, and Attractor Dynamics in the Brain.
*Physical Review E*.

[friston2017]
K. Friston.
(2017).
Precision Psychiatry: Free-Energy and the Bayesian Brain.
*Comprehensive Psychiatry*.

[hohwy2013]
J. Hohwy.
(2013).
The Predictive Mind.
*Oxford University Press*.

[jaynes1957]
E. T. Jaynes.
(1957).
Information Theory and Statistical Mechanics.
*Physical Review*.

[rao1999]
R. P. N. Rao, D. H. Ballard.
(1999).
Predictive Coding in the Visual Cortex.
*Nature Neuroscience*.
