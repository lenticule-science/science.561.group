---
title: Extending First Context
act: ExtendFirstContext
slug: extend-first-context
top: BindTrace
bottom: SeedFirstContext
summary: >-
  The initial seed must accept further bindings. Letting *Bind Trace* witness
  *Seed First Context* yields ***Extend First Context***
  (`ExtendFirstContext`).
tags:
  - act
---
# Extending First Context

## Interpretation

The initial seed must accept further bindings.  Letting *Bind Trace* witness *Seed First Context* yields ***Extend First Context*** ([ExtendFirstContext](extend-first-context.md)).

The trace *Bind Trace* can now observe the seeded context, so `(BindTrace SeedFirstContext)` records how an explicit binding expands the seed.  This is exactly the extension we require, hence the name *Extend First Context*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
