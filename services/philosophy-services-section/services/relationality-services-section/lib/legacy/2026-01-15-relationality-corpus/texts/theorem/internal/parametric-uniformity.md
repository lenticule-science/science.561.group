---

title: Parametric Uniformity
tags:
  - parametricity
  - indexed
  - effect
  - coeffect
depends-on:
  - indexed-category
  - context-flow
  - context-nucleus
  - dynamic-residuation
  - context-adjunction-witness
  - parametric-effect
  - parametric-coeffect
  - parametric-monad-fiber
  - parametric-monad-reindex
  - parametric-comonad-fiber
  - parametric-comonad-reindex
  - parametric-module
  - parametric-nat
  - parametricity
form: research
# Theorem (Parametric Uniformity)

Parametric semantics live entirely inside the relational calculus.  The acts
listed below witness that reindexing, effect/comonad structure, and logical
relations are already present and interact coherently.

## 1. Indexed contexts

**Theorem 1 (Indexed context category).**  
[Indexed Category](../../../acts/indexed-category.md) equips the context layer
with reindexing functors.  [Context Flow](../../../acts/context-flow.md),
[Context Nucleus](../../../acts/context-nucleus.md), and
[Dynamic Residuation](../../../acts/dynamic-residuation.md) form the adjoint
pair used for reindexing, and
[Context Adjunction Witness](../../../acts/context-adjunction-witness.md)
records the unit/counit equations.

*Proof sketch.* `IndexedCategory` earns the fibred structure.  The flow is left
adjoint to the nucleus by Dynamic Residuation, so every reindexing operation
arises from composing these adjoints.  The adjunction witness ensures coherence
across base-change. ∎

## 2. Effects, coeffects, and modules

**Theorem 2 (Effect–coeffect duality).**  
[Parametric Effect](../../../acts/parametric-effect.md) and
[Parametric Coeffect](../../../acts/parametric-coeffect.md) extend the indexed
category with an effect monad and coeffect comonad.  Their fibres and reindexing
behaviour are recorded by
[Parametric Monad Fiber](../../../acts/parametric-monad-fiber.md),
[Parametric Monad Reindex](../../../acts/parametric-monad-reindex.md),
[Parametric Comonad Fiber](../../../acts/parametric-comonad-fiber.md), and
[Parametric Comonad Reindex](../../../acts/parametric-comonad-reindex.md).
Modules and naturality witnesses appear in
[Parametric Module](../../../acts/parametric-module.md) and
[Parametric Nat](../../../acts/parametric-nat.md).

*Proof sketch.* Each cited act proves compatibility of the effect/coeffect
structures with reindexing.  The fibres preserve the adjunction, and the
reindexing acts show how substitution along the base affects the modal
structure.  Together they give a uniform effect–coeffect duality inside every
indexed slice. ∎

## 3. Abstraction theorem

**Theorem 3 (Parametric abstraction).**  
[Parametricity](../../../acts/parametricity.md) states that any term respecting
the indexed reindexings is uniform across all contexts: two related arguments
remain related after flowing along the parametric effect/comonad stack.

*Proof sketch.* The act is exactly the relational abstraction theorem: its proof
shows that a term invariant under the parametric action is indistinguishable in
all reindexed contexts.  The fibres/reindexing laws above provide the semantic
backbone for this argument, so the theorem follows immediately. ∎

## 4. Logical relations and contextual equivalence

**Theorem 4 (From parametricity to contextual equivalence).**  
Let `~ₚ` be the parametric relation from `Parametricity` and `~₍ctx₎` the
contextual equivalence witnessed in
[Relational Equivalence](relational-equivalence.md).
Then `~ₚ` refines `~₍ctx₎`: parametric equals imply contextual equality.

*Proof sketch.* `Parametricity` already shows that uniform terms cannot be
distinguished by any reindexed context; `Relational Equivalence` characterises
contextual indistinguishability via the observation hierarchy.  Since every
context arises from the indexed adjunction above, the parametric relation is a
subset of contextual equivalence. ∎

## Summary

| Feature | Witnessing acts |
| ------- | ---------------- |
| Indexed contexts | `IndexedCategory`, `ContextFlow`, `ContextNucleus`, `DynamicResiduation`, `ContextAdjunctionWitness` |
| Effects/coeffects | `ParametricEffect`, `ParametricCoeffect`, fibres/reindexing acts, `ParametricModule`, `ParametricNat` |
| Abstraction theorem | `Parametricity` |
| Link to contextual equivalence | `Parametricity` + `Relational Equivalence` |

This theorem packages the entire parametric semantics story inside the calculus,
so later texts can cite it whenever uniformity across contexts is required.
