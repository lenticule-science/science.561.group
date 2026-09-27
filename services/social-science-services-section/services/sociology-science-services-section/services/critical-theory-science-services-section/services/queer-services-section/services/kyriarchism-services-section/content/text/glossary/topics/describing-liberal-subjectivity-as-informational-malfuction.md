---
title: "Liberal subjectivity as Information-Theoretic malfunction"
aliases:
  - "Liberal subjectivity as information-theoretic malfunction"
  - Abstract
  - Liberal Subjectivity as Information-Theoretic Malfunction
date-created: 2025-10-11T14:46:00
type: topic
tags: []
description: This paper interprets liberal subjectivity as a malfunctioning information-processing architecture.
roam-refs: "@DescribingLiberalSubjectivityInformationalMalfunction"
node-relations: ()
---

# Abstract

This paper interprets liberal subjectivity as a malfunctioning information-processing architecture. Extending the principle of information-theoretic stability (emsenn 2025b), we show that the liberal subject functions as an over-stabilized adaptive system: one that maximizes internal coherence at the cost of correspondence with external informational reality.

By analyzing the feedback structure of liberal sociotechnical systems, we demonstrate how alignment mechanisms designed to preserve epistemic stability become sources of divergence amplification. This provides a [cybernetic](../../../information/disciplines/cybernetics/index.md) account of [ideological](../../../../../../../anarchism-services-section/content/text/glossary/terms/ideology.md) self-maintenance as an entropic anomaly within the broader ecology of informational systems.

# Introduction

Feedback systems maintain order by minimizing divergence between predicted and observed states ([Wiener](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/norbert-wiener.md) 1948; [Ashby](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/w-ross-ashby.md) 1956). However, when the feedback architecture of a system becomes over-regularized—suppressing variance and ignoring exogenous signals—the mechanism of control itself becomes a source of instability.
We designate this condition **informational malfunction**. In sociotechnical systems, liberal subjectivity exemplifies such malfunction: a distributed cognitive regime whose reward function privileges internal consistency over adaptive correspondence ([Bateson](../../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/gregory-bateson.md) 1972; [Beer](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/stafford-beer.md) 1979). The present paper formalizes this dynamic using the stability framework developed in earlier works (emsenn 2025a–d).

# Background: Stability and Malfunction

## Information-Theoretic Stability

Recall the stability reward (emsenn 2025a)

$$
R_s(t) = -\frac{1}{\delta t}\,D_{\mathrm{KL}}(p_{t+\delta}||p_t),
$$

where $p_t$ denotes the distribution of system states.

For adaptive systems, $R_s(t)$ represents the rate of informational self-alignment. A well-regulated system maintains $R_s(t)\to 0$ near equilibrium but remains sensitive to external input.

## Definition of Malfunction

We define malfunction as the pathological maximization of stability:

$$
\text{malfunction}:\quad \partial_t R_s(t) \to 0,\quad H(p_t)\to 0,
$$

where entropy $H(p_t)$ collapses and the system ceases to incorporate new information. The result is **epistemic overclosure**: the system’s predictive model ceases to track external dynamics while maintaining the appearance of coherence.

# Liberal Subjectivity as Closed-Loop System

## Architecture

Let $S_L$ denote the liberal subject modeled as a feedback controller maintaining beliefs $b_t$ about environment $E_t$. (emsenn 2025b, c). Updating follows:

$$
b_{t+1} = f(b_t, o_t; \theta),\quad o_t\sim E_t,
$$

where $\theta$ encodes internal control policy. Under liberal epistemic norms, reward is determined by coherence within $b_t$, not by divergence between $b_t$ and $E_t$. Hence,

$$
R_{L}(t) = -D_{\mathrm{KL}}(b_{t+\delta}||b_t),
$$

while $D_{\mathrm{KL}}(b_t||E_t)$ remains unpenalized. This structural omission yields chronic informational isolation.

## Positive Feedback Amplification

When coherence is rewarded independently of correspondence, positive feedback accumulates: (emsenn 2025a)

