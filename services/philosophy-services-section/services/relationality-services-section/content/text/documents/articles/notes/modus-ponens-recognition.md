---
title: Modus Ponens Recognition
id: modus-ponens-recognition
role: operator
status: plan
inputs:
- id: recognition
  alias: antecedent
- id: recognition
  alias: implication
outputs:
- id: recognition
  alias: consequence
transformation:
- let
  - combined
    - call
      - recognition-merge
      - antecedent
      - implication
  - result_predicate
    - call
      - modus-ponens-predicate
      - antecedent
        - predicate
      - implication
        - predicate
  - consequence
    - call
      - update-predicate
      - combined
      - result_predicate
  - return
    - consequence
proof_refs:
- recognition
- recognition-merge
- imply-recognition
- meet-recognition
- modus-ponens-act
description: "Inference: from A and A ⇒ B, derive B in the recognition lattice while preserving support/window/scope/provenance and flow/nucleus compatibility."
---

# Recognition Modus Ponens

Inference: from `A` and `A ⇒ B`, derive `B` in the recognition lattice while
preserving support/window/scope/provenance and flow/nucleus compatibility.

## Proof
- Uses: implication/meet adjunction on predicates plus sheaf gluing for
  supports/windows.
- Shows that: modus ponens is earned in the recognition lattice; given
  antecedent and implication, the consequence follows without violating locality
  or flow/nucleus invariants.
