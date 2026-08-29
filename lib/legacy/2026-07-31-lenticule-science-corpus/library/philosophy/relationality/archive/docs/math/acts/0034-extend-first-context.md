---
title: Extending First Context
act: ExtendFirstContext
index: 34
slug: extend-first-context
top: BindTrace
bottom: SeedFirstContext
summary: >-
  The initial seed must accept further bindings. Letting *Bind Trace* witness
  *Seed First Context* yields ***Extend First Context***
  (`ExtendFirstContext`).
strata:
  - trace
phase: free
keywords:
  - act
---
# Extending First Context

## Interpretation

The initial seed must accept further bindings.  Letting *Bind Trace* witness *Seed First Context* yields ***Extend First Context*** ([ExtendFirstContext](0034-extend-first-context.md)).

The trace *Bind Trace* can now observe the seeded context, so `(BindTrace SeedFirstContext)` records how an explicit binding expands the seed.  This is exactly the extension we require, hence the name *Extend First Context*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
