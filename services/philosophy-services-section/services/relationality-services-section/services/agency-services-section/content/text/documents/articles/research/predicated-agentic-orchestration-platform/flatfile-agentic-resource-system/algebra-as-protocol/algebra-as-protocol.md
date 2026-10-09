---
name: algebra-as-protocol
description: "FARS's commitment that federation messages are substrate-algebra operations, not protocol primitives."
type: concept
class: federation-discipline
instantiates: [federation]
depends-on: [content-hash-addressing, sovereign-node, federation-convergence, transport-tolerance-of-federation]
see-also: [federation-envelope-record, merge-peer, emit-federation-envelope, admit-federation-envelope, compose, settle]
title: algebra-as-protocol
---

# Algebra-as-protocol

FARS's commitment that *federation messages are substrate-algebra operations, not protocol primitives*.
An outbound federation envelope is an emitted record of an operator that ran locally (a [`compose`](../morphisms/compose.md), a [`settle`](../code/transformers/settle.md), an [`apply-edit`](../code/transformers/apply-edit.md)); an inbound federation envelope is an admitted record of an operator that the sender ran.
The receiver's job is *not* to interpret a wire-protocol intent; it is to replay the algebra against its own substrate.
The wire format is `(operator, operand-content-hashes, value-domain-cells)` tuples that any conformant FARS node can replay.

Algebra-as-protocol is the FARS-substrate instance of the parent-theory [federation-as-substrate-join](../../../../teaching/explanations/federation-as-substrate-join.md) reading and the structural consequence of [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md).
The convergence theorem says that the substrate's [merge](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/merge.md) operator IS the federation protocol — the work an explicit protocol layer would do (ordering, conflict resolution, retry) is absorbed into the value-domain join $\vee_k$ and the closure operator $\mathrm{cl}_p$.
This concept pins down what that means at the wire layer: the wire carries algebra, not protocol commands.

## What this commits FARS to

- **No federation-specific operators.** FARS does not introduce a separate "federation send" or "federation merge" morphism that lives outside the algebra.
  [`merge-peer`](../code/transformers/merge-peer.md) is the substrate's [`compose`](../morphisms/compose.md) on cells (extended to fiber-maps across the substrate) followed by [`settle`](../code/transformers/settle.md) under the local rule system.
  [`emit-federation-envelope`](../code/transformers/emit-federation-envelope.md) and [`admit-federation-envelope`](../code/transformers/admit-federation-envelope.md) handle envelope packaging and verification, but the *content* they carry is exactly the substrate's existing algebraic primitives.
- **Wire format is algebra payloads.** Per [federation-envelope-record](../objects/federation-envelope-record.md), the envelope's `payload.content` is a canonical-JSON serialization of one or more *substrate cells* (predicate, arguments, value-domain value, provenance) plus the `operator` that produced them and the `operand-content-hashes` of the inputs to that operator.
  A receiver that holds the operands by hash can re-derive the cells locally; a receiver that does not can request the operands by hash from the sender.
- **Receiver-side replay.** When an envelope arrives, the receiver does not "apply a federation update" as if applying a protocol message.
  It runs [`merge-peer`](../code/transformers/merge-peer.md) — exactly the substrate's existing [`compose`](../morphisms/compose.md)-then-[`settle`](../code/transformers/settle.md) — with the envelope's cells as one of the inputs.
  Per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), the result converges with the sender's state without a coordinator.
- **Transport is a conduit, not a protocol.** Per [transport-tolerance-of-federation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/transport-tolerance-of-federation.md), the bytes-in-transit can flow over any transport (HTTP, libp2p, filesystem-shared inbox, NATS, copying over USB) without affecting convergence.
  The receiver's algebra runs the same regardless of how the envelope arrived; the envelope's signature and content-hash provide all the integrity the algebra requires.

## What "algebra" means in the wire format

A federation envelope's payload, in the *algebra-as-protocol* discipline, has the following structural shape:

