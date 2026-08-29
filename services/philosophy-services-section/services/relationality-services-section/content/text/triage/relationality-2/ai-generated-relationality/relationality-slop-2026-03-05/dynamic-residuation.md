---
title: "Dynamic Residuation"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Dynamic Residuation
movement: III (Directed Dynamics)
draft-names:
  draft-3-treatise: "Dynamic Residuation / Flow-Indexed Implication"
  draft-4: "(implicit in Flow-indexed constructions)"
  draft-10: "Dynamic Residuation — Reasoning Through Motion (explicit law with citations)"
stability: medium — named in treatise (draft 3) and draft 10; implicit elsewhere
---

The extension of residual implication (Induces) to directed dynamics (Flow). Where Induces asks "what must be added to a for b to be recognized?" in the static logical field, Dynamic Residuation asks the same question along a Flow trajectory: "what must be added at time t for b to be recognized at time t'?"

## What it is

Treatise (draft 3): Defines Flow-Indexed Implication as a generalization of the Galois connection Together(a, −) ⊣ Induces(a, −) to the Flow comonad. The static residuation Includes(Together(a,b), c) iff Includes(a, Induces(b,c)) becomes flow-indexed: the "adding" and "recognizing" happen at potentially different stages of the directed dynamics.

This is the mechanism by which logical implication becomes dynamic implication — "if this, then that" becomes "if this now, then that later" while preserving the structural coherence earned in Movements I and II.

## Why it matters

Dynamic Residuation bridges two parts of the derivation that might seem separate:

1. The logical core (Movement I) earns Induces as the residual of Together — a static relationship
2. Directed dynamics (Movement III) earns Flow — directed motion preserving the modal core

Dynamic Residuation shows that these are not independent structures but that the logical implication itself becomes dynamic when Flow is introduced. The logic moves with the system.

This also connects to the Discipline hierarchy: a Discipline must commute with Flow, and Dynamic Residuation is the formal mechanism by which implication (Induces) and dynamics (Flow) interact coherently.

## Draft 10's explicit formulation

Draft 10 ("Proposing a Modality of Relationing Existence") gives the explicit law:

Flow(a ∧ b) ≤ c ⟺ a ≤ Flow(b ⇒ c)

Cited as equivalent to "lax monoidal preservation of implication" (Street §3; Riehl-Verity §8.2). The explanation: "Logical reasoning remains valid under process application."

Draft 10 also derives further operations from Dynamic Residuation:
- Add(a,b) = Flow(a ∧ b) — monadic addition
- Multiply(a,b) = Flow(a) ∧ Flow(b) — monadic multiplication
- These satisfy associativity up to lax inequality
- Stable Envelope: Envelope(x) = Possible(x) ∧ Necessary(x) — the "bandwidth of stable variation" (Galois interval)

This confirms Dynamic Residuation is a genuine structural law, not an automatic consequence.

## Relationships

- Extends: Induces (static residual implication, Movement I)
- Requires: Flow (directed comonadic dynamics, Movement III)
- Relates to: Discipline (which must commute with both)
- Parallel to: how Necessary/Possible extend Close/Open with modal force
- Produces: Add, Multiply (arithmetic of processes)
- Produces: Stable Envelope
- Present in: treatise (draft 3), draft 10
- PRE has the derived operations (Add, Multiply) but does not name Dynamic Residuation as a separate law

## Open question

The law Flow(a ∧ b) ≤ c ⟺ a ≤ Flow(b ⇒ c) — is this the DEFINING property of Flow's interaction with the logical core, or a consequence of the KZ-comonadic structure? Draft 10 states it as a law; the treatise treats it as earned from the structure.
