---
title: Failure-Driven Knowledge Updates
description: Proposes using agent task failures to trigger targeted research passes that update relevant skills, duties, and knowledge graph entities.
date-created: 2026-04-04
type: note
name: continuous-learning-pipeline
keywords:
  - agent-failure
  - knowledge-graph
  - targeted-research
  - skill-updates
  - duty-definitions
specialization: idea
serves: operations-loop
---

When an agent fails a dispatched task — wrong output, blocked by missing knowledge, or poor quality — the failure should trigger a targeted research pass that updates the relevant duty definitions, skills, or knowledge graph entities. This is tighter than the current instinct-based pattern detection because we already have structured work types (plans, tasks, duties) and a knowledge graph with typed relations. A failure on a "write term" task, for example, can trace back to which skill was loaded, which terms were referenced, and what the agent actually produced — then feed corrections into the specific skill or add missing graph edges, rather than waiting for a generic observer to notice a pattern across sessions.
