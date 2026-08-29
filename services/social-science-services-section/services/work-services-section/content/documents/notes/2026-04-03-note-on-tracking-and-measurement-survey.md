---
title: "Tracking and Measurement: How You Know What State Work Is In"
date-created: 2026-04-03
description: "How organizations observe and measure work state â€” from Earned Value Management through kanban flow metrics to Stevens' measurement scales, audit trails, and the dangers of Goodhart's Law."
part-of: ops-research-foundations
references:
  fleming-koppelman2010:
    authors: ["Quentin W. Fleming", "Joel M. Koppelman"]
    title: "Earned Value Project Management"
    publication: "Project Management Institute"
    year: 2010
    note: "4th edition"
  anderson2010:
    authors: ["David J. Anderson"]
    title: "Kanban: Successful Evolutionary Change for Your Technology Business"
    publication: "Blue Hole Press"
    year: 2010
  stevens1946:
    authors: ["S. S. Stevens"]
    title: "On the Theory of Scales of Measurement"
    publication: "Science, 103(2684)"
    year: 1946
  tufte2001:
    authors: ["Edward R. Tufte"]
    title: "The Visual Display of Quantitative Information"
    publication: "Graphics Press"
    year: 2001
    note: "2nd edition"
  strathern1997:
    authors: ["Marilyn Strathern"]
    title: "'Improving Ratings': Audit in the British University System"
    publication: "European Review, 5(3)"
    year: 1997
    note: "Source of Goodhart's Law generalization"
  reinertsen2009:
    authors: ["Donald G. Reinertsen"]
    title: "The Principles of Product Development Flow"
    publication: "Celeritas Publishing"
    year: 2009
---

Tracking is the continuous observation of work entity states. It does not act â€” it observes and reports. The tracking stage reads the operational state, computes derived metrics, surfaces anomalies, and feeds the review stage with data for comparison against plans.

## Earned Value Management

Earned Value Management (Fleming and Koppelman 2010) is the standard costing methodology for project tracking. It answers three questions simultaneously: how much work was planned? How much was done? How much did it cost?

Three baseline measurements:

- **Planned Value (PV)** â€” the budgeted cost of work scheduled by now. What you said you'd do.
- **Earned Value (EV)** â€” the budgeted cost of work actually completed. What you actually did, priced at the plan rate.
- **Actual Cost (AC)** â€” what you actually spent to do what you did.

From these, two variances:

- **Schedule Variance (SV) = EV âˆ’ PV** â€” positive means ahead, negative means behind
- **Cost Variance (CV) = EV âˆ’ AC** â€” positive means under budget, negative means over

And two performance indices:

- **Schedule Performance Index (SPI) = EV / PV** â€” above 1.0 means ahead of schedule
- **Cost Performance Index (CPI) = EV / AC** â€” above 1.0 means under budget

EVM works when work is quantifiable and the plan is stable. For knowledge work â€” where the scope changes frequently and "percent complete" is hard to measure â€” EVM is less directly applicable. But the principle holds: track what you planned to do, what you actually did, and what it cost you. The three-way comparison is the foundation of all tracking.

In a work management system: PV is the plan (tasks and their estimated effort). EV is task completion progress. AC is the actual cost of work (time, resources, or tokens consumed). SPI tells you whether you're advancing tasks at the planned rate. CPI tells you whether each task costs more or less than expected. These are computable from any datastore that tracks plans, completions, and costs.

## Flow metrics: kanban

Where EVM measures against a baseline plan, kanban metrics (Anderson 2010, Reinertsen 2009) measure the flow of work through the system regardless of plan.

**Cycle time** â€” how long from work starting to work completing. A task created Monday and completed Wednesday has a 2-day cycle time. Short cycle times mean the system processes work quickly.

**Lead time** â€” how long from work entering the system (created or requested) to work completing. Lead time includes queue time (waiting to be started) plus cycle time. Lead time is what the customer experiences; cycle time is what the worker experiences.

**Work in progress (WIP)** â€” how many items are actively being worked on at this moment. High WIP means more context switching, more partial work, longer cycle times. Little's Law: $\text{Average Lead Time} = \frac{\text{WIP}}{\text{Throughput}}$. To reduce lead time, either reduce WIP or increase throughput. Reducing WIP is usually easier and has immediate effect.

**Throughput** â€” how many items complete per unit time. Tasks per session, tasks per week, plans completed per month. Throughput is the system's output rate.

**Flow efficiency** â€” what fraction of lead time is potential work vs. waiting. If a task sits in a queue for 3 days and takes 1 day of work, flow efficiency is 25%. Most knowledge work systems have flow efficiency under 15% â€” the vast majority of time is spent waiting, not working.

