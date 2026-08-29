---
title: Reduction and Normalization Structure
role: Reduction step, strong normalization, and confluence package for relational
  terms.
inputs: []
outputs:
- id: reduction-normalization-structure
  name: normalization
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The acts `Reduce`, `NormalizeStrongly`, and `EnsureConfluence`, together with
the normalization/reducibility theorem, induce a reduction-and-normalization
structure on relational terms:

- `Reduce` defines the primitive step relation on terms,
- the reducibility acts show that well-typed/reducible terms are strongly
  normalising under this step relation, and
- `EnsureConfluence` guarantees that, under the same hypotheses, the step
  relation is confluent.

Consequently, for the class of terms covered by the normalization theorem:

- every reduction sequence terminates in a normal form, and
- the normal form is unique up to the earned equivalences.

This structure is the basis for any interpreter or evaluator: it provides the
step relation and the guarantee that evaluation is well-behaved on the earned
programs.

## Proof
- TODO: fill proof.
