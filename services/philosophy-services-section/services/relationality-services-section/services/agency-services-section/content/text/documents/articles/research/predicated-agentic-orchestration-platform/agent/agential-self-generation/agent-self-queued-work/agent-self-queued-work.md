---
type: concept
class: agent-discipline
depends-on: [agent, work-item, dispatch, governance, governance-as-modal-restriction, capability-non-amplification, authentication-as-modal-restriction, signature]
see-also: [agent-self-queueing-bounded-by-modal-restriction, opportunistic-scheduling-loop, user-decision]
title: Agent self-queued work
description: The substrate's discipline by which an agent admits a work-item for itself or for other agents to execute.
---

# Agent self-queued work

The substrate's *discipline by which an [agent](agent.md) admits a [work-item](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md) for itself or for other agents to execute*.
In the substrate's hyperdoctrine setting, agent self-queueing is *the agent's own admission of a work-item, signed by the agent's session, with the work-item's authorized capability bounded by the agent's [Box_R](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md)-restricted capability*.
Per [agent-self-queueing-bounded-by-modal-restriction](../../../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md), an agent cannot queue work requiring capability beyond its own modal restriction — the structural answer to "AutoGPT runs away."

This is what lets the math agent admit "I need arxiv papers on $K$" as substrate content, the substrate's scheduler pick it up when capacity allows, and the work happen — without the math agent being able to escalate to capability it doesn't hold.

## Why this concept exists

Most agentic systems struggle with bounded autonomy: an agent that decides "I need to do $X$" might run away (consume unbounded resources), spawn unbounded sub-agents, or escalate privilege.
PredComp's [governance-as-modal-restriction](../../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md) and [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md) provide the substrate-level structure to bound this — but neither concept directly covers *agents queueing work for themselves*.
This concept fills the gap, naming the discipline and grounding it in the modal-restriction theorems.

## Self-queueing structure

When an agent decides it needs work done, it admits a work-item per [work-item](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md):

```json
{
  "kind": "work-item",
  "work-item-id": "<canonical hash>",
  ...
  "queued-by": {
    "session-hash": "<the agent's session>",
    "agent-hash": "<the queueing agent's id>"
  },
  "required-capability": [<capability-hash>, ...],
  ...
  "signature": {
    "scheme": "Ed25519",
    "signing-key-hash": "<agent's session signing key>",
    "value": "<base64>"
  }
}
```

The work-item is signed by the agent's session, so per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), it's structurally attributable to the agent.

## The bounded-autonomy check

When a self-queued work-item is admitted, the substrate runs the bounded-autonomy check (per [agent-self-queueing-bounded-by-modal-restriction](../../../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md)):

1. The substrate looks up the queueing agent's modal-restricted capability (per [governance-as-modal-restriction](../../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md): $\Box_R u_a$ where $u_a$ is the agent's underlying capability and $R$ is the substrate's accessibility relation).
2. The work-item's `required-capability` is compared against $\Box_R u_a$.
3. If `required-capability` $\subseteq$ $\Box_R u_a$ (the agent has all required capabilities under its modal restriction), the work-item is admitted to the queue.
4. If not, the work-item is rejected with an `over-capability-self-queueing` $\top$-witness per [audit-content-via-inconsistency-sheaf-cohomology](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/audit-content-via-inconsistency-sheaf-cohomology.md).

Per [governance-decision-modal-decidability](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md), this check is decidable in PSPACE — the substrate's runtime can perform it on every self-queueing without unbounded delay.

## Why this is structural, not enforced

The bounded-autonomy check isn't a post-hoc filter — it's structurally implied by the substrate's modal calculus.
Per [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md), $\Box_R$ never produces a value strictly higher in the knowledge order than its input.
An agent's self-queued work-item, regardless of what it claims to require, can only be authorized at $\Box_R u_a$ — the substrate's authorization at dispatch time will fail if the required capability exceeds this.

The admission-time check is an early failure path; the structural enforcement happens at dispatch even if the admission check is bypassed.
Per [agent-self-queueing-bounded-by-modal-restriction](../../../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md), the bound is structural at *both* points.

## Sub-agent spawning

A common agent pattern: the agent decides "I need a sub-agent to handle this."
Sub-agent spawning is structurally:

