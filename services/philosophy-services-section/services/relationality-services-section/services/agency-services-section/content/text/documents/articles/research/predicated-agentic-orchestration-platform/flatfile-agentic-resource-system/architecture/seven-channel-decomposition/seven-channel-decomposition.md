---
name: seven-channel-decomposition
description: "The framing that every substrate concern decomposes into one of seven channels of respond over the substrate's algebra."
type: concept
class: framing
depends-on: [channel, respond, fiber]
see-also: [office-as-fuzzy-cell, agent-record, office-record]
title: seven-channel-decomposition
---

# Seven-channel decomposition

The framing that *every substrate concern decomposes into one of seven channels of [`respond`](../../code/transformers/respond.md) over the substrate's algebra*.
The discipline emerged from analysis of an operational substrate's hooks and tools (44 hooks and 83 tools in one snapshot): every hook, every tool, every governance check, every learning artifact resolved into one of seven respond patterns differing only in which channel they read from and write to.
The substrate's behavioral surface is one algebra applied seven ways, not seven separate subsystems.

The seven channels are substrate entities (per [`Channel`](../objects/channel.md)) with declared shapes and policies.
Each channel's events carry domain-specific predicates; the substrate's algebra operates over those predicates the same way it operates over any others.
The decomposition is what makes FARS's claim of *one substrate, one algebra* operational: regardless of whether the work is observation, governance, accounting, query, mutation, analysis, or learning, the substrate-level operation is `respond` on the appropriate channel.

## The seven channels

Each channel pairs with one *kind of substrate concern* and is realized as one [`respond`](../../code/transformers/respond.md) pattern:

1. **Observation** — *recording what happened*.
  `respond(session, {channel: observation, ...})
  `.
  The session log channel; events recording what an agent saw, heard, or noticed during operation.
  The observation events are what later become instinct candidates per the CL pipeline.

2. **Guard** — *checking if an action is allowed*.
  `respond(action, {channel: guard, ...}) → t | f | ⊤`.
  Constraint checks, policy enforcement, scope-bound enforcement.
  A $t$-result admits the action; $f$ blocks; $\top$ flags a contested decision for escalation.
  The hardcoded constants of older governance hooks (allowed-paths, forbidden-keywords) become predicates on the entity being guarded.

3. **Accounting** — *tracking resource flows*.
  `respond(event, {channel: accounting, ...})
  `.
  The accounting channel is where the [σ/Δ structure of every event](../../event-sourcing/event-as-transaction/event-as-transaction.md) is *load-bearing for the channel's own coherence*: attention debited from one entity, progress credited to another, the two sides required to balance.
  The substrate's double-entry coherence is computable from this channel — a FARS substrate where the accounting-channel events do not balance is a substrate with a substrate-coherence diagnostic.
  Other channels carry σ/Δ in their event payloads even when no one consults the structure for coherence checking.

4. **Query** — *reading entity state*.
  `respond(entity, {})`.
  The basic substrate-read pattern.
  The query channel records the read for audit (per [read-discipline](../../../../teaching/explanations/read-discipline.md)) and for replay; the read itself uses no special channel — it's the most-used pattern.

5. **Mutation** — *changing entity state*.
  `respond(entity, mutation-message) → settlement`.
  The basic substrate-write pattern, realized through [`apply-edit`](../../code/transformers/apply-edit.md).
  Mutation events are what every other channel's witnessing ultimately points back to: every observation is a mutation on some session; every guard decision is a mutation on the action's audit trail; every accounting transaction is a mutation on two entities' balances.

6. **Analysis** — *batch inspection*.
  `respond(entity-set, {channel: analysis, ...})
  `.
  Cycles found, broken links flagged, structural diagnostics produced.
  Analysis events are computed from the substrate's content without changing it (the analysis itself is read-only, though the resulting events are mutations on the analysis-output entities).

7. **Learning** — *self-composition*.
  `respond(observations, observations)` — dream-state composition where the substrate composes its own observations against itself to produce instincts, skills, and (eventually) tools.
  The CL pipeline's settlement path runs on this channel.

## Why seven

The decomposition is *empirical*: it emerged from analysis of an operational substrate, not from first principles.
The number seven has no algebraic significance — it is the count of distinct concerns the substrate operationally surfaces.
A FARS realization that handles fewer concerns will use fewer channels (a read-only realization may not need mutation or learning).
A realization that handles more (e.g., a federation-heavy realization adds *federation* as an explicit channel) will use more.

The seven channels are the *minimum complete set* the substrate's operational behavior decomposes into without remainder: every substrate operation is at least one of the seven, every concern fits in at least one channel.

## What the decomposition implies for the substrate

- **Hooks become thin.** A hook that fires on a substrate event reads from one channel and writes to another (or to none).
  The hook's body is a respond-and-emit pair.
  The substrate's hook layer is ~40 thin adapters, not 127 hand-coded files.

- **Governance is one channel.** All policy enforcement is `respond(action, {channel: guard, ...})
  `.
  Adding a new policy is creating a closure rule that fires on the guard channel; modifying a policy is editing a substrate entity; retiring a policy is retraction.

- **Accounting is a coherence invariant.** Per the analysis, *every record is a transaction* with debit and credit sides.
  The accounting channel is where the invariant lives; substrate-coherence-checking includes verifying that accounting events balance.

- **Learning is a channel like any other.** The CL pipeline's outputs (instincts, skills, eventually tools) are events on the learning channel, generated by closure rules that compose observations against themselves.
  There is no separate "learning subsystem" — learning is one application of the substrate's algebra.

## What this is not

- **Not a service architecture.** The seven channels are not seven microservices, seven daemons, or seven endpoints.
  They are seven *predicates* on substrate events; consumers find their events by channel filter.
  The substrate's machinery is undivided.
- **Not a permission scheme.** Channels are routing predicates, not authorization gates.
  Authorization is separate (per [scope](../../../scope/scope.md) and the guard channel); routing is what channel-name does.
- **Not exhaustive.** A FARS realization MAY add channels (e.g., `dispatch`, `bridge`, `federation`) for domain-specific routing without violating the decomposition.
  The seven are the *core* channels; additional channels layer on without disrupting the decomposition's load-bearing claim.

## Position

The seven-channel decomposition is the *behavioral taxonomy* of the FARS substrate.
It pairs with [office-as-fuzzy-cell](../../office-as-fuzzy-cell/office-as-fuzzy-cell.md) (which gives the structural taxonomy of agent-side entities): together, the two framings describe what the substrate's agent-side does at the channel level (seven concerns) and how its agent-side entities are structured (cells with sites, fibers, constructors, laws).

The framing depends on [`Channel`](../objects/channel.md) (the substrate object the seven names instantiate) and on [`respond`](../../code/transformers/respond.md) (the algebraic operator each channel pattern uses).
It composes with [`emit-event`](../../code/transformers/emit-event.md) and [`apply-edit`](../../code/transformers/apply-edit.md): the channels are *where* events are emitted, and substrate edits are *one of the seven* (mutation).
