---
title: Documentation Measurement Report
kind: structure
layer: program
status: someday
uses: []
produces: []
used_by:
  - program/documentation/structure/documentation-program
derives-from:
  - machine/structure/evaluation-state
produced-by:
  - program/documentation/operator/documentation-measure
description: A Documentation Measurement Report is a program-layer refinement of the machine Evaluation State that summarises measurement results over a Documentation Snapshot.
---

A **Documentation Measurement Report** is a program-layer refinement of the
machine [Evaluation State](../evaluation-state.md) that
summarises measurement results over a
[Documentation Snapshot](documentation-snapshot.md).
It is defined for any documentation corpus measured by the program.

## Fields
- **Blocking counts:** number of missing metadata/proofs/deps by layer.
- **Refactor counts:** number of legacy/structural issues by layer.
- **Top destabilizers:** ordered list of files with scores (blocking/refactor
  weights and proximity to acts).
- **Issue frequencies:** histogram of recurring issue codes (e.g., missing
  layer, missing kind, missing derived_from).

## Invariants
- All counts and scores are derived from the measured snapshot; no stale
  entries.
- Ordering of destabilizers follows proximity to acts (higher priority printed
  later).
- Report references only files present in the measured snapshot.

## Proof
Refines [machine/structure/evaluation-state.md](../evaluation-state.md)
by constraining evaluation data to documentation measurement outputs. The
report inherits evaluation-state integrity (well-formed state that can be
stored and reused) while specialising the content to measurement metrics.
