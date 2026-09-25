---
type: question
status: open
depends-on: [dependent-type-theory, simply-typed-lambda-calculus, curry-howard-correspondence]
title: Lean binding for this directory
description: This directory is currently not Lean-bound.
---

# Lean binding for this directory

This directory is currently *not* Lean-bound. No theorem carries a `lean:` field. This question scopes the work of producing initial bindings against the Lean 4 kernel and `Mathlib.Logic` / `Mathlib.Combinatorics.SimpleGraph` (the latter for cross-citation with [graph-theory/questions/lean-binding](../../research-articles/questions/lean-binding.md)).

## Sub-questions

- **Sub-question A.** Which Lean module matches each object? The Lean 4 kernel itself is an MLTT-style [dependent-type-theory](../../../../glossary/terms/dependent-type-theory.md), so the typing rules of this directory are *the typing rules Lean uses* — there is no separate mathlib statement to bind, the rules are the kernel. Concrete bindings live in `Mathlib.Logic.Basic` (function extensionality, propositional extensionality), `Init.Prelude` (the universe hierarchy), and `Mathlib.CategoryTheory.Closed.Cartesian` (semantic counterpart of STLC).
- **Sub-question B.** Which theorems can mathlib prove for us? [Church-Rosser](../../research-articles/church-rosser.md) and [strong-normalization-stlc](../../research-articles/strong-normalization-stlc.md) are *meta-theorems about Lean's own kernel* — they are proved on paper (and in Coq's `MetaCoq`), but Lean cannot internally prove them about itself without paradox. [Subject-reduction](../../research-articles/subject-reduction.md), [progress](../../research-articles/progress.md), and [principal-typing-stlc](../../research-articles/principal-typing-stlc.md) similarly. The [curry-howard-correspondence](../../research-articles/curry-howard-correspondence.md) is *embodied* by Lean rather than proved within it.
- **Sub-question C.** Should this directory open a `lean/` subdirectory with a Lean formalisation of *some specific* concrete object-language calculus (an STLC interpreter in Lean, with mechanised subject reduction)? The [examples/lean-formalisation-of-stlc](../../teaching-articles/examples/lean-formalisation-of-stlc.md) sketches this.

## What is established

- The corpus convention (per [predication-categories](../../research/2026/07/31/categories/theories/predication-categories/_index.md)) is `lean:` frontmatter pointing at a separate Lean project, not embedded `.lean` files.
- The fact that meta-theorems about Lean's kernel cannot be internalised in Lean creates an unusual constraint: *most theorems in this directory are precisely the kind that resist mathlib binding*. This is a structural feature of the discipline, not a lack of effort.

## What remains open

- *Bind the few theorems that can be bound.* [Univalence-axiom](../../../../glossary/terms/univalence-axiom.md) has a stated form in mathlib's `Mathlib.Logic.Equiv` (not as axiom — Lean does not include univalence — but as a *predicate* that one could assume). The [consistency-of-mltt](../../research-articles/consistency-of-mltt.md) theorem has *external* mechanisations (MetaCoq) that could be cited via `lean:` rather than `mathlib:`.
- *Author a small worked Lean STLC formalisation.* The [examples/lean-formalisation-of-stlc](../../teaching-articles/examples/lean-formalisation-of-stlc.md) example points to where this would live.
- *Cross-link with [graph-theory/questions/lean-binding](../../research-articles/questions/lean-binding.md)* — the graph-theory directory is binding live mathlib lemmas; this directory is binding language facts about the meta-theory. The two work in tandem.
