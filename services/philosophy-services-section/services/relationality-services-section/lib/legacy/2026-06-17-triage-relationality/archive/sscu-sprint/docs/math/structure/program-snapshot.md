---
title: Program Snapshot
role: structure
derived_from: computer/type/computer-snapshot
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Program-layer snapshot derived from the computer snapshot, carrying program
state/workspace for persistence.

## Definition
- Carrier: [Computer Snapshot](../../type/computer-snapshot.md) specialised
  to program artefacts (workspace, plan, session).
- Fields (concrete at computer layer):
  - `snapshot_id` (string/UUID)
  - `timestamp` (ISO-8601 UTC)
  - `state_digest` (SHA-256 hex) over program workspace/session bindings
  - `plan_ref` (optional wiring plan id)
  - `workspace_digest` (optional SHA-256 hex) of workspace payload
  - `session_ref` (optional program session id)
  - `provenance` (actor/origin/trace_ref)
  - `integrity_hash` (SHA-256 hex) covering header+payload
  - `payload` (object): serialized workspace/session/plan bindings
- Serialization: JSON/YAML following the above; integrity hash recomputed over
  canonical serialization of header+payload.

## Invariants
- Integrity: hashes/digests cover id + payload; must verify on load.
- Fidelity: save/load round-trips yield equivalent program state.
- Stability: payload adheres to program schema; no extra state.

## Proof
- Derived from: [Computer Snapshot](../../type/computer-snapshot.md).
- Shows that: lifting computer snapshots to program payloads yields a reusable
  snapshot carrier for program persistence.
