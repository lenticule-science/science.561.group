---

name: board
  - "Board"
  - "board"
  - "project board"
  - "closure board"
date-created: 2026-03-07T00:00:00
introduces: term
keywords:
  - project-management
  - semiotics
  - kanban
description: "A projection of the project graph onto lifecycle states, showing how closure flows through the system."
defined-in:
  - ../index.md
---

A **board** is a projection of the project graph onto lifecycle
states. It shows how closure flows through the system.

| Column | Contents | Closure meaning |
|---|---|---|
| **Gap** | Predicate graph violations | Identified but unaddressed |
| **Shaped** | Plans with status: proposed or accepted | Path to closure is designed |
| **Active** | Plans with status: active | Closure in progress |
| **Closed** | Plans with status: completed | Partial closure achieved |

The board is generated from plan frontmatter by the review-plans
skill, not maintained by hand.

A [WIP limit](./wip-limit.md) constrains the potential column: at
most 2-3 plans active simultaneously. This prevents the system
from dispersing energy across too many partial closures.
