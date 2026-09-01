---
title: Failure Semantics
tags:
  - specification
  - failure
  - error
  - kernel
layer: machine
status: plan
depends-on:
  - machine/kernel
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Describes admissible failure modes for kernel operators and how failures propagate through wiring and runbooks."# Failure Semantics

This specification describes admissible failure modes for the Relational Machine Kernel
operators and how failures propagate through wiring and runbooks.

## 1. Failure kinds

Define a small set of kernel-level failure kinds:

- `RecognitionFailure` – criteria or policies fail to justify a recognition.
- `EvaluationFailure` – evaluation step is undefined on the current state.
- `StorageFailure` – save/load cannot complete (e.g. missing snapshot).
- `WiringFailure` – invalid port connections or cyclic runbooks.

Each failure kind must carry:

- the operator and arguments involved,
- a diagnostic message,
- and, where applicable, references to the recognitions or specs violated.

## 2. Operator behaviour

- **Recognition operators (`Rec_{ϕ,π}`).**  
  May fail with `RecognitionFailure` when:
  - the criterion does not hold,
  - the policy rejects the recognition.

- **Evaluation operators (`step`, `norm`).**  
  `step` may fail with `EvaluationFailure` when the primitive reduction is
  undefined; `norm` may fail when the earned normalisation guarantees do not
  apply.

- **Storage/persistence (`save`, `load`, `save_context`, `load_context`).**  
  `save` must not fail for earned states; `load` may fail with
  `StorageFailure` if the snapshot identifier is unknown or content is
  corrupted.

- **Wiring/runbooks (`connect`, `validate_runbook`, `plan_execution`).**  
  `connect` returns failure when `compatible` is false; `validate_runbook`
  returns failure when any connection is invalid or the graph is cyclic;
  `plan_execution` may fail with `WiringFailure` when no topological ordering
  exists.

## 3. Propagation through runbooks

Runbook execution must:

- treat kernel operator failures as step failures,
- stop executing dependent steps when a failure occurs,
- record the failure as a recognition with diagnostics,
- leave the global state in a well-defined condition:
  - no partial updates outside the effects of completed steps,
  - all invariants for sections, snapshots, and recognitions preserved.

## 4. Invariants

- Failures are explicit and typed; there is no silent divergence or
  unclassified error.
- Successful operators must not change behaviour in the presence of unrelated
  failures (no hidden global flags).
- Every failure must be explainable in terms of violated preconditions or
  theorems referenced by the failing operator.
