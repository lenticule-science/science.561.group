---
title: "The Settlement of Work Management: How Infrastructure Turns Inquiry Into Process"
date-created: 2026-04-03
description: "As work infrastructure matures, questions like 'what should I do next?' settle from open inquiry through derivation and procedure into deterministic process — the same settlement path that applies to the work being managed."
---

As a work system matures, the question "what should I do next?" changes character.
In a new project with no infrastructure, answering that question is genuine [inquiry](../terms/inquiry.md) — both the meaning of "next" and the method for finding it are open.
With some structure in place (a backlog, some priorities), it becomes [derivation](../terms/derivation.md) — the meaning is settled but the answer follows from judgment.
With a dependency graph and status tracking, it becomes [procedure](../terms/procedure.md) — follow the rules, but execution involves branching.
With a complete dependency graph, WIP limits, and readiness checks, it becomes [process](../terms/process.md) — the answer is deterministically computable.

This is the settlement path applied to work management itself.

## The progression

| Stage | "What's next?" is... | Infrastructure required |
|-------|---------------------|----------------------|
| Inquiry | An open question requiring deliberation | None — the human decides from memory and intuition |
| Derivation | Answerable by reasoning over known constraints | A backlog with some prioritization criteria |
| Procedure | Answerable by following rules with judgment at choice points | A dependency graph, status tracking, and dispatch rules |
| Process | Deterministically computable | Complete dependency graph, readiness checks, capacity constraints, and a pure function over the knowledge graph |

## What makes this interesting

Most work management systems aim for the procedure stage — give humans enough structure to make informed decisions.
The observation here is that the infrastructure already in place (knowledge graph, task dependencies, `dispatch-work.js`, `plan-status.js`) has pushed several common questions past procedure into process:

- "What tasks are ready?" → query the graph for open tasks with all dependencies met (process)
- "What plan has the most momentum?" → sort by completion percentage (process)
- "What's overdue?" → compare due-date against today (process)
- "What agent should do this task?" → match capabilities against task requirements (procedure, approaching process)

The settlement is not uniform.
"What's the highest-leverage task?" remains inquiry — leverage depends on context, goals, and judgment that no dependency graph captures.
"Should we revise this plan?" is derivation — the variance data informs but doesn't determine the answer.
The system settles what CAN be settled and leaves what can't to human judgment.

## The recursive application

The work type classification ([process](../terms/process.md), [procedure](../terms/procedure.md), [derivation](../terms/derivation.md), [inquiry](../terms/inquiry.md)) is itself a tool for managing work.
When the classification is applied to the act of managing work, it reveals where the management system has gaps:

- If "what's next?" is still inquiry in a mature system, the infrastructure is missing something (probably dependency declarations or readiness criteria)
- If "what's next?" is procedure but could be process, there's an automation opportunity
- If "what's next?" has been reduced to process, the system is working — the infrastructure has settled that question

This is why building work infrastructure is not overhead.
Each piece of infrastructure — a dependency graph, a status tracker, a dispatch function — settles one more question from inference to computation.
The system becomes more reliable not by trying harder but by needing to infer less.

## See also

- [Work Type Classification Survey](./work-type-classification-survey.md) — how the four types are defined and distinguished
- [The Algebraic Structure of Work](./algebraic-structure-of-work.md) — how settlement maps to substitution in the free algebra
- [Planning and Scheduling Survey](./planning-and-scheduling-survey.md) — the infrastructure traditions that enable this settlement
