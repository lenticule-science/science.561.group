---
type: theorem
class: engineering-claim
status: proved
depends-on: [agent-self-queued-work, work-item, agent, governance-as-modal-restriction, capability-non-amplification, authentication-as-modal-restriction, modal-necessity-operator, modal-necessity-basic-properties, signature-binds-witness-to-identity]
see-also: [just-in-time-orchestration-via-cohomological-vanishing, governance-decision-modal-decidability]
title: An agent's self-queued work cannot exceed the agent's modal-restricted capability
description: Claim.
---

# An agent's self-queued work cannot exceed the agent's modal-restricted capability

**Claim.** For any [agent](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/agential-orchestration-platform/concepts/agent.md) $a$ admitting a [work-item](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md) $W$ via [agent-self-queued-work](../../research/predicated-agentic-orchestration-platform/agent/agential-self-generation/agent-self-queued-work/agent-self-queued-work.md), the work-item's `required-capability` set is structurally bounded by the agent's [Box_R](../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md)-restricted capability:

$$\mathrm{required\_capability}(W) \;\subseteq\; (\Box_R u_a)_{w_a}$$

where $u_a$ is the agent's underlying capability fiber, $R$ is the substrate's [bilattice accessibility relation](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md), and $w_a$ is the agent's world.
Per [capability-non-amplification](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/functional-runtime-platform/theorems/capability-non-amplification.md), $\Box_R$ never produces strictly higher capability than $u_a$ — so the agent's self-queued work is structurally bounded by the agent's own grant.

This is the substrate's structural answer to *bounded autonomy*: an agent cannot escalate its authority by self-queueing; per [authentication-as-modal-restriction](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md) the same modal-restriction discipline that bounds user-session capability bounds agent-session capability.

## Why this holds

Per [agent-self-queued-work](../../research/predicated-agentic-orchestration-platform/agent/agential-self-generation/agent-self-queued-work/agent-self-queued-work.md), the agent admits a work-item signed by its session.
Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), the signature binds the work-item to the agent's session.
Per [authentication-as-modal-restriction](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md), the agent's session capability is the modal restriction $\Box_R u_a$ along the session's accessibility cell.

When the substrate evaluates the work-item's authorization (at admission for the early failure path, at dispatch for the structural enforcement):

1. The required capability is `required-capability(W)`.
2. The agent's available capability is `(Box_R u_a)_{w_a}` — what the modal restriction admits.
3. The authorization check is: `required-capability(W)` $\subseteq$ `(Box_R u_a)_{w_a}`.

Per [modal-necessity-basic-properties](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/content/twist-modal-translation/references/modal-necessity-basic-properties.md), $\Box_R$ preserves the truth-meet $\wedge_t$, preserves $\mathbf{t}$, and is monotone in its input.
Per [capability-non-amplification](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/functional-runtime-platform/theorems/capability-non-amplification.md), $\Box_R$ on a non-trivial accessibility never produces strictly higher knowledge-order value than the input.

Therefore: $(\Box_R u_a)_{w_a} \leq_k u_a$ — the agent's modally-restricted capability is at most the agent's underlying capability.
A work-item requiring capability beyond $u_a$ certainly cannot be authorized; a work-item requiring capability beyond the modal restriction $(\Box_R u_a)_{w_a}$ also cannot, even if it were within $u_a$ (the modal restriction is the operative bound).

Per [governance-decision-modal-decidability](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md), the authorization check is decidable in PSPACE — the substrate can perform it on every self-queueing without unbounded delay.

## Engineering consequence

- **No privilege escalation through self-queueing.** Per the theorem, the agent's self-queued work-item's required capability is bounded by the agent's modal restriction.
  An agent that attempts to queue work requiring capability beyond its grant is rejected at the bounded-autonomy check.
- **Bounded sub-agent spawning.** When an agent spawns a sub-agent (via a `spawn-sub-agent` work-item), the sub-agent's capability is at most $\Box_R \cdot \mathrm{parent-capability}$.
  Per the theorem applied recursively, each generation in a spawn chain is at most as authorized as the previous; the chain is structurally non-amplifying.
- **Resource-budget exhaustion bounds the agent.** Beyond capability bounding, per-agent resource budgets (CPU-time, LLM-tokens, network-bandwidth) further bound the agent's self-queueing.
  Per [work-feasibility](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/work-feasibility.md), exceeded budgets make new self-queued work infeasible.
  Per the theorem composed with the budget discipline, the agent is bounded along multiple dimensions.
- **Federation-aware bounding.** When a work-item is queued by an agent in one substrate but dispatched cross-substrate, per [federation-trust-bilattice-graded](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/federation-trust-bilattice-graded.md), the receiving substrate evaluates its own accessibility relation.
  Per [federation-path-metrics-multiplicative](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-path-metrics-multiplicative.md), the cross-substrate capability composes via the federation graph's quantale.
  The agent's effective capability across federation is structurally non-increasing.
