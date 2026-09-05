---
title: "Lean binding for type theory"
type: question
status: open
depends-on: [dependent-type-theory, simply-typed-lambda-calculus, curry-howard-correspondence]
---


This part of the corpus is currently not Lean-bound. No theorem carries a `lean:` field. This question scopes the work of producing initial bindings against the Lean 4 kernel and `Mathlib.Logic` / `Mathlib.Combinatorics.SimpleGraph`.

## Sub-questions

- **Sub-question A.** Which Lean module matches each object? The Lean 4 kernel itself is an MLTT-style [dependent type theory](../../../../glossary/terms/dependent-type-theory.md), so these typing rules are the typing rules Lean uses. Concrete bindings live in `Mathlib.Logic.Basic` (function extensionality and propositional extensionality), `Init.Prelude` (the universe hierarchy), and `Mathlib.CategoryTheory.Closed.Cartesian` (the semantic counterpart of STLC).
- **Sub-question B.** Which theorems can mathlib prove for us? [Church–Rosser](../church-rosser.md) and strong normalization for STLC are metatheorems about calculi rather than ordinary theorems internal to Lean's own kernel. Subject reduction, progress, and principal typing have the same constraint. The Curry–Howard correspondence is embodied by Lean rather than proved within it.
- **Sub-question C.** Should the corpus open a separate Lean project containing a concrete object-language calculus—an STLC interpreter in Lean with mechanized subject reduction? The [Lean formalization of STLC](../../teaching-articles/examples/lean-formalisation-of-stlc.md) sketches that work.

## What is established

- The corpus convention is `lean:` frontmatter pointing at a separate Lean project, not embedded `.lean` files.
- Metatheorems about Lean's kernel cannot generally be internalized in Lean without introducing a distinct encoded object language. This is a structural constraint, not merely unfinished binding work.

## What remains open

- Bind the few statements that have honest library counterparts.
- Author a small worked Lean STLC formalization.
- Cross-link this work with the separate [graph-theory Lean-binding question](./lean-binding.md), where live mathlib graph lemmas can be bound directly.
