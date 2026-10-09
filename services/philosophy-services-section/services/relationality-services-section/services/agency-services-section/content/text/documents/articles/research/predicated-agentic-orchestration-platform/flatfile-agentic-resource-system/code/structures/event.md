---
name: event
description: "The substrate-record carrying one entry in the event log: the canonical statement that something happened in the substrate at a particular moment, by a particular actor, on a particular channel, with attached witness for replay-verification."
type: definition
class: record
depends-on: [event-sourcing, witness, channel]
see-also: [emit-event, apply-edit, witness]
title: event
---

# Event

The substrate-record carrying one entry in the event log: the canonical statement that *something happened* in the substrate at a particular moment, by a particular actor, on a particular channel, with attached witness for replay-verification.
An `Event` is what [event-sourcing](teaching/explanations/event-sourcing.md) makes authoritative; the substrate's history is the totally-ordered sequence of `Event`s, and substrate state is the projection of that sequence.

An `Event` is *immutable* upon emission.
Per [event-sourcing](teaching/explanations/event-sourcing.md), conformant realizations SHALL NOT edit or remove `Event`s after they are appended; mistakes are corrected by emitting *retraction events* whose payload cites the retracted event's hash.
Two `Event`s with byte-identical content (under canonical-form serialization) hash to the same identifier and are the same event for replay purposes.

## Required fields

Every conforming realization SHALL hold, for each `Event`:

- **`timestamp`** — when the event occurred, ISO 8601 with sub-second precision.
  Used as the primary ordering key; ties broken by canonical-hash-of-payload (see [event-sourcing](teaching/explanations/event-sourcing.md) on total ordering).
- **`action`** — what kind of event this is (e.g., `assert`, `retract`, `apply-edit`, `settle`, `dispatch`, `consolidate`, `emit-message`, `retraction`).
  The action vocabulary is itself substrate content (each action is a kind that closure rules can match against); realizations declare their action vocabulary.
- **`subject`** — the entity-address the event is about.
  The substrate-level "who is this happening to" predication.
  Required; an event with no subject is a substrate-invisible edit and SHALL be rejected at emission.
- **`actor`** — the entity-address that caused the event.
  May be an agent, an office, a hook, the heartbeat, the closure-rule application machinery; whichever substrate entity initiated the action.
  Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), every actor SHALL be a substrate entity (no events from off-substrate processes).
- **`channel`** — the [`Channel`](channel.md) name the event publishes on.
  Channels decouple producers from consumers: an event emitted on `dispatch` is read by entities that subscribe to `dispatch`, regardless of who emitted it.
  See [channel](channel.md) for the channel-as-substrate-entity discipline.
- **`origin`** — the trace-tag identifying the *immediate* cause of the event (which closure rule fired? which operator was running? which user input arrived?).
  Distinct from `actor`: `actor` is the substrate-level responsible entity; `origin` is the operational-level trace token.
  Per the LPMud security pattern, privileged operators check `origin` before admitting actions.
- **`payload`** — the event's content.
  A mapping carrying the action-specific predications (for an `assert` action: subject/predicate/object/value; for a `settle` action: target hash, fuel consumed, fixed-point hash; for a `dispatch` action: message hash, candidate set, ranked results).
  The payload's shape is determined by the `action`.
- **`witness`** — the [`Witness`](witness.md) attached to the event: the cryptographic audit chain.
  Distinct from the event's semantic content; the witness is what an auditor verifies.

A realization MAY add additional fields (machine identifier, parent-event reference, federation-source identifier, …).
Additions SHOULD be presented under a clearly-distinguished namespace so canonical-hashing remains stable across realizations that share the core fields.

## Invariants

- **Append-only.** Once emitted, an `Event` SHALL NOT be edited or removed.
- **Causally-traceable.** Every `Event` SHALL carry an `actor` and `origin` sufficient to trace the cause back to a substrate entity.
  Events with anonymous or off-substrate causes violate the substrate's [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) commitment.
- **Channel-tagged.** Every `Event` SHALL declare a `channel`.
  The channel decouples consumers from producers; an event with no channel is unreadable by the substrate's standard read-discipline (it has no addressable conduit).
- **Witness-attached.** Every `Event` SHALL carry a `Witness`.
  The witness's `input_hashes` cite the substrate state the event was emitted from; the witness's `output_hash` cites the event's own canonical hash.
  An event without a witness violates the audit contract.
- **Replayable.** Given the substrate state immediately before the event and the event's content, replaying the event SHALL produce the substrate state immediately after.

## What an `Event` is not

- **Not the same as a `Witness`.** A `Witness` is the cryptographic audit chain over an operator's run; an `Event` is the substrate-level statement of what happened.
  The two are coupled: every Event carries a Witness, every Witness witnesses an Event.
  They are *different views* of the same operator-invocation: the Event is the *semantic* record (what happened); the Witness is the *audit* record (how to verify it).
- **Not a log line.** A log line is a human-readable note; an Event is a machine-verifiable substrate record.
  Realizations MAY render Events as log lines for human consumption, but the canonical Event is the structured record.
- **Not a message.** A *message* is a fiber-shaped query/extension presented to an entity as input; the Event is the *substrate-level record* of the message's processing.
  A single message produces (typically) one Event when handled.
  Messages can be synthesized for inference without being persisted as events; not every fiber composition needs an event.

## Storage

The event log is realized as an append-only ordered store over the [flatfile](../../flatfile/flatfile.md) substrate.
The default form is a JSONL file (`<root>/.fars/events.jsonl`) where each line is one canonicalized `Event`; conformant realizations MAY use content-addressed cells, a database table, or any other ordered-append store as long as the discipline holds:

- Append is atomic per event.
- Content is byte-stable under canonical-form serialization.
- The total order is preserved on replay.

Per [two-store-coherence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/two-store-coherence.md), the event log and the entity store are jointly authoritative.
A read that surfaces an entity SHALL surface a state consistent with the events whose `subject` is that entity.

## Position

`Event` is the load-bearing record for FARS's audit, replay, federation, and history-traversal capabilities.
Every operator that mutates the substrate emits at least one Event ([`apply-edit`](../transformers/apply-edit.md), [`emit-event`](../transformers/emit-event.md)); every operator that reads-and-summarizes substrate history reads Events filtered by channel, subject, actor, or origin.
