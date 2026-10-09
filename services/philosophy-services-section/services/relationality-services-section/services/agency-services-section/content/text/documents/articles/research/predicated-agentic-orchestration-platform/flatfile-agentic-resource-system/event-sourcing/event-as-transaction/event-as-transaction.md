---
name: event-as-transaction
description: "The discipline that every event in the substrate is a double-entry transaction — it carries both a Δ-side (what flows through, the extension that the algebra's $\odot$ operator realizes) and a σ-side (what settles, the restriction the algebra's $\Rightarrow$ operator realizes)."
type: concept
class: framing
depends-on: [event-sourcing, bilattice-valued-witness, predication-fiber, compose, restrict]
see-also: [event, channel, seven-channel-decomposition, witness, entity-as-model]
---

# Event as transaction

The discipline that *every event in the substrate is a double-entry transaction* — it carries both a Δ-side (what *flows through*, the extension that the algebra's $\odot$ operator realizes) and a σ-side (what *settles*, the restriction the algebra's $\Rightarrow$ operator realizes).
The two sides are not optional aspects to record on some events and omit on others; they are the structure of *every* substrate edit, because every substrate edit is an act of an entity admitting a message into its fiber and an act of an entity restricting its fiber to the message's commitments.

The framing names what the bilattice algebra and the substrate's event log have been doing all along.
The adjunction $\odot \dashv \Rightarrow$ from the [adjoint-structure paper](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/research-articles/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md) is two operations that share their information content; an event is the substrate-recorded act that exercises both.
The accounting reading — every transaction has a debit and a credit — is the operational reading of the same fact: a substrate edit that moved information from somewhere to somewhere else has a *from* and a *to*, and the algebra requires both to settle for the edit to be coherent.

## The two sides

For an event $e$ in the substrate's [event log](event-sourcing.md), recording an edit on entity $E$ caused by message $M$:

- **Δ-side (extension, debit, send)** — what flows from $M$ into $E$'s fiber.
  This is the substrate-realization of $M \odot E$: the message extends the entity by combining its commitments with $M$'s.
  The Δ-cell on the event records *what was extended*: which predicate values $M$ contributed, which fiber cells $E$ now carries that it did not carry before.

- **σ-side (restriction, credit, receive)** — what settles in $E$'s fiber as a result.
  This is the substrate-realization of $E \Rightarrow$ the post-extension state: the entity restricts its fiber to what is consistent with $M$'s commitments under the closure rule system, producing a settled value the event records.
  The σ-cell on the event records *what settled*: which predicate values reached $\mathbf{t}$, $\mathbf{f}$, or $\top$, which remained at $\bot$, which contradicted prior commitments.

Both cells are required.
An event with a Δ-side and no σ-side is an extension that did not settle — a partial edit the substrate has not closed.
An event with a σ-side and no Δ-side is a settlement caused by no extension — which means it was caused by something other than a substrate-visible message, and the substrate's history is incomplete.

## Why this is universal, not channel-specific

The [seven-channel decomposition](../../architecture/seven-channel-decomposition/seven-channel-decomposition.md) names accounting as one channel where the σ/Δ structure is *visible* — accounting events are explicitly transactions that debit one entity and credit another, and a coherent substrate's accounting events SHALL balance.
The framing here is broader: the accounting channel makes σ/Δ legible, but it is not where σ/Δ originates. *Every* event has both sides, because every event is the algebraic-record of an extension-and-restriction pair.

A few examples of how σ/Δ surfaces in non-accounting channels:

