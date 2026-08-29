---
title: Neurophysiological embodiment of information-theoretic stability
aliases:
  - "Neurophysiological embodiment of information-theoretic stability"
  - "neurophysiological embodiment of information-theoretic stability"
date-created: 2025-10-11T14:43:00
---

# Abstract

Information-theoretic stability (Senn 2025a–c) describes adaptive systems as minimizing divergence between successive probability distributions.
This paper examines the biological implementation of that principle in the human nervous system.
Using evidence from predictive coding, dopaminergic prediction-error signaling, and autonomic control, we show that the stability reward corresponds to measurable neurophysiological quantities: the rate of free-energy reduction, dopaminergic precision coding, and vagal-mediated homeostasis.
This formulation unifies computational, affective, and autonomic dynamics within a single information-geometric framework.

# 1. Introduction

The nervous system maintains internal order by minimizing informational divergence between expected and actual sensory states (Friston 2010; Sterling & Laughlin 2015).
This process, formalized as free-energy minimization, has both computational and physiological realizations: neural activity, neuromodulation, and autonomic regulation jointly maintain **stability** in the organism’s information state.
Here, we describe how the information-theoretic stability reward (Senn 2025a–c) manifests in neural circuits and physiological feedback loops.

# 2. Neurocomputational Background

## 2.1 Predictive Coding Architecture

In hierarchical cortical models, prediction errors ascend and predictions descend between levels (Rao & Ballard 1999; Friston 2008).
Let $q_t(s^{(l)})$ denote the belief state at level $l$.
Free-energy minimization occurs through synaptic updates proportional to local prediction error $\epsilon^{(l)} = o^{(l)} - \hat o^{(l)}$.
The temporal derivative of free energy, $\partial_t F$, quantifies deviation from stability; its negative corresponds to the stability reward $R_s(t)$ (Senn 2025b).

## 2.2 Dopaminergic Prediction-Error Coding

Dopaminergic neurons encode a reward-prediction error $\delta_t$ approximating $\partial_t F$ (Schultz 1998; Friston et al. 2012).
Empirical work links phasic dopamine bursts to unexpected information gain and tonic levels to long-term policy stability (Niv 2007).
Thus,
$$
\delta_t \propto -\partial_t F \propto R_s(t),
$$
identifying dopamine release as a biological correlate of informational stability optimization.

# 3. Autonomic Regulation as Stability Control

## 3.1 Homeostatic Loops

The autonomic nervous system maintains physiological variables (temperature, heart rate, energy balance) within narrow ranges.
Baroreflex and respiratory control operate via feedback minimizing error between sensed and set-point states (Berntson et al. 1997).
This feedback minimizes divergence between predicted and actual interoceptive signals, implementing stability at the bodily level.

## 3.2 Vagal Tone and Parasympathetic Precision

High vagal tone enhances flexibility in adapting to perturbations (Thayer & Lane 2000).
In information-theoretic terms, parasympathetic dominance increases precision on slow internal signals, stabilizing low-frequency dynamics while permitting rapid corrective action.
We formalize this as modulation of precision $\pi_t$ on interoceptive errors:
$$
\dot q_t = -\pi_t\, \mathrm{grad}_g F(q_t),
$$
as in Senn (2025b).
Vagal regulation thus corresponds to precision-weighted descent on free energy, implementing physical stability of the internal milieu.

# 4. Multiscale Integration

## 4.1 Cortico-Subcortical Coupling

Higher cortical levels encode long-timescale causes; subcortical nuclei mediate fast autonomic responses (Friston 2008; Critchley 2009).
Coupled through bidirectional projections, these systems maintain a joint stability manifold $\mathcal{M}_S$ in which neural and physiological dynamics co-minimize divergence:
$$
R_s^{\mathrm{total}} = R_s^{\mathrm{cortex}} + R_s^{\mathrm{subcortical}} + R_s^{\mathrm{autonomic}}.
$$
Stationarity $\nabla R_s^{\mathrm{total}} = 0$ defines adaptive equilibrium.

## 4.2 Energy Metabolism and Thermodynamic Consistency

