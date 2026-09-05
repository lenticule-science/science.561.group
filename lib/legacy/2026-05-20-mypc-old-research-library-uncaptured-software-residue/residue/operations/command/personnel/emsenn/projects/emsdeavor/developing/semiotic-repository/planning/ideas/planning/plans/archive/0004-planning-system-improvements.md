---
title: "Planning system improvements"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: completed
priority: critical
depends-on: []
---

## Summary

Improve the planning system so plans can be prioritized, ordered by
dependency, and reviewed systematically. This is infrastructure that
every other plan depends on — without it, there is no principled way
to decide what to work on next.

## Motivation

The current planning system (plans/index.md) defines plan lifecycle
(draft → active → completed → abandoned) but lacks:

- **Priority**: no way to rank plans against each other
- **Dependencies**: no way to express "plan X blocks plan Y"
- **Proposed state**: no distinction between "still being drafted"
  and "ready for emsenn's review"
- **Plan review process**: no description of HOW emsenn reviews and
  approves plans
- **Milestones**: no way to group related plans into phases
- **Plan template**: the format is described in prose but there's no
  template file
- **Questions directory**: referenced in the spec but doesn't exist

These gaps mean the agent cannot answer "what should I work on next?"
from the planning system alone. It falls back on ad-hoc judgment,
which is exactly what planning infrastructure should prevent.

## Research findings

FOSS best practices surveyed: Python PEPs, Rust RFCs, IETF RFC 2026,
Architecture Decision Records, MoSCoW prioritization, dependency-based
ordering.

Key recommendations for a small team (1 person + AI agents):

1. **Dependency ordering as primary mechanism** — the plan that
   unblocks the most other plans gets worked on first
2. **Simple priority field for tie-breaking** — critical/high/medium/low
3. **BDFL model** — emsenn has final say, proposals are proposals
4. **Lazy consensus for low-risk changes** — if no objection, proceed
5. **Proportional process** — small work gets small plans

## Steps

1. Update `plans/index.md` spec:
   - Add `priority` field (critical, high, medium, low) to plan
     frontmatter
   - Add `depends-on` field (list of plan numbers) to plan frontmatter
   - Add `proposed` status between draft and accepted
   - Describe the plan review/approval process
   - Add milestones concept (named groups of related plans)
   - Update the working-notes section (now outdated — working notes
     are thin pointers, not session state)

2. Create `plans/_template.md` with the updated frontmatter schema.

3. Create `plans/questions/index.md` (referenced in spec but missing).

4. Update existing plans (0001, 0002, 0003) to include priority and
   depends-on fields.

5. Update `review-plans` skill to:
   - Sort plans by priority, then by dependency count (plans that
     unblock the most go first)
   - Flag plans in `proposed` state as ready for review
   - Report the recommended next plan to work on

6. Update TODO.md to reflect the new priority ordering.

7. Write decision record 0004 documenting the planning system
   improvements (what was added and why).

## Done when

- [x] plans/index.md spec includes priority, depends-on, proposed
      status, review process, and milestones
- [x] Template file exists at plans/_template.md
- [x] plans/questions/index.md exists (already existed)
- [x] Existing plans have priority and depends-on fields
- [x] review-plans skill sorts by priority and dependency
- [x] TODO.md reflects priority ordering

## Dependencies

None — this is foundational infrastructure.

## Log

**2026-03-07** — Created. Surveyed repo governance material and FOSS
planning best practices. This plan is itself an example of the gap:
without priority fields, we cannot systematically determine that this
plan should come before plans 0001-0003.

**2026-03-07** — Completed. All steps executed:
- plans/index.md updated with priority, depends-on, proposed status,
  milestones, review process, and priority algorithm
- _template.md created
- plans/questions/index.md already existed
- Plans 0001-0003 updated with priority and depends-on fields
- review-plans skill v0.2: sorts by priority/dependency, recommends
  next action, updates TODO.md
- Decision 0004 written
- TODO.md updated with priority-ordered plan list
