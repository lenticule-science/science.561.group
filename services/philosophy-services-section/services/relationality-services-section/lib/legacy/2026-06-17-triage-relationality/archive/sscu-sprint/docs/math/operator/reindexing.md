---
title: Reindexing
role: operator
derived_from: acts/substitute-reducibility
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Inputs: a morphism in the [Index Base](../structure/index-base.md) and a judgemental object in the source [Fiber Category](../structure/fiber-category.md).
- Outputs: the pullback of that judgement along the base morphism as a judgemental object in the target fibre.
- Behaviour: restricts substitution along a context morphism, transporting recognised terms, types, and judgements while preserving the typing and entailment guarantees earned by the substitution reducibility act.

## Invariants
- Functorial: pulling back along identity morphisms is identity on fibres; pullbacks along composed morphisms compose accordingly.
- Type- and entailment-preserving: transported judgements remain well-typed and maintain the reducibility guarantees from [SubstituteReducibility](../acts/substitute-reducibility.md).

## Proof
- Derived from: [SubstituteReducibility](../acts/substitute-reducibility.md), which shows substitution preserves typing and entailment.
- Shows that: restricting substitution along a base morphism defines a functor between fibre categories, satisfying identity and composition laws and preserving recognised judgemental structure.
