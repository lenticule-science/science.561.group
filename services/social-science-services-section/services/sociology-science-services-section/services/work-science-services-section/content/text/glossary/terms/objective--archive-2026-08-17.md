---

description: "A specific, measurable, time-bounded target that serves a broader goal — decidable (achieved or not), trackable (progress metric), and grounded in SMART/OKR traditions."
aliases: [objectives]
contrasts-with: [goal, intent, task]
instance-of: work
traditions: [doran-smart, grove-okr]
serves-takes: goal
has: [metric, target, deadline, status]
date-created: 2026-03-20
date-modified: 2026-04-06
---

An objective is a specific, measurable, time-bounded target that serves a broader goal. It has four parts: a target (what counts as achieved), a goal it serves (the broader direction), a progress metric (how to track movement), and a deadline (when it must be achieved by).

The defining property is **decidability**. An objective is either achieved or not — there is no ambiguity. This distinguishes it from a goal (which specifies direction but may never be fully "achieved"), an intent (which specifies how to reconstruct something but has no deadline), and a [task](./task.md) (which has a completion condition but not necessarily a metric or deadline).

An objective is:
- **Achieved** when the target is met by the deadline
- **Missed** when the deadline passes without achievement
- **On track** when the metric shows sufficient progress toward the deadline

## The SMART criteria

SMART objectives (Doran, 1981) formalize the conditions under which an objective functions as an actionable target rather than a vague aspiration:

- **Specific**: the target is determinate — no room for interpretive dispute about whether it is achieved
- **Measurable**: the progress metric exists and can be evaluated — without measurement, progress is invisible
- **Achievable**: it is structurally possible to reach the target — aspiration without possibility is delusion
- **Relevant**: achieving the objective genuinely contributes to the goal it serves — if it settles independently of the goal, it is a task, not an objective
- **Time-bounded**: the deadline is specific — without one, deferral is always available and progress has no reference point

## The OKR structure

The OKR framework (Grove, Intel 1970s; Doerr, Google 1999) introduces a bipartite structure:

- **Objective** (in OKR's informal sense): qualitative, aspirational, directional — "Build the most reliable navigation system in the fleet"
- **Key Result**: quantitative, measurable milestone — "Achieve 99.97% uptime across all navigation systems by Q3"

In the work vocabulary: the OKR *Objective* corresponds to a goal (directional, purpose-stating); the OKR *Key Results* are **objectives** in the formal sense — specific, measurable, time-bounded sub-targets.

Neither alone is sufficient: a goal without objectives has no operational traction; objectives without a goal are tasks with no direction.

## Objectives and reporting

An objective generates a natural reporting structure: at each check-in, the progress metric either shows movement toward the target or it doesn't. A periodic report on an objective answers: "How much has progress changed this period, and is the current trajectory sufficient to achieve the target by the deadline?"

## Objectives under friction

Achieved objectives can regress. An objective met at one point may become unmet if conditions change — a system that was compliant becomes non-compliant when requirements shift. This means objectives require monitoring, not just one-time assessment. Achievement must be assessed at the deadline, not earlier.

The appropriate response to friction is not to abandon the objective (unless achievability fails) but to exercise judgment: determine what actions will advance the target given current conditions.

## Related

- [Task](./task.md) — a goal-directed unit of work; an objective is more specific (metric + deadline)
- [Plan](./plan.md) — a structured set of operations; objectives are what plans aim to achieve
- [Endeavor](./endeavor.md) — self-commissioned striving; objectives operationalize endeavor into decidable milestones
