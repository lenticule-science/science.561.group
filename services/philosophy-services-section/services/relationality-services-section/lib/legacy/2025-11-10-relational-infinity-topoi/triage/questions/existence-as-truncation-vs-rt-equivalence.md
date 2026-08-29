---
name: existence-as-truncation-vs-rt-equivalence
type: question
class: definitional-choice
status: open
explores: [field-of-existence, sharp-monad, rt-self-stabilization]
depends-on:
  - field-of-existence
  - sharp-monad
  - rt-self-stabilization
---

Source draft 1 takes "existence" of an SD-constructible diagram to mean its $(-1)$-truncation (a propositional shadow); source draft 2 takes it to mean RT-equivalence ($\Diamond_l$-modal status, equivalently $G$-coalgebra status).

These are different conditions. The $(-1)$-truncation collapses an $\infty$-groupoid of constructible extensions to a *proposition* — "extensions exist" — losing the data of *which* extension. RT-equivalence picks out the *canonical* extension as a $\Diamond_l$-modal point.

## Resolution

Both readings should be developed as parallel objects (e.g. `field-of-existence-rt` and `field-of-existence-prop`) once the subtheory is past triage, with a comparison theorem identifying when they coincide. Draft a comparison statement: under what condition on $\mathcal{S}$ is the truncation reflection of the SD-constructible stack equivalent to the $\Diamond_l$-modal reflection?