Neural computation consumes metabolic free energy.
Empirical studies show correlations between metabolic efficiency and signal predictability (Attwell & Laughlin 2001).
Minimizing informational divergence thus coincides with minimizing metabolic expenditure, linking thermodynamic and informational stability (Crooks 1999; Sengupta et al. 2016).

# 5. Discussion

1.  ****Unified interpretation.****
    Neural learning, dopaminergic reward, and autonomic regulation instantiate the same gradient descent on divergence.
2.  ****Physiological correlates of affect.****
    Positive affect corresponds to increasing stability ($\partial_t R_s>0$), negative affect to decreasing stability ($\partial_t R_s<0$), consistent with dopaminergic and vagal indices of wellbeing (Porges 2011).
3.  ****Disorders of stability.****
    Dysregulation of precision weighting or coupling (e.g., in anxiety or Parkinson’s disease) can be framed as persistent deviation from the stability manifold.

# 6. Conclusion

The nervous system embodies the information-theoretic principle of stability through multiscale feedback: cortical inference, dopaminergic modulation, and autonomic regulation cooperate to minimize divergence between predicted and actual internal states.
This model unifies informational, affective, and physiological homeostasis under a single geometric principle, offering a rigorous foundation for future empirical and computational studies of adaptive regulation.

# References

- Amari, S. (2016). **Information Geometry and Its Applications**. Springer.
- Attwell, D., & Laughlin, S. B. (2001). “An Energy Budget for Signaling in the Grey Matter of the Brain.” **Journal of Cerebral Blood Flow & Metabolism**, 21(10), 1133–1145.
- Berntson, G. G., et al. (1997). “Heart Rate Variability: Origins, Methods, and Interpretive Caveats.” **Psychophysiology**, 34(6), 623–648.
- Critchley, H. D. (2009). “Psychophysiology of Neural, Cognitive and Affective Integration: fMRI and Autonomic Indicants.” **International Journal of Psychophysiology**, 73(2), 88–94.
- Crooks, G. E. (1999). “Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation.” **Physical Review E**, 60(3), 2721–2726.
- Friston, K. J. (2008). “Hierarchical Models in the Brain.” **PLoS Computational Biology**, 4(11), e1000211.
- Friston, K. J. (2010). “The Free-Energy Principle: A Unified Brain Theory?” **Nature Reviews Neuroscience**, 11(2), 127–138.
- Friston, K. J., Shiner, T., FitzGerald, T., et al. (2012). “Dopamine, Affordance and Active Inference.” **PLoS Computational Biology**, 8(1), e1002327.
- Niv, Y. (2007). “Cost, Benefit, and the Control of Prediction Error: The Role of Dopamine.” **Current Opinion in Neurobiology**, 17(6), 701–706.
- Porges, S. W. (2011). **The Polyvagal Theory.** Norton.
- Rao, R. P. N., & Ballard, D. H. (1999). “Predictive Coding in the Visual Cortex.” **Nature Neuroscience**, 2(1), 79–87.
- Schultz, W. (1998). “Predictive Reward Signal of Dopamine Neurons.” **Journal of Neurophysiology**, 80(1), 1–27.
- Sengupta, B., Stemmler, M., Laughlin, S. B., & Niven, J. E. (2016). “Action Potential Energy Efficiency Varies Among Neuron Types.” **Journal of Neuroscience**, 36(27), 7231–7244.
- Sterling, P., & Laughlin, S. (2015). **Principles of Neural Design.** MIT Press.
- Thayer, J. F., & Lane, R. D. (2000). “A Model of Neurovisceral Integration.” **Biological Psychology**, 74(2), 243–262.
- Senn, E. (2025a). **Information-Theoretic Stability as a Reward Function.** arXiv:math.IT.
- Senn, E. (2025b). **Stability Dynamics in Cognitive Systems: A Predictive-Processing Interpretation.** arXiv:cs.AI.
- Senn, E. (2025c). **Stability Optimization in Artificial Agents: An Information-Theoretic Framework for Alignment.** arXiv:cs.AI.


---

<!-- source: neurology/neuroscience/archive/references/information-theoretic-stability-neurophysiology/neurophysiological-embodiment-of-information-theoretic-stability--002794.org -->