```json
{
  "operator": "compose | settle | apply-edit | retract | ...",
  "operand-content-hashes": [
    "<hex-sha256 of input fiber 1>",
    "<hex-sha256 of input fiber 2>",
    ...
  ],
  "rule-system-version": "<hex-sha256 of the closure-rule system the sender ran>",
  "cells": [
    {
      "entity": "<canonical entity address>",
      "cell-key": <structured key per Fiber's cell discipline>,
      "value": "⊥ | t | f | ⊤",
      "provenance": [
        {"source-hash": "<hex-sha256>", "kind": "frontmatter-key | body-pattern | closure-rule-output", ...}
      ]
    },
    ...
  ]
}
```

The payload is the *algebraic content* — not a protocol verb.
A receiver who holds none of the cited operands (by hash) can either (a) request the operands from the sender (a follow-up envelope with `payload.kind: "request-operand"` and the missing hashes), or (b) admit the cells without re-deriving them, treating the sender's signature as the warrant.
The choice is per peer-record policy.

## Why this discipline matters

Substrate convergence per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) requires the receiver to perform *the substrate's own join* on incoming cells, not a protocol-defined merge.
If the wire format carried protocol verbs ("admit-as-truth", "override", "supersede"), the receiver would be re-implementing semantics already pinned by the substrate's value-domain.
The bilattice already says how $t \odot t = t$, $t \odot f = \top$, $t \odot \bot = t$; expressing those in protocol verbs would *duplicate* the algebra at the protocol layer, with two implementations to keep coherent.

Algebra-as-protocol collapses the duplication.
The substrate is the protocol.
Two FARS nodes federating share *one* algebra (the bilattice), *one* closure-rule discipline (each evaluated at its own version, with re-settlement bridging the version gap), *one* witness chain (each node carrying its own log; the federation envelope chain crossing between them).

## What the discipline rules out

- **Protocol-level conflict resolution.** A federation that resolves "conflicts" via a protocol-level rule (last-write-wins, primary-replica precedence, vector clocks) is implementing semantics outside the substrate's value-domain.
  Per the bilattice's own discipline, two contradictory commitments compose to $\top$ (contested), and $\top$ is a substrate-visible state for governance to resolve — not a protocol-level branch decision.
- **Protocol-level ordering requirements.** A federation that requires envelopes to arrive in a particular order (sender-time order, vector-clock order) is mixing transport concerns into algebra.
  Per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), the algebra is order-independent: the same set of envelopes in any order converges to the same state.
  Transport may sequence for efficiency; the algebra does not require it.
- **Protocol-level retry semantics.** A federation that distinguishes "first delivery" from "retry" at the protocol layer is over-specifying.
  Per [content-hash-addressing](../flatfile/content-hash-addressing/content-hash-addressing.md), duplicate envelopes (same canonical hash) are dedup'd at admission.
  Retries are safe; the algebra absorbs them.
- **Wire formats that elide cell values.** A federation envelope that omits the value-domain value of a cell (sending only "set $X$" without the value-domain value) is not algebra; it is an ambient-typed assertion the receiver must guess at.
  Per the four-valued bilattice's discipline, every cell carries one of $\{\bot, t, f, \top\}$; the envelope SHALL carry the value explicitly.

## Position

Algebra-as-protocol is the *engineering content* of FARS's federation discipline.
Per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), the substrate's algebra suffices to converge two peers' state; per this concept, the substrate's algebra is also what the wire carries — there is nothing else to carry.
Per [sovereign-node](../architecture/sovereign-node/sovereign-node.md), each peer runs the algebra against its own substrate; per [content-hash-addressing](../flatfile/content-hash-addressing/content-hash-addressing.md), the operands the algebra cites are portable across nodes; per [bounded-vocabulary-handshake](../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md), the predicates the algebra operates on are pre-agreed.

The concept composes with [`compose`](../morphisms/compose.md) and [`settle`](../code/transformers/settle.md) (the algebra primitives), with [`merge-peer`](../code/transformers/merge-peer.md) (the federation realization of those primitives), with [`Witness`](../objects/witness.md) (every algebra step produces a witness; federation envelopes carry the witness chain across the boundary), and with [event-sourcing](event-sourcing.md) (the receiver appends an envelope's admission as an event citing the sender's witness).
