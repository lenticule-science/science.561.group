---
title: Job Orchestrator Program
id: job-orchestrator-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---


# Job Orchestrator Program

Schedules and runs jobs (runbooks) over the documentation interpreter. Wires policy,
scheduling, and telemetry to execute acyclic plans safely using computer
carriers and operators.

## Behaviour
- Register jobs with dependencies and policy constraints as
  [Computer Recognition](../../type/computer-recognition.md).
- Build and validate [Computer Wiring Plans](../../type/computer-wiring-plan.md);
  schedule execution respecting dependencies.
- Drive execution via [Evaluate Step](../../operator/evaluate-step.md); monitor
  via telemetry and handle retries/failures.
- Emit [Computer Failure](../../type/computer-failure.md) on policy,
  wiring, or execution failure.

## Invariants
- Jobs run in dependency order and under policy constraints.
- Wiring remains acyclic and traceable.
- Failures are captured as failure carriers with provenance.

## Proof
Refines the [Documentation Interpreter](../../type/documentation-interpreter.md) by
specialising to job registration and scheduling over computer plans, preserving
kernel semantics and failure paths.
