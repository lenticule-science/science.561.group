---
name: mutual-information
kind: measure
description: "I(R; D) = H(R) + H(D) - H(R, D). The shared information between a regulator's state-space and a disturbance space. Measures how much R tracks D."
of: closure-rule-system
---

**Mutual information** is the information-theoretic quantity measuring shared variance between a closure-rule-system's state-space and a disturbance space:

$$ I(R; D) \;=\; H(R) + H(D) - H(R, D) $$

where $H(X)$ is the Shannon entropy of a probability distribution on $X$'s state-space and $H(R, D)$ is the joint entropy.

## Properties

- **Non-negative**: $I(R; D) \geq 0$, with equality iff $R$ and $D$ are statistically independent.
- **Symmetric**: $I(R; D) = I(D; R)$.
- **Bounded above**: $I(R; D) \leq \min(H(R), H(D))$.
- **Data-processing inequality**: if $R' = f(R)$ is a function of $R$, then $I(R'; D) \leq I(R; D)$.

## Relation to requisite variety

Mutual information quantifies how much a regulator's state tracks the disturbances it must absorb.
The [requisite-variety](../requisite-variety/requisite-variety.md) condition $|R| \geq |D|$ is the cardinality precondition; mutual information $I(R; D)$ is the actual achieved tracking.
A regulator may satisfy requisite-variety in cardinality but achieve low mutual information — its state-space is large enough but is not actually correlated with disturbances.

The **maximally tracking regulator** has $I(R; D) = H(D)$ — every disturbance is reflected in the regulator's state.
This is the upper bound; achieving it requires the regulator's dynamics to literally encode the disturbance.

## In the substrate

For a closure-rule-system $R$ acting on a Heyting algebra $A$ with disturbance space $D$ entering as perturbations, the mutual information $I(\mathrm{Fix}(R); D)$ measures how much the regulated layer of $A$ encodes information about $D$.
For autopoiesis-cells, this is the information the joint quiescent layer $A^*$ carries about the fiberwise variation across histories.
