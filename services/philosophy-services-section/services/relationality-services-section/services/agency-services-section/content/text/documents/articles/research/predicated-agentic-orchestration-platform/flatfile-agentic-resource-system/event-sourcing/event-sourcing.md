---
name: event-sourcing
description: "The discipline that the event log is authoritative and substrate state is derived: every substrate edit produces an event; events are append-only and totally ordered (by append time); the substrate's current state is the projection of events into Notes, Fibers, and indexes."
type: concept
class: framing
depends-on: [source-of-truth, two-store-coherence, witness, flatfile]
see-also: [event, channel, apply-edit, emit-event, validation-as-settlement]
title: event-sourcing
---

# Event-sourcing

The discipline that the *event log is authoritative* and substrate state is *derived*: every substrate edit produces an event; events are append-only and totally ordered (by append time); the substrate's current state is the projection of events into [`Note`](../objects/note.md)s, [`Fiber`](../code/structures/fiber.md)s, and indexes.
Replaying the events from genesis SHALL reproduce the current state byte-for-byte (modulo declared elision).

Event-sourcing is a substrate-architecture commitment, not an implementation hint.
It pins what *substrate edits are* in FARS: not direct file writes, but the triple of (write the file, emit an event, fire lifecycle cascade).
It pins what *audit and replay are*: the event log is the playback tape; given a starting snapshot and a suffix of events, any past state is reconstructible.

The discipline reaches FARS from three directions in the prior art.
(1) Kafka's "the log IS the database": stateful systems can be modeled as a log of events plus a derived projection, and the projection is rebuildable from the log.
(2) The actor model (Erlang/OTP, the substrate-as-actor reading): each entity is an actor that processes a sequence of messages, and the message sequence IS the entity's history.
(3) CRDT semantics: the substrate's value-domain join $\vee_k$ is commutative and associative, so concurrent events from different sources merge without coordination, and the merge is itself an event in the log.

## Two stores, one source

FARS commits to *two-store coherence* per [two-store-coherence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/two-store-coherence.md).
The substrate has two persistent stores:

- **The flatfile entity store** — the directory of `.md` files.
  Editable by humans through ordinary tools.
  Source-of-truth for *content*: the canonical statement of what each entity is.
- **The event log** — the append-only sequence of events.
  Source-of-truth for *history*: the canonical statement of what happened, in what order, by whom, on what channel, with what witness.

Conformant realizations SHALL maintain both stores under the discipline that they cannot diverge.
Two patterns are admissible, with a transition between them:

- **File-first** (the practical mode): a substrate edit writes the file first, and a hook emits the corresponding event.
  The file is authoritative; the event log is an audit trail.
  Drift is detected by re-deriving file state from events and comparing canonical hashes.
- **Event-first** (the architecturally correct mode): a substrate edit emits the event first; a reducer projects the event into the file.
  The event log is authoritative; the files are derived view.
  Drift is impossible by construction.

FARS realizations MAY operate in either mode.
The recommended trajectory is *file-first with event recording*, evolving toward *event-first* as the substrate's coverage of edit operations through hooks reaches saturation.
Per the upstream [two-store-coherence-asymptote](../../../../questions/two-store-coherence-asymptote.md) question, the transition completion criteria are not yet pinned at the substrate level.

## What event-sourcing commits FARS to

- **Every substrate edit produces an event.** A substrate edit that fails to produce an event — a file write through a back channel, a manual fix-up that bypasses the hook — is a *substrate-invisible edit*.
  The substrate's history is incomplete; replay no longer reproduces state.
  Conformant realizations MUST detect substrate-invisible edits and either reify them (synthesize the missing event from a file diff) or surface them as substrate-coherence diagnostics.

- **Events are append-only.** The event log SHALL NOT be edited or compacted in place.
  Mistakes are corrected by *retraction events* — events whose payload cites a prior event's hash and a closure-rule-recorded reason for retraction.
  The retracted event remains in the log; replay sees the retraction and projects accordingly.

- **Events are totally ordered.** Within a single substrate, events have a total order by append time.
  The order SHALL be deterministic across replays: if two operations produce events at the same logical instant, a canonical-hash tiebreaker breaks the tie consistently.
  Across federated substrates, events are partially ordered (per substrate); cross-substrate merge uses the value-domain's join.

- **Replay is deterministic.** Given the event log from genesis (or from a snapshot's content-hash), a conformant realization SHALL produce byte-identical substrate state.
  This is the precondition for audit.

- **State is a projection.** A conformant realization MAY maintain in-memory caches, derived indexes, sqlite projections, content-addressed stores — these are admissible per [source-of-truth](../../../../teaching/explanations/source-of-truth.md).
  What the realization SHALL NOT do is treat the cache as authoritative when it diverges from the event log.

## What event-sourcing is not

- **Not "events instead of files."** FARS keeps the flatfile substrate as the human-editable presentation layer.
  The event log adds the audit-and-replay substrate alongside; it does not replace the file store.
- **Not a queue.** An event log is not a work queue with consume-and-acknowledge semantics.
  Events stay in the log forever (in the absence of declared elision).
  Consumers read at their own pace; their read positions are themselves substrate content (not log mutations).
- **Not Kafka.** Realizations MAY use Kafka, NATS, JSONL, content-addressed cells, or any other ordered-append store as the event log's underlying carrier.
  The discipline is what's load-bearing; the carrier is realization choice.

## Position

Event-sourcing is the framing under which [`apply-edit`](../code/transformers/apply-edit.md) and [`emit-event`](../code/transformers/emit-event.md) are coherent: they exist *because* the substrate is event-sourced.
It is also what makes [`Witness`](../objects/witness.md) chains operationally meaningful: a witness is the audit metadata for an event, and the event is what the witness witnesses.

The framing composes with [entity-as-model](../entity/entity-as-model.md): the entity is a model whose history IS the projection of its events; replaying the events gives the entity's evolution as a sequence of models.
The framing composes with [federation](../../teaching/explanations/federation.md): two FARS instances synchronize by exchanging events, and the value-domain's join makes the merge coherent without coordination.
