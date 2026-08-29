---
title: Judgment Value
id: judgment-value
role: structure
status: plan
derived_from:
- acts/seed-value
proof_refs: []
---


# Judgment Value

Value carrier for the judgment calculus, earned by `SeedValue` and
`RecognizeValue`.

## Components

- Seeded values from `SeedValue`.
- Recognition of values at the head of the trace via `RecognizeValue`.

## Proof

Sketch: `SeedValue` provides initial values; `RecognizeValue` identifies values
in the trace. Together define the value carrier for the evaluation structure.
