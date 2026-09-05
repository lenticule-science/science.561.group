---
title: "Proactive plan capture from conversations"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: critical
depends-on: []
goal: "002"
milestone: "governance-foundation"
---

## Summary

The agent should proactively capture emsenn's statements, corrections,
and ideas as plans, policies, or decisions — not wait for explicit
instructions to do so. This is both a process improvement and a
policy amendment.

## Motivation

emsenn's correction: "If you reviewed this session I bet you could
find like 50 plans that you currently are making me repeat in various
contexts."

The current interpret-message skill classifies messages and encodes
insights, but it does not aggressively mine every statement for
plan-worthy content. When emsenn says "X should happen," that IS a
plan. When emsenn says "don't do Y," that IS a policy. The agent
should not require emsenn to explicitly say "make a plan for this."

This is the meta-governance problem: the planning system exists, but
the agent doesn't use it aggressively enough. Every conversation
should produce plans proportional to the ideas expressed.

## Steps

1. Amend policy 008 (prompts become artifacts) to explicitly include
   plans: "Every prompt that describes work to be done produces a
   plan before (or instead of) doing the work."
2. Update the interpret-message skill to:
   - Scan every message for imperative statements ("X should...",
     "we need to...", "make sure to...", "don't forget...")
   - For each, create a plan (or add to an existing plan)
   - Report back what plans were created/updated
3. Write a `mine-conversation` skill that reviews a full session
   transcript and extracts all uncaptured plans, policies, and
   decisions.
4. Run the mine-conversation skill on this session as a test case.
5. Add a session-end checklist: before ending, review what was said
   and ensure everything plan-worthy is captured.

## Done when

- [ ] Policy 008 amended to cover plans
- [ ] interpret-message skill scans for imperative statements
- [ ] mine-conversation skill exists
- [ ] This session's uncaptured items are all captured
- [ ] Session-end checklist documented

## Dependencies

None — this is the most important process improvement.

## Log

**2026-03-07** — Created. emsenn explicitly frustrated that the agent
makes them repeat ideas across contexts. The mining agent found ~20
uncaptured plan-worthy items from this session alone.
