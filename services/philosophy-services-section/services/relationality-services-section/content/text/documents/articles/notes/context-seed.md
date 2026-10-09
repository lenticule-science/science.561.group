---
title: Context Seed
id: context-seed
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/seed-first-context
description: Initial context seeded from a trace, earned by SeedFirstContext and extended by ExtendFirstContext.
---



Initial context seeded from a trace, earned by `SeedFirstContext` and extended
by `ExtendFirstContext`.

## Components

- Seed context anchored in `Nothing`.
- Extension witness: bindings added by `BindTrace` stay attached to the seed.

## Proof

Sketch: `SeedFirstContext` anchors the trace in `Nothing`; `ExtendFirstContext`
shows bindings attach. Combine to define the seed context carrier.
