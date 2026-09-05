---
title: Computer Snapshot
id: computer-snapshot
role: structure
status: later
derived_from: machine/structure/snapshot
proof_refs: []
---



## Definition
- Carrier: program-facing snapshot derived from the machine [Snapshot](./snapshot.md).
- Fields (concrete at the computer layer):
  - `snapshot_id` (string/UUID, required)
  - `timestamp` (string, ISO-8601 UTC, required)
  - `state_digest` (string/SHA-256 hex, required): digest of serialized state.
  - `plan_ref` (string, optional): wiring plan identifier in use.
  - `bindings` (object, optional): serialized bindings for replay.
  - `provenance` (object `{actor, origin, trace_ref}`, optional)
  - `integrity_hash` (string/SHA-256 hex, required): covers header + payload.
- Purpose: enable programs to save/load state through the computer API without bypassing machine snapshot rules.

## Invariants
- Identifiers and contents match machine snapshots; integrity checks are enforced via computer operators.
- Round-tripping through computer storage preserves machine snapshot semantics.
- Integrity: `integrity_hash` must verify over the serialized header+payload.
- Replayability: if `bindings` are present, restoring yields an evaluation state consistent with `state_digest`.

## Proof
- Derived from: [Machine Snapshot](./snapshot.md).
- Shows that: lifting snapshots to the computer layer yields a persistence carrier suitable for SDKs while preserving machine invariants.
