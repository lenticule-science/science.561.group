---
title: Syntax Service Program
id: syntax-service-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---



Provides syntactic services (parsing, normalisation checks) over earned acts and
structures.

## Behaviour
- Ingest terms/derivations as [Computer Recognition](../../type/computer-recognition.md).
- Validate admissibility and normalisation obligations via
  [Evaluate Step](../../operator/evaluate-step.md); emit results or failures.
- Expose APIs for syntax queries under policy controls.

## Invariants
- Only earned syntax/semantics are accepted.
- Outputs are traceable to inputs; failures are
  [Computer Failure](../../type/computer-failure.md).

## Proof
Refines the documentation interpreter by specialising to syntax validation wiring,
preserving kernel failure semantics.
