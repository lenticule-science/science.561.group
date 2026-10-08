---
name: "Metric"
description: "A quantitative measure of a quality — the reduction of a complex state to a number that enables comparison, tracking, and decision-making."
date-created: 2026-04-03
instance-of: quality
applies-to: [work-unit, plan, project, agent]
part-of-stage: tracking
references:
  stevens1946:
    authors:
      - S. S. Stevens
    title: On the Theory of Scales of Measurement
    year: 1946
    publication: Science, 103(2684)
  strathern1997:
    authors:
      - Marilyn Strathern
    title: "'Improving Ratings': Audit in the British University System"
    year: 1997
    publication: European Review, 5(3)
---

A metric is a quantitative measure of a [quality](../../../../philosophy/terms/quality.md) — a number assigned to an aspect of a [thing](../../../../philosophy/terms/thing.md) to enable comparison, tracking, and decision-making.
Task completion count, plan progress percentage, cycle time, cost per session — all metrics.

Stevens (1946) identifies four levels of measurement.
A metric's level determines which operations are meaningful:

| Level | Property | Operations | Work examples |
|-------|----------|-----------|---------------|
| Nominal | Equality | Count, mode | Task type, status label |
| Ordinal | Order | Median, rank | Priority, risk level |
| Interval | Equal intervals | Mean, difference | Dates, sprint numbers |
| Ratio | True zero | All arithmetic | Cost, duration, task count |

The level matters because averaging an ordinal metric is meaningless.
"Average priority" across tasks produces a number that means nothing.
"Average cycle time" across tasks is meaningful because cycle time is ratio-scale.

A metric is a reduction.
A plan's actual state is complex — 30 tasks with different statuses, dependencies, blockers, assignees.
The metric "65% complete" compresses this to a single number.
The compression is lossy — the number doesn't tell you which tasks are done or which are blocked.
But it enables comparison: 65% this week vs. 55% last week tells you the plan is advancing.

Goodhart's Law (Strathern 1997): when a metric becomes a target, it ceases to be a good metric.
If agents are measured by tasks completed, they break large tasks into trivial subtasks.
If plans are measured by completion percentage, plans get padded with easy tasks.
Metrics should be descriptive (they tell you what's happening) not prescriptive (they don't define what should happen).
The [review](review.md) stage judges quality; metrics just observe quantity.

See [Tracking and Measurement Survey](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/documents/notes/2026-04-03-note-on-tracking-and-measurement-survey.md) for the full theoretical grounding.
