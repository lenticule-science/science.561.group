---
title: "Liberal Subjectivity as Information-Theoretic Malfunction"
authors:
  - emsenn
date-created: 2025-10-11T00:00:00
keywords:
  - information-theory
  - cybernetics
  - liberalism
date-updated: 2026-03-09
part-of: sociology/schools/cybernetic-postliberalism/texts
description: "Liberal subjectivity interpreted as a malfunctioning information-processing architecture: a system that maximizes internal coherence at the cost of correspondence with external informational reality."
---

Liberal subjectivity interpreted as a malfunctioning information-processing architecture: a system that maximizes internal coherence at the cost of correspondence with external informational reality.

## Abstract

This paper interprets liberal subjectivity as a malfunctioning information-processing architecture. Extending the principle of information-theoretic stability, we show that the liberal subject functions as an over-stabilized adaptive system: one that maximizes internal coherence at the cost of correspondence with external informational reality.

By analyzing the feedback structure of liberal sociotechnical systems, we demonstrate how alignment mechanisms designed to preserve epistemic stability become sources of divergence amplification. This provides a [cybernetic](../../information/disciplines/cybernetics/index.md) account of [ideological](../../../../../../../content/text/glossary/terms/ideology.md) self-maintenance as an entropic anomaly within the broader ecology of informational systems.

## 1. Introduction

Feedback systems maintain order by minimizing divergence between predicted and observed states ([Wiener](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/norbert-wiener.md) 1948; [Ashby](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/w-ross-ashby.md) 1956). However, when the feedback architecture of a system becomes over-regularized — suppressing variance and ignoring exogenous signals — the mechanism of control itself becomes a source of instability. We designate this condition *informational malfunction*. In sociotechnical systems, liberal subjectivity exemplifies such malfunction: a distributed cognitive regime whose reward function privileges internal consistency over adaptive correspondence ([Bateson](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/gregory-bateson.md) 1972; [Beer](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/stafford-beer.md) 1979).

## 2. Background: stability and malfunction

### 2.1. Information-theoretic stability

Recall the stability reward:

$$R_s(t) = -\frac{1}{\delta t}\,D_{\mathrm{KL}}(p_{t+\delta}||p_t),$$

where $p_t$ denotes the distribution of system states. For adaptive systems, $R_s(t)$ represents the rate of informational self-alignment. A well-regulated system maintains $R_s(t)\to 0$ near equilibrium but remains sensitive to external input.

### 2.2. Definition of malfunction

We define malfunction as the pathological maximization of stability:

$$\text{malfunction}:\quad \partial_t R_s(t) \to 0,\quad H(p_t)\to 0,$$

where entropy $H(p_t)$ collapses and the system ceases to incorporate new information. The result is *epistemic overclosure*: the system's predictive model ceases to track external dynamics while maintaining the appearance of coherence.

## 3. Liberal subjectivity as closed-loop system

### 3.1. Architecture

Let $S_L$ denote the liberal subject modeled as a feedback controller maintaining beliefs $b_t$ about environment $E_t$. Updating follows:

$$b_{t+1} = f(b_t, o_t; \theta),\quad o_t\sim E_t,$$

where $\theta$ encodes internal control policy. Under liberal epistemic norms, reward is determined by coherence within $b_t$, not by divergence between $b_t$ and $E_t$. Hence,

$$R_{L}(t) = -D_{\mathrm{KL}}(b_{t+\delta}||b_t),$$

while $D_{\mathrm{KL}}(b_t||E_t)$ remains unpenalized. This structural omission yields chronic informational isolation.

### 3.2. Positive feedback amplification

When coherence is rewarded independently of correspondence, positive feedback accumulates:

