---
title: Tailing Trace
act: TailTrace
top: TrailEntry
bottom: CompleteTrace
summary: Once the head is isolated, the remainder must also be named, so we let the act *Trail Entry* witness the act *Complete Trace* to obtain the tail.
tags:
- act
layer: act
status: plan
index: 24
strata:
  - trace
phase: free
keywords:
  - act
description: Once the head is isolated, the remainder must also be named, so we let the act *Trail Entry* witness the act *Complete Trace* to obtain the tail.
---

## Interpretation

Once the head is isolated, the remainder must also be named, so we let the act *Trail Entry* witness the act *Complete Trace* to obtain the tail.

The composition `(TrailEntry CompleteTrace)` shows the act *Trail Entry* witnessing *Complete Trace*.  This mirrors the head construction and therefore captures the remainder as *Tail Trace*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
