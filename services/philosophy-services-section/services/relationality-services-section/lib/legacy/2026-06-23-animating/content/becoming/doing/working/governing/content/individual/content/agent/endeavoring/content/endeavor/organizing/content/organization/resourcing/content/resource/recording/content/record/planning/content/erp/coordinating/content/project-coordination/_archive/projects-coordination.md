---
title: Projects, Coordination, and Workflows
keywords:
  - idea
  - projects
  - coordination
part-of: relational-computer
description: "Models projects and coordination as recognitions so planning and execution use relational machinery."
---
# Idea: Projects, Coordination, and Workflows

Model projects and coordination as recognitions and runbooks so planning and execution use the same relational machinery as everything else.

## 1. Recognitions

- `ProjectRecognition`
  - scope, goals, stakeholders, related domains (code, research, MUD, etc.).
- `MilestoneRecognition`
  - major checkpoints with dates and success criteria.
- `TaskRecognition`
  - as in the calendar/tasks idea, but linked to projects and resources.
- `DependencyRecognition`
  - explicit dependencies between tasks, milestones, and external recognitions
    (papers, contracts, datasets).
- `RiskRecognition`
  - identified risks, triggers, mitigations.

## 2. Topology and measurement

- Topology:
  - project → milestone → task graphs,
  - links to other domains (code, data, governance, finance).
- Measurement:
  - progress, cycle time, bottlenecks, load on people/resources.

## 3. Runbooks

- `plan_project`: define recognitions for milestones, tasks, dependencies, risks.
- `update_status`: record progress, slippage, and measurement updates.
- `review_project`: summarize outcomes, link to recognitions changed (code, policies, data), update value/ethics recognitions if needed.

Projects become narratives over recognitions, not just kanban cards: you can see how a project touched code, policies, finances, health, and ecology in one graph.
