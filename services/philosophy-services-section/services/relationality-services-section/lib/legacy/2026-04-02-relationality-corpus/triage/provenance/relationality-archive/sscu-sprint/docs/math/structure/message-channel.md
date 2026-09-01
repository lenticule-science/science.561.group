---
name: message-channel
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Carrier for messages as traced observations between agents.

## Definition
- Components: per-edge [Context](context.md), message traces as
  [Observations](observation.md), and ordering/causality constraints along the
  channel.
- Structure: source/target contexts, buffer of in-flight observations, and
  admissible observation witnesses.

## Invariants
- Causality: message order respects channel context; no time-travel on a single
  channel.
- Integrity: observations carry provenance; partial traces remain consistent.
- Compatibility: channel restrictions/pullbacks preserve observation witnesses.

## Proof
- Uses: [Context](context.md) and [Observation](observation.md) to define the
  channel.
- Shows that: message exchange can be modelled as recognised observations along
  structured contexts, supporting social flow and distributed snapshots.
