---
name: channel
description: "The substrate-record carrying one named conduit through which Events are routed: the substrate-level decoupling of who emits from who consumes."
type: definition
class: record
depends-on: [event-sourcing]
see-also: [event, emit-event, apply-edit]
title: channel
---

# Channel

The substrate-record carrying one named conduit through which [`Event`](event.md)s are routed: the substrate-level decoupling of *who emits* from *who consumes*.
A `Channel` is itself an entity in the substrate (per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md)); editing a channel's policy is editing predications, just like editing any other entity.

Per the messaging-foundations discipline FARS inherits, channels are *named pipes* with broadcast-read semantics: any entity emits to a channel by setting `channel: <name>` on the event it emits; any entity consumes from a channel by reading the event log filtered by that channel.
The channel does not maintain a subscription list; consumers find their events by filter, not by registration.
The substrate routes events via the channel name predicate, not via a routing table.

## Required fields

Every conforming realization SHALL hold, for each `Channel`:

- **`name`** — the canonical channel identifier (e.g., `dispatch`, `events`, `bridge`, `learning`, `accounting`, `observation`, `guard`, `query`, `mutation`, `analysis`).
  The substrate's channel vocabulary is itself substrate content; new channels are added by creating new `Channel` entities.
- **`shape`** — the predication-pattern events on this channel SHALL satisfy.
  A pointer to a substrate shape entity (or an inline pattern) declaring required and optional payload predicates.
  Events emitted to the channel are validated against the shape per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md); events failing the shape are rejected at emission.
- **`emit-policy`** — the predication-pattern that an actor SHALL satisfy in order to emit on this channel.
  Typically expressed as a fiber-overlap requirement: actors with `provides-capabilities: [<channel-related>]` MAY emit; others MAY NOT.
  The policy itself is substrate content; modifying who can emit is a substrate edit.
- **`read-policy`** — analogous: the predication-pattern an actor SHALL satisfy to consume from this channel.
  Many channels are public-read (any entity may consume); others are scoped (only actors at a particular office may read).
  The policy is substrate content.
- **`description`** — human-readable note declaring the channel's purpose.
  Provenance only — not part of routing or policy enforcement.

## Common channels

The substrate's standard channel vocabulary, grounded in the seven-channel decomposition that emerged from prior FARS analysis:

- **`observation`** — events recording what an actor saw or heard during operation.
  The session log channel.
- **`guard`** — events recording constraint checks (allowed / blocked) and policy decisions.
- **`accounting`** — events recording resource flows (work assigned, work completed, time consumed).
  Every accounting event IS a $\sigma/\Delta$ transaction; the substrate's double-entry coherence is computable from this channel.
- **`query`** — events recording substrate reads.
  Used for read-discipline auditing and for replaying past queries.
- **`mutation`** — events recording substrate writes.
  The primary channel for [`apply-edit`](../transformers/apply-edit.md) emissions.
- **`analysis`** — events recording batch inspections (cycles found, broken links flagged, structural diagnostics produced).
- **`learning`** — events recording memory consolidation, instinct formation, skill promotion.
  The channel for the CL pipeline's outputs.

A realization MAY add channels (e.g., `dispatch`, `bridge`, `federation`) for domain-specific routing.
The seven above are the substrate-level minimum; richer realizations layer additional channels on top.

## Invariants

- **Substrate entities.** Every `Channel` SHALL be a substrate entity, not a hard-coded operator-level enum.
  Adding a channel is creating an entity; modifying a channel's policy is editing predications.
- **Decoupling.** Emitters and consumers of a channel SHALL NOT need direct reference to one another.
  The decoupling is the channel's *raison d'être*: an office that records events doesn't need to know who reads them; an office that reads events doesn't need to know who produced them.
- **Shape-validated.** Events emitted to a channel SHALL be validated against the channel's shape; shape-violating events are rejected per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md).
- **Policy-gated emission and read.** The `emit-policy` and `read-policy` SHALL be evaluated by [`apply-edit`](../transformers/apply-edit.md) before admitting an emission, and by read-discipline operators before surfacing events to a consumer.
  Policy violations produce diagnostic events on the `guard` channel.

## What a `Channel` is not

- **Not a queue.** A channel does not hold events as pending work to consume; events live in the event log forever.
  Channel-name is a *filter predicate* on the log, not a buffer.
- **Not a routing table.** The substrate does not maintain a mapping from channel-name to consumer-address.
  Consumers are pull-not-push; they read the log filtered by channel.
- **Not a transport.** A channel is a *substrate-level routing predicate*, not a wire protocol.
  How events are physically delivered to consumers (CLI tail, MCP push, HTTP poll, federation sync) is realization-specific; the channel is what the carriers route on.

## Position

`Channel` is what makes FARS's event log readable as decoupled streams.
Without channels, every consumer would need to filter events by a combination of subject, actor, and action — possible but painful.
With channels, a consumer subscribes to one filter predicate (`channel: dispatch`) and receives all relevant events without coupling to the producers.

`Channel` is also what makes the seven-channel decomposition operational.
Each of the seven kinds of substrate concern (observation, guard, accounting, query, mutation, analysis, learning) IS a channel; each is one $\textsf{respond}$ pattern over the same algebra; the substrate's audit, governance, and learning subsystems read their events from the appropriate channels.

The substrate-level question of whether `Channel` should be promoted to AgOP or RC — currently AgOP has [`inbox`](../../teaching/explanations/inbox.md) and [`outpost`](../../teaching/explanations/outpost.md) for the receive/emit endpoints, but no standalone `channel` for the named conduit between them — is open and is an upstream-gap candidate.
