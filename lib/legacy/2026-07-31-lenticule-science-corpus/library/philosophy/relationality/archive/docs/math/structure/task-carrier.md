---
title: Task Carrier
id: task-carrier
role: structure
status: plan
derived_from: math/structure/trace
proof_refs: []
---


# Task Carrier

Finite units of work in an informational system: evaluation steps, flow
operations, measurement updates, each annotated with trace positions and
port/channel metadata.

## Definition
- Carrier: tasks as records containing a reference to an earned act step,
  required inputs/outputs, associated [System Trace](trace.md) spans,
  and port/channel bindings.
- Purpose: schedule and route work within the system subject to trace ordering,
  interface constraints, and policy.

## Invariants
- Trace alignment: each task references the trace spans it reads/writes.
- Port typing: inputs/outputs reference well-typed system interface ports.
- Policy awareness: tasks carry policy regime references when required.
- Finiteness: task sets are finite to admit precedence linearisation.

## Proof
- Derived from: [Trace Carrier](../math/structure/trace.md), using its
  ordered spine to attach trace spans to tasks.
- Shows that: enriching trace positions with port/channel bindings yields a
  schedulable task carrier suitable for system scheduling operators.
