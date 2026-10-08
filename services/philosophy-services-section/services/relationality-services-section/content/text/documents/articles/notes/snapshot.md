---
title: Snapshot
id: snapshot
role: structure
status: plan
proof_refs:
- storage-snapshot
fields:
- name: id
  type: trace
  description: snapshot lineage identifier (symbol/string).
- name: version
  type: trace
  description: monotone counter for successive saves.
- name: provenance
  type: trace
  description: "`{actor, origin, timestamp}` of the save."
- name: payload
  type: recognition
  description: recognitions and evaluation state being persisted.
- name: hash
  type: trace
  description: integrity hash over canonical payload.
description: Snapshot carrier refining the storage snapshot with identifiers, hashes, provenance, and payload (recognitions and evaluation state) suitable for encoding, saving, and loading.
---

# Snapshot

Snapshot carrier refining the storage snapshot with identifiers, hashes,
provenance, and payload (recognitions and evaluation state) suitable for
encoding, saving, and loading.

## Fields
- `id`: stable identifier for the snapshot lineage.
- `version`: monotone counter for successive saves.
- `provenance`: `{actor, origin, timestamp}` describing who/when/where saved.
- `payload`: recognitions and evaluation state being persisted.
- `hash`: integrity hash over the canonical payload.

## Invariants
- Integrity: `hash` covers payload and metadata; must verify on load.
- Fidelity: save/load round-trips yield observationally equivalent
  recognitions/evaluation state, or an explicit failure.
- Stability: payload adheres to the storage snapshot schema; no extra state.
- Monotonicity: `version` increases on each successful save in a lineage.

## Proof
- Uses: storage snapshot schema and the round-trip requirement captured in
  [Persistence Stack](persistence-stack.md).
- Shows that: adding ids/provenance/hash to the storage snapshot yields a
  carrier that supports encoding, saving, and loading with explicit integrity
  and round-trip guarantees.
