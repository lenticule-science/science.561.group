---
name: observation-record
description: Observation record
type: definition
class: record
instantiates: [observation-record]
depends-on: [session-record, channel, fiber, witness]
see-also: [instinct-record, consolidate, three-tier-memory]
title: observation-record
---

# Observation record

The substrate-record holding one *observation* — a recorded note of what an agent saw, heard, did, or noticed during a session, before consolidation has identified any pattern in it.
An `ObservationRecord` is the *raw substrate-input to learning*: per [consolidation-as-settlement](../../settlement/consolidation-as-settlement/consolidation-as-settlement.md), accumulated observations compose under `learning`-channel closure rules to produce [`InstinctRecord`](instinct-record.md)s.

An observation is *not yet* a generalization.
Two observations of the same surface event are two observations, not one (each carries its own provenance, timestamp, and witness).
The substrate's discipline is to preserve raw observations in the searchable tier (per [three-tier-memory](../../architecture/three-tier-memory/three-tier-memory.md)) and to *settle them into instincts via consolidation*, not to deduplicate them at observation time.

`ObservationRecord` is FARS's realization of AgOP's [observation-record](../../../objects/observation-record.md) at the bilattice value-domain.

## Required fields

Every conforming realization SHALL hold, for each `ObservationRecord`:

### Identity

- **`name`** — content-derived identifier, typically the canonical hash of the observation's payload.
- **`timestamp`** — ISO-8601 timestamp of when the observation was recorded.

### Source

- **`session`** — reference to the [`SessionRecord`](session-record.md) the observation was emitted from.
- **`agent`** — reference to the [`AgentRecord`](agent-record.md) that produced the observation.
  Inherited from the session's agent unless explicit override.
- **`origin`** — the trace-tag identifying what surfaced the observation (a tool invocation, a closure-rule firing, a manual agent note, an LLM-derived noticing).

### Content

- **`subject`** — the substrate entity (or external referent) the observation is *about*.
  May reference an entity address, a process, a file path, or a non-substrate thing the agent noticed.
- **`predicates`** — the observation's content as predication-cells: `(predicate-name, value)` pairs declaring what the observation asserts.
  At F1 formality, predicates may be sparse and prose-flavored; at F2, structured; at F3 the observation is essentially a typed predication and consolidation may be trivial.
- **`evidence`** — content-addressed reference to any material the observation cites (a screenshot, a tool output, a quoted passage).
  Used to support audit and replay.

### Channel

- **`channel`** — typically `observation`, but MAY be `analysis` for batch-pass observations or `learning` for observations explicitly produced as consolidation candidates.
  Per [seven-channel-decomposition](../../architecture/seven-channel-decomposition/seven-channel-decomposition.md).

### Provenance

- **`witness`** — [`Witness`](witness.md) attached at observation-emission time.
  Per [`emit-event`](../transformers/emit-event.md)'s discipline, every observation that enters the event log carries its emission witness.
- **`derived-from`** — optional list of references to source events (a tool's witness, a session's prior observations) that produced this observation.
  Lets an auditor trace the observation back to its substrate context.

## Invariants

- **Substrate entity.** An `ObservationRecord` SHALL be a substrate entity.
  Per [event-sourcing](teaching/explanations/event-sourcing.md), each observation enters the event log as an event on the `observation` (or other) channel.
- **Append-only.** Observations SHALL NOT be edited or deleted.
  Per [event-sourcing](teaching/explanations/event-sourcing.md), corrections produce retraction events.
- **Session-scoped.** Every observation SHALL cite a session.
  Observations without session linkage cannot participate in consolidation rules that match by-session, and break the substrate's session-audit chain.
- **Provenance-recorded.** The `origin` and `witness` together identify *who* surfaced the observation and *how* it was emitted.
  Observations without provenance are non-conformant.
- **Predicate-typed.** Observations carry predicates, not free-form text alone.
  A pure-prose observation (no structured predicates) is an F1 observation; the substrate admits these but consolidation rules can do less with them.

## What an `ObservationRecord` is not

- **Not an instinct.** An observation is one data point.
  An [`InstinctRecord`](instinct-record.md) is a *settled pattern* across many observations.
  Promotion from observations to instincts is consolidation per [`consolidate`](../transformers/consolidate.md).
- **Not a log line.** A log line is a runtime artifact for human reading.
  An observation is substrate content — the substrate's algebra operates on observations the same way it operates on any other entity.
- **Not a memory of the agent.** Observations are recorded *by* the agent's session but persist *in* the substrate.
  Per [session-as-entity](../../entity/session-as-entity/session-as-entity.md), the substrate carries the observation; the agent reads from the substrate.

## How observations accumulate

During a session, the agent's actions, the closure rules' firings, and the realization's tool invocations produce observations on the `observation` channel.
Each is one substrate event with an attached `ObservationRecord`.
The session's `observation-cursor` tracks the high-watermark in the event log; consolidation reads events from the cursor backward, scoped to the session (or to a multi-session window for cross-session consolidation).

Per [three-tier-memory](../../architecture/three-tier-memory/three-tier-memory.md), observations live in the *searchable* tier: they are queryable by filter (channel, subject, agent, time-range, session) but are not loaded into every prompt.
An agent that wants to see its recent observations runs a respond against the searchable tier.

## Position

`ObservationRecord` is the substrate-record under which the *learning input* is preserved.
Without observation records, consolidation has no input; without consolidation, the substrate has no settlement-path-derived patterns; without patterns, no instincts; without instincts, no skills emerge from operational experience.
The CL pipeline begins with `ObservationRecord`.

The record composes with [`SessionRecord`](session-record.md) (its source), [`Channel`](channel.md) (its routing), [`InstinctRecord`](instinct-record.md) (its settled descendant), and [`Witness`](witness.md) (its provenance).
