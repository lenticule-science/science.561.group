---
name: fiber-category
role: structure
derived_from: acts/judge-profile
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: for each context in the [Index Base](index-base.md), the category whose objects are recognised terms, types, and judgements established by [ProfileRecognitions](../acts/profile-recognitions.md).
- Morphisms: judgemental morphisms between recognised objects that respect the profile’s typing and entailment rules.
- Structure: inherits identities and composition from the judgemental data supplied by [JudgeProfile](../acts/judge-profile.md).

## Invariants
- Every fibre is cartesian closed to the extent earned by the profile recognitions; morphisms preserve typing and recognised equalities.
- Reindexing along context morphisms (defined separately) acts functorially between fibres, preserving identities and composition.

## Proof
- Derived from: [JudgeProfile](../acts/judge-profile.md), which equips each context with recognised terms, types, and judgements.
- Shows that: the judgemental data of the profile forms a category in each context; identities and composition follow from the profile’s typing and entailment closure, yielding the fibre categories used in indexed semantics.