In practice, all of these are computable from a datastore plus event history. Task creation timestamps, status change timestamps, and session associations give you cycle time, lead time, and throughput. WIP is a point-in-time count of tasks with status "in progress." Flow efficiency requires tracking when tasks transition from "waiting" to "potential" â€” which any event log can provide.

## Scales of measurement: Stevens

S. S. Stevens' *On the Theory of Scales of Measurement* (1946) defines four levels of measurement, each supporting different statistical operations:

| Scale | Property | Examples in work tracking |
|-------|----------|--------------------------|
| **Nominal** | Equality (=, â‰ ) | Task type (bug, feature, research). Status labels (open, closed). |
| **Ordinal** | Order (<, >) | Priority (high, medium, low). Task ordering in a plan. |
| **Interval** | Equal intervals | Calendar dates. Temperature. Sprint numbers. |
| **Ratio** | True zero | Task count. Cost. Duration. Tokens consumed. |

The distinction matters because you can only do certain operations at certain scales. You can count nominals (3 bugs, 5 features). You can rank ordinals (high > medium > low). You can subtract intervals (5 days between reviews). You can divide ratios (cost per task = total cost / task count).

A common tracking error: treating ordinals as ratios. "Priority 3" is not three times as important as "priority 1" â€” it's just higher in the ordering. Averaging priorities is meaningless. Averaging costs is meaningful. Stevens tells you which operations your data supports.

In practice: task status is nominal. Priority is ordinal. Dates are interval. Counts, costs, and durations are ratio. The tracking stage should use the appropriate scale for each metric and avoid operations that the scale doesn't support.

## Visual display: Tufte

Edward Tufte's *The Visual Display of Quantitative Information* (2001) establishes principles for presenting data honestly and efficiently:

**Data-ink ratio** â€” maximize the proportion of ink (or pixels, or characters) that represents data. Remove chartjunk, decorative elements, and redundant labels. In a text-based system, this means: status output should be dense with information and sparse with formatting.

**Small multiples** â€” show the same structure repeated across different data. Plan status for all plans, shown the same way, lets you compare at a glance. A consistent status table is a small multiple.

**Lie factor** â€” the ratio of the effect shown to the effect in the data. A progress bar that shows 50% when 10% of tasks are done (because 50% of the timeline has elapsed) has a lie factor of 5. Show what's measured, not what's estimated.

For a text-based work management system, tracking output should be dense (every line carries information) and comparable (all plans shown the same way). The principle: don't invent visualization formats. Use consistent, comparable, data-dense output that can be composed from the datastore.

## Audit trails and provenance

An audit trail is an immutable record of who did what, when, and why. Every state change in the operations loop should produce an audit event: task created, task assigned, task started, task completed, plan revised, review held, feedback applied.

Audit events have a fixed schema: timestamp, actor, action, subject, previous state, new state, justification. The sequence of events IS the history of the work. Any question about "what happened?" is answered by querying the event log.

In practice, a raw activity log (recording tool calls with timestamps and session IDs) is a proto-audit trail. The full audit trail requires capturing state transitions as first-class events. When a task status changes from "open" to "completed," that should produce an event record with: who completed it (agent or user), when (timestamp), what changed (status: open -> completed), and optionally why (reference to the session or commit that did the work).

An event log combined with a structured datastore gives you full provenance: for any entity, you can trace its history â€” when each attribute was set, by whom, in what session. This is the audit backbone that makes any operations loop observable and reviewable.

## Goodhart's Law and perverse incentives

Marilyn Strathern's generalization of Goodhart's Law (1997): "When a measure becomes a target, it ceases to be a good measure." If you measure programmers by lines of code, they write verbose code. If you measure doctors by patient throughput, they rush appointments. If you measure agents by tasks completed, they break large tasks into trivial subtasks.

This is not a reason to avoid measurement. It is a reason to measure carefully:
- Measure outcomes, not outputs. "Did the plan achieve its goal?" not "How many tasks were completed?"
- Use multiple metrics that cross-check each other. High throughput with low quality is worse than moderate throughput with high quality.
- Keep metrics descriptive, not prescriptive. The tracking stage observes and reports. The review stage judges. Don't let the tracking metrics become the judgment.

In practice, the plan completion percentage (tasks done / total tasks) is a useful tracking metric. But it should never be the sole evaluation criterion. A plan at 100% where every task was trivially defined is worse than a plan at 40% where each completed task produced real value. The review stage must evaluate quality, not just count.

## See also

- [The Ontology of Work Operations](./2026-04-03-note-on-ontology-of-work-operations.md) â€” the base mapping
- [Planning and Scheduling Survey](./2026-04-03-note-on-planning-and-scheduling-survey.md) â€” what tracking observes
- [Dispatch and Delegation Survey](./dispatch-and-delegation-survey.md) â€” what tracking monitors
