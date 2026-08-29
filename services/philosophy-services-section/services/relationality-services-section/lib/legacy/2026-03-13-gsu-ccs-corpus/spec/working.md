---
id: working
description: "Executing a work unit from a queue without selection bias. The base mode of agent activity; does not require the target to be a SkillfulWorkUnit."
defines: Working
describes: Work
domain: WorkQueue
codomain: WorkResult
---

# Working

## What this is

**Working** is the act of executing the next available work unit from a queue.
It has no selection bias — it takes what is next. The target need not be a
SkillfulWorkUnit (§skillful-work): ad-hoc work, exploratory work, one-off tasks,
and direct user requests are all forms of Working.

Working is the base mode. It gets things done. It does not ask whether doing this
work enables more work — that question belongs to Improving (§improving).

## MUST

- Consume a work unit from the queue and produce a named output (§work) — the
  output may be an artifact, a judgment, a transformed state, or a report that
  nothing was found
- Emit a SkillResult (§skill-result) — success with the output value, or a
  SkillError if the work could not be completed
- Leave the queue in a consistent state — the consumed item is marked done
  whether the result is success or error

## CAN

- Target any work unit, skillful or ad-hoc
- Be invoked directly by a user request, without any queue or plan
- Complete without triggering any improvement cycles — Working has no obligation
  to improve what it touches; that is Improving's job

## CANNOT

- Reorder the queue based on what would enable more work — that is selection
  bias, which belongs to Improving
- Discard a SkillError without recording it somewhere — an error that vanishes
  is not a completed work unit

## Relationship to Improving

Working and Improving are not mutually exclusive. Improving (§improving) IS a
form of Working — it applies Working to SkillfulWorkUnits specifically, with
added selection bias and feedback cycles. Every Improving pass is a Working pass;
not every Working pass is an Improving pass.

## Pending

- Formal construction of WorkQueue as a typed object — blocked by:
  skill-algebra construction
