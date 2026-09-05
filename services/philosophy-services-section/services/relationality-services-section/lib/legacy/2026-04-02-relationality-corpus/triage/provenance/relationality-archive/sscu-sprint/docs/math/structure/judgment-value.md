---
name: judgment-value
role: structure
derived_from:
- acts/seed-value
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Value carrier for the judgment calculus, earned by `SeedValue` and
`RecognizeValue`.

## Components

- Seeded values from `SeedValue`.
- Recognition of values at the head of the trace via `RecognizeValue`.

## Proof

Sketch: `SeedValue` provides initial values; `RecognizeValue` identifies values
in the trace. Together define the value carrier for the evaluation structure.
