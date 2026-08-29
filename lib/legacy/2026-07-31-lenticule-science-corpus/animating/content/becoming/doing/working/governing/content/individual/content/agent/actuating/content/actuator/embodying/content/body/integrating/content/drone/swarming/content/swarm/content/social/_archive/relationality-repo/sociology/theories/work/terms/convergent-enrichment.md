---
title: "Convergent Enrichment"
description: "A task prioritization strategy for bootstrapping a self-describing system: enrich from the bottom (foundational vocabulary) and the top (operational context) simultaneously, letting the two fronts converge in the middle where most work happens."
defines: convergent-enrichment
date-created: 2026-04-06
instance-of: method
applies-to: [plan, task, endeavor]
part-of-stage: planning
enables: [dispatch, settlement]
requires: [priority, leverage]
related: [settlement-path, progressive-automation, focus]
references:
  - id: reinertsen2009
    type: document
    title: The Principles of Product Development Flow
    author:
      - literal: Donald G. Reinertsen
    container-title: Celeritas Publishing
    issued:
      - year: 2009
  - id: goldratt1984
    type: document
    title: The Goal
    author:
      - literal: Eliyahu M. Goldratt
    container-title: North River Press
    issued:
      - year: 1984
  - id: rother2009
    type: document
    title: Toyota Kata
    author:
      - literal: Mike Rother
    container-title: McGraw-Hill
    issued:
      - year: 2009
  - id: ohno1988
    type: document
    title: Toyota Production System: Beyond Large-Scale Production
    author:
      - literal: Taiichi Ohno
    container-title: Productivity Press
    issued:
      - year: 1988
---

Convergent enrichment is a task prioritization strategy for bootstrapping a self-describing system — one where the infrastructure needed to plan work IS the work being planned.
The strategy: enrich from both ends simultaneously and let the two fronts meet in the middle.

## The problem

A self-describing system uses its own data to plan, dispatch, and track work.
But when the system's data is thin — when entities have too few predicates for the algebra to compute meaningful results — the system cannot intelligently plan its own enrichment.
Querying "what should be richer?" returns ⊥ (unknown) because the predicates that would answer that question are themselves missing.
The snake eats its own tail.

This is the cold-start problem applied to infrastructure.
A build system that needs itself to build itself.
A planning system too impoverished to plan its own improvement.
Goldratt's Theory of Constraints (1984) identifies this as a focusing problem: the constraint IS the system's information content, and you cannot identify the constraint using the constrained system.

## The strategy

Enrich from two directions:

**From below: foundational vocabulary.** The most basic terms in the system — [thing](../../../../philosophy/terms/thing.md), [quality](../../../../philosophy/terms/quality.md), [state](../../../../philosophy/terms/state.md), [act](../../../../philosophy/terms/act.md), [container](../../../../philosophy/terms/container.md), [relation](../../../../philosophy/terms/relation.md) — are the atoms everything else composes from.
Enriching these propagates upward: every entity that references `thing` inherits meaning through the graph.
A small investment at the bottom yields large returns across the entire vocabulary.

**From above: operational context.** The top-level entities — the [ship](./ship.md), the [charter](../theories/governance/terms/charter.md), the [goals](./goal.md) — provide the CONTEXT that makes lower-level entities meaningful.
A [task](./task.md)'s `part-of: some-plan` only computes if the [plan](./plan.md)'s fiber is rich enough to say something about the task.
Enriching the top provides the frame within which middle-level entities become informative.

**They converge in the middle.** The bottom provides VOCABULARY (what predicates mean).
The top provides CONTEXT (what predicates matter).
When they meet — when a plan entity has predicates grounded in library terms AND connected to the ship's goals — the algebra produces non-trivial results.
The middle layer (plans, tasks, offices) becomes self-informing.

## Why two fronts, not one

Enriching only from the bottom is the mathematical approach — get the foundations right and everything follows.
But without operational context, rich vocabulary is unused: the system knows what a "plan" is but not which plans matter.
Work stalls in abstraction.

Enriching only from the top is the managerial approach — define the goals and work backward.
But without vocabulary, operational entities are prose: the system has goals but can't compute whether a task serves them.
Work stalls in ambiguity.

The convergence is what Toyota Kata (Rother 2009) describes as the improvement kata: establish a target condition (top-down), then experiment toward it through small steps (bottom-up), measuring the gap between current and target at each iteration.
Ohno's Toyota Production System (1988) achieves this through pull: the top-level demand (what's needed) pulls enrichment from the bottom (what's available), and the gap between them IS the work queue.

Reinertsen (2009) provides the economic frame: the cost of delay for foundational vocabulary is HIGH but DIFFUSE (it blocks everything a little).
The cost of delay for operational context is HIGH and CONCENTRATED (it blocks specific immediate work).
Prioritize by which enrichment unblocks the most value soonest — which means alternating between bottom and top as each front's returns diminish.

## The settlement connection

In [settlement path](./settlement-path.md) terms: the bottom-up front is settling vocabulary from [inquiry](./inquiry.md) toward [process](./process.md).
The top-down front is settling operational structure from inquiry toward procedure.
They converge when the vocabulary is settled enough to express the operational structure, and the operational structure is settled enough to use the vocabulary.
At convergence, the system can plan its own enrichment — the cold-start problem is resolved.

## Gamification as prioritization mechanism

When a self-describing system includes character sheets for its agents, low XP tracks on the character sheet point directly at where enrichment has the most leverage.
The character sheet IS a fiber — its ⊥ entries mark domains where the algebra produces no information.
This makes convergent enrichment self-steering: the game IS the prioritization system, and playing the game IS doing the enrichment.

The circularity is real — gamification needs enriched fibers to produce non-⊥ results, but enrichment needs gamification to know where to aim.
The resolution is convergent development: build both simultaneously, because each gamification step IS enrichment (it adds predicates to operational entities) and each enrichment step makes gamification richer (queries return non-⊥ on more compositions).

## See also

- [priority](./priority.md) — what determines which enrichment task comes first
- [settlement path](./settlement-path.md) — how work moves from open to determined
- [focus](./focus.md) — the resource that convergent enrichment allocates
- [leverage](leverage.md) — the criterion for selecting which enrichment has the most impact
