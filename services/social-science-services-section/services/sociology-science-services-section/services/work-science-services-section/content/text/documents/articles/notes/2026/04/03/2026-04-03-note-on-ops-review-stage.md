---
title: "Ops Review Stage: Responsibilities and Dependencies"
description: System capability to support periodic review at every cadence with plan-vs-actual comparison and approval gates
date-created: 2026-04-03
type: note
name: ops-review-stage
keywords:
  - aar
  - approval-gates
  - plan-vs-actual
  - cadence
  - escalation-triggers
  - quality-assessment
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

The review stage owns:
- Cadence definition (daily, weekly, quarterly, annual, ad-hoc)
- After-Action Review (AAR) format and protocol
- Plan-vs-actual comparison (what was planned, what happened, variance analysis)
- Approval gates (what permits plan change, execution restart, scope expansion?)
- Quality assessment (did we meet acceptance criteria?)
- Stakeholder notification and sign-off
- Review decision recording
- Escalation triggers

## Current Infrastructure

Partial patterns in AAR documents and decision records, but no unified review protocol.

## Open Questions

- What distinguishes a standup from a sprint review from a retrospective?
- How is plan-vs-actual variance computed and presented?
- What triggers an approval gate (schedule variance, scope change, failure)?
- Who has authority to approve what (delegation vs. escalation)?
- What is the difference between "quality assessment" and "health check"?
- How do we suppress or escalate based on review findings?

## Blockers

Depends on ops-vocabulary to formalize:
- Review record schema (cadence, plan, actual, variance, decisions)
- AAR format and required fields
- Approval gate rules and authority matrix
- Quality criteria and assessment methods