- **Observation channel.** A session log entry recording "agent saw X" is an extension of the session's fiber by the observation $M$ (Δ-side: the new observation cell), and a restriction of the session's fiber to the consistent-with-$M$ subspace (σ-side: the cell's settled value, with witnessing reference to $M$).

- **Mutation channel.** A substrate edit asserting $\langle E, p, v \rangle = \mathbf{t}$ is an extension of $E$'s fiber by the proposition (Δ-side: which cell received which value), and a restriction of $E$'s fiber to the post-edit state (σ-side: whether the assertion stuck at $\mathbf{t}$, settled to $\top$ against an existing $\mathbf{f}$, or remained $\bot$ pending closure).

- **Guard channel.** A guard event recording "action $A$ was admitted" is an extension of the action-context fiber by the admission witness (Δ-side: which guard rule produced the admission), and a restriction of the action-context to the admission-consistent state (σ-side: the cell's settled value, with the guard's authority cited).

- **Learning channel.** A consolidation event recording "instinct $I$ was admitted from observations $O_1, O_2, O_3$" is an extension by the instinct claim (Δ-side: which observations contributed) and a restriction of the substrate to the with-$I$-as-content state (σ-side: $I$'s settled fiber).

The accounting channel is the channel that makes the σ/Δ structure *load-bearing for the channel's own coherence* (a balance-violating accounting event is a coherence diagnostic).
The other channels carry σ/Δ in their event payloads even when no one consults the structure for coherence checking.

## What this implies

- **Every [`Witness`](../objects/witness.md) carries a transaction.** A witness records both who admitted what (Δ-side) and what the substrate concluded (σ-side).
  The two sides together let an auditor reconstruct both the message and the post-message state.
  A witness that records only one side is incomplete.

- **Replay is double-sided.** Replaying an event log per [event-sourcing](event-sourcing.md) means replaying both the Δ-side (re-applying the extensions) and the σ-side (re-running the closure that produced the settlements).
  A realization that replays only Δ produces a substrate with the right cells but not necessarily the right closure-induced values; a realization that replays only σ has no inputs to settle.

- **Conservation lets the substrate detect coherence drift.** Across the substrate's full event log, the sum of Δ-cells across all events equals the sum of σ-cells (modulo the value-domain's join).
  A substrate where this balance fails has events whose extensions did not settle, or settlements with no extension — both are coherence diagnostics the substrate SHALL surface.
  This generalizes the accounting channel's specific balance constraint to all channels.

- **Federation is σ/Δ across substrates.** When two FARS instances exchange events, the receiving instance treats incoming events as Δ-extensions of its local fibers and computes the σ-restrictions under its own closure rule system.
  The value-domain's join $\vee_k$ from [content-hash addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md) is what makes the cross-substrate σ-side computable without coordination — the receiving substrate composes the incoming Δ against its existing fibers, and the join produces a coherent merged σ.

## What this is not

- **Not accounting-channel exclusive.** The accounting channel's debit/credit balance is one *application* of the σ/Δ structure.
  The structure itself is universal across the seven channels; accounting is where it is most visible because accounting events explicitly name the two parties (debited entity, credited entity) the substrate's algebra relates.

- **Not a new substrate primitive.** No new operator is introduced. $\odot$ and $\Rightarrow$ are the substrate's existing operators ([`compose`](../morphisms/compose.md), [`restrict`](../../code/transformers/restrict.md)); the framing names what an event records about their joint exercise.
  A FARS realization that already implements `compose` and `restrict` already realizes σ/Δ; the framing is content for understanding what the realization is doing.

- **Not a recommendation that events should explicitly carry "Δ" and "σ" cells.** A realization MAY name the cells anything (`extension`, `settlement`, `incoming`, `resolved`, `payload`, `result`); the framing is about what the cells *mean*, not what they are *called*.
  The substrate-coherence check that the two sides match is computable regardless of cell names, given the rule system's declaration of which cells carry which side.

## Position

Event-as-transaction is the framing under which the substrate's event log and the substrate's algebra are *the same machine viewed from two angles*: the event log records, in operational language, the σ/Δ pair the algebra produced; the algebra produces, in mathematical language, the Δ/σ pair the event log records.
Neither is more fundamental than the other; both are required for the substrate to operate.

The framing depends on [event-sourcing](event-sourcing.md) (the discipline that makes σ/Δ replayable) and on the bilattice algebra (which produces the Δ-extensions and σ-restrictions the events record).
It composes with [entity-as-model](../../entity/entity-as-model.md): a model's response to a message is its σ-side; the model's absorption of the message is its Δ-side; an event records both.
It composes with [witness-routing](../../dispatch/witness-routing/witness-routing.md): a routing decision is itself an event with a Δ-side (which entity the message was extended toward) and a σ-side (what the receiving entity settled).

The framing also informs the substrate-realization of *all-records-are-transactions* — the long-standing observation across the FARS prior art that every substrate edit is a double-entry-style act.
With σ/Δ named as the substrate's universal structure, the observation is not a property the substrate has to maintain through discipline; it is a property the substrate has by virtue of being driven by the bilattice algebra's adjunction.
