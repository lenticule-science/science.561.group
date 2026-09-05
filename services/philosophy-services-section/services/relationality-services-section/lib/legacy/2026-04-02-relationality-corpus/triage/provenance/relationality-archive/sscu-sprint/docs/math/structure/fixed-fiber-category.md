---
name: fixed-fiber-category
role: structure
derived_from: acts/fixed-fiber-category
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: the fibre categories of recognitions restricted to the fixed profile defined by [FixedProfileRecognitions](../acts/fixed-profile-recognitions.md).
- Morphisms: judgemental arrows between fixed recognitions that respect the fixed-profile typing and entailment rules.
- Construction: inherits objects and morphisms from the general [Fiber Category](fiber-category.md) but intersects them with the fixed-profile recognitions earned by the act [FixedFiberCategory](../acts/fixed-fiber-category.md).

## Invariants
- Closed under identities and composition inside each fibre; both are inherited from the underlying fibre categories.
- Stable under the fixed-shape constraints imposed by [FixedProfileRecognitions](../acts/fixed-profile-recognitions.md); morphisms preserve those constraints.

## Proof
- Derived from: [FixedFiberCategory](../acts/fixed-fiber-category.md), which earns the restriction of fibre categories to fixed recognitions.
- Shows that: the fixed-profile restriction forms a subcategory in each fibre, retaining categorical laws while enforcing the fixed-profile invariants.
