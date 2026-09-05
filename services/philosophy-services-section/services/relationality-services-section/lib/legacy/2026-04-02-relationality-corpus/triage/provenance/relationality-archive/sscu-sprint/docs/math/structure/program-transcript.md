---
name: program-transcript
role: structure
derived_from: computer/type/computer-snapshot
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Program-layer transcript capturing ordered commands and outcomes for replay.

## Definition
- Carrier: [Computer Snapshot](../../type/computer-snapshot.md) extended
  with a typed event log over [Program Command](program-command.md),
  [Program Wiring Plan](program-wiring-plan.md), and [Program Session](program-session.md).
- Fields (concrete at computer layer):
  - `snapshot_id` (string/UUID, required)
  - `timestamp` (string, ISO-8601 UTC, required)
  - `provenance` (object `{actor, origin, trace_ref}`, required)
  - `state_digest` (string/SHA-256 hex, required): digest of program session/workspace at capture.
  - `plan_ref` (string, optional): identifier of the plan used during capture.
  - `events` (array, required): ordered list of event objects:
    - `seq` (integer, required)
    - `command_id` (string, required) referencing a program-command
    - `command_payload` (object, required) — serialized command content
    - `result` (object, optional) — serialized outcome on success
    - `failure` (object, optional) — serialized computer failure on failure
    - `bindings_digest` (string/SHA-256 hex, optional) — digest of bindings after the event
  - `integrity_hash` (string/SHA-256 hex, required): covers snapshot header + state_digest + events.
  - Suggested schemas:
    - JSON Schema: `events` as array items with `seq`, `command_id`, `command_payload`, `result|failure`, `bindings_digest`.
    - YAML runbook transcript: top-level keys `snapshot_id`, `state_digest`, `plan_ref`, `events:` with list entries, `integrity_hash`.

## Invariants
- Order-preserving: events are recorded in evaluation/trace order.
- Integrity: `integrity_hash` and `state_digest` must verify; each event’s
  `bindings_digest` matches the bound state after applying the event.
- Deterministic replay: replaying `events` from the referenced snapshot yields
  a program session whose digest equals `state_digest`.
- Reference integrity: `plan_ref` (if present) must exist; command_ids in the
  log refer to recorded commands.

## Proof
- Derived from: [Computer Snapshot](../../type/computer-snapshot.md).
- Uses: [Program Command](program-command.md), [Program Wiring Plan](program-wiring-plan.md),
  and [Program Session](program-session.md) to type the event log and replay
  target.
- Shows that: extending snapshots with typed, hashed event logs yields a
  replayable transcript consistent with computer storage semantics; replaying
  the log reproduces the recorded session up to observational equivalence.
