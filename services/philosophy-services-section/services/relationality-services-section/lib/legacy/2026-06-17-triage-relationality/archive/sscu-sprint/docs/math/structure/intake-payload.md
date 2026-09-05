---
title: Intake Payload Carrier
role: structure
derived_from: acts/seed-observation
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: raw intake data that can be seeded into observations.
- Source: earned from [Seed Observation](../acts/seed-observation.md), which introduces payloads for observation seeding.

## Invariants
- Payloads are admissible inputs for the seeding act.
- Payload content remains stable through seeding into observations.

## Proof
- Derived from: [Seed Observation](../acts/seed-observation.md), which establishes payloads as observation inputs.
- Shows that: the seeding act induces a carrier of payloads suitable for intake observations.
