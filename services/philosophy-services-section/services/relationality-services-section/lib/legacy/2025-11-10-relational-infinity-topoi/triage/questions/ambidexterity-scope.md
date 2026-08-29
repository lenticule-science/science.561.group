---
name: ambidexterity-scope
type: question
class: theorem-scope
status: open
explores: [ambidexterity, sd-ambidexterity, field-of-existence]
depends-on:
  - ambidexterity
  - sd-ambidexterity
  - field-of-existence
---

Source draft 1 proves ambidexterity for [SD-constructible](../teaching/explanations/constructibility.md) diagrams on the SD ∞-site; source draft 2 sketches a stronger statement for the entire [field of existence](../objects/field-of-existence.md) (i.e. all $G$-coalgebra diagrams whether or not constructible).

The two are not equivalent:

- *Constructible* is the well-formedness condition: each stratum's value is determined by its latching/matching neighborhoods.
- *Existence* is the convergence condition: the recursive realization terminates.

A constructible diagram may fail to converge (on an infinite-degree site); a convergent diagram may fail to be constructible (its stratum-values may carry free data the latching/matching does not pin down).

## Which scope is the right one for ambidexterity

**Argument for SD-constructible:** ambidexterity is a *local* property at each stratum. Constructibility is the local condition that pins down the stratum value, and ambidexterity at a stratum reduces to the latching/matching norm map being an equivalence at that stratum. This is the scope draft 1 actually proves.

**Argument for field of existence:** ambidexterity should be stable under iteration of the dynamics; constructibility plus existence is what gives stability. The field-of-existence scope is what survives if the dynamics is iterated indefinitely. This is the scope draft 2 wants for downstream applications.

## Resolution

The current statement of [`theorems/sd-ambidexterity.md`](../theorems/sd-ambidexterity.md) uses the SD-constructible scope. Draft 2's stronger statement is unproven in any of the source drafts — promoting it requires a genuinely new argument that the convergent extension of a constructible skeleton remains ambidextrous, which is *not* automatic.

Path: prove the constructible-scope statement (draft 1's argument with the descent-step gap filled), then attempt to extend to the field of existence as a corollary using KZ-laxity of $G$.
