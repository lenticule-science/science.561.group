---
name: requisite-variety
kind: condition
description: "Ashby's law: a closure-rule-system R absorbs disturbances from a disturbance space D iff |R.state-space| ≥ |D.state-space|. Only variety can destroy variety."
of: closure-rule-system
condition: "|R.state-space| ≥ |D.state-space|"
---

**Requisite variety** is the condition (Ashby 1956) that a closure-rule-system $R$ can absorb disturbances from a disturbance space $D$ iff its state-space has cardinality at least as large as that of $D$:

$$
|R.\mathrm{state\text{-}space}| \;\geq\; |D.\mathrm{state\text{-}space}|.
$$

Equivalently: "Only variety can destroy variety" — a regulator's variety must match the variety it regulates against.

## Statement

Let $R$ be a closure-rule-system acting on a state-space $S_R$, and let $D$ be a disturbance space mapped into $S_R$ via some interaction $\delta : D \to S_R$. The closure-rule-system $R$ is **requisite-variety-sufficient against $D$** when the cardinality of the regulator's reachable state-space dominates the cardinality of the disturbance space:

$$
|\,\mathrm{Fix}(R) \cap \mathrm{im}(\delta)\,| \;\geq\; |\,D\,|.
$$

When this holds, every disturbance in $D$ has a distinct regulated outcome in $\mathrm{Fix}(R)$. When it fails — when $|D| > |\mathrm{Fix}(R)|$ — multiple disturbances must map to the same regulated outcome by pigeonhole. The regulator cannot distinguish them, and disturbance enters the system as noise.

## Why this is law-shaped

For any regulator $R$ regulating against any disturbance space $D$:

- If $|R| \geq |D|$: regulation is in principle possible (whether the specific regulator achieves it depends on the interaction $\delta$).
- If $|R| < |D|$: regulation is in principle impossible by pigeonhole.

The condition is necessary, not sufficient.

## Connection to closure-rule-system

A closure-rule-system carries an implicit variety: the cardinality of its reachable state-space under iterated rule-firing. Requisite variety is the condition on this cardinality relative to the disturbance space the system must respond to.

For closure-rule-systems realized as Heyting algebras with nuclear structure, the variety of the regulator is $|\mathrm{Fix}(\sigma)|$ (saturation regulator) or $|\mathrm{Fix}(\Delta)|$ (transfer regulator) or $|A^*|$ (joint regulator). The disturbance is the perturbation between fibers across the indexing history category. Requisite variety in this setting becomes the condition that $|A^*_t|$ is large enough to absorb the fiberwise variation $|T|$ produces.
