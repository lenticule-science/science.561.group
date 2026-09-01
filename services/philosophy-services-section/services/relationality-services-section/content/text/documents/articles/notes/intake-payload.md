---
title: Intake Payload Carrier
id: intake-payload
role: structure
status: plan
derived_from: acts/seed-observation
proof_refs: []
---



## Definition
- Carrier: raw intake data that can be seeded into observations.
- Source: earned from [Seed Observation](./seed-observation.md), which introduces payloads for observation seeding.

## Invariants
- Payloads are admissible inputs for the seeding act.
- Payload content remains stable through seeding into observations.

## Proof
- Derived from: [Seed Observation](./seed-observation.md), which establishes payloads as observation inputs.
- Shows that: the seeding act induces a carrier of payloads suitable for intake observations.
