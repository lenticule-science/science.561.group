---
type: narrative
status: current
recaps: [session, memory]
introduces: []
title: Session and memory as substrate state
description: "The dominant frame for \"an agent's session\" treats it as a runtime concern: the agent connects, the runtime allocates a session record in some session table, the agent does work, the runtime tears the session down."
---

# Session and memory as substrate state

The dominant frame for "an agent's session" treats it as a runtime concern: the agent connects, the runtime allocates a session record in some session table, the agent does work, the runtime tears the session down.
State that needs to outlive the session — what the agent learned, what work it left in flight, what context it had built up — is dumped to a memory store the runtime exposes through a separate API.
Resume after disconnection means reattaching to the session record and reading the memory store back into the agent's context.

This shape has the same pathology that runs through every "separate subsystem" pattern.
The session table and the memory store are runtime structures the substrate is unaware of.
Their content does not participate in the substrate's algebra.
Their audit trail is separate from the substrate's [event log](../../../objects/event-log.md).
When the runtime restarts, the session table can be lost, can be partially recovered, can drift from what the substrate's content suggests should be true.
The agent's experience — "I had this context, it disappeared, the system forgot what I was doing" — is a direct consequence of the session and the memory living outside the substrate.

The substrate's response is that a session is a substrate entity and memory is a sub-region of the substrate.
Per [session](../teaching/explanations/session.md), the session entity records the agent's identity, the work in flight, the messages exchanged, the witness chain produced.
Per [memory](../teaching/explanations/memory.md), memory records are predications connecting the agent to recently-touched entities, each carrying a relevance value in the substrate's value-domain.
Both are substrate content; both participate in the substrate's algebra; both have their audit trail in the substrate's event log; both are recoverable from substrate content alone if the runtime restarts.

The structural commitments are concrete:

- **Session start and session end are substrate operations.** Per [open-session](../morphisms/open-session.md) and [close-session](../morphisms/close-session.md), each produces a witness, each is appended to the event log, each updates predications on the agent and session entities.
  Reconstructing what happened across the session boundary is reading past substrate state.
- **Resume is content-addressed.** Per [resume-session](../morphisms/resume-session.md), an interrupted session resumes by re-reading the substrate-resident session record.
  The session's accumulated state is referenced by canonical hash; resuming reads the same byte-identical content the session had at pause.
  The traditional pathology — "the resumed session doesn't quite have the same state as before" — is structurally impossible when the state is content-addressed substrate content.
- **Memory is closure-driven.** The relevance value on each recall record is updated by closure rules: recency-promotion rules raise relevance for newly-touched entities, decay rules lower relevance for untouched entities, explicit-dismissal rules retract dismissed entities.
  The rules are substrate content; tuning the agent's memory behavior is editing the closure rules, not configuring a separate memory subsystem.
- **Compaction is canonical-form rewriting.** When memory grows large, the substrate's response is *not* to truncate or to summarize ambiently — those operations lose information silently and irrecoverably.
  The substrate's response is to apply [canonical-form](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/canonical-form.md) rewrites that retain high-relevance content and retract low-relevance content explicitly, with the retractions witnessed in the event log.
  An auditor reviewing the agent's memory at any past moment can replay the compaction.
- **Session content is bounded by scope.** Per [scope](../../scope/scope.md), what the session can record is bounded by the scope's vocabulary and admission discipline.
  Sessions cannot accumulate predications outside their scope; the substrate's admission discipline rejects out-of-scope content at the session boundary, with the rejection itself a substrate event.

Software prior art that handles long-running agent state well makes the same architectural moves.
Multi-tier agent memory systems where the agent's context is split into always-loaded core blocks, searchable recall, and deep archival — three tiers that map to the substrate's distinction between session-resident content (always-loaded), event-log-indexed content (searchable), and substrate-content-at-rest (archival).
Memory-bank patterns where the agent's context is structured into named sections (productContext, activeContext, progress, decisionLog) — structured content rather than free-form text.
Session-resume patterns where the agent's editorial judgments about its own work are explicitly preserved across pause-resume — substrate content rather than runtime cache.
Each system makes the same move at its specific layer; the substrate's contribution is making the move uniformly across all the platform's persistent state.

Several engineering consequences follow:

- **The agent's "context" is queryable substrate content.** The traditional opaque-blob context window — bytes assembled at session start, modified through opaque updates, lost on session end — is replaced by substrate content the agent can query and the substrate can reason about.
  The platform can compute "what does this agent currently know?" by traversing the agent's memory predications.
- **Session state is replicable.** Per [replication](../../../../../../../../../../content/text/documents/articles/notes/replication.md), session content participates in the substrate's replication discipline.
  An agent's session can be replicated across substrates, can resume on a different host, can be inspected from a different replica.
  The session is not bound to a particular runtime instance.
- **Cross-session learning is a substrate operation.** When an agent completes a session, the session's record stays in the substrate.
  The agent's next session starts with access to the previous sessions' content (within scope).
  Per the [settlement-path](../teaching/explanations/settlement-path.md), the previous sessions' observations can mature into instincts that the next session consults — substrate content driving substrate behavior.
- **Privacy and access are substrate concerns.** Per [authorization](../../governance/authorization/authorization.md), session content's visibility is governed by the substrate's capability discipline.
  An agent reading another agent's session content is governed by the same substrate operators that govern any other content access.
  There is no separate "session privacy" subsystem.
- **Compaction cost is bounded.** Closure-driven memory compaction is bounded by the wavefront width (per [wavefront-and-locality](../../../narratives/wavefront-and-locality.md)).
  A long-running agent's memory does not grow without bound; it settles to an equilibrium where decay-rule retractions balance recency-rule promotions.
  The equilibrium width is a substrate property, tunable by closure-rule edits.

The discipline's hard edge is the refusal to put session state in runtime caches.
A runtime that maintains a session table separately from the substrate has erected a parallel state the substrate is unaware of, and the parallel state will drift.
The substrate's response is to make the substrate's content the only place session state lives, and to make every runtime read from the substrate when it needs session state.

The pattern composes with [agential-self-generation](../../agent/agential-self-generation/agential-self-generation.md): an agent reading its own session content is the substrate reading its own content; an agent rewriting its own memory through closure rules is the platform exercising its self-modification discipline through the substrate's own operators.
With [federation](../teaching/explanations/federation.md): a session that crosses substrates carries its content across the federation boundary, with the destination substrate composing the session's predications against its local scope.
With [governance](../teaching/explanations/governance.md): a governance decision affecting an agent's authority changes the agent's view (per [boundary-as-fiber](../../scope/boundary-as-fiber/boundary-as-fiber.md)) on the next access; the session reflects the change without requiring a session restart.
None of these requires additional infrastructure; each is the substrate's one session-as-substrate-content discipline applied at a different boundary.
