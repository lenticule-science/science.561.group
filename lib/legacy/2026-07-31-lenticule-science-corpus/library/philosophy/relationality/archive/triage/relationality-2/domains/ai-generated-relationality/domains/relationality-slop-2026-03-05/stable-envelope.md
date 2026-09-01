---
title: "Stable Envelope"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Enveloping
movement: V
draft-names:
  draft-10: "Envelope(x) = Possible(x) AND Necessary(x) — bandwidth of stable variation"
  draft-12: "Stable Envelope Env_F(a) := box-F(a) AND diamond-F(a) (Definition 15, Lemma 31)"
  draft-3-treatise: "(implicit — intersection of modal aspects)"
stability: high — explicit in drafts 10 and 12 with formal definition and conservation law
signature: "Env_F : Rel -> Rel (unary, parameterized by Flow)"
---

The intersection of the necessary and possible aspects of a flowed recognition: Env_F(a) = Necessary(Flow(a)) AND Possible(Flow(a)). The active envelope is the emergent container of coherence within which a state's motion remains consistent with structural stability.

## What it is

Draft 12 Definition 15: The stable envelope of a state a under Flow is the overlap of two bounding regions:
- The necessary aspect: what must hold globally after flowing (closure of the flow)
- The possible aspect: what can hold locally after flowing (interior of the flow)

The envelope captures the range within which a recognition can vary under flow while remaining active under both closing and opening. It is neither pure necessity (too rigid) nor pure possibility (too free) — it is the bandwidth of stable variation.

Draft 10: "Envelope(x) = Possible(x) AND Necessary(x)" — described as the bandwidth of stable variation.

## Why it matters

The stable envelope is where conservation lives. Draft 12 Lemma 31 (Conservation Law): Every conserved observable on a state factors through its active envelope. If I is an invariant observable, then I = I' composed with Env_F(a). This means every measurable quantity that is preserved under evolution can be measured by restricting to the stable envelope.

The envelope also governs transport: when a state moves under Flow from a to F(a) and is related to b via F(f), the active envelope of a maps into the stable envelope of b (transport condition). Coherence is carried intact.

## The relational action

Draft 12: The Relational Action S[F_t, a] accumulates coherence intensity measured on the stable envelope of the evolving state:

  S[F_t, a] = integral over time of the coherence intensity on Env_F(F_t(a))

The actual evolution extremizes this action — the physical path is the one that maximizes accumulated self-consistency.

## Relationships

- Composed from: Closing (Necessary) and Opening (Possible) applied to Flow
- Used by: the Conservation Law (all conserved observables factor through the envelope)
- Used by: the Transport Condition (envelopes map into envelopes under flow)
- Used by: the Relational Action (coherence intensity is measured on the envelope)
- Bridges: the modal operators (Necessary/Possible from Movement II) and the physical reading (states/observables from Movement V)

## TTL encoding

Encoded as `rel:StableEnvelope` (Operator) in ontology.ttl. signatureArity 1. inMovement MovementV. Defined as the meet of Necessitating and Possibilizing applied to Flow.

## Lean encoding

In MovementIII.lean:
```
def StableEnvelope (a : Rel) : Rel :=
  close (flow.toFun a) ⊓ open_.toFun (flow.toFun a)
```
With theorems: `envelope_le_necessary` (the envelope is bounded by necessity) and `envelope_ge_possible` (possibility is bounded by the envelope, given the right condition). The factorization (Lemma 31) and transport condition are not yet formalized.

## SHACL validation

As an Operator, StableEnvelope must have signatureArity (= 1), rdfs:label, skos:definition, and attestedIn.
