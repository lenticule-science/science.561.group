---
title: Negate Recognition
id: negate-recognition
role: operator
status: plan
inputs:
- id: recognition
  alias: predicate
outputs:
- id: recognition
  alias: pseudocomplement
transformation:
- let
  - neg_predicate
    - call
      - negate-predicate
      - predicate
        - predicate
  - negation
    - call
      - update-predicate
      - predicate
      - neg_predicate
  - return
    - negation
proof_refs:
- recognition
- negate
description: "Pseudocomplement in the recognition lattice: returns the largest recognition whose meet with the input yields bottom, preserving support/window/scope via structural sharing."
---


Pseudocomplement in the recognition lattice: returns the largest recognition
whose meet with the input yields bottom, preserving support/window/scope via
structural sharing.

## Proof
- Derived from: the Negate act (pseudocomplement) on predicates.
- Shows that: the recognition pseudocomplement can be expressed by taking the pseudocomplement of the predicate
  while preserving support/window/scope and flow/nucleus data.