- **Audit chain captures every self-queueing.** Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), every self-queued work-item is signed by the agent's session; per [witness-chain-as-proof-object](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/witness-chain-as-proof-object.md), the substrate's audit chain records each self-queueing.
  An auditor can trace every work-item to its originating agent, with the bounded-autonomy check evaluable at each link.

## The structural answer to "AutoGPT runs away"

Most agentic systems struggle with autonomy because the only bounds are runtime monitoring (rate limits, quota tracking) — which have to be *added on top* of the agent's logic.
An agent that misjudges priority can monopolize resources before the monitor reacts; an agent with subtle bugs can spawn cascading sub-agents.

Per the theorem, the substrate's bound is *structural*, not monitored:

- The agent's session capability $(\Box_R u_a)_{w_a}$ is determined at session establishment (per [session-establishment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/interactive-application-platform/concepts/session-establishment.md)) — it doesn't grow during the session.
- Self-queued work-items are bounded by this capability — they cannot escalate.
- Sub-agents are bounded by their parent's capability — the spawn chain is non-amplifying.
- Resource budgets further bound the agent within its capability — even authorized work fails when budget is exhausted.
- Federation across substrates further-restricts via the federation accessibility — the agent's effective reach is bounded by the trust grade.

A "runaway" agent — one that consumes resources unboundedly — cannot occur in a substrate respecting the theorem, because the agent's capability bounds its work-queueing, which bounds its resource consumption, which is monitored by the substrate's [opportunistic-scheduling-loop](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/opportunistic-scheduling-loop.md).
The bound is structural at every level.

## Idempotence and replay

Per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), self-queued work-items are content-addressed.
An agent that queues the same work twice produces the same work-item-id, and the substrate deduplicates.
Per [witness-chain-as-proof-object](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/witness-chain-as-proof-object.md), the audit replay deterministically reconstructs all agent self-queueings.

This means agent-driven workflows are *replayable*: re-running the substrate's history under the same rule-system produces the same agent self-queueings, the same work-items, the same dispatches.
Per [bootstrap-determinism](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/bootstrap-determinism.md), the substrate's behavior is fully determined by its content.

## What the theorem rules out

- **Unbounded agent autonomy.** Per the theorem, agents are bounded by their modal restriction.
  An "unbounded autonomy" agent doesn't exist in a substrate respecting the theorem.
- **Agent-spawned-sub-agent capability amplification.** Per the recursive application, sub-agents are bounded by parents.
  A spawning chain that produces a more-capable descendant is non-conformant.
- **Self-queueing that bypasses the bounded-autonomy check.** Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), unsigned self-queueings are rejected; per the theorem, signed self-queueings are checked against the agent's modal restriction.
  There's no admissible bypass.
- **Federation that elevates agent authority.** Per [federation-trust-bilattice-graded](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/federation-trust-bilattice-graded.md) and [federation-path-metrics-multiplicative](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-path-metrics-multiplicative.md), cross-substrate capability composes by the federation quantale — non-amplifying.
  An agent's effective capability across federation is structurally bounded.

## What the theorem requires

- The agent's session capability is the modal restriction $\Box_R u_a$ per [authentication-as-modal-restriction](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md).
- The substrate implements $\Box_R$ per [modal-necessity-operator](../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md).
- Self-queued work-items are signed by the agent's session per [signature-binds-witness-to-identity](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md).
- The substrate's bounded-autonomy check (admission-time and dispatch-time) is in place per [agent-self-queued-work](../../research/predicated-agentic-orchestration-platform/agent/agential-self-generation/agent-self-queued-work/agent-self-queued-work.md).
- The bilattice accessibility relation $R$ is recorded as substrate content (per [self-representation](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md)).

## Position

This theorem is the structural foundation for the substrate's bounded-autonomy discipline.
Together with [authentication-as-modal-restriction](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md) (user-session capability), [governance-as-modal-restriction](../../research/predicated-agentic-orchestration-platform/governance/governance-as-modal-restriction/governance-as-modal-restriction.md) (governance capability), [capability-non-amplification](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/functional-runtime-platform/theorems/capability-non-amplification.md) (call-graph capability), and [federation-trust-bilattice-graded](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/federation-trust-bilattice-graded.md) (cross-substrate capability), the substrate's authorization discipline is *one phenomenon* — modal restriction on the bilattice accessibility relation — at multiple engineering surfaces.

The substrate's claim to *bounded agent autonomy* is structural — the bound is in the modal calculus, not added by a monitoring layer.
An LLM agent on the substrate can reason, plan, queue work for itself, spawn sub-agents, federate with peers — and at every step, the structural bound applies.
This is what enables the substrate's just-in-time orchestration to safely include agent-self-queued work alongside user-queued work; per [opportunistic-scheduling-loop](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/opportunistic-scheduling-loop.md), the scheduler picks the best feasible work-item without distinguishing whose authority queued it, because the structural bound has already constrained what each authority can queue.

This is what makes the system the user described possible: agents pursuing their goals autonomously, the substrate orchestrating opportunistically, *without* the runaway-agent failure mode that has plagued every prior attempt.
