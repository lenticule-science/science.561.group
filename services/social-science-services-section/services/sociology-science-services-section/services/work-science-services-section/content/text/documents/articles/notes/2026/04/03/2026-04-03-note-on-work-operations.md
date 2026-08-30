---
title: Work Operations as Integrated MUD
description: Proposes work operations system architecture using MUD design patterns and shared ontology; outlines nine-stage integrated plan.
date-created: 2026-04-03
type: note
name: work-operations
keywords:
  - work-operations
  - operations-loop
  - mud-architecture
  - work-ontology
  - shared-data-model
specialization: project
goal:
  - operations-loop
  - endeavor-resource-planning
serves: [operations-loop, endeavor-resource-planning]
campaign: build-the-coordination-substrate
serves-system: cross-cutting
requires: [respond, work-vocabulary, knowledge-graph, event-log, offices, settlement]
produces: [coordinated-work, closed-loop-operations, multi-scale-planning, operational-metrics]
depends-on: [convergent-enrichment-plan, frontmatter-foundations, fars-architecture-coherence]
---


This project builds the system's ability to coordinate work as one integrated system.

## This is a MUD for work

The repo already has a foundational ontology at `library/terms/`: thing, object, quality, state, act, vessel, container. The operations loop is this ontology applied to work:

- A **task** is a thing. It has qualities (work type, priority). It has a state (pending, running, blocked, completed). Acts change its state (assigning, starting, completing).
- A **plan** is a container. It holds tasks. Tasks come and go; the plan persists.
- A **project** is a vessel. It holds plans and persists through changes in contents.
- A **session** is a vessel. It holds acts performed during a period.
- A **milestone** is a state of a plan — a recognizable configuration of its contents.
- An **assignment** is an act — it changes a task's state and creates a relation to an agent.
- A **queue** is a container — it holds tasks awaiting dispatch, ordered by some quality.
- An **audit trail** is a sequence of acts — each recorded with its time and actor.

This is the same modeling problem that MUDs solve: a world of entities with properties, states, actions, and containers. The dimension isn't a fantasy realm — it's the endeavor's work. But the architecture is the same.

The triage app specs all use the recognition/topology/measurement/runbook pattern. Work operations should use it too: work entities are recognitions, dependencies are topology, metrics are measurement, commands are runbooks.

## Why this is one project, not six

Planning without tracking is guessing. Tracking without execution data is fiction. Review without plan-vs-actual comparison is venting. Feedback without plan adjustment is journaling. The six stages share a data model — work entities flow through all of them. Building them separately produces six disconnected tools. Building them together produces one world where work entities live.

The connective tissue is the ontology:
- **Work units** are things that flow through states across all stages
- **Acts** (assigning, starting, completing, reviewing, adjusting) are what move things between states
- **Containers** (plans, queues, backlogs, sessions) hold work at each stage
- **Relations** (dependencies, assignments, approvals) connect work entities to each other and to agents
- **Events** are acts recorded with their time — the audit trail that makes the whole loop observable

## Plan structure

### 1. ops-research-foundations
Research across all six stages in parallel. Read the real literature on scheduling, dispatch/delegation, execution monitoring, metrics, retrospectives, continuous improvement. Produce survey texts grounded in real sources. This is genuine inquiry — we don't know what terms we need until we study what practitioners and researchers have learned.

### 2. ops-vocabulary
Define the terms the loop needs, grounded in the research. This includes terms we know we need (schedule, milestone, assignment, execution state, metric, review, cadence, etc.) and terms the research surfaces that we haven't anticipated. Also: evaluate whether the four work types are exhaustive or need expansion.

### 3-8. Stage-specific plans (one per stage)
Each stage gets its own plan covering: frontmatter schema for that stage's records, tools/commands for that stage, hooks for enforcement, integration points with adjacent stages. Each depends on the vocabulary being defined first.

### 9. ops-integration
The cross-cutting plan: the event model, the state machine, the flow concept, the multi-scale operation (how the same loop works for a session and for a generation). This runs alongside the stage plans, not after them — integration is designed continuously, not bolted on at the end.

## What this subsumes

The existing planning-infrastructure plan should be absorbed into ops-planning-stage once the research foundations are complete. Much of its content is valid but needs to be part of the larger structure rather than standing alone.

Tasks from agentic-orchestration that touch the operations loop (operationalize-work-vocabulary, work-hierarchy-enforcement, parameterizable-record-commands, frontmatter-consequence-hook) should be coordinated with this project's plans.

## Research-first

Every stage starts with research. The terms come from the research. The schemas come from the terms. The tools come from the schemas. This ordering is not optional — building tools on undefined vocabulary is how you get slop.
