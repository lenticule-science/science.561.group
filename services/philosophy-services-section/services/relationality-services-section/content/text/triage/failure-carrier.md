---
title: Kernel Failure Carrier
kind: structure
layer: machine
status: plan
derived_from:
  - system/structure/task-carrier
uses: []
used_by:
  - machine/operator/evaluate-step
  - machine/operator/recognition
  - machine/operator/storage
  - machine/operator/wiring
  - machine/structure/kernel
---

The kernel records failures as first-class carriers so that runbooks and
operators can propagate and inspect them without ambiguity.

## Components

- `kind` — classification (`RecognitionFailure`, `EvaluationFailure`,
  `StorageFailure`, `WiringFailure`).
- `origin` — the machine operator that raised the failure, with arguments.
- `diagnostics` — structured explanation (violated preconditions/theorems).
- `snapshot` — optional reference to the state/snapshot involved.

## Usage

- Machine operators may emit a `FailureCarrier` instead of a successful
  result when their preconditions are not met.
- Runbooks halt dependent tasks when a `FailureCarrier` is present and record
  it as part of execution history.
