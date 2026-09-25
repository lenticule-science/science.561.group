---
title: Effect Monad
id: effect-monad
role: structure
status: plan
proof_refs: []
---



## Definition
- Base: [Monad Fiber](./monad-fiber.md) equips each fixed fibre with a monad action.
- Reindexing: [Monad Reindex](./monad-reindex.md) transports monadic objects along base morphisms while preserving the monad laws.
- Structure: assembles these into the indexed effect monad over the fixed-profile fibres.

## Invariants
- Reindexing commutes with the monad unit and multiplication; pullbacks of monadic objects preserve structure.
- Functorial across the index base: identity and composition of base morphisms act as identity and composition on pulled-back monadic objects.

## Proof
- Uses: [Monad Fiber](./monad-fiber.md) for fibrewise monads and [Monad Reindex](./monad-reindex.md) for compatibility along the base.
- Produced by: [Monad Reindex](./monad-reindex.md), which constructs the pulled-back monadic objects used to assemble the indexed monad.
- Shows that: fibrewise monads plus reindexing compatibility satisfy the definition of an indexed monad, yielding the effect structure used by parametricity and uniformity results.
