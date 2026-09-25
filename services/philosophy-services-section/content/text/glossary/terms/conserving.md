---
title: "Conserving"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Conserving
movement: V (also cross-cutting — conservation principles operate at every level)
draft-names:
  draft-10: "Conservation (invariant principles under Flow)"
  draft-12: "Conservation Law (Lemma 31), Continuity Equation, Noether Correspondence (Corollary 17)"
  draft-3-PRE: "(implicit — preservation under nuclei and flow)"
stability: high — present in drafts 10 and 12 with explicit formal treatment
description: The principle that coherence — the total intensity of being's relational consistency — is neither created nor destroyed during transformation, but only redistributed through the relational field.
---

The principle that coherence — the total intensity of being's relational consistency — is neither created nor destroyed during transformation, but only redistributed through the relational field. Conservation is not imposed from outside; it is implicit in the relational structure.

## What it is

Draft 12 develops conservation through three equivalent formulations:

1. **Invariance condition**: An observable I is conserved if I composed with Flow equals I. What is measured does not change under evolution.
2. **Continuity equation**: For observable density rho, the change in rho over time plus the divergence of rho under Flow equals zero. The total amount of any observable is preserved, only redistributed.
3. **Variational principle**: The relational action S[F_t, a] = integral of coherence intensity on the stable envelope of the evolving state is stationary. The actual evolution is the one that extremizes the accumulated self-consistency of the process.

Draft 12 Corollary 18: These three formulations are equivalent — each expresses in a different form that the total intensity of coherence remains constant throughout directed transformation.

## The Noether correspondence

Draft 12 Corollary 17: If S is a continuous symmetry of the system (an endofunctor that commutes with Flow), then there is an associated conserved quantity I_S(a) which remains invariant under Flow. Every symmetry yields a conservation law.

This is the relational analogue of Noether's theorem from physics — but here, conservation is not a physical assumption. It follows from the structure of coherent relating: any consistency in the logic finds expression as a measurable invariant.

## Conservation as redistribution

Draft 12: Flow maintains the total intensity of being (total coherence) while allowing that intensity to move through different forms and regions. No part of relation vanishes; it flows. Energy, in this reading, quantifies the deviation from coherence: if a state is fully self-consistent and unchanging, E(a) = 0. Conservation of energy expresses constancy of total coherence through transformation.

## Relationships

- Depends on: Flowing (conservation is invariance under Flow)
- Depends on: Observing (conserved quantities are observables)
- Located in: the stable envelope (every conserved observable factors through the active envelope)
- Expressed by: the continuity equation, the variational principle, the invariance condition (three equivalent formulations)
- Related to: the Noether correspondence (symmetry implies conservation)

## TTL encoding

Encoded as `rel:Conserving` (Phenomenon) in ontology.ttl. Cross-cutting: operates within Movement V's physical reading but the principle applies at every level where Flow is defined.

## Lean encoding

In MovementV.lean: `IsConserved` is defined as commutativity of an observable with Flow:
```
def IsConserved : Prop :=
  forall a : Rel, obs.toFun (flow.toFun a) = flow.toFun (obs.toFun a)
```
The theorem `conserved_preserves_fixed` proves that conserved observables preserve flow-fixed states. The Noether correspondence, continuity equation, and variational principle are not yet formalized.

## SHACL validation

As a Phenomenon, Conserving must have rdfs:label, skos:definition, and attestedIn (per RelationalConceptShape). No additional movement-specific constraints because phenomena are cross-cutting.
