---
title: Documentation Command
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-recognition
uses: []
produces: []
used_by:
  - program/documentation/operator/documentation-nucleation
produced_by:
  - program/documentation/operator/documentation-nucleation
---
# Documentation Command

Program-level command carrier representing a validated documentation rewrite or
measurement task.

## Definition
- Carrier: derived from [Computer Recognition](../../../../../documents/articles/notes/computer-recognition.md),
  scoped to documentation actions (measure, split, link, derive, mark-provisional).
- Fields: action verb, target docs, parameters (e.g., new paths, derived_from),
  provenance, and constraints.
- Purpose: normalize planned rewrites/measurements into executable commands over
  the documentation workspace.

## Invariants
- Validated: commands must reference existing docs or declared new ones with
  proper layer/kind metadata.
- Layer-safe: commands must not introduce upward edges or missing proofs.
- Traceable: commands carry provenance for audit and replay.

## Proof
- Derived from: [Computer Recognition Carrier](../../../../../documents/articles/notes/computer-recognition.md).
- Shows that: restricting recognitions to documentation actions yields an
  executable command carrier aligned with the computer recognition semantics.
