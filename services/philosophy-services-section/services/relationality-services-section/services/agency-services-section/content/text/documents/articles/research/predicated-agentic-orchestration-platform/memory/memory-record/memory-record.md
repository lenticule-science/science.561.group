---
type: definition
class: substrate-entity
realizes: [memory]
depends-on: [memory, session, agent]
see-also: [session-record, settlement-path]
title: Memory record
description: "A memory record is the substrate-entity formal definition of an agent's memory: the predication-graph entity that records a particular recall record — predications connecting an agent to a recently-touched substrate entity, with a…"
---

# Memory record

A **memory record** is the substrate-entity formal definition of an agent's [memory](teaching/explanations/memory.md): the predication-graph entity that records a particular *recall record* — predications connecting an [agent](teaching/explanations/agent.md) to a recently-touched substrate entity, with a relevance value indicating how strongly the agent should retain the entity in memory.

A session's memory is not one entity but a *region* of memory records: many recall records, each recording one thing the agent has recently encountered.
The session's [session-record](session-record.md) cites the region; substrate operators consult the region when the agent acts.

## Structural fields

- **`id`** — kebab-case identifier; typically derived from agent-id + recalled-entity-id + creation-time.
- **`agent`** — reference to the agent whose memory this record contributes to.
- **`session`** — reference to the [session](teaching/explanations/session.md) the recall happened in (or `null` for cross-session memory the agent retains).
- **`recalled-entity`** — reference to the substrate entity the memory is about.
- **`recall-context`** — predications declaring why the entity was recalled: which traversal touched it, which skill invocation referenced it, which dispatch decision involved it.
- **`relevance`** — the substrate's value-domain measure of how strongly the agent should retain this recall.
  Per [memory](teaching/explanations/memory.md), relevance is value-domain-typed (multi-valued, weighted, bilattice-valued), not a Boolean.
- **`last-accessed`** — informational timestamp of the most-recent access.
  Used by recency-decay closure rules.
- **`pinned`** — optional Boolean predication indicating the recall is exempt from decay (the agent or governance has marked the recall as durable).
- **`closure-kind`** — `recall`.

## Invariants

- **Scope-bounded.** A recall record's `recalled-entity` must be visible at the agent's [scope](../../scope/scope.md).
  Agents do not recall what their authorization does not admit; per the discipline, out-of-scope recall records are violations.
- **Substrate-recorded.** Per [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md), the memory region is itself substrate content; the platform's memory is queryable through the same operators as ordinary content.
- **Decay-rule-determined.** A memory record's `relevance` is updated by the substrate's decay rule (a closure rule that applies to recall records as a class).
  The substrate's discipline is that all updates flow through the rule, not through ad-hoc per-record modifications.

## Operations

- *Insert.* When the agent encounters a substrate entity (via a traversal, a skill invocation, a dispatch), the substrate's recall-creation rule fires: a memory record is inserted with initial relevance derived from the encounter's significance.
  The insertion is witnessed.
- *Decay.* The substrate's recency-decay closure rule lowers the relevance of recall records whose `last-accessed` is older than the rule's threshold.
  Records dropping below a retention floor are retired.
- *Promote.* Recall records that recur frequently can be promoted into [instinct-records](instinct-record.md) by the [promote](../../office/promote/promote.md) operator: a pattern across many recalls becomes a substrate-level instinct.
- *Pin / unpin.* The agent (or governance) can pin a recall record, exempting it from decay.
  The pin is itself a substrate predication, witnessed.
- *Compact.* The session-end discipline may compact the session's memory region: low-relevance records are retired; high-relevance records are summarized into a smaller canonical-form.
  Compaction preserves provenance — compact records cite the originals.

## Position in the platform

Memory records are the platform's *agential history with relevance weighting*.
They are what makes session resume meaningful (the resumed session's recall set is the session's prior recall set), context compaction sustainable (low-relevance records are retired without losing what mattered), and learning meaningful (instincts derive from patterns across recall records).

Per [formality-layer](../../scope/formality-layer/formality-layer.md), a platform that maintains rich memory regions can answer many queries from substrate state rather than re-deriving from observations: the memory region is the platform's working substrate at runtime.
