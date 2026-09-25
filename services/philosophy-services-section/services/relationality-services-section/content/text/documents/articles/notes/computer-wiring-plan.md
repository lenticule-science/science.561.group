---
title: Computer Wiring Plan
id: computer-wiring-plan
role: structure
status: later
proof_refs: []
derives-from: machine/structure/wiring-plan
---



## Definition
- Carrier: execution plan for programs, derived from the machine [Wiring Plan](./wiring-plan.md).
- Fields (concrete at the computer layer):
  - `plan_id` (string/UUID): unique identifier for this plan.
  - `steps`: map from step id to operator reference plus metadata (policy, retry, observability).
  - `ports`: map from port id to carrier type and direction.
  - `edges`: list of directed connections `{from_port, to_port}` forming a graph over steps/ports.
  - `entry_steps` / `exit_steps`: sources/sinks of the plan.
  - `annotations` (optional): policy, audit, failure-handling hints.
  - `integrity_hash`: digest over the plan fields to detect tampering.
- Purpose: provide a program-facing runbook format that wires computer-level operators over computer carriers with explicit topology and integrity.
 - API formats (examples, implementation-dependent):
   - JSON Schema: ports typed by `$ref` to computer carriers; edges as array of `{from, to}`; steps declaring `operator`, `inputs`, `outputs`, `policy`.
   - YAML runbook: anchors for operators, steps keyed by id, `ports:` and `edges:` blocks, `integrity_hash:` at root.
   - Hashing rule: `integrity_hash = SHA256(canonical_json(plan_id, steps, ports, edges, entry_steps, exit_steps, annotations))`.

## Invariants
- Acyclic and well-typed with respect to computer operators/ports.
- Integrity: `integrity_hash` verifies over the plan fields; any modification requires recomputation.
- Refines the machine wiring invariants; every computer plan corresponds to a valid machine wiring plan.

## Proof
- Derived from: [Machine Wiring Plan](./wiring-plan.md).
- Shows that: lifting machine wiring to the computer layer yields a runbook format programs can author while respecting machine constraints.

## Earlier material

## Proof
- Derived from: [Machine Wiring Plan](wiring-plan.md).
- Shows that: lifting machine wiring to the computer layer yields a runbook format programs can author while respecting machine constraints.
