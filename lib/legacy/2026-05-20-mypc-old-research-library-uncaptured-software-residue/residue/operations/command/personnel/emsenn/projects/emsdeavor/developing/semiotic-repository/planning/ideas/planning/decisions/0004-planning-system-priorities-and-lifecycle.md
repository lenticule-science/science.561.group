---
title: "Add priorities, dependencies, and lifecycle states to planning system"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: accepted
---

## Context

The planning system (plans/index.md) defined a basic lifecycle
(draft → active → completed → abandoned) but had no way to rank
plans against each other or express dependencies between them. This
meant the agent could not answer "what should I work on next?" from
the planning system alone — it fell back on ad-hoc judgment, which
is exactly what planning infrastructure should prevent.

emsenn observed: "Having a working-notes.md file seems like an
indication we're missing huge chunks of actual governance, planning,
and implementation infrastructure."

## Decision

1. **Add priority field** to plan frontmatter: critical, high,
   medium, low. Used for ordering within status groups.

2. **Add depends-on field**: list of plan numbers that must complete
   before this plan can start. Used to detect blocked plans and to
   rank plans by how many others they unblock.

3. **Add lifecycle states**: proposed (ready for review), accepted
   (approved but not started), deferred (not now), rejected
   (declined). These distinguish "still being drafted" from "ready
   for emsenn's review" from "approved and waiting."

4. **Add milestones**: optional `milestone:` field to group related
   plans. A milestone is complete when all its plans are complete.

5. **Define the priority algorithm**: active blocked → accepted
   highest-priority → proposed needs review → write new plans →
   ask for direction.

6. **Update review-plans skill** to sort by priority and dependency
   count and recommend the next action.

## Consequences

- Every plan now carries priority and depends-on metadata.
- The review-plans skill can mechanically determine what to work on
  next, reducing ad-hoc judgment.
- TODO.md reflects priority ordering.
- The planning system is self-improving: plan 0004 (this change) was
  itself the highest-priority plan because it was foundational
  infrastructure.

## Alternatives considered

- **No priority field, just dependency ordering**: Rejected because
  dependency ordering alone can't distinguish between two unblocked
  plans of different importance.
- **Numeric priority scores (RICE)**: Rejected as too heavyweight
  for a 1-person + AI team. Simple labels suffice.
- **Separate roadmap files**: Rejected in favor of the simpler
  milestone field on individual plans.
