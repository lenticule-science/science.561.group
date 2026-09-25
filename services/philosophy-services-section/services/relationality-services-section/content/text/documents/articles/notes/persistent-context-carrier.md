---
title: Persistent Context Carrier
id: persistent-context-carrier
role: structure
status: plan
proof_refs: []
derives-from: acts/retrace-context
---



## Definition
- Carrier: contexts that can be saved and replayed with a stabilised baseline tail without changing relational meaning.
- Components: initial seeding, renewal/extension along a trace, retracing over a stored baseline.
- Source: earned via [Retrace Context](./retrace-context.md), with supporting acts [Seed First Context](./seed-first-context.md), [Renew Context](./renew-context.md), [Extend Context](./extend-context.md), and [Baseline Limit](./baseline-limit.md).

## Invariants
- Closed under renewal and retrace: replaying a persisted context yields an equivalent context.
- Baseline stability: the tail provided by `BaselineLimit` remains fixed across save/reload cycles.

## Proof
- Derived from: [Retrace Context](./retrace-context.md), which earns the ability to replay stored contexts.
- Shows that: the retrace act, together with seeding, renewal/extension, and baseline fixation, induces a carrier of contexts stable under persistence and replay.

## Earlier material

## Definition
- Carrier: contexts that can be saved and replayed with a stabilised baseline tail without changing relational meaning.
- Components: initial seeding, renewal/extension along a trace, retracing over a stored baseline.
- Source: earned via [Retrace Context](retrace-context.md), with supporting acts [Seed First Context](seed-first-context.md), [Renew Context](renew-context.md), [Extend Context](extend-context.md), and [Baseline Limit](baseline-limit.md).
