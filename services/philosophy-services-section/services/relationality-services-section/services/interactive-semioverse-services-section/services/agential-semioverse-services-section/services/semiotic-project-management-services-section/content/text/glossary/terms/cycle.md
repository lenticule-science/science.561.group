---
name: "Cycle"
aliases:
  - "Cycle"
  - "cycle"
  - "work cycle"
date-created: 2026-03-07T00:00:00
authors:
  - claude
keywords:
  - ProjectManagement
  - Semiotics
  - ShapeUp
description: "An appetite-bounded work period tied to a single active plan."
defined-in:
  - ../index.md
requires:
  - ./appetite.md
  - ./circuit-breaker.md
---

A **cycle** is a bounded sequence of sessions with a declared scope
and a [circuit breaker](./circuit-breaker.md). Cycles are not
sprints (fixed-length iterations on a regular cadence); they are
[appetite](./appetite.md)-bounded work periods.

A cycle begins when a plan moves to active. The cycle's scope is
the plan's acceptance criteria. The cycle's budget is the plan's
appetite. When the appetite is exhausted without completion, the
circuit breaker fires.

Between cycles: [cool-down](./cool-down.md). Cool-down is
unstructured time for the encoding loop to run without pressure.
