---

name: planning-without-methodology
date-created: 2026-03-07T00:00:00
keywords:
  - project-management
  - methodology
  - agential-semioverse
description: "Analysis of why 16 plans remain perpetually draft: the repository has plan formatting but no planning methodology."
cites:
  - "PDCA (Shewhart/Deming)"
  - "Theory of Constraints (Goldratt)"
  - "OKRs (Grove)"
---

The ASR has 16 plans. All are draft. None have been approved, activated,
or completed (except plan 0004, which bootstrapped the planning format
itself). This is not because the plans are bad — it is because the
repository has a plan *format* but no planning *methodology*.

## What exists

The plans specification (`plans/index.md`) defines:

- **Format**: frontmatter schema, section structure, naming convention
- **Lifecycle states**: draft → proposed → accepted → active → completed
  (plus rejected, deferred, abandoned)
- **Priority levels**: critical, high, medium, low
- **Decision algorithm**: check active plans, then accepted, then proposed,
  then write new plans
- **Principles**: lightweight, immutable decisions, log-as-you-go

This is sufficient infrastructure for *filing* plans. It is not
sufficient infrastructure for *planning*.

## What is missing

### 1. Goal structure

Plans exist in a vacuum. There is no declared set of objectives that
plans serve. When a plan is created, it states "what" and "why" but
the "why" connects only to immediate needs ("frontmatter is
incomplete," "triage needs processing"), not to strategic objectives.

Without goals, there is no way to evaluate whether a plan is worth
doing. Priority fields (critical, high, medium, low) express urgency
without purpose. Two high-priority plans with no shared goal are just
two urgent tasks — prioritizing between them requires judgment that
the system cannot supply.

### 2. Gate criteria

The lifecycle has states but no gates. What evidence demonstrates
that a plan is ready to move from draft to proposed? What does emsenn
need to see to accept a plan? What demonstrates that a completed plan
actually achieved its purpose?

Without gates, the lifecycle is a label system. Plans stay draft
because there is no procedure for making them not-draft — no
checklist, no review template, no definition of "ready."

### 3. Strategic review cadence

There is no rhythm to planning. The review-plans skill runs at
session start, but it produces a status table, not a strategic
assessment. It answers "what plans exist?" not "are we moving toward
our goals?" or "what should we be planning that we aren't?"

Without cadence, planning is reactive — plans appear when someone
thinks of work to do, not when the system identifies gaps between
its current state and its objectives.

### 4. Constraint identification

The Theory of Constraints (Goldratt, 1984) holds that every system
has a bottleneck, and optimizing anything other than the bottleneck
is waste. The planning system has no mechanism for identifying the
bottleneck. It prioritizes by urgency and dependency count, not by
constraint analysis.

Without constraint identification, effort disperses across many
plans rather than concentrating on the one thing that would unblock
the most progress.

### 5. Outcome verification

The "done when" criteria in plans check whether the plan's tasks
were completed — not whether completing them served the goal. A plan
can be "completed" without achieving its purpose if the goal was
poorly specified or the approach was wrong.

Without outcome verification, the planning system cannot learn. It
cannot say "plan 0005 was completed but triage quality did not
improve, so our approach was wrong."

## The distinction

A plan FORMAT tells you how to write a plan. A planning METHODOLOGY
tells you:

- What to plan (goal identification)
- When to plan (cadence)
- How to evaluate a plan (gate criteria)
- What to plan FIRST (constraint identification)
- Whether planning worked (outcome verification)

The repository needs a planning methodology — a specification that
connects the existing plan format to the project's strategic
objectives through defined processes. The plan format is retained;
the methodology wraps around it.
