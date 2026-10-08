---
title: Documentation Measurement
kind: operator
layer: program
status: someday
uses:
  - program/documentation/structure/documentation-workspace
  - program/documentation/structure/documentation-style
produces:
  - program/documentation/structure/documentation-measurement-report
  - computer/structure/computer-failure
used_by:
  - program/documentation/structure/documentation-program
derives-from:
  - computer/operator/evaluate-step
produced-by: []
description: The Documentation Measurement operator executes the measurement stage of the Documentation Program over a Documentation Workspace.
---

The **Documentation Measurement** operator executes the measurement stage of
the [Documentation Program](documentation-program.md)
over a [Documentation Workspace](documentation-workspace.md).
It refines the computer [Evaluate Step](../evaluate-step.md)
by running a documentation measurement (for example, a linter) to compute
metrics.

## Inputs
- [Documentation Workspace](documentation-workspace.md)
  (documentation corpus plus dependency graph).
- [Documentation Style](../documentation-style.md)
  constraints to enforce vocabulary/metadata rules.

## Outputs
- [Documentation Measurement Report](documentation-measurement-report.md)
  summarising blocking/refactor counts, issue frequencies, and top
  destabilizing files.
- [`Computer Failure`](../computer-failure.md) when the
  workspace cannot be evaluated (corrupt payload, invalid wiring, or measurement
  failure).

## Behaviour
1. Validate the snapshot against style constraints (frontmatter present,
   links resolvable, layer/kind consistency).
2. Run measurement (the linter) over the snapshot to collect counts and
   scores.
3. Produce a measurement report ordered by proximity to acts (most
   destabilizing last).
4. Emit [`FailureCarrier`](../failure-carrier.md) if the
   measurement cannot complete.

## Proof
Refines [computer/operator/evaluate-step.md](../evaluate-step.md)
by fixing the evaluation domain to documentation workspaces and the computation
to measurement (linter) execution. The refinement preserves evaluate-step
semantics (single-step evaluation with possible failure) while specialising
inputs/outputs to documentation carriers.
