---
title: Parameterized Restrict
role: operator
derived_from: math/operator/hypertensor-restrict
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Executable restriction of a parameterized section along a cover arrow in the
parameterized coverage site.

## Definition
- Inputs: a [Parameterized Section](../structure/parameterized-section.md)
  over `U` and an inclusion `V → U` from the
  [Parameterized Coverage Site](../structure/parameterized-coverage-site.md).
- Output: the restricted section over `V`, encoded in the same payload format.
- Behaviour: calls the section’s restriction hook with the cover metadata,
  ensuring compatibility with overlap constructors and caching if available.

## Invariants
- Functoriality: restriction along identities is identity; along composites it
  matches iterated restriction.
- Coverage compatibility: restriction respects cover refinements and produces
  inputs suitable for matching-family and gluing operators.
- Determinism: given the same section and cover arrow, the restriction output
  is byte-identical or errors explicitly.

## Proof
- Derived from: [Hypertensor Restrict](../../math/operator/hypertensor-restrict.md)
  by fixing executable restriction hooks on parameterized sections.
- Shows that: the abstract restriction maps are realizable in calculus, feeding
  matching-family checks, gluing, and path composition lifts.
