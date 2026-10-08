---
name: "Effort"
description: "The potential work time an agent spends on a task — distinct from wall-clock duration and from total available capacity."
date-created: 2026-04-04
aliases: ["efforts"]
instance-of: quality
quality-of: [agent, task, work-unit]
contrasts-with: [duration, capacity]
applies-to: [task, plan, work-unit, assignment]
part-of-stage: tracking
references:
  reinertsen2009:
    authors:
      - Donald G. Reinertsen
    title: The Principles of Product Development Flow
    year: 2009
    publication: Celeritas Publishing
  kahneman-tversky1979:
    authors:
      - Daniel Kahneman
      - Amos Tversky
    title: "Intuitive Prediction: Biases and Corrective Procedures"
    year: 1979
    publication: TIMS Studies in Management Science
  ohno1988:
    authors:
      - Taiichi Ohno
    title: "Toyota Production System: Beyond Large-Scale Production"
    year: 1988
    publication: Productivity Press
---

Effort is the potential work time an agent spends on a task, measured in hours, person-days, or story points.
It is strictly distinct from [duration](duration.md) — the wall-clock span from task start to finish — and from [capacity](capacity.md) — the total available work time an agent or system has in a period.

A task with three days of [duration](duration.md) but only six hours of effort has a low effort-to-duration ratio.
The gap reveals waiting time (task blocked on dependencies, waiting for information or approvals), context-switching (agent pulled away to other tasks), overhead (meetings, coordination, documentation), and idle time (agent available but the next subtask not ready).
The ratio of effort to duration is flow efficiency: effort ÷ duration.
Lean manufacturing, following Taiichi Ohno (1988), targets flow efficiency above 25%; knowledge work typically runs 5–15% because interruption and coordination costs are high.

Effort can be measured three ways. **Hours** are precise and directly comparable across agents ("I spent 4 hours on this task").
Hours invite gaming: Parkinson's Law (1955) observes that work expands to fill available time, so if an agent estimates 8 hours and is given 8 hours, they fill it regardless of actual needs. **Story points** are relative estimates of complexity, capturing "this task is twice as complex as that one," but story points are incommensurable across teams — one team's 5-point task is another's 3-point task. **Person-days** combine effort with headcount and duration: a one-person-day task takes one agent one working day, or two agents half a day.
This is useful for [dispatch](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/04/03/2026-04-03-dispatch-and-delegation-survey.md) but obscures individual effort.

Effort estimation fails systematically for the same reasons [duration](duration.md) estimation fails: Kahneman and Tversky (1979) show that people underestimate the effort required by their own tasks while accurately estimating base-rate effort for similar past tasks.
We know our estimates tend to be optimistic, yet we make optimistic estimates.
This is the planning fallacy.
PERT three-point estimation helps: agents estimate optimistic effort (best-case), most-likely effort (realistic), and pessimistic effort (with unexpected obstacles).
This models effort as a distribution with variance, not a point estimate.

Effort and energy are not the same, though both are consumed during work.
An hour of creative writing (high cognitive load, high energy cost) and an hour of filing (low cognitive load, low energy cost) are equal effort by the clock but unequal in energy expenditure.
This is why [capacity](capacity.md) is not purely hours — it includes attention bandwidth, cognitive energy, and skill-specific resource.
An agent fatigued from a day of deep work may have eight hours remaining in their daily [capacity](capacity.md) but cannot apply them to another deep-work task.

Effort is typically tracked on tasks and assignments as estimated and actual values.
The tracking stage compares estimated effort to actual effort.
Systematic underestimation signals calibration failure — the team does not know how long their work takes.
Systematic overestimation signals sandbagging (estimating conservatively to guarantee delivery) or scope contraction (tasks shrink after estimation).
Sustained high variance between estimated and actual effort blocks reliable planning.

Reinertsen (2009) connects effort to economic flow: cost of delay operates on [duration](duration.md), not effort.
A task that takes the same effort but runs for longer [duration](duration.md) incurs higher cost of delay.
This is why reducing [duration](duration.md) without increasing effort is pure gain — more work gets done per unit of calendar time, so value flows faster.
But reducing effort while holding duration constant often reveals hidden waiting and inefficiency, not a productivity win.

See [Tracking and Measurement Survey](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/documents/notes/2026-04-03-note-on-tracking-and-measurement-survey.md) for how effort metrics feed into organizational learning.
