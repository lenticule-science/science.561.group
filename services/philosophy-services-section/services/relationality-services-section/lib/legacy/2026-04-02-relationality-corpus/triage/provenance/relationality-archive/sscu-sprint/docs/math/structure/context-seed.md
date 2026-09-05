---
name: context-seed
role: structure
derived_from:
- acts/seed-first-context
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Initial context seeded from a trace, earned by `SeedFirstContext` and extended
by `ExtendFirstContext`.

## Components

- Seed context anchored in `Nothing`.
- Extension witness: bindings added by `BindTrace` stay attached to the seed.

## Proof

Sketch: `SeedFirstContext` anchors the trace in `Nothing`; `ExtendFirstContext`
shows bindings attach. Combine to define the seed context carrier.
