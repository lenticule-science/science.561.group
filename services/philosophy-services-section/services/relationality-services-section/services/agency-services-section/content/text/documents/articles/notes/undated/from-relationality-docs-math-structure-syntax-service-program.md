---
title: Syntax Service Program
id: syntax-service-program
role: structure
status: someday
proof_refs: []
derives-from:
  - computer/type/documentation-interpreter
description: Provides syntactic services (parsing, normalisation checks) over earned acts and structures.
---



Provides syntactic services (parsing, normalisation checks) over earned acts and
structures.

## Behaviour
- Ingest terms/derivations as [Computer Recognition](../../../../../../../../content/text/documents/articles/notes/computer-recognition.md).
- Validate admissibility and normalisation obligations via
  [Evaluate Step](../../../../../../../../content/text/documents/articles/notes/evaluate-step.md); emit results or failures.
- Expose APIs for syntax queries under policy controls.

## Invariants
- Only earned syntax/semantics are accepted.
- Outputs are traceable to inputs; failures are
  [Computer Failure](../../../../../../../../content/text/documents/articles/notes/computer-failure.md).

## Proof
Refines the documentation interpreter by specialising to syntax validation wiring,
preserving kernel failure semantics.
