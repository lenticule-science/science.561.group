---
title: Context Adjoint Functors
tags:
  - adjunction
  - monad
  - comonad
depends_on:
  - context-flow
  - context-nucleus
  - dynamic-residuation
  - context-adjunction-witness
---
# Theorem (Context Adjoint Functors)

In the context category, with acts

- `ContextFlow`,
- `ContextNucleus`,
- `DynamicResiduation`,
- `ContextAdjunctionWitness`,

we have:

1. **Adjunction.**  
   `ContextFlow` is left adjoint to `ContextNucleus`: for contexts `C, D`, the
   hom-recognitions `Hom(ContextFlow(C), D)` and
   `Hom(C, ContextNucleus(D))` are identified by `DynamicResiduation`.

2. **Monad/comonad from adjunction.**  
   The monad induced by this adjunction coincides with `GoldenMonad` (the
   profile nucleus monad) and the comonad coincides with `Comonad` (the
   profile flow comonad).

## Proof sketch

The residuation law gives the natural bijection between hom-recognitions.  The
unit and counit arise from the identity along this bijection, and the induced
monad/comonad match the closure and flow structures already defined for
`NucleateProfile` and `FlowProfile`.
