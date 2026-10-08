---
title: Judgment Value
id: judgment-value
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/seed-value
description: Value carrier for the judgment calculus, earned by SeedValue and RecognizeValue.
---



Value carrier for the judgment calculus, earned by `SeedValue` and
`RecognizeValue`.

## Components

- Seeded values from `SeedValue`.
- Recognition of values at the head of the trace via `RecognizeValue`.

## Proof

Sketch: `SeedValue` provides initial values; `RecognizeValue` identifies values
in the trace. Together define the value carrier for the evaluation structure.
