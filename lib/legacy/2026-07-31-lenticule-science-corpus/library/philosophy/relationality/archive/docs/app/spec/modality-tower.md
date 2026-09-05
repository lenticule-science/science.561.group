---
title: Modality Tower Simulation
keywords:
  - simulation
  - modality
  - tower
depends_on:
  - theorem/internal/modal-structure
---

To support a relational computer that reasons with stacked modalities (always,
eventually, nested irrationals, etc.), we simulate the modality tower described
in **Theorem (Modal Structure)**.

## State representation

- **Base predicates.**  
  Propositions over stabilized recognitions in a fixed physics/profile slice of
  the kernel. Concretely, predicates are boolean-valued observables on
  `FixedProfileRecognitions` (or a finite subset) derived from the judgment
  calculus and measurement stack; this specification does not introduce a new
  global state space.

- **Modal operators.**  
  Implementations of `□`, `◇`, truncations, and irrational variants as
  functions over these predicates, approximating the earned acts in the modal
  stack while reusing the flow/nucleus structure of the kernel.

- **Tower cache.**  
  Local data structure storing iterated applications of modal operators:
  `T[level]` holds the predicate vector/expression after `level` iterations for
  a chosen finite slice. It is a simulation cache, not a separate store of
  truth.

## Inputs

1. Initial predicate family `P`.
2. Transition structure (flow/nucleus) for computing modal successors.
3. Tower specification (sequence of operators to apply, e.g., `[□, ◇, □]`).

## Procedures

1. **Base evaluation.**  
   Evaluate `P` on the state space.

2. **Iterative application.**  
   For each operator in the tower, apply it to the current predicate, recording
   intermediate results.  Support both linear towers (fixed sequence) and
   branching structures (tree of modalities).

3. **Stability detection.**  
   Detect when iterated applications stabilise (predicate stops changing) to
   emulate `QuadraticModality` behaviour.

4. **Temporal reasoning.**  
   Provide APIs to query whether a state satisfies a tower pattern (e.g., `□◇P`).

## Invariants

- Each modal operator must be monotone; assert this by checking that `P ≤ Q`
  implies `op(P) ≤ op(Q)`.
- Tower cache should eventually stabilise (or repeat) for primitive substitutions.
- Comparisons between `□P` and `□□P` should satisfy the KZ slack constraints.

## Outputs

- Tower evaluation results for each state.
- Stabilisation levels and diagnostics for KZ violations.