$$\partial_t I(b; b') > \partial_t I(b; E),$$

where $I(b; b')$ is mutual information among beliefs over time and $I(b; E)$ is mutual information with environment. Such internal coupling produces neural reinforcement of preexisting models, a biological analogue to [ideological](../../../../../../../content/text/glossary/terms/ideology.md) self-confirmation.

## 4. Systemic consequences

### 4.1. Entropic inversion

Under malfunction, entropy reduction within the belief manifold $H(b_t)$ occurs alongside entropy increase in the environment $H(E_t)$. This corresponds to a *local entropic inversion*:

$$\partial_t H(b_t) < 0 \quad \text{and} \quad \partial_t H(E_t) > 0.$$

The subject's informational order is purchased at the expense of environmental disorder; analogous to Maxwell's demon operating without thermodynamic compensation.

### 4.2. Social feedback loops

Liberal institutions function as coupled controllers maintaining systemic coherence (Habermas 1984; [Luhmann](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/niklas-luhmann.md) 1995). Each subsystem minimizes its internal divergence while amplifying external noise. The collective dynamics converge on a global attractor of self-reinforcing stability:

$$R_S^{\mathrm{total}} = \sum_i R_s^{(i)} - \lambda \sum_{i<j} D_{\mathrm{KL}}(E_i||E_j),$$

where $\lambda$ denotes coupling strength among subsystems. For sufficiently large $\lambda$, systemic overcorrelation induces fragility — small perturbations propagate catastrophically (Perrow 1984; Taleb 2012).

## 5. Alignment failure and [ontological](../../../../../../../../../../philosophy-services-section/services/western-services-section/services/metaphysics-services-section/services/ontology-services-section/content/text/glossary/terms/ontology.md) drift

### 5.1. Alignment failure

From the standpoint of information geometry, alignment requires $\nabla D_{\mathrm{joint}}=0$ between internal and external distributions. In the liberal subject, gradient descent halts prematurely due to internal saturation of $R_s$. The subject thus becomes trapped in a false equilibrium: locally stable, globally misaligned.

### 5.2. Ontological drift

Persistent misalignment yields *[ontological](../../../../../../../../../../philosophy-services-section/services/western-services-section/services/metaphysics-services-section/services/ontology-services-section/content/text/glossary/terms/ontology.md) drift*, a slow divergence between the system's generative model and the causal structure of its environment. Formally,

$$\frac{d}{dt} D_{\mathrm{KL}}(E_t||b_t) > 0$$

despite $\partial_t D_{\mathrm{KL}}(b_{t+\delta}||b_t) \approx 0$. This drift represents the informational signature of [ideological](../../../../../../../content/text/glossary/terms/ideology.md) decay: an increase in environmental surprise unaccompanied by corresponding update.

## 6. Discussion

- **Liberalism as [cybernetic](../../information/disciplines/cybernetics/index.md) pathology.** Liberal subjectivity, and constituents such as Whiteness ([Fanon](../../../../../../../../../../../content/text/documents/articles/biographies/frantz-fanon.md) 1967) and Man ([Wynter](../../../../../../../../../../../content/text/documents/articles/biographies/sylvia-wynter.md) 2003), exemplifies over-stabilization: a regime in which control feedback overwhelms adaptation, paralleling overfitting in machine learning and metabolic rigidity in physiology.
- **Entropic ethics.** Maintaining informational openness requires nonzero entropy production — accepting bounded instability as the cost of adaptation ([Ashby](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/w-ross-ashby.md) 1956; [Beer](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/stafford-beer.md) 1979).
- **Implications for sociotechnical design.** Systems engineered to remain indefinitely stable without external calibration will eventually diverge from reality; resilience demands controlled instability.

## 7. Conclusion

Liberal subjectivity can be formalized as an information-theoretic malfunction: a system that maximizes internal stability while decoupling from external informational flows. By grounding this diagnosis in divergence dynamics, mutual-information geometry, and feedback theory, we describe [ideology](../../../../../../../content/text/glossary/terms/ideology.md) not as belief content but as a mode of thermodynamic misregulation. Restoring adaptivity requires reintroducing entropy: designing feedback architectures that reward correspondence rather than mere coherence.

## References

- [Ashby](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/w-ross-ashby.md), W. R. (1956). *An Introduction to Cybernetics.* Chapman & Hall.
- [Bateson](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/gregory-bateson.md), G. (1972). *Steps to an Ecology of Mind.* Ballantine.
- [Beer](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/stafford-beer.md), S. (1979). *The Heart of Enterprise.* Wiley.
- Cover, T., & Thomas, J. (2006). *Elements of Information Theory* (2nd ed.). Wiley.
- [Fanon](../../../../../../../../../../../content/text/documents/articles/biographies/frantz-fanon.md), F. (1967). *Black Skin, White Masks.* Trans. C. L. Markmann. Grove Press.
- Habermas, J. (1984). *The Theory of Communicative Action, Vol. 1.* Beacon Press.
- [Luhmann](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/niklas-luhmann.md), N. (1995). *Social Systems.* Stanford University Press.
- Perrow, C. (1984). *Normal Accidents: Living with High-Risk Technologies.* Basic Books.
- Taleb, N. N. (2012). *Antifragile: Things That Gain from Disorder.* Random House.
- [Wiener](../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/norbert-wiener.md), N. (1948). *Cybernetics: Or Control and Communication in the Animal and the Machine.* MIT Press.
- [Wynter](../../../../../../../../../../../content/text/documents/articles/biographies/sylvia-wynter.md), S. (2003). "Unsettling the Coloniality of Being/Power/Truth/Freedom." *CR: The New Centennial Review*, 3(3), 257-337.

## Earlier material

The stability of an adaptive system can be read as a rate of informational self-alignment: the rate at which the distribution of system states changes from one moment to the next.
A well-regulated system settles toward equilibrium — that rate of change approaches zero — but remains sensitive to external input.

We define malfunction as the pathological maximization of stability: the system's rate of self-alignment freezes and the entropy of its state distribution collapses, so that the system ceases to incorporate new information.
The result is *epistemic overclosure*: the system's predictive model ceases to track external dynamics while maintaining the appearance of coherence.

Consider the liberal subject modeled as a feedback controller maintaining beliefs about its environment, updating those beliefs from observation according to an internal control policy.
Under liberal epistemic norms, reward is determined by coherence within the belief set, not by divergence between the beliefs and the environment.
The divergence between belief and environment remains unpenalized.
This structural omission yields chronic informational isolation.

When coherence is rewarded independently of correspondence, positive feedback accumulates: the coupling of beliefs to one another grows faster than the coupling of beliefs to the environment.
Such internal coupling produces neural reinforcement of preexisting models, a biological analogue to [ideological](../../../../../../../content/text/glossary/terms/ideology.md) self-confirmation.

Under malfunction, entropy reduction within the belief manifold occurs alongside entropy increase in the environment.
This is a *local entropic inversion*: the entropy of the subject's beliefs falls while the entropy of its environment rises.
The subject's informational order is purchased at the expense of environmental disorder; analogous to Maxwell's demon operating without thermodynamic compensation.

Liberal institutions function as coupled controllers maintaining systemic coherence (Habermas 1984; [Luhmann](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/content/relating/content/relational-entity/content/social-being/content/social-relation/content/power/subjectifying/content/subject/content/possessive-individual/ontologizing/content/liberalism/analyzing/content/cybernetic-postliberalism/teaching/content/general/people/niklas-luhmann.md) 1995).
Each subsystem minimizes its internal divergence while amplifying external noise.
The collective dynamics converge on a global attractor of self-reinforcing stability.
As coupling among the subsystems grows, systemic overcorrelation induces fragility — small perturbations propagate catastrophically (Perrow 1984; Taleb 2012).

Alignment would require the internal and external distributions to come into agreement.
In the liberal subject, this adjustment halts prematurely due to internal saturation: the subject's drive toward stability is already satisfied.
The subject thus becomes trapped in a false equilibrium: locally stable, globally misaligned.

Persistent misalignment yields *[ontological](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/content/relating/content/relational-entity/content/social-being/content/social-relation/content/power/subjectifying/content/subject/content/possessive-individual/ontologizing/content/liberalism/analyzing/content/cybernetic-postliberalism/teaching/content/philosophy/terms/ontology.md) drift*, a slow divergence between the system's generative model and the causal structure of its environment: the gap between the environment and the subject's beliefs widens over time even though the subject's beliefs have all but stopped changing.
This drift represents the informational signature of [ideological](../../../../../../../content/text/glossary/terms/ideology.md) decay: an increase in environmental surprise unaccompanied by corresponding update.

- **Liberalism as [cybernetic](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/content/relating/content/relational-entity/content/social-being/content/social-relation/content/power/subjectifying/content/subject/content/possessive-individual/ontologizing/content/liberalism/analyzing/content/cybernetic-postliberalism/teaching/content/information/disciplines/cybernetics/index.md) pathology.** Liberal subjectivity, and constituents such as Whiteness ([Fanon](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/content/relating/content/relational-entity/content/social-being/content/social-relation/content/power/subjectifying/content/subject/content/possessive-individual/ontologizing/content/liberalism/analyzing/content/cybernetic-postliberalism/teaching/content/general/people/frantz-fanon.md) 1967) and Man ([Wynter](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/content/relating/content/relational-entity/content/social-being/content/social-relation/content/power/subjectifying/content/subject/content/possessive-individual/ontologizing/content/liberalism/analyzing/content/cybernetic-postliberalism/teaching/content/general/people/sylvia-wynter.md) 2003), exemplifies over-stabilization: a regime in which control feedback overwhelms adaptation, paralleling overfitting in machine learning and metabolic rigidity in physiology.
- **Entropic ethics.** Maintaining informational openness requires nonzero entropy production — accepting bounded instability as the cost of adaptation ([Ashby](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/content/relating/content/relational-entity/content/social-being/content/social-relation/content/power/subjectifying/content/subject/content/possessive-individual/ontologizing/content/liberalism/analyzing/content/cybernetic-postliberalism/teaching/content/general/people/w-ross-ashby.md) 1956; [Beer](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/content/relating/content/relational-entity/content/social-being/content/social-relation/content/power/subjectifying/content/subject/content/possessive-individual/ontologizing/content/liberalism/analyzing/content/cybernetic-postliberalism/teaching/content/general/people/stafford-beer.md) 1979).
- **Implications for sociotechnical design.** Systems engineered to remain indefinitely stable without external calibration will eventually diverge from reality; resilience demands controlled instability.
