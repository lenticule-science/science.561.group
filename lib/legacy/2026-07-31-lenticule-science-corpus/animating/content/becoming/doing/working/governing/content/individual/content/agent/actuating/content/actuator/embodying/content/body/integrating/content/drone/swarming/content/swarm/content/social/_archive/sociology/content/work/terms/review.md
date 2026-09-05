---
title: "Review"
description: "The act of comparing actual outcomes against planned outcomes — the structured assessment that produces learning and feeds the feedback stage. As a record, a review is a container of findings."
defines: review
date-created: 2026-04-03
extends: [record]
instance-of: [act, container]
produces: [finding]
part-of-cycle: operations-loop
position-in-cycle: 5
follows: tracking
precedes: feedback
input-from: [observation, plan, goal]
output-to: [finding]
has: [scope, review-type]
scope-takes: [session, plan, project, goal]
references:
  - id: army-aar1993
    type: document
    title: A Leader's Guide to After-Action Reviews
    author:
      - literal: US Army
    container-title: Training Circular 25-20
    issued:
      - year: 1993
  - id: argyris-schon1978
    type: document
    title: Organizational Learning: A Theory of Action Perspective
    author:
      - literal: Chris Argyris
      - literal: Donald A. Schön
    issued:
      - year: 1978
---

A review is the [act](../../../../philosophy/terms/act.md) of comparing actual outcomes against planned outcomes.
It takes what happened and what was supposed to happen and produces a judgment: what went right, what went wrong, and why.
Review is where the operations loop learns.

A review is not a status check.
Status checks observe the current [state](../../../../philosophy/terms/state.md) — "where are we?"
A review evaluates the trajectory — "how did we get here, and was it the right path?"
The distinction matters: tracking is continuous observation, review is periodic assessment.

The US Army's After Action Review protocol (TC 25-20, 1993) distills review into four questions: What was supposed to happen?
What actually happened?
Why was there a difference?
What do we do better next time?
These four questions apply at every scale — session, plan, project, goal.

Argyris and Schön (1978) distinguish two depths of review.
Single-loop review asks "did we execute the plan correctly?" and produces tactical adjustments.
Double-loop review asks "was the plan the right plan?" and produces strategic adjustments.
Both are necessary.
A system that only does single-loop review optimizes for the current approach without questioning whether the approach is correct.

A review is a container of [findings](./finding.md).
Each finding compares an [observation](./observation.md) against an expectation and produces a judgment: what the variance is, why it exists, how much it matters.
The review groups related findings and provides the scope — session, plan, project, goal — that determines what observations and expectations are relevant.

Findings feed the [feedback](./feedback.md) stage, which turns them into [adjustments](./adjustment.md) — concrete changes to plans, processes, terms, policies.
Without the feedback stage, findings accumulate and are ignored.

See [Review and Retrospective Survey](../texts/review-and-retrospective-survey.md) for the full theoretical grounding.
