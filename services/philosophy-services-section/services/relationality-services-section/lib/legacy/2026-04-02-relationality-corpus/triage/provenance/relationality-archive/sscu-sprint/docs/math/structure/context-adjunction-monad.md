---
name: context-adjunction-monad
role: structure
derived_from:
- acts/context-adjunction-witness
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Monad and comonad induced by the context adjunction.

## Components

- Monad from `flow ⊣ nucleus` coincides with the profile nucleus monad.
- Comonad from `flow ⊣ nucleus` coincides with the profile flow comonad.

## Proof

Sketch: use the unit/counit from the adjunction (ContextAdjunction) to build
the monad/comonad and identify them with the earned profile closure/flow
structures.
