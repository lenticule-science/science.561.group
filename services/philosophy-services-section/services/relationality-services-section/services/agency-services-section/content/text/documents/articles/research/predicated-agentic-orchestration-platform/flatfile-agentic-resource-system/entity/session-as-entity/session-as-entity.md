---
name: session-as-entity
description: "The discipline that a FARS session is itself a substrate entity, not a transient runtime object: when an agent opens a session to do work, the session is created as a substrate entity per apply-edit; when the session ends, the session is closed but the entity persists; the session's history (every skill invoked, every observation made, every event emitted during the session) is in the substrate's event log under the session's address."
type: concept
class: framing
depends-on: [session, agential-self-generation, agent-record, office-record]
see-also: [session-record, open-session, close-session, three-tier-memory]
title: session-as-entity
---

# Session as entity

The discipline that *a FARS session is itself a substrate entity*, not a transient runtime object: when an agent opens a session to do work, the session is created as a substrate entity per [`apply-edit`](../../code/transformers/apply-edit.md); when the session ends, the session is closed but the entity persists; the session's history (every skill invoked, every observation made, every event emitted during the session) is in the substrate's event log under the session's address.

The framing is the engineering content of *session save/resume is explicit, not implicit* (the prior-art convergent claim across Bussard, OpenClaw, ECC, Cline, Letta).
When a session ends, no special "save the session" operation runs — the session's content is already in the substrate.
When a session resumes, no special "load the session" operation reconstructs it — the substrate's existing read-discipline operates on the session's address.

The framing depends on [agential-self-generation](../../../agent/agential-self-generation/agential-self-generation.md): every operative element of an AgOP platform is itself a substrate entity.
A session is operative; therefore a session is a substrate entity.
Sessions that exist outside the substrate (as runtime-only objects in a session-server's memory) violate the discipline; FARS treats only sessions-as-entities.

## What a session entity contains

A [`SessionRecord`](../objects/session-record.md) is *what the substrate carries about one session*.
Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the record IS the session: the session's identity, its agent, its office, its scope, its current state, its observation log are all predicates on the record.
The record is what an [`open-session`](../morphisms/open-session.md) creates; what a [`close-session`](../morphisms/close-session.md) finalizes; what a [`resume-session`](../morphisms/resume-session.md) reads.

The session's *runtime presence* (the live process, the open LLM stream, the human at a terminal) is not part of the substrate; it's a realization-level binding between the substrate-resident session entity and the external compute resource.
Two realizations that share the same session record produce equivalent session behavior; two realizations whose session records diverge are running different sessions.

## Lifecycle phases

A session entity moves through declared lifecycle phases, each marked by a substrate event:

- **`open`** — the session has been created (`open-session` event); the agent has been invested with the office; the always-loaded tier has been composed; work can begin.
- **`active`** — the session is in the middle of work.
  Observations accumulate in the searchable tier; substrate edits flow through `apply-edit`.
- **`paused`** — the session has been temporarily suspended (the agent stepped away, the realization is rate-limited, the substrate is in maintenance).
  The session-record persists; the session-state event chain is intact; resumption picks up where work left off.
- **`closing`** — the session is ending; consolidation candidates are being identified; the final state is being recorded.
- **`closed`** — the session has ended; the session-record is finalized; subsequent operations on the session are read-only.
  The session is *not retired* from the substrate; closed sessions remain queryable.

Lifecycle transitions are themselves substrate events.
The substrate's `analysis`-channel rules can fire on session-state predicates (e.g., a `stale-session` rule that triggers when a session has been `active` for longer than a threshold without observations, surfacing as a $\top$-cell per [anomaly-as-contradiction](../../settlement/anomaly-as-contradiction/anomaly-as-contradiction.md)).

## What session-as-entity makes possible

- **Audit of agent work.** The session record's event chain is the auditable history of the agent's session: what was invoked, what was observed, what was emitted, in what order.
  Replaying the chain reproduces the session's substrate effects.
- **Resumption across agents.** A session that ended without completing its work can be resumed by a *different agent* (per the office's installation discipline; substituting the bearer is a substrate edit).
  The new agent starts from the substrate-resident state, not a runtime handoff.
- **Cross-session consolidation.** Per [consolidation-as-settlement](../../settlement/consolidation-as-settlement/consolidation-as-settlement.md), patterns from one session's observations compose against patterns from past sessions.
  The composition operates over substrate content, and the substrate-resident session record makes the cross-session traversal coherent.
- **Federation of sessions.** Two FARS substrates federating sessions exchange session-records and event chains via [federation](../../teaching/explanations/federation.md).
  The shared substrate vocabulary makes cross-substrate session-resume admissible (subject to authorization).
- **Substrate-coherence checks on session work.** The substrate's `guard`-channel rules apply to session edits: a session that produces substrate edits violating the office's `writes` predicate or scope is flagged at substrate-coherence-check time, not at agent-runtime.

## What session-as-entity is not

- **Not a chat history.** A chat history is a sequence of messages between an agent and a human; FARS sessions MAY include chat-shape work but are not constrained to it.
  A session may consist entirely of substrate edits with no human-facing chat.
- **Not a process.** A realization MAY associate a session with a process (a Python process, an LLM API stream, a terminal); the session IS the substrate record, not the process.
  Two processes serving the same session (a load-balanced pool) act as one session for substrate purposes.
- **Not a transaction.** A transaction has rollback semantics; sessions don't roll back.
  A session that produced substrate edits and was later judged faulty is *not undone* — the edits remain in the substrate, with retraction events emitted for the ones that should be reversed (per [event-sourcing](event-sourcing.md)'s retraction discipline).

## Position

Session-as-entity is what makes [`SessionRecord`](../objects/session-record.md) coherent and what gives [`open-session`](../morphisms/open-session.md), [`resume-session`](../morphisms/resume-session.md), [`close-session`](../morphisms/close-session.md), and [`consolidate`](../../code/transformers/consolidate.md) their semantics.
Without the framing, sessions would either be too ephemeral (lost when the runtime process ends) or too coupled to runtime (unreplayable across realizations).
With the framing, sessions are first-class substrate content that the substrate's whole machinery — events, witnesses, replay, audit, federation — applies to.
