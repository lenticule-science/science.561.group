---
type: question
status: open
depends-on: [identity-type, univalence-axiom, dependent-type-theory]
title: Cubical vs book-style HoTT for the corpus's identity type
description: "Two prevailing presentations of homotopy type theory give different operational status to the identity-type:"
---

# Cubical vs book-style HoTT for the corpus's identity type

Two prevailing presentations of homotopy type theory give different operational status to the [identity-type](../../../../glossary/terms/identity-type.md):

- **Book HoTT** ([Univalent Foundations Program 2013](../../bibliographies/univalent-foundations2013.md)) keeps the standard MLTT identity type and *posits* the [univalence-axiom](../../../../glossary/terms/univalence-axiom.md) as a non-computational axiom. Univalence is consistent (by the simplicial-set model) but does not reduce — terms produced via univalence are stuck.

- **Cubical type theory** replaces the inductive identity type with an *interval-based path type* whose elimination *computes*: univalence becomes a derived theorem, and homotopy-theoretic constructions execute. Implemented in cubical Agda and (experimentally) in Coq's `cubicaltt`.

## What is established

- Both presentations are consistent.
- Book HoTT is simpler to state, simpler to teach, and simpler to embed in an existing MLTT-based assistant — but loses canonicity (closed terms of inductive types may not reduce to constructors).
- Cubical HoTT recovers canonicity at the cost of substantially more elaborate identity-type rules.

## What remains open

- *Which presentation should this directory adopt as primary?* The current `identity-type.md` is presentation-neutral; if the corpus needs to bind to a Lean or Agda formalisation, a choice is forced.
- *Lean 4 / mathlib alignment*: Lean 4's identity type is intensional MLTT-style; mathlib uses it without univalence by default. A corpus-side decision to commit to book HoTT keeps the binding straightforward; commitment to cubical HoTT would require a different proof-assistant binding (cubical Agda).
- *The interval primitive.* Cubical HoTT introduces a special interval type $\mathbb{I}$ that is not a standard inductive — its rules are listed separately. Whether to author this directory's `objects/` to include `interval.md` depends on the choice above.