## Imported source: neurology/neuroscience/archive/references/information-theoretic-stability-neurophysiology/neurophysiological-embodiment-of-information-theoretic-stability--002794.org

:PROPERTIES:
:ID:       61634e41-b312-47b0-ae96-3d0bf9081d9a
:END:
#+title: Neurophysiological Embodiment of Information-Theoretic Stability
#+date: [2025-10-11 Sat 14:43]


* Abstract
Information-theoretic stability (Senn 2025a–c) describes adaptive systems as minimizing divergence between successive probability distributions.  
This paper examines the biological implementation of that principle in the human nervous system.  
Using evidence from predictive coding, dopaminergic prediction-error signaling, and autonomic control, we show that the stability reward corresponds to measurable neurophysiological quantities: the rate of free-energy reduction, dopaminergic precision coding, and vagal-mediated homeostasis.  
This formulation unifies computational, affective, and autonomic dynamics within a single information-geometric framework.

* 1. Introduction
The nervous system maintains internal order by minimizing informational divergence between expected and actual sensory states (Friston 2010; Sterling & Laughlin 2015).  
This process, formalized as free-energy minimization, has both computational and physiological realizations: neural activity, neuromodulation, and autonomic regulation jointly maintain *stability* in the organism’s information state.  
Here, we describe how the information-theoretic stability reward (Senn 2025a–c) manifests in neural circuits and physiological feedback loops.

* 2. Neurocomputational Background

** 2.1 Predictive Coding Architecture
In hierarchical cortical models, prediction errors ascend and predictions descend between levels (Rao & Ballard 1999; Friston 2008).  
Let $q_t(s^{(l)})$ denote the belief state at level $l$.  
Free-energy minimization occurs through synaptic updates proportional to local prediction error $\epsilon^{(l)} = o^{(l)} - \hat o^{(l)}$.  
The temporal derivative of free energy, $\partial_t F$, quantifies deviation from stability; its negative corresponds to the stability reward $R_s(t)$ (Senn 2025b).

** 2.2 Dopaminergic Prediction-Error Coding
Dopaminergic neurons encode a reward-prediction error $\delta_t$ approximating $\partial_t F$ (Schultz 1998; Friston et al. 2012).  
Empirical work links phasic dopamine bursts to unexpected information gain and tonic levels to long-term policy stability (Niv 2007).  
Thus,
\[
\delta_t \propto -\partial_t F \propto R_s(t),
\]
identifying dopamine release as a biological correlate of informational stability optimization.

* 3. Autonomic Regulation as Stability Control

** 3.1 Homeostatic Loops
The autonomic nervous system maintains physiological variables (temperature, heart rate, energy balance) within narrow ranges.  
Baroreflex and respiratory control operate via feedback minimizing error between sensed and set-point states (Berntson et al. 1997).  
This feedback minimizes divergence between predicted and actual interoceptive signals, implementing stability at the bodily level.

** 3.2 Vagal Tone and Parasympathetic Precision
High vagal tone enhances flexibility in adapting to perturbations (Thayer & Lane 2000).  
In information-theoretic terms, parasympathetic dominance increases precision on slow internal signals, stabilizing low-frequency dynamics while permitting rapid corrective action.  
We formalize this as modulation of precision $\pi_t$ on interoceptive errors:
\[
\dot q_t = -\pi_t\, \mathrm{grad}_g F(q_t),
\]
as in Senn (2025b).  
Vagal regulation thus corresponds to precision-weighted descent on free energy, implementing physical stability of the internal milieu.

* 4. Multiscale Integration

** 4.1 Cortico-Subcortical Coupling
Higher cortical levels encode long-timescale causes; subcortical nuclei mediate fast autonomic responses (Friston 2008; Critchley 2009).  
Coupled through bidirectional projections, these systems maintain a joint stability manifold $\mathcal{M}_S$ in which neural and physiological dynamics co-minimize divergence:
\[
R_s^{\mathrm{total}} = R_s^{\mathrm{cortex}} + R_s^{\mathrm{subcortical}} + R_s^{\mathrm{autonomic}}.
\]
Stationarity $\nabla R_s^{\mathrm{total}} = 0$ defines adaptive equilibrium.

