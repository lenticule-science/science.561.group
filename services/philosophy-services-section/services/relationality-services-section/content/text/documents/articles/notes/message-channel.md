---
title: Message Channel
id: message-channel
role: structure
status: plan
proof_refs: []
---



Carrier for messages as traced observations between agents.

## Definition
- Components: per-edge [Context](./context.md), message traces as
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
- Uses: [Context](./context.md) and [Observation](observation.md) to define the
  channel.
- Shows that: message exchange can be modelled as recognised observations along
  structured contexts, supporting social flow and distributed snapshots.
