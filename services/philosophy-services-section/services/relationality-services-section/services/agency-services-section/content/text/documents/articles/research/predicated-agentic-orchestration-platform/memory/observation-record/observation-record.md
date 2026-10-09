---
type: definition
class: substrate-entity
realizes: [settlement-path]
depends-on: [settlement-path, witness]
see-also: [instinct-record, skill-record, tool-record]
title: Observation record
description: "An observation record is the first stage of the settlement path: a substrate-entity recording what happened — an event observed, a state reached, a failure diagnosed — without claiming why it happened or what to do about it."
---

# Observation record

An **observation record** is the first stage of the [settlement path](teaching/explanations/settlement-path.md): a substrate-entity recording *what happened* — an event observed, a state reached, a failure diagnosed — without claiming why it happened or what to do about it.
Observations are the rawest substrate content; they accumulate, and from many observations the platform derives more-mature artifacts.

## Structural fields

- **`id`** — kebab-case identifier; typically a hash-derived stable id.
- **`description`** — one-line summary of what was observed.
- **`closure-kind`** — `observation`.
- **`subject`** — reference to the entity the observation is about.
- **`observed-at`** — timestamp of observation (informational; not consulted for correctness).
- **`observed-by`** — reference to the observing entity (an [agent](teaching/explanations/agent.md), a [closure rule](../../teaching/explanations/closure-rule.md), an external-boundary message).
- **`what-happened`** — the substantive content: predications declaring the observed state, event, or failure.
  The shape of this content depends on what kind of observation it is — an event observation describes the event; a state observation describes the state; a failure observation includes the [failure diagnosis](../../failure-diagnosis/failure-diagnosis.md).
- **`origin`** — per the substrate's [origin](../../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/origin.md) discipline, the originating cause of the observation.
- **`session`** — optional reference to the [session](teaching/explanations/session.md) the observation was recorded within.

## Invariants

- **Observations do not assert claims about why.** An observation records what happened, not what caused it.
  Causal claims are content for later stages ([instincts](instinct-record.md)).
- **Observations are append-only.** Once recorded, an observation is not edited; if its content turns out to be wrong, a new observation is recorded retracting or correcting it (with the substrate's discipline for that revision).
- **Origin always present.** Per [origin](../../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/origin.md), every observation has an origin predication.
  An observation with no origin is a substrate violation.

## Operations

- *Record.* An observation is recorded by inserting an observation-record entity into the substrate; the insertion is itself a witnessed event.
  The substrate's [event log](../../../objects/event-log.md) accumulates observation events.
- *Aggregate.* Multiple observations sharing a pattern can be aggregated by a closure rule into an [instinct](instinct-record.md).
  The aggregation is itself a substrate operation, with witness.
- *Audit.* Querying observations of a given subject, of a given session, with a given pattern is a substrate traversal.

## Position in the platform

Observation records are the platform's *raw input layer*: the substrate's content of what its agents and operations have actually done or seen.
They are the data that the platform's learning derives from; without rich observations, the platform's [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md) has nothing to mature.

Observations have low [formality](../../scope/formality-layer/formality-layer.md) — they are typically produced by inference (an agent observing that something happened, recording it in natural language) and so have higher per-record cost than mature artifacts.
The platform's economy depends on observations *eventually* maturing into instincts and skills, lowering the per-similar-event cost over time.
