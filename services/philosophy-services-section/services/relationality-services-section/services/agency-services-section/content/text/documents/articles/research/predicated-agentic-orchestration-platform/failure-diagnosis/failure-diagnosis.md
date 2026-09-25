---
type: concept
class: pattern
depends-on: [witness, dispatch]
see-also: [settlement-path, escalation]
title: Failure diagnosis
description: The platform's pattern for recording why a failure happened, not just that it happened.
---

# Failure diagnosis

The platform's pattern for recording *why a failure happened*, not just that it happened.
A failed [skill invocation](../skill/skill-invocation/skill-invocation.md), a failed [dispatch](dispatch.md) match, a failed runbook step is recorded with predications declaring the diagnosed cause — what about the substrate state, the operator's input, or the operator's body produced the failure.
The diagnosis is itself substrate content, queryable on subsequent dispatch.

The discipline is structurally distinct from logging:

- *Logging* records the failure event — what failed, with what error code, at what timestamp.
  It is sufficient for after-the-fact reconstruction.
- *Failure diagnosis* records the cause in predication form — predications about what caused the failure, what conditions would prevent recurrence, what alternative approaches might succeed.
  It is sufficient to *consult on the next attempt*.

Three engineering uses:

- **Re-dispatch on failure with enriched context.** When a [skill invocation](../skill/skill-invocation/skill-invocation.md) fails, the [dispatch](dispatch.md) operator may select an alternative agent or skill.
  The enriched re-dispatch reads the previous attempt's failure diagnosis as part of the candidate-set computation: agents whose capability predications match against the diagnosis are preferred.
  The platform learns from the diagnosis on the same cycle that produced it.
- **Pattern detection across diagnoses.** Multiple failures with similar diagnoses become an [instinct](settlement-path.md) — an entity declaring the recurring pattern, the trigger, and the cause.
  The instinct is consultable by the platform's future dispatch decisions; the platform's behavior gradually shifts to avoid recurring failures.
- **Audit and oversight.** A human reviewer can read the diagnosis to understand what went wrong, in substrate-level terms, without parsing logs or reconstructing context.
  The diagnosis is a structured engineering artifact, queryable through the same operators as content.

The pattern requires that failure-producing operators emit *diagnostic* witness entries, not just error-code witness entries.
A skill invocation that fails preconditions emits a witness recording which preconditions failed and why; a dispatch that produces no admissible match emits a witness recording the candidate set and the gap that prevented matching; a runbook step that aborts emits a witness recording the abort cause and the runbook's resulting state.

The discipline scales with the platform's [agential self-generation](../agent/agential-self-generation/agential-self-generation.md): when failures are diagnosed in substrate-level predications, the platform's *own* tendency to fail is observable in substrate-level terms.
Closure rules can detect that a particular skill is failing more often, that a particular agent's capability predications are out of date, that a particular runbook step has structural issues.
The platform identifies its own engineering debt as substrate content.
