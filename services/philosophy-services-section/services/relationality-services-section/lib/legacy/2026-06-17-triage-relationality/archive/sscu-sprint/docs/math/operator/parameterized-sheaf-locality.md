---
title: Parameterized Sheaf Locality
role: operator
derived_from: math/operator/sheaf-locality
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



Executable locality witness: if two parameterized sections agree on a cover,
they are equal in the parameterized sheaf.

## Definition
- Inputs: two [Parameterized Sections](../structure/parameterized-section.md)
  over a window `U` and a cover `{Ui → U}` in the parameterized coverage site,
  with restrictions along each cover arrow.
- Output: equality witness (or refusal) showing the sections are equal when all
  restrictions coincide.
- Behaviour: applies the sheaf’s restriction functions to both sections on each
  cover element and overlap, checks equality of encoded payloads, and produces
  an equality certificate when all checks pass.

## Preconditions
- Restriction functions for the cover are total and deterministic.
- Section encodings support equality checks used by the sheaf.

## Postconditions
- Successful equality witness can be reused under cover refinements.
- Failure produces no equality witness; caller may attempt refinement or
  recomputation.

## Proof
- Derived from: [Sheaf Locality](../../math/operator/sheaf-locality.md) by
  executing restriction and equality checks with parameterized sheaf routines.
- Shows that: the earned locality law is realizable at the calculus level with
  executable evidence.
