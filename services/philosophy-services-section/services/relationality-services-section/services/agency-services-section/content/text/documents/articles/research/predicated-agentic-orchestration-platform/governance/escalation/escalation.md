---
type: morphism
class: operator
realizes: [governance]
depends-on: [office, governance, witness]
see-also: [dispatch-matching, runbook-execution]
title: Escalation
description: The operator that, when an agent cannot handle a piece of work — because the work falls outside the agent's scope, exceeds its capability, or produces a contested dispatch match — forwards the work to the next-higher office in the agent's…
---

# Escalation

The operator that, when an [agent](teaching/explanations/agent.md) cannot handle a piece of work — because the work falls outside the agent's [scope](../../scope/scope.md), exceeds its [capability](agent.md), or produces a contested [dispatch](teaching/explanations/dispatch.md) match — forwards the work to the next-higher [office](teaching/explanations/office.md) in the agent's reporting graph.
Escalation produces a [witness](../../teaching/explanations/witness.md) entry recording why the escalation occurred and which office now bears the work.

The operator's procedure:

1. The agent (or the [skill-invocation](../../skill/skill-invocation/skill-invocation.md) operator on its behalf) detects an inability to handle: a precondition violation outside the agent's authority, a [dispatch matching](../../dispatch/dispatch-matching/dispatch-matching.md) result of $\top$ (contested), an exceeded [fuel bound](../../teaching/explanations/fuel-bound.md), or an explicit "escalate" predication on the message.
2. The escalation operator reads the agent's reporting predications to identify the next-higher office in the [governance](teaching/explanations/governance.md) graph.
3. The work is forwarded as a new message to the higher office's [inbox](teaching/explanations/inbox.md), bearing a predication citing the originating agent, the originating message's canonical hash, and the reason for escalation.
4. The escalation produces a [witness](../../teaching/explanations/witness.md) entry: the originating agent, the higher office, the reason, the canonical hashes of the original and escalated messages.

Three engineering properties:

- **Governance-respecting.** The escalation path is the reporting graph in the governance predications — not an ad-hoc routing decision.
  An office that is not the next-higher in the reporting graph may not receive escalations from a given agent.
  This is the engineering content of "escalation respects the org chart."
- **Bounded.** A piece of work cannot escalate more times than the height of the reporting graph above the originating agent.
  If the work reaches the top of the graph and still cannot be handled, the platform's policy decides: typically the work is recorded as unhandled in the [event log](../../../objects/event-log.md) and the originating message is marked as deferred.
- **Witness-chained.** Each escalation step is one witness entry; the chain of escalations for a given originating message is reconstructible by following the citing-predications.
  An auditor reviewing why some work took longer than expected reads the escalation chain.

escalation was treated as a runtime concern in but was not a first-class operator.
The modern formulation makes it explicit: escalation is one of the platform's named morphisms; its behavior is determined by the governance closure rules; its effects are recorded in the witness chain.
