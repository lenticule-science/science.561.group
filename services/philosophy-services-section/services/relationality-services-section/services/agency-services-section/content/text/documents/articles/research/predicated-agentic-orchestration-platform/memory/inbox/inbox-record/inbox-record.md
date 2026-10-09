---
type: definition
class: substrate-entity
realizes: [inbox]
depends-on: [inbox, channel]
see-also: [outpost, federation-graph]
title: Inbox record
description: "An inbox record is the substrate-entity formal definition of an inbox: the predication-graph entity that records the inbox's scope, its admissibility shape, its retention policy, its trust requirements, and the queue of received messages…"
---

# Inbox record

An **inbox record** is the substrate-entity formal definition of an [inbox](teaching/explanations/inbox.md): the predication-graph entity that records the inbox's scope, its admissibility shape, its retention policy, its trust requirements, and the queue of received messages awaiting [dispatch](teaching/explanations/dispatch.md).

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`scope`** — reference to the [scope](../../../scope/scope.md) the inbox serves.
- **`admissibility-shape`** — reference to a [shape record](../../../scope/shape/shape-record/shape-record.md) that incoming messages must satisfy.
  Messages failing the shape are rejected at the inbox boundary.
- **`required-witness`** — declaration of what [witness](../../teaching/explanations/witness.md) signature an incoming message must carry — typically a federation-source signature (per [federation-handshake](../../../agent/federation/federation-handshake/federation-handshake.md)) or a session-bound origin predication (per [origin](../../../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/origin.md)).
- **`accepted-origins`** — references to identity entities (agents, federated platforms, declared external-boundary entities) the inbox admits messages from.
  Messages with origins outside the accepted set are rejected.
- **`retention-policy`** — declarations of how long received messages persist before retirement (immediate, until-dispatched, time-windowed, indefinite).
- **`rate-limit`** — optional substrate-recorded rate constraints (messages per period from a given origin), enforced by closure rules consulting recent-arrival predications.
- **`queue`** — references to received-but-not-yet-dispatched message entities.
- **`closure-kind`** — `inbox`.

## Invariants

- **Append-only queue.** Messages are written to the queue; never edited or removed except by dispatch or retirement (per retention-policy).
  Both transitions produce witnesses.
- **Admissibility-shape enforced at boundary.** No message enters the queue without passing the admissibility shape.
  Failures are recorded as rejection witnesses but do not enter the queue.
- **Origin verified at boundary.** Every queued message carries a verified origin predication.
  Unverifiable origins are rejected.
- **Scope-coherent.** The inbox's scope predication matches the scope at which the inbox operates; cross-scope inboxes are not admitted.

## Operations

- *Receive.* The boundary's receive operator validates incoming bytes against the admissibility shape, verifies the witness signature against the accepted origins, and (on success) inserts the message entity into the queue.
  (See [boundary](../../teaching/explanations/boundary.md) for the substrate's discipline.)
- *Dispatch-out.* The [dispatch-matching](../../../dispatch/dispatch-matching/dispatch-matching.md) operator reads the queue (typically in arrival order, possibly with priority-ordered policy declarations) and assigns the next message to an agent-skill pair.
  The dispatched message is marked dispatched but remains in the queue per retention-policy.
- *Retire.* Per retention-policy, retired messages are removed from the queue; the retirement is a substrate event with witness.
- *Audit.* Querying the queue, the rejection log, the dispatch decisions are substrate traversals.

## Position in the platform

The inbox record is the platform's *receive-side substrate boundary*: every message that crosses into the substrate from an external party (or from another scope on the same platform) does so through an inbox record.
The record's predications determine what crosses, what is rejected, and how the substrate's audit can later reconstruct the message stream.

Multiple inboxes per scope are admissible; each handles a particular sub-class of incoming work, distinguished by the admissibility shape.
A scope might have a high-priority inbox for governance escalations and a normal-priority inbox for routine work; both share the scope but operate as distinct substrate entities.
