---
title: Intake Observation Carrier
id: intake-observation
role: structure
status: plan
derived_from: acts/seed-observation
proof_refs: []
---


# Intake Observation Carrier

## Definition
- Carrier: intake observations backed by recognitions.
- Source: earned from [Seed Observation](./seed-observation.md); refined by [Profile Observation Recognitions](./profile-observation-recognitions.md) to align with profiled recognitions.

## Invariants
- Seeded observations are compatible with profile observation recognitions.
- Stable under additional profiling without altering existing observation semantics.

## Proof
- Derived from: [Seed Observation](./seed-observation.md), which seeds intake observations.
- Shows that: seeding observations and aligning them with profile recognitions yields the intake observation carrier.
