---
type: definition
class: substrate-entity
realizes: [agent]
depends-on: [agent, identity-by-relations, agential-self-generation, entity, multi-observer-system]
see-also: [office-record, session-record, agent-community-consensus]
title: Agent record
description: "An agent record is the substrate-entity formal definition of an agent: the predication-graph entity whose predications declare an agent's identity, capabilities, and operational history."
---

# Agent record

An **agent record** is the substrate-entity formal definition of an [agent](teaching/explanations/agent.md): the predication-graph entity whose predications declare an agent's identity, capabilities, and operational history.
Per [identity by relations](../../teaching/explanations/identity-by-relations.md), the agent *is* its predications — formally, an [entity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/entity.md) of the substrate's [entity set](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/entity-set.md) $E$, whose identity is constituted by the predications it participates in.
The agent record is the substrate's representation of those predications.

When multiple agents act on a shared substrate, the collection of their views forms an [agent community](../agent-community/agent-community-consensus/agent-community-consensus.md) — structurally a [multi-observer system](../../../../../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md) whose objects are agent-records and whose morphisms are the agent-to-agent translations encoded in the platform's federation graph.

## Structural fields

- **`id`** — kebab-case identifier; the agent's substrate identity (the entity's name in $E$).
- **`description`** — one-line summary.
- **`agent-kind`** — declaration of what kind of agent this is: `human`, `ai-model` (with model-identity reference), `automated-process`, `composed-multi-agent`.
  Per identity-by-relations, the kind is itself a predication.
- **`identity-key`** — reference to the cryptographic identity used to sign the agent's witnesses.
  Required for federation (per [federation-handshake](../federation/federation-handshake/federation-handshake.md)) and for tamper-evident witness chains.
- **`provenance`** — predications declaring how this agent came to be: who created it (for AI agents and automated processes), when (for time-bounded agents), under what governance authority.
  Required for [provenance](../../teaching/explanations/provenance.md) of the agent's actions.
- **`member-of`** — references to [office-records](office-record.md) the agent is a member of.
  Per [enroll](../../office/enroll/enroll.md), this predication is what grants the agent the office's authorization (powers, duties, privileges, immunities).
- **`individual-powers`** — references to [power-records](../../governance/power/power-record/power-record.md) granted directly to the agent (independent of office membership).
- **`individual-duties`**, **`individual-privileges`**, **`individual-immunities`** — analogous direct grants of the other Hohfeldian positions.
- **`capability-predications`** — substantive predications declaring what work-types the agent handles, what skills it can invoke, what formality layers it operates at.
- **`active-sessions`** — references to currently-open [session-records](session-record.md).
  Active sessions are what the agent is currently doing.
- **`witness-chain`** — derived view: every witness the agent has produced, in event-log order.
  The witness-chain is queryable via traversal but typically not stored as a separate predication (it's reconstructed on demand from the event log).
- **`closure-kind`** — `agent`.

## Invariants

- **Identity-key required.** An agent without an identity-key cannot sign witnesses, cannot federate, cannot be authenticated.
  Identityless agents are admissible only as transient interactive participants without persistent operations.
- **Provenance required for non-human agents.** AI models and automated processes must have provenance predications.
  Human agents may have minimal provenance (the human exists outside the substrate); the substrate's discipline is to record what is recordable.
- **Substrate-resident.** The agent record is itself substrate content.
  Per [agential self-generation](../agential-self-generation/agential-self-generation.md), agents are entities the substrate carries — the agent's entity-set membership is what makes its capability and authorization predications substrate content.
- **Capability-coherent.** The agent's `capability-predications` are consistent with its `member-of` offices' offered capabilities (or are individually-granted overrides).
  Mismatches surface as substrate-coherence issues.

## Operations

- *Create.* Inserting a new agent-record entity establishes the agent in the substrate.
  The creation produces a witness; the agent's first session can begin once the agent-record is resolved.
- *Identify.* Resolving an agent's identity from a signed witness involves [hash-verification](../../../morphisms/compute-hash.md) of the witness's signature against the agent's identity-key.
  The identification produces a verification record.
- *Enroll.* Per [enroll](../../office/enroll/enroll.md), the agent's `member-of` predication is updated.
- *Open session.* Per [session-record](session-record.md) discipline, opening a session creates a session-record citing the agent.
  The session is a settling restricted to the agent's authorized sublocale (per [session-as-time-bounded-sublocale](../../session/session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md)).
- *Audit.* Querying the agent's witness chain, capability predications, session history are substrate traversals.

## Position in the platform

Agent records are the substrate's *first-class actor representation*.
Without them, agents are out-of-band processes whose actions the substrate sees but whose identity it does not represent; with them, agents are substrate entities, queryable and modifiable through the same operators as any other content.
Per [agential self-generation](../agential-self-generation/agential-self-generation.md), the agential layer is in the substrate; agent records are the layer's identity carriers.
When multiple agent records share a substrate, the collection forms an agent community whose consensus and disagreement are characterized by [agent-community-consensus](../agent-community/agent-community-consensus/agent-community-consensus.md).

A platform that hosts external agents (humans connecting via TUI, AI models invoked via API) creates agent-records for them on first interaction; subsequent operations cite the agent-record by id.
The substrate's audit can answer "what has this human done in this scope?" or "what has this AI model produced this week?" by traversing the agent record's witness chain.
