---
title: Seeding Terms
act: SeedTerm
index: 49
top: HeadTrace
bottom: TraceContext
summary: >-
  To allow a trace head to address a recognised context as a term, we direct
  the act *Head Trace* to witness the act *Trace Context*.
strata:
  - term
phase: free
keywords:
  - act
---

## Interpretation

To allow a trace head to address a recognised context as a term, we direct the act *Head Trace* to witness the act *Trace Context*.

The composition `(HeadTrace TraceContext)` inserts the head of the trace into the recorded context, exactly forming the seed needed for terms, so we call it *Seed Term*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
