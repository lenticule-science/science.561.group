---
name: agent-record
description: Agent record
type: definition
class: record
instantiates: [agent, agent-record]
depends-on: [agential-self-generation, fiber, witness, scope]
see-also: [skill-record, runbook-record, office-record, invoke-skill]
title: agent-record
---

# Agent record

The substrate-record holding one agent's identity, capabilities, scope, and operational history.
An `AgentRecord` is FARS's realization of AgOP's [agent-record](../../../objects/agent-record.md) at the bilattice value-domain.
Per [agential self-generation](../../../agent/agential-self-generation/agential-self-generation.md), the agent's existence is *the existence of its record*: an agent that is not representable as predications is outside the substrate; the substrate treats only agents-as-entities.

An `AgentRecord` carries three classes of predications: *identity*, *capability*, and *operative history*.
Identity predications declare *who* the agent is (name, type, provenance, signing key).
Capability predications declare *what the agent can do* (skills available, scope of operation, work-types handled).
Operative history predications accumulate from the agent's actions over time (every skill invoked, every runbook executed, every witness emitted).

## Required fields

Every conforming realization SHALL hold, for each `AgentRecord`:

### Identity

- **`name`** — canonical identifier within the substrate.
  Used in witnesses to cite who performed each action.
- **`type`** — the agent's kind (`human`, `ai-model`, `automated-process`, `hybrid`).
  Informs how the substrate routes work and presents context.
- **`provenance`** — origin trace: when the agent was enrolled in the substrate, by which signing authority, with what initial capabilities.
  A predicate chain leading back to substrate-installation.
- **`signing-key`** — public key (or content-addressed reference to it) used to verify the agent's witness signatures.
  Witnesses citing this agent SHALL be verifiable against this key per [hash-discipline](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-discipline.md).

### Capability

- **`skills`** — a list of references to [`SkillRecord`](skill-record.md) entities the agent can invoke.
  The agent's *constructor set* per [office-as-fuzzy-cell](../../office-as-fuzzy-cell/office-as-fuzzy-cell.md).
  At F3, this is a typed list; at F1–F2, may include prose-described informal capabilities.
- **`scope`** — predication pattern declaring the substrate region the agent operates within.
  Reads from the [scope](../../../scope/scope.md) discipline; the agent's operations are bounded to entities matching its scope.
- **`work-types`** — list of work-type predicates the agent handles (e.g., `[procedure, derivation, inquiry]`).
  Used by [`dispatch`](../morphisms/dispatch.md) for matching incoming work.
- **`reads`** — channels and predicates the agent consumes (per [declared-dependency-ordering](../../declared-dependency-ordering/declared-dependency-ordering.md)).
- **`writes`** — channels and predicates the agent produces.
- **`offices`** — the [`OfficeRecord`](office-record.md) entities this agent currently inhabits.
  An agent MAY hold one or more offices; each office defines an action domain.
  The agent's effective capabilities are the union of its own skill list and its offices' constructors.

### Operative history

- **`witness-chain`** — content-addressed references to the witnesses this agent has emitted, in canonical order.
  The chain accumulates as the agent acts; replay reproduces the agent's history.
- **`current-session`** — optional reference to the agent's currently-open [`SessionRecord`](session-record.md) (forthcoming spec section).
  Null when the agent is between sessions.
- **`last-active`** — timestamp of the agent's most recent witness emission.
  Used by anomaly-detection rules per [anomaly-as-contradiction](../../settlement/anomaly-as-contradiction/anomaly-as-contradiction.md) (e.g., a stale-agent rule fires when `last-active` exceeds a threshold).

## Invariants

- **Substrate entity.** An `AgentRecord` SHALL be a substrate entity.
  Per [agential self-generation](../../../agent/agential-self-generation/agential-self-generation.md), the substrate's discipline treats agents only through their records.
- **Witness-attributed.** Every action the substrate records as having been performed by this agent SHALL cite the agent's name in the witness's `actor` field, AND the action's witness SHALL be signed by the agent's `signing-key` (or reference an admissible delegation chain that signs it).
- **Capability-bounded.** The agent's effective capabilities are the union of its own `skills` and its offices' constructors.
  An action requiring a skill not in this union SHALL fail at dispatch; the failure produces a `guard`-channel diagnostic event.
- **Scope-bounded.** Actions outside the agent's scope SHALL fail at admission.
  Scope-violations are guard-channel events.
- **Identity-stable.** The agent's `name`, `type`, and `signing-key` SHALL NOT be modified after initial enrollment without an explicit re-enrollment event citing both the old and new identity.
  Identity drift breaks the witness chain's verifiability.

## What an `AgentRecord` is not

- **Not a session.** Agents persist across sessions; sessions are bounded interactions between an agent and the substrate.
  An agent has many sessions over its lifetime; each session is its own entity.
- **Not a process.** A FARS realization MAY associate an agent with a runtime process (a Python process, an LLM API endpoint, a human in a terminal), but the agent IS the substrate record, not the process.
  Two processes serving the same agent (e.g., a load-balanced LLM deployment) act as one agent for substrate purposes.
- **Not the user.** A user is a substrate entity (with its own personnel record); an agent may serve a user, may be the user, or may be an autonomous process.
  The relationship is declared as substrate predications, not implied.

## Position

`AgentRecord` is the substrate-level statement that "this agent exists, with this identity, with these capabilities, with this history, at this scope."
It is what makes [`invoke-skill`](../transformers/invoke-skill.md) and [`execute-runbook`](../transformers/execute-runbook.md) coherent: those operators take an `AgentRecord` reference as their actor parameter and produce witnesses citing that agent.

The record composes with [`OfficeRecord`](office-record.md) (the action-domain the agent operates in), [`SkillRecord`](skill-record.md) (the procedures the agent invokes), and [`RunbookRecord`](runbook-record.md) (composed procedures the agent executes).
Together these four record types form the agent-side substrate of FARS.