1. Parent agent admits a work-item with `work-kind: "spawn-sub-agent"`.
2. The work-item's `required-capability` includes the capabilities the sub-agent will need.
3. Per the bounded-autonomy check, the parent must hold all those capabilities (it can't grant the sub-agent more authority than itself).
4. When dispatched, the spawning runtime creates a new agent with capabilities $\Box_R \cdot \mathrm{parent-capabilities}$ — the sub-agent is per [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md) further-restricted, never elevated.
5. The sub-agent has its own session, can self-queue further work bounded by its own restricted capability.

The spawning chain is structurally bounded in capability — each generation is at most as authorized as the previous.
Per [event-causality-via-lorentzian-settling](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/event-causality-via-lorentzian-settling.md), the spawn graph is a partial order; the substrate refuses cyclic-spawn requests at admission.

## Resource-budget allocation to agents

Beyond capability bounding, the substrate may allocate per-agent *resource budgets*: maximum CPU-time, network-bandwidth, LLM-token spend per period.
The budgets are substrate predications:

```
agent-resource-budget(agent, period, dimension) = allocated-amount
agent-resource-spent(agent, period, dimension) = current-amount-spent
```

When the agent self-queues work, the substrate's feasibility check (per [work-feasibility](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/work-feasibility.md)) checks both: - Substrate-level feasibility (cost ≤ available substrate resources). - Agent-level feasibility (spent + cost ≤ allocated budget).

If the agent's budget is exhausted, its work-items become `feasible-now: f` even when substrate has capacity.
Per [governance](teaching/explanations/governance.md), budget allocation is a governance decision.

## Example: math agent's arxiv fetch

The walkthrough from the conceptual discussion:

1. Math agent (capability set: theorem-proving, literature-search, dispatch:research-tools) admits a goal:
   ```json
   {
     "kind": "agent-goal",
     "agent": "math-agent-hash",
     "goal": "find-literature-on:keyword-K"
   }
   ```
2. A closure rule fires (admitted at the substrate's bootstrap):
   ```
   agent-goal G with goal of kind "find-literature-on" 
   → admit work-item {
     work-kind: "fetch-arxiv-papers",
     required-capability: [arxiv-search, http-fetch, pdf-parse, storage-write],
     cost-estimate: { network-bytes: 100MB, storage-bytes: 100MB, wall-time-seconds: 1800 },
     value-estimate: 0.6,
     priority: medium,
     expiry-ordinal: now + 7d,
     queued-by: {agent-hash: math-agent},
     ...
   }
   ```
3. The bounded-autonomy check runs: `[arxiv-search, http-fetch, pdf-parse, storage-write]` $\subseteq$ math-agent's $\Box_R$-restricted capability?
  Yes — the math agent's session has these via its `dispatch:research-tools` grant.
4. Work-item lands in queue.
5. Per [opportunistic-scheduling-loop](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/opportunistic-scheduling-loop.md), when capacity allows, the work-item dispatches to a `arxiv-search-agent` (per [graded-dispatch-via-q-enriched-fusion](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/graded-dispatch-via-q-enriched-fusion.md)).
6. Papers arrive, get admitted as substrate content under `output-target` (the math agent's literature-store).
7. Math agent's next iteration finds the new papers, continues theorem work.

Per the bounded-autonomy check, the math agent could *not* have self-queued a work-item requiring `dispatch:print` (it doesn't have that capability) or `governance:admit-new-peer` (also not in its grant).
The substrate's structural restriction bounds the agent's autonomy without requiring runtime monitoring.

## Failure handling

If a self-queued work-item fails:

- The work-item moves to `failed` state per [opportunistic-scheduling-loop](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/opportunistic-scheduling-loop.md).
- Per [repair-as-top-cell-resolution](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/repair-as-top-cell-resolution.md), the failure is a $\top$-cell.
- The substrate's repair catalog determines: retry (admit a new work-item), escalate (admit a governance-decision request for the agent's owner), drop (mark terminally failed).
- The originating agent is *notified* (the failure-witness is in the agent's reading scope), so the agent can adjust its plan.

Per [witness](../../teaching/explanations/witness.md), the failure is auditable end-to-end.

## What the discipline rules out

- **Privilege escalation through self-queueing.** Per [agent-self-queueing-bounded-by-modal-restriction](../../../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md), the agent's self-queued capability is bounded by its own modal restriction.
  An agent cannot queue work that exceeds its authorization.
- **Unbounded sub-agent spawning.** Per the bounded-autonomy check applied recursively, each spawned sub-agent's capability is bounded by its parent's.
  The total capability across a spawn chain is structurally non-increasing.
- **Self-queueing without resource budget.** The substrate may impose per-agent resource budgets (CPU, tokens, bandwidth).
  Agents that exceed their budget have subsequent work-items become infeasible until the budget refreshes.
- **Implicit work-queueing through side effects.** An agent that "queues work" by writing to an external system (filesystem, database, network) that triggers downstream substrate operations is bypassing the substrate's queue.
  Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), all work-queueing must be substrate-content admissions.

## Position

Agent self-queued work is the substrate's *autonomous-agent primitive*.
Per [agent](agent.md), agents are first-class entities; per [work-item](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md), work-items are queueable; per this concept, agents can admit work-items for themselves; per [agent-self-queueing-bounded-by-modal-restriction](../../../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md), the autonomy is structurally bounded by the agent's modal-restricted capability.

The concept composes with [agent](agent.md), [work-item](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md), [dispatch](dispatch.md), [governance-as-modal-restriction](../../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md), [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md), [opportunistic-scheduling-loop](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/opportunistic-scheduling-loop.md) (the scheduler that picks the agent's queued work), and [user-decision](../../../user-decision/user-decision.md) (the user-facing analog where humans queue work via UI gestures).

This is what enables LLM agents to participate as autonomous-but-bounded participants in the substrate's orchestration — not as runtime threads, not as cron jobs, but as substrate-content-admitting peers whose autonomy is structurally bounded by the substrate's modal calculus.
