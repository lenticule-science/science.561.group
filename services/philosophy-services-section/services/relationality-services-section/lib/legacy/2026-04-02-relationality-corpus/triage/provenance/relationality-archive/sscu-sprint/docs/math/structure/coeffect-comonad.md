---
name: coeffect-comonad
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Base: [Comonad Fiber](comonad-fiber.md) equips each fixed fibre with a comonad action.
- Reindexing: [Comonad Reindex](../operator/comonad-reindex.md) transports comonadic objects along base morphisms while preserving the comonad laws.
- Structure: assembles these into the indexed coeffect comonad over the fixed-profile fibres.

## Invariants
- Reindexing commutes with counit and comultiplication; pullbacks of comonadic objects preserve structure.
- Functorial across the index base: identity and composition of base morphisms act as identity and composition on pulled-back comonadic objects.

## Proof
- Uses: [Comonad Fiber](comonad-fiber.md) for fibrewise comonads and [Comonad Reindex](../operator/comonad-reindex.md) for compatibility along the base.
- Produced by: [Comonad Reindex](../operator/comonad-reindex.md), which constructs the pulled-back comonadic objects used to assemble the indexed comonad.
- Shows that: fibrewise comonads plus reindexing compatibility satisfy the definition of an indexed comonad, yielding the coeffect structure used by parametricity and uniformity results.
