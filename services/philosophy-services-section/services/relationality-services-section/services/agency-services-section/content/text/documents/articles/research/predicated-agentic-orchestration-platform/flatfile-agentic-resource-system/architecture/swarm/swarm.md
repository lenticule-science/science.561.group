---
name: swarm
description: "A swarm in FARS is the agential population acting within one sovereign node: the agents, skills, runbooks, and offices that the node's dispatch routes work to and that the node's heartbeat schedules."
type: concept
class: agential-discipline
status: draft
instantiates: [agential-self-generation, dispatch, heartbeat]
depends-on: [sovereign-node, agent-record, skill-record, runbook-record, office-record]
see-also: [confederation, swarm-coordinated-system, mcp-client-as-swarm-participant, routable-llm-endpoint-as-swarm-participant, swarm-participation-handedness]
title: swarm
---

# Swarm

A *swarm* in FARS is the agential population acting within one [sovereign node](../sovereign-node/sovereign-node.md): the [agents](../objects/agent-record.md), [skills](../objects/skill-record.md), [runbooks](../objects/runbook-record.md), and [offices](../objects/office-record.md) that the node's [dispatch](../../teaching/explanations/dispatch.md) routes work to and that the node's [heartbeat](../../teaching/explanations/heartbeat.md) schedules.
A swarm is not a separate substrate from its sovereign node; it is the *agential aspect* of the node — the population whose activity the substrate's algebra orchestrates.

## What "swarm" pins down

- **One swarm per sovereign node.** A sovereign node has exactly one swarm.
  The swarm's identity is the node's identity; there is no separate swarm-id.
- **The swarm is substrate content.** Per [agential-self-generation](../../../agent/agential-self-generation/agential-self-generation.md), every member of the swarm is itself a substrate entity in the node's flatfile.
  Adding an agent to the swarm is inserting an `AgentRecord`; activating a skill is admitting a `SkillRecord`.
  The swarm is what the substrate's frontmatter says it is.
- **Coordination is substrate-mediated, not message-passing.** Per [dispatch](../../teaching/explanations/dispatch.md), agents are matched to work via twist-product fusion in the closure-rule sub-system; per [heartbeat](../../teaching/explanations/heartbeat.md), unsettled entities are scheduled by policy.
  Two swarm members do not directly call each other; their interaction is mediated by predications they each read and write.

## Relationship to swarm-coordinated-system

The sister theory [swarm-intelligence](../../../../../../artificial-intelligence/theories/swarm-intelligence/_index.md) defines [swarm-coordinated-system](../../../../../../artificial-intelligence/theories/swarm-intelligence/concepts/swarm-coordinated-system.md) as a multi-agent system jointly satisfying scalability, homogeneity, and stigmergy. **A FARS swarm in the sense of this concept is *not* a swarm-coordinated-system in the strict classical sense.**

- *Homogeneity fails by design.* FARS agents are role-typed: skills, offices, and modes differentiate them.
  The swarm-vs-orchestration-dichotomy theorem in swarm-intelligence places role-typed agential systems on the orchestrated side.
- *Scalability is mixed.* A FARS agent backed by an LLM has per-step cost scaling with context length; an agent backed by code has bounded per-step cost.
  The swarm is heterogeneous in cost-class.
- *Stigmergy is approximated.* Substrate-mediated interaction is closer to stigmergy than direct messaging, but the substrate is a structured predication-graph, not a continuous trace field.

The FARS-swarm concept inherits the *coordination spirit* of swarm-intelligence (population-mediated, substrate-mediated, no central conductor, agential-self-generation produces the population) without claiming the formal swarm-coordinated-system convergence guarantees.
Where a sub-population of the swarm happens to satisfy the strict conditions — homogeneous code-backed agents reading and writing a bounded predication-region — that sub-population *is* a swarm-coordinated-system in the strict sense, and the swarm-intelligence theorems apply to it locally.
The FARS-swarm concept is the broader notion that admits both regimes within one sovereign node.

## Position relative to confederation

A swarm is what runs *within* one sovereign node.
A [confederation](../confederation/confederation.md) is a set of sovereign nodes federated together via [federation](../../teaching/explanations/federation.md).
The discipline:

- **Members of a swarm are substrate entities at one node.** An agent is an `AgentRecord` in the node's flatfile.
- **Members of a confederation are sovereign nodes.** A peer is a [`PeerRecord`](../../code/structures/peer-record.md) in this node's flatfile, recording another node's identity and trust.
- **A confederation is not a "swarm of swarms" in the substrate.** The federated whole has no single dispatch table; each node's swarm dispatches its own work.
  Federation is the additive discipline that lets one swarm's predications reach another swarm's substrate via [merge-peer](../../code/transformers/merge-peer.md), per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md).
  The confederation has no agent-population of its own.

## What swarm is not

- *Not a fleet of processes.* A swarm is a substrate-recorded population, not a runtime population.
  One process may host many agents, or many processes may share the substrate.
- *Not bounded to AI agents.* Per [`AgentRecord`](../objects/agent-record.md), an agent is anything that operates on the substrate through skills — humans, code, LLM, hybrid.
  The swarm includes them all.
- *Not the same as the sovereign-node it lives in.* The sovereign node is the substrate-with-its-event-log-and-rule-system; the swarm is the agential population inside it.
  Two FARS realizations could share substrate-shape and differ entirely in their swarm.
