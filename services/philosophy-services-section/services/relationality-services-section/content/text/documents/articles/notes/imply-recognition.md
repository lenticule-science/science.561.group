---
title: Imply Recognition
id: imply-recognition
role: operator
status: plan
inputs:
- id: recognition
  alias: antecedent
- id: recognition
  alias: consequent
outputs:
- id: recognition
  alias: implication
transformation:
- let
  - merged
    - call
      - recognition-merge
      - antecedent
      - consequent
  - impl_predicate
    - call
      - imply-predicate
      - antecedent
        - predicate
      - consequent
        - predicate
  - implication
    - call
      - update-predicate
      - merged
      - impl_predicate
  - return
    - implication
proof_refs:
- recognition
- recognition-merge
- imply-recognition
description: "Implication in the recognition lattice: returns the greatest recognition x such that antecedent ∧ x ≤ consequent, gluing supports/windows/scopes and updating the predicate."
---


Implication in the recognition lattice: returns the greatest recognition `x`
such that `antecedent ∧ x ≤ consequent`, gluing supports/windows/scopes and
updating the predicate.

## Proof
- Derived from: implication act on predicates plus sheaf gluing for
  supports/windows.
- Shows that: implication is earned as the right adjoint to meet over
  recognitions while preserving locality and flow/nucleus invariants.
