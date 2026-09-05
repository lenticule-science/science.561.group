---

name: calendar-service-program
kind: structure
layer: program
derived_from: computer/structure/computer-kernel
uses:
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-evaluation-state
  - computer/structure/computer-recognition
  - computer/structure/computer-snapshot
produces:
  - computer/structure/computer-wiring-plan
used_by: []
produced_by: []
---

Program-layer API for relational calendar handling (events, recurrence, time
zones) built on the computer kernel.

## Definition
- Inputs: event specifications recognised via computer
  [Recognition](../../../computer/operator/recognition.md) into calendar event
  carriers; initial [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md).
- Plan: maintain a [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md)
  that encodes recurrence rules, time zones, dependencies, and conflict
  resolution; execute via [Evaluate Step](../../../computer/operator/evaluate-step.md).
- Persistence: save/restore calendars via [Computer Storage](../../../computer/operator/storage.md)
  and [Computer Snapshot](../../../computer/structure/computer-snapshot.md).
- Outputs: updated wiring plan/state and conflict/stability reports; failures
  as [Computer Failure](../../../computer/structure/computer-failure.md).

## Structures
- Calendar Event: recognition with start/end, recurrence, timezone, constraints.
- Timezone Profile: offsets/DST rules as parameters.
- Recurrence Rule: earned recurrence specification (freq, interval, exceptions).
- Conflict Report: conflicts detected among events (overlaps, policy violations).
- Calendar Schedule: binding of events into an executable wiring plan.

## Operators (API)
- `recognize_event`: ingest event specs into calendar event recognitions.
- `normalize_time`: apply timezone/offset rules to event instants.
- `plan_schedule`: build/refresh the wiring plan respecting dependencies,
  commutation, recurrence expansions.
- `detect_conflicts`: compute [Conflict Report] when overlaps or constraints
  collide.
- `stabilize_schedule`: adjust plan under changes, maintaining trace/policy
  invariants.
- `snapshot_schedule`: persist/restore calendar state.

## Invariants
- Time/zone fidelity: normalization uses explicit timezone profiles; no hidden
  offsets.
- Recurrence determinism: recurrence expansions are deterministic for given
  rules.
- Conflict purity: conflicts reported without mutating state; mutations flow
  through evaluate-step/plan.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: calendar handling (including Gregorian/timezone rules) can be
  expressed via computer recognition/evaluation/storage with domain parameters
  supplied as inputs, without extending machine semantics.