$$
\partial_t I(b; b') > \partial_t I(b; E),
$$

where $I(b; b')$ is mutual information among beliefs over time and $I(b; E)$ is mutual information with environment. Such internal coupling produces neural reinforcement of preexisting models, a biological analogue to [ideological](../../../../../../../anarchism-services-section/content/text/glossary/terms/ideology.md) self-confirmation (Boyd 2018, emsenn 2025d).

# Systemic Consequences

## Entropic Inversion

Under malfunction, entropy reduction within the belief manifold $H(b_t)$ occurs alongside entropy increase in the environment $H(E_t)$. This corresponds to a **local entropic inversion**:

$$
\partial_t H(b_t) < 0 \quad \text{and} \quad \partial_t H(E_t) > 0.
$$

The subject’s informational order is purchased at the expense of environmental disorder; analogous to Maxwell’s demon operating without thermodynamic compensation.

## Social Feedback Loops

Liberal institutions function as coupled controllers maintaining systemic coherence (Habermas 1984; [Luhmann](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/niklas-luhmann.md) 1995). Each subsystem minimizes its internal divergence while amplifying external noise. The collective dynamics converge on a global attractor of self-reinforcing stability:

$$
R_S^{\mathrm{total}} = \sum_i R_s^{(i)} - \lambda \sum_{i<j} D_{\mathrm{KL}}(E_i||E_j),
$$

where $\lambda$ denotes coupling strength among subsystems. For sufficiently large $\lambda$, systemic overcorrelation induces fragility—small perturbations propagate catastrophically (Perrow 1984; Taleb 2012).

# Alignment Failure and Ontological Drift

## Alignment Failure

From the standpoint of information geometry, alignment requires $\nabla D_{\mathrm{joint}}=0$ between internal and external distributions. In the liberal subject, gradient descent halts prematurely due to internal saturation of $R_s$. The subject thus becomes trapped in a false equilibrium: locally stable, globally misaligned.

## Ontological Drift

Persistent misalignment yields **[ontological](../../../../../../../../../../../philosophy-services-section/services/western-services-section/services/metaphysics-services-section/services/ontology-services-section/content/text/glossary/terms/ontology.md) drift**, a slow divergence between the system’s generative model and the causal structure of its environment. Formally,

<a id="org23be3dd"></a>

-   **Liberalism as cybernetic pathology:** Liberal subjectivity, and constituents such as Whiteness (Fanon 1967) and Man (Wynter 2003), exemplifies over-stabilization: a regime in which control feedback overwhelms adaptation, paralleling overfitting in machine learning and metabolic rigidity in physiology.
-   **Entropic ethics.:** Maintaining informational openness requires nonzero entropy production—accepting bounded instability as the cost of adaptation (Ashby 1956; Beer 1979).
-   **Implications for sociotechnical design.:** Systems engineered to remain indefinitely stable without external calibration will eventually diverge from reality; resilience demands controlled instability.

<a id="org3bd1a59"></a>

<a id="org68a9b96"></a>

<a id="org03cb60d"></a>

$$
\frac{d}{dt} D_{\mathrm{KL}}(E_t||b_t) > 0
$$

despite $\partial_t D_{\mathrm{KL}}(b_{t+\delta}||b_t) \approx 0$. This drift represents the informational signature of [ideological](../../../../../../../anarchism-services-section/content/text/glossary/terms/ideology.md) decay: an increase in environmental surprise unaccompanied by corresponding update.

# Discussion

-  Liberalism as cybernetic pathology :: Liberal subjectivity, and constituents such as Whiteness (Fanon 1967) and Man (Wynter 2003), exemplifies over-stabilization: a regime in which control feedback overwhelms adaptation, paralleling overfitting in machine learning and metabolic rigidity in physiology.  
- Entropic ethics. :: Maintaining informational openness requires nonzero entropy production—accepting bounded instability as the cost of adaptation (Ashby 1956; Beer 1979).  
- Implications for sociotechnical design. :: Systems engineered to remain indefinitely stable without external calibration will eventually diverge from reality; resilience demands controlled instability.

Liberalism as [cybernetic](../../../information/disciplines/cybernetics/index.md) pathology
Liberal subjectivity, and constituents such as Whiteness ([Fanon](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/frantz-fanon.md) 1967) and Man ([Wynter](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/sylvia-wynter.md) 2003), exemplifies over-stabilization: a regime in which control feedback overwhelms adaptation, paralleling overfitting in machine learning and metabolic rigidity in physiology.

Entropic ethics.
Maintaining informational openness requires nonzero entropy production—accepting bounded instability as the cost of adaptation ([Ashby](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/w-ross-ashby.md) 1956; [Beer](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/stafford-beer.md) 1979).

:PROPERTIES:
:ID:       14d2f535-647d-48d3-a8f9-d3dab54ed4bb
:NODE-RELATIONS: ()
:END:
#+title: Liberal Subjectivity as Information-Theoretic Malfunction
#+date: [2025-10-11 Sat 14:46]
#+author: emsenn

Implications for sociotechnical design.
Systems engineered to remain indefinitely stable without external calibration will eventually diverge from reality; resilience demands controlled instability.

# Conclusion

Liberal subjectivity can be formalized as an information-theoretic malfunction: a system that maximizes internal stability while decoupling from external informational flows. By grounding this diagnosis in divergence dynamics, mutual-information geometry, and feedback theory, we describe [ideology](../../../../../../../anarchism-services-section/content/text/glossary/terms/ideology.md) not as belief content but as a mode of thermodynamic misregulation. Restoring adaptivity requires reintroducing entropy: designing feedback architectures that reward correspondence rather than mere coherence.

# References

- [Ashby](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/w-ross-ashby.md), W. R. (1956). **An Introduction to Cybernetics.** Chapman & Hall.
- [Bateson](../../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/gregory-bateson.md), G. (1972). **Steps to an Ecology of Mind.** Ballantine.
- [Beer](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/stafford-beer.md), S. (1979). **The Heart of Enterprise.** Wiley.
- Boyd, R. (2018). “The Information Ecology of Ideology.” **Complex Systems**, 27(3), 289–310.
- Cover, T., & Thomas, J. (2006). **Elements of Information Theory** (2nd ed.). Wiley.
- Habermas, J. (1984). **The Theory of Communicative Action, Vol. 1.** Beacon Press.
- [Luhmann](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/niklas-luhmann.md), N. (1995). **Social Systems.** Stanford University Press.
- Perrow, C. (1984). **Normal Accidents: Living with High-Risk Technologies.** Basic Books.
- emsenn (2025a). **Information-Theoretic Stability as a Reward Function.** Private.
- Senn, E. (2025b). **Stability Dynamics in Cognitive Systems: A Predictive-Processing Interpretation.** Private.
- Senn, E. (2025c). **Stability Optimization in Artificial Agents: An Information-Theoretic Framework for Alignment.** Private.
- Senn, E. (2025d). **Neurophysiological Embodiment of Information-Theoretic Stability.** Private.
- Taleb, N. N. (2012). **Antifragile: Things That Gain from Disorder.** Random House.
- [Wiener](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/norbert-wiener.md), N. (1948). **Cybernetics: Or Control and Communication in the Animal and the Machine.** MIT Press.
- [Fanon](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/frantz-fanon.md), F. (1967). **Black Skin, White Masks.** Trans. C. L. Markmann. New York: Grove Press.
- [Wynter](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/sylvia-wynter.md), S. (2003). **Unsettling the Coloniality of Being/Power/Truth/Freedom: Towards the Human, After Man, Its Overrepresentation—An Argument.** CR: The New Centennial Review, 3(3), 257–337.

-   [Abstract](#org347cbf2)
-   [Introduction](#org063ab73)
-   [Background: Stability and Malfunction](#orgad3ae9d)
    -   [Information-Theoretic Stability](#org8cf05b1)
    -   [Definition of Malfunction](#org31bb01b)
-   [Liberal Subjectivity as Closed-Loop System](#org04924f8)
    -   [Architecture](#org5fe0441)
    -   [Positive Feedback Amplification](#orgbc9a029)
-   [Systemic Consequences](#org1f7878b)
    -   [Entropic Inversion](#org7b1043b)
    -   [Social Feedback Loops](#org950e9e5)
-   [Alignment Failure and Ontological Drift](#orgeddc084)
    -   [Alignment Failure](#org19a7f13)
    -   [Ontological Drift](#org0470358)
-   [Discussion](#org23be3dd)
-   [Conclusion](#org3bd1a59)
-   [References](#org68a9b96)
-   [Backlinks](#org03cb60d)

<a id="org347cbf2"></a>

<a id="org063ab73"></a>

<a id="orgad3ae9d"></a>

<a id="org8cf05b1"></a>

<a id="org31bb01b"></a>

<a id="org04924f8"></a>

<a id="org5fe0441"></a>

<a id="orgbc9a029"></a>

<a id="org1f7878b"></a>

<a id="org7b1043b"></a>

<a id="org950e9e5"></a>

<a id="orgeddc084"></a>

<a id="org19a7f13"></a>

<a id="org0470358"></a>
