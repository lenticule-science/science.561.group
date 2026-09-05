---
title: Parametric Semantics
tags:
  - parametricity
  - monad
  - comonad
  - indexed-category
---
# Theorem (Parametric Semantics)

With acts

- `IndexedCategory`,
- `ParametricEffect`,
- `ParametricCoeffect`,
- `ParametricModule`,
- `ParametricNat`,
- `Parametricity`,

we have:

1. **Uniformity across contexts.**  
   Any term interpreted under parametric semantics is invariant under context
   change (reindexing) and the fixed flow, i.e. it behaves identically in all
   stabilised contexts.

2. **Effect–coeffect duality.**  
   The effect monad and coeffect comonad form a dual pair in the indexed
   category: effects distribute over coeffects and vice versa up to
   stabilization.

3. **Abstraction theorem.**  
   If two modules are contextually indistinguishable in one context, their
   interpretations are indistinguishable in all fixed contexts.

4. **Logical relations.**  
   The equality induced by parametricity is exactly the stabilised relational
   equality induced by `(ContextNucleus ContextFlow)`.

## Proof sketch

Uniformity follows from indexed monad/comonad interplay.  Duality follows from
the adjunction between flow and nucleus.  Abstraction follows from
parametricity: a term respecting all reindexings acts uniformly across contexts.
Logical relations follow from the nucleus-mediated collapse induced by
parametricity.
