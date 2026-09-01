---
title: Parametric Semantics Simulation
tags:
  - simulation
  - parametric
  - indexed
depends-on:
  - theorem/external/parametric-semantics
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Implements parametric semantics by building an indexed category with effect/coeffect structures."# Parametric Semantics Simulation

Implement **Theorem (Parametric Semantics)** by building an indexed category with
effect/coeffect structures and enforcing the abstraction theorem.

## State representation

- **Base category.**  
  Contexts and their morphisms, stored as nodes/edges in a graph.  Each object
  carries the data needed for reindexing (flow/nucleus witnesses).

- **Fibres.**  
  For each context `Γ`, maintain a fibre category of terms/judgements.  This can
  reuse the simply-typed lambda calculus simulation infrastructure.

- **Effect/Coeffect operators.**  
  Functors `T` and `G` acting on fibres, represented as transformation routines.

- **Logical relation store.**  
  Records parametric relations between fibre elements to enforce uniformity.

## Inputs

1. Base contexts and morphisms.
2. Definitions of effect/comonad actions on fibres.
3. Reindexing rules (seen as functors between fibres).

## Procedures

1. **Reindexing.**  
   Given `f: Γ -> Δ`, compute pullback functors `f^*` on fibres.  Check coherence
   with flow/nucleus operations.

2. **Effect/coeffect application.**  
   Apply `T` and `G` to fibre objects/morphisms, ensuring distributivity and
   duality laws hold.

3. **Parametricity checking.**  
   For each pair of terms related by the logical relation, verify that reindexing
   and modal actions preserve the relation.  Report violations.

4. **Abstraction theorem enforcement.**  
   When a term is uniform across contexts, mark it as parametric and memoise its
   relation class.

## Invariants

- Reindexing functors must be functorial (identity and composition laws).
- Effect/comonad pair must satisfy multiplication/comultiplication coherence.
- Parametric relation must be closed under reindexing and modal actions.

## Outputs

- Indexed-category object with fibre data.
- Reports showing which terms satisfy parametricity.
- Diagnostics for invariants (functoriality, duality, abstraction).
