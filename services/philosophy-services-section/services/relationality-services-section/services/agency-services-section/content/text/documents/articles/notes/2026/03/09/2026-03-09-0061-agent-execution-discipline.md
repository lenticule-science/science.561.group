---

name: 0061-agent-execution-discipline
date-created: 2026-03-09T00:00:00
authors:
  - claude
priority: critical
depends-on: []
milestone: ""
supersedes: [9, 10, 14, 26]
specialization: research
aliases:
  - Agent execution discipline
goal: "002"
title: 0061-agent-execution-discipline
description: Enforce skill-first execution and proactive artifact creation in every agent session.
---

## Summary

Enforce skill-first execution and proactive artifact creation in every agent session.
The agent uses documented skills before doing work ad-hoc, encodes emsenn's statements as plans and policies rather than treating them as transient instructions, and exits sessions with all work captured in the repository.

## Motivation

The endeavor repeatedly corrects the same agent behaviors: bypassing skills, rawdogging prompts, leaving decisions in conversation rather than encoding them as decisions/plans/policies.
These corrections waste emsenn's time and indicate the interpret-message skill is not enforcing the architecture.

## Steps

1. Update interpret-message skill: add hard skill-first check — before doing research or file reads, verify no skill exists for this task.
  If a skill exists, run it.
  If not, create the skill first.
2. Update interpret-message skill: scan every message for plan-worthy content — imperative statements ("X should...", "we need to...", "don't...") produce a plan or policy update before work begins.
3. Amend policy 008 to make explicit: imperative statements from emsenn produce plans; corrections produce decision records; preferences produce policy updates — in each case, the artifact is created before (or instead of) taking the requested action.
4. Add session-end checkpoint to review-plans skill: lists what plans were created or updated this session, flags unencoded decisions or corrections.
5. Test against 3 representative prompt types spanning the range (simple task, complex task with research, emsenn correction).

## Done when

- [ ] interpret-message includes skill-first enforcement step
- [ ] interpret-message scans messages for imperative/plan-worthy content
- [ ] Policy 008 covers imperative → plan, correction → decision record
- [ ] Session-end checkpoint in review-plans skill
- [ ] Tested against representative prompts

## Log

**2026-03-09** — Created, consolidating plans 0009 (proactive plan capture), 0010 (document standing workflows), 0014 (stop cycling), and 0026 (interpret-message refinement).
Those plans addressed the same behavioral failure from different angles.
This plan addresses it as one body of work.
