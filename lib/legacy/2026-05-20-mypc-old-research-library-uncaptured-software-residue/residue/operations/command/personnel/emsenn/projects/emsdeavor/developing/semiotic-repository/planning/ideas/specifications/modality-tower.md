---

title: Modality Tower Simulation
aliases:
  - Modality Tower Simulation
  - modality tower simulation
date-created: "2026-03-04T00:00:00"
keywords:
  - simulation
  - modality
  - tower
depends_on:
  - theorem/internal/modal-stack
type: specification
description: Specification for simulating stacked modality towers with iterative modal operator application and stability detection.
target-discipline: mathematics
triage-status: promotable
---


# Specification (Modality Tower Simulation)

To support a relational computer that reasons with stacked modalities (always,
eventually, nested irrationals, etc.), we simulate the modal tower described in
**Theorem (Modal Stack)**.

## State representation

- **Base predicates.**  
  Collection of propositions on the state space (can reuse modal-logic spec
  infrastructure).

- **Modal operators.**  
  Implementations of `□`, `◇`, truncations, and irrational variants, each as
  functions over predicates.

- **Tower cache.**  
  Data structure storing iterated applications of modal operators: `T[level]`
  holds the predicate vector/expression after `level` iterations.

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
