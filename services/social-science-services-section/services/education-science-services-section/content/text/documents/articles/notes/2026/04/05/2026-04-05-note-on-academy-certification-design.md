---
name: academy-certification-design
specialization: analysis
date-created: 2026-04-05
part-of: voidfleet-academy-plan
task: va-design-certification-system
description: "What it means for an officer to be certified for a duty — competency gates grounded in education theory, formality assessment, and operational evidence"
title: academy-certification-design
---

What it means for an officer (human or AI) to be certified for a duty. Grounded in:
- [Competency-based progression](../../../../../notes/2026-04-04-note-on-competency-based-progression.md) — Bloom, Biggs, Tyler
- [Naval officer training](../../../naval-and-military-officer-training.md) — PQS qualification cards
- [Offices as fuzzy cells](./offices-as-fuzzy-cells.md) — formality assessment
- [Training as closure](../../../../../notes/2026-04-04-note-on-training-as-closure.md) — convergence to fixed point

## The Core Principle

Certification is fixed-point detection: the officer's behavior on a duty has converged — further training of the same kind produces no improvement. This is not a threshold ("confidence > 0.8"). It is an idempotence check: does the officer's output on this duty type change when we apply the training operator one more time?

## Certification Levels

### Level 0: Unqualified
The officer has no demonstrated capability for this duty. Cannot be dispatched.

### Level 1: Apprentice (F1 — narrative)
The officer can perform the duty with supervision. Evidence:
- Has completed at least 3 tasks of this duty type
- Success rate > 50% (more successes than failures)
- No critical failures (session crashes, data loss, convention violations)

### Level 2: Qualified (F2 — structured)
The officer can perform the duty independently within bounds. Evidence:
- Has completed at least 10 tasks of this duty type
- Success rate > 80%
- Instincts related to this duty have confidence > 0.6
- No recent critical failures (last 5 tasks all successful)

### Level 3: Master (F3 — algebraic)
The officer's behavior on this duty is near-deterministic. Evidence:
- Has completed at least 25 tasks of this duty type
- Success rate > 95%
- The duty's formality assessment is F3 across all components
- A deterministic tool could replicate the officer's output (or already does)
- Instincts have converged (decay is minimal — behavior is stable)

### Level 4: Demoted to Tool
The duty has been fully formalized. A deterministic script handles it. The officer is no longer needed — the progressive automation path is complete for this duty.

## Qualification Cards (PQS-Style)

Each office has a qualification card listing duties with competency criteria:

```yaml
office: researcher
qualifications:
  - duty: research-produces-texts
    criteria:
      - "Can identify gaps in existing library coverage"
      - "Produces texts with valid frontmatter and citations"
      - "Grounds claims in real disciplinary sources"
      - "Does not fabricate sources"
    evidence-type: task-completion-review
    min-completions: 10
    min-success-rate: 0.8

  - duty: cite-sources
    criteria:
      - "Every claim has a citation"
      - "Citations are to real works (not hallucinated)"
      - "Sources are from the relevant discipline"
    evidence-type: content-review
    min-completions: 5
    min-success-rate: 0.9
```

## How Certification Works

### For AI Officers
1. **Automatic tracking**: The CL pipeline records task completions, failures, and instinct evolution per office.
2. **Periodic assessment**: The heartbeat runs a certification check — compute success rate, check instinct confidence, assess formality.
3. **Promotion**: When criteria are met, the officer's certification level increases. This is recorded as an event and may change dispatch priority (certified officers get dispatched before uncertified ones).
4. **Demotion**: If recent performance drops (3+ failures in last 10 tasks), certification drops one level. The officer returns to supervised dispatch.

### For Human Officers
1. **Portfolio review**: The human demonstrates competency by producing artifacts (completed tasks, written content, architectural designs).
2. **Peer review**: Another officer (human or AI) reviews the portfolio against the qualification card.
3. **Self-assessment**: The human evaluates their own readiness. Honest self-assessment is a competency in itself.

## Connection to Dispatch

The dispatch system uses certification:
- **Level 0**: Cannot receive this duty type
- **Level 1**: Can receive with `--supervised` flag (first officer reviews output)
- **Level 2**: Can receive independently
- **Level 3**: Can receive and the output is trusted without review
- **Level 4**: Not dispatched — a tool handles it

## Connection to the Algebraic Learning Calculus

Certification is the operational face of the closure operator. The training operator is: dispatch task → officer completes → evaluate output → update instincts. The fixed point is: the officer's instincts and behavior no longer change under this operator. Certification detects this fixed point.

The formality assessment (F0-F3) is the certification pre-check: if the office's components are all at F3, the officer SHOULD be at Level 3 or 4. If not, something is wrong — either the formality assessment is incorrect or the officer isn't using the formal patterns.

## What This Produces

A `certifications.json` file (or frontmatter in each office definition) that tracks:
- Per office, per duty: certification level + evidence
- Historical progression: when each level was reached
- Active instincts that inform this duty
- Recent performance metrics

The heartbeat checks this periodically. The dispatch system reads it. The Academy curriculum uses it to determine what training is needed.

## See Also

- [Academy curriculum design](./academy-curriculum-design.md) — how officers progress through stages
- [Offices as fuzzy cells](./offices-as-fuzzy-cells.md) — formality assessment
- [Progressive automation plan](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/triage/progressive-automation-plan.md) — the Level 4 endgame
