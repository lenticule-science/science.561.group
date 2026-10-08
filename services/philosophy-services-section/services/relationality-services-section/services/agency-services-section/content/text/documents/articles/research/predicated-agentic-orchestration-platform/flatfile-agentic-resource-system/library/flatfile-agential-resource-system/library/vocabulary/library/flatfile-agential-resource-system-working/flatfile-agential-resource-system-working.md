---
id: flatfile-agential-resource-system-working
description: "Executing a work unit from a queue without selection bias. The base mode of agent activity; does not require the target to be a SkillfulWorkUnit."
uses:
  - Work
  - FlatfileAgentialResourceSystemSkillResult
describes: Work
takes: WorkQueue
produces: WorkResult
date-modified: 2026-03-19
params:
  work-queue: relational-universe
output: relational-universe-morphism
ast:
  queue-dequeue-execute:
    - work-queue:
        - fifo-order
    - work-result:
        - skill-result
title: Flatfile Agential Resource System Working
---

# Flatfile Agential Resource System Working

## What this is

**FlatfileAgentialResourceSystemWorking** is the act of executing the next available work unit from a queue.
It has no selection bias — it takes what is next.
The target need not be a SkillfulWorkUnit ([flatfile-agential-resource-system-skillful-work](../flatfile-agential-resource-system-skillful-work/flatfile-agential-resource-system-skillful-work.md)): ad-hoc work, exploratory work, one-off tasks, and direct user requests are all forms of FlatfileAgentialResourceSystemWorking.

FlatfileAgentialResourceSystemWorking is the base mode.
It gets things done.
It does not ask whether doing this work enables more work — that question belongs to FlatfileAgentialResourceSystemImproving ([flatfile-agential-resource-system-improving](../flatfile-agential-resource-system-improving/flatfile-agential-resource-system-improving.md)).

FlatfileAgentialResourceSystemWorking MUST consume a work unit from the queue and produce a named output ([work](work.md)) — the output may be an artifact, a judgment, a transformed state, or a report that nothing was found.
It MUST emit a FlatfileAgentialResourceSystemSkillResult ([flatfile-agential-resource-system-skill-result](../flatfile-agential-resource-system-skill-result/flatfile-agential-resource-system-skill-result.md)) — success with the output value, or a SkillError if the work could not be completed.
It MUST leave the queue in a consistent state — the consumed item is marked done whether the result is success or error.
FlatfileAgentialResourceSystemWorking CANNOT reorder the queue based on what would enable more work — that is selection bias, which belongs to FlatfileAgentialResourceSystemImproving.
It CANNOT discard a SkillError without recording it — an error that vanishes is not a completed work unit.
FlatfileAgentialResourceSystemWorking MAY target any work unit (skillful or ad-hoc) and MAY be invoked directly by a user request without any queue or plan.

## Relationship to FlatfileAgentialResourceSystemImproving

FlatfileAgentialResourceSystemWorking and FlatfileAgentialResourceSystemImproving are not mutually exclusive.
FlatfileAgentialResourceSystemImproving ([flatfile-agential-resource-system-improving](../flatfile-agential-resource-system-improving/flatfile-agential-resource-system-improving.md)) IS a form of FlatfileAgentialResourceSystemWorking — it applies FlatfileAgentialResourceSystemWorking to SkillfulWorkUnits specifically, with added selection bias and feedback cycles.
Every FlatfileAgentialResourceSystemImproving pass is a FlatfileAgentialResourceSystemWorking pass; not every FlatfileAgentialResourceSystemWorking pass is a FlatfileAgentialResourceSystemImproving pass.

## Open questions

- Formal construction of WorkQueue as a typed object — blocked by: skill-algebra construction
