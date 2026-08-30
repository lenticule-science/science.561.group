---
title: Ops Feedback Stage
description: System capability for review findings to flow into plan adjustments, process improvements, and organizational learning
date-created: 2026-04-03
type: note
name: ops-feedback-stage
keywords:
  - learning-loops
  - lessons-extraction
  - impact-analysis
  - decision-records
  - settlement-path
date-completed: 2026-04-03
project: work-operations
specialization: plan
application: planning
architecture-note:
  - Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
  - Under architecture.md Phase 4, this stage is a respond()-composition view + formatter. Not a special-purpose tool but a batch-query over entity-fibers with presentation logic.
department: engineering
cross-cuts: [command, science]
---

## Scope

The feedback stage owns:
- Lessons extraction from reviews (what did we learn?)
- Single-loop learning (plan adjustment within current operational model)
- Double-loop learning (questioning the model itself)
- Settlement path application (how insights become organizational practice)
- Decision records and rationale capture
- Impact analysis (how did this change affect future work?)
- Feedback collection and prioritization
- Rollout of changes (gradual adoption vs. immediate mandate)

## Current Infrastructure

Partial patterns in decision-records and learning systems, but feedback is often siloed.

## Open Questions

- How do we distinguish single-loop (faster execution) from double-loop (better process)?
- What is the decision threshold for applying a lesson (confidence, impact)?
- How do we measure whether a feedback change actually improved outcomes?
- Should feedback-to-plan changes trigger immediate re-planning?
- What is the settlement path for this repository's operations?
- How do we prevent feedback from contradicting earlier decisions?

## Blockers

Depends on ops-vocabulary to formalize:
- Lesson record schema (observation, insight, hypothesis, outcome)
- Learning loop decision rules (when to apply single vs. double loop)
- Change propagation protocol (when and how to roll out changes)
- Impact metrics (how to assess whether feedback worked)
