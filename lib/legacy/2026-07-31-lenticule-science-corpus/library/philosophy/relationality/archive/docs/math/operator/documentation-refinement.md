---
title: Documentation Refinement
id: documentation-refinement
role: Refine documentation graph nodes to eliminate defects while preserving layer/dependency
  rules.
status: plan
inputs:
- id: documentation-graph
  name: doc-graph
outputs:
- id: documentation-graph
  name: refined-graph
transformation:
- return
- value
proof_refs: []
---


# Documentation Refinement

The **Documentation Refinement** operator is the system-level flow over the
documentation graph that identifies defective docs and steps them toward an
atomic, well-typed state.

## Definition
- Predicates:
  - `WellTyped(d)`: the doc respects its layer/kind, states exactly one
    structure/operator, and uses only earned vocabulary.
  - `Defect(d)`: negation of `WellTyped(d)`, classified into defect kinds
    (atomicity, instantiation, metadata, vocabulary) ordered by priority.
- Function `Next(d)`: selects nearest defective docs from `d`, ordered by
  proximity to acts and defect priority.
- Relation `Refine ⊆ |D| × |D|`: single refinement steps (splitting, tightening
  deps, aligning content).

## Behaviour
- Given a slice of the documentation graph, compute `Next`, choose a target,
  apply a `Refine` step to reduce defects, and update the graph.

## Invariants
- Refinement steps reduce or eliminate defects.
- Layer and dependency rules remain satisfied after each step.

## Proof
- Uses: `detect-doc-defects` to classify defects, `select-next-doc` to prioritise
  targets, and `apply-refine-step` to perform defect-reducing edits on the
  [Documentation Graph](../system/structure/documentation-graph.md).
- Shows that: each refinement step reduces defects while preserving
  layer/dependency/vocabulary invariants, yielding a progressively refined
  documentation graph.