** 4.2 Energy Metabolism and Thermodynamic Consistency
Neural computation consumes metabolic free energy.  
Empirical studies show correlations between metabolic efficiency and signal predictability (Attwell & Laughlin 2001).  
Minimizing informational divergence thus coincides with minimizing metabolic expenditure, linking thermodynamic and informational stability (Crooks 1999; Sengupta et al. 2016).

* 5. Discussion
1. **Unified interpretation.**  
   Neural learning, dopaminergic reward, and autonomic regulation instantiate the same gradient descent on divergence.
2. **Physiological correlates of affect.**  
   Positive affect corresponds to increasing stability ($\partial_t R_s>0$), negative affect to decreasing stability ($\partial_t R_s<0$), consistent with dopaminergic and vagal indices of wellbeing (Porges 2011).
3. **Disorders of stability.**  
   Dysregulation of precision weighting or coupling (e.g., in anxiety or Parkinson’s disease) can be framed as persistent deviation from the stability manifold.

* 6. Conclusion
The nervous system embodies the information-theoretic principle of stability through multiscale feedback: cortical inference, dopaminergic modulation, and autonomic regulation cooperate to minimize divergence between predicted and actual internal states.  
This model unifies informational, affective, and physiological homeostasis under a single geometric principle, offering a rigorous foundation for future empirical and computational studies of adaptive regulation.

* References
- Amari, S. (2016). *Information Geometry and Its Applications*. Springer.  
- Attwell, D., & Laughlin, S. B. (2001). “An Energy Budget for Signaling in the Grey Matter of the Brain.” *Journal of Cerebral Blood Flow & Metabolism*, 21(10), 1133–1145.  
- Berntson, G. G., et al. (1997). “Heart Rate Variability: Origins, Methods, and Interpretive Caveats.” *Psychophysiology*, 34(6), 623–648.  
- Critchley, H. D. (2009). “Psychophysiology of Neural, Cognitive and Affective Integration: fMRI and Autonomic Indicants.” *International Journal of Psychophysiology*, 73(2), 88–94.  
- Crooks, G. E. (1999). “Entropy Production Fluctuation Theorem and the Nonequilibrium Work Relation.” *Physical Review E*, 60(3), 2721–2726.  
- Friston, K. J. (2008). “Hierarchical Models in the Brain.” *PLoS Computational Biology*, 4(11), e1000211.  
- Friston, K. J. (2010). “The Free-Energy Principle: A Unified Brain Theory?” *Nature Reviews Neuroscience*, 11(2), 127–138.  
- Friston, K. J., Shiner, T., FitzGerald, T., et al. (2012). “Dopamine, Affordance and Active Inference.” *PLoS Computational Biology*, 8(1), e1002327.  
- Niv, Y. (2007). “Cost, Benefit, and the Control of Prediction Error: The Role of Dopamine.” *Current Opinion in Neurobiology*, 17(6), 701–706.  
- Porges, S. W. (2011). *The Polyvagal Theory.* Norton.  
- Rao, R. P. N., & Ballard, D. H. (1999). “Predictive Coding in the Visual Cortex.” *Nature Neuroscience*, 2(1), 79–87.  
- Schultz, W. (1998). “Predictive Reward Signal of Dopamine Neurons.” *Journal of Neurophysiology*, 80(1), 1–27.  
- Sengupta, B., Stemmler, M., Laughlin, S. B., & Niven, J. E. (2016). “Action Potential Energy Efficiency Varies Among Neuron Types.” *Journal of Neuroscience*, 36(27), 7231–7244.  
- Sterling, P., & Laughlin, S. (2015). *Principles of Neural Design.* MIT Press.  
- Thayer, J. F., & Lane, R. D. (2000). “A Model of Neurovisceral Integration.” *Biological Psychology*, 74(2), 243–262.  
- Senn, E. (2025a). *Information-Theoretic Stability as a Reward Function.* arXiv:math.IT.  
- Senn, E. (2025b). *Stability Dynamics in Cognitive Systems: A Predictive-Processing Interpretation.* arXiv:cs.AI.  
- Senn, E. (2025c). *Stability Optimization in Artificial Agents: An Information-Theoretic Framework for Alignment.* arXiv:cs.AI.
