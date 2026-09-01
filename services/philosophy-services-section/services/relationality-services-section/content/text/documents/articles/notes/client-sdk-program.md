---
title: Client SDK Program
id: client-sdk-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---



A program-layer wiring that exposes the kernel via client SDKs. It wraps intake,
policy, and telemetry so external applications interact with the machine
without bypassing earned constraints.

## Behaviour
- Validate and normalise client requests via computer
  [Recognition](./recognition.md) and
  [Recognize Spec](./recognize-spec.md); attach auth/trace
  context into [Computer Evaluation State](./computer-evaluation-state.md).
- Build/execute runbooks for SDK calls via
  [Plan Runbook](./plan-runbook.md),
  [Evaluate Step](./evaluate-step.md),
  [Detect Plan Conflicts](./detect-plan-conflicts.md), and
  [Stabilize Plan](./stabilize-plan.md).
- Forward requests to recognition/storage/evaluation endpoints; validate
  responses and update the [Program Wiring Plan](./program-wiring-plan.md).
- Snapshot SDK state via [Snapshot Plan](./snapshot-plan.md) using
  [Program Snapshot](./program-snapshot.md) and
  [Program Transcript](./program-transcript.md).
- Emit telemetry via measurement fabric; surface failures as
  [Computer Failure](./computer-failure.md).

## Invariants
- Requests are policy-compliant and traceable.
- Responses validate against computer recognition carriers.
- Failures surface as [Computer Failure](./computer-failure.md); state unchanged on failure.
- Deterministic processing for a given request/runbook; failures are explicit
  (auth/policy violations, type errors, plan conflicts).

## Proof
Refines the computer [Wiring Plan](./computer-wiring-plan.md)
by fixing endpoints and policy checks for SDK calls while preserving kernel
failure semantics and exposing only computer carriers/operators; uses shared
program-layer primitives for command normalisation, planning, conflict
handling, and snapshotting.
