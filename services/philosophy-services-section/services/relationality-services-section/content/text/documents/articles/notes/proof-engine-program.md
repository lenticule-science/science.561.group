---
title: Proof Engine Program
id: proof-engine-program
role: structure
status: someday
derived_from: computer/type/documentation-interpreter
proof_refs: []
---



Program-level engine that executes proof scripts and runbooks over the computer
kernel, producing proof certificates or explicit failures. It exposes a
program-facing API for ingesting proofs, compiling them into
[Computer Wiring Plans](./computer-wiring-plan.md),
stepping them deterministically, and persisting checkpoints.

## Definition
- Inputs:
  - Proof scripts/runbooks recognised into
    [Computer Wiring Plans](./computer-wiring-plan.md)
    via [Recognition](./recognition.md).
  - Initial [Computer Evaluation State](./computer-evaluation-state.md)
    seeded with obligations, environments, and goal queue.
- Execution (reduction semantics):
  1. Validate the plan for acyclicity, typing, and required witnesses.
  2. Iterate [Evaluate Step](./evaluate-step.md) over
     the plan, invoking machine-level reductions through computer carriers.
  3. For each goal, require a recognised witness; unfulfilled goals emit
     [Computer Failure](./computer-failure.md) tagged
     with the offending obligation and environment.
- Persistence:
  - Checkpoint intermediate states and certificates through
    [Computer Storage](./storage.md) into
    [Computer Snapshots](./computer-snapshot.md) to
    allow replay, bisimulation, and audit.
- Outputs:
  - Updated wiring plans that encode remaining goals or extracted lemmas.
  - Updated evaluation state capturing bindings and ready queues.
  - Success as a proof certificate embedded in the evaluation bindings; failure
    as [Computer Failure](./computer-failure.md)
    without mutating committed bindings.

## Invariants
- Soundness: every accepted step must be justified by a recognised witness;
  no unchecked state transitions or assumption leaks.
- Determinism: given an identical wiring plan, evaluation state, and snapshot
  sequence, execution yields the same bindings and certificate hashes.
- Failure purity: obligation or typing failures emit
  [Computer Failure](./computer-failure.md) and leave
  prior bindings untouched; recovery must restart from a saved snapshot.
- Auditability: every step, witness, and binding is available for replay from
  stored [Computer Snapshots](./computer-snapshot.md)
  so third parties can independently check the proof trace.

## Proof
- Derived from: [Computer Kernel](./documentation-interpreter.md).
- Shows that: encoding proof scripts as computer wiring plans and stepping them
  through kernel operators yields a proof engine that preserves machine
  semantics, surfaces failures explicitly, and remains replayable under
  snapshot/restore without adding new computational effects.
