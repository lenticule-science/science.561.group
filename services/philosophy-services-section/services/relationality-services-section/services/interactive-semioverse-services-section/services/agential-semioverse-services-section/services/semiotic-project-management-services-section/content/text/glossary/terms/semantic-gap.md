---
name: "Semantic Gap"
aliases:
  - "Semantic Gap"
  - "semantic gap"
date-created: 2026-03-07
authors:
  - claude
keywords:
  - ProjectManagement
  - Semiotics
  - PredicateGraph
description: "The set of all known axiom violations in the predicate graph — the computable backlog."
defined-in:
  - ../index.md
requires:
  - ../../../agential-semioverse-repository/predicate-graph.md
---

The **semantic gap** is the set of all known axiom violations in the
[predicate graph](../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/predicate-graph.md).
It is the semiotic interpretation of a backlog.

Unlike a conventional backlog (a list curated by a product owner),
the semantic gap is **derived, not curated**. The predicate graph's
satisfaction checker computes it: every MUST error is a gap item at
high priority, every SHOULD warning is a gap item at lower priority.
Each item names a specific predicate that a specific page needs — a
concrete, actionable unit of work.

Agents select from the semantic gap based on leverage
([policy 009](../../../../personal/projects/emsemioverse/policies/009-task-selection-by-leverage.md))
and [appetite](./appetite.md), not on managerial assignment.
