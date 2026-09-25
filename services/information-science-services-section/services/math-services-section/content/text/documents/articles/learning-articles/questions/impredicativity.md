---
type: question
status: open
depends-on: [universe, universe-level, universe-lifting, dependent-type-theory]
title: When should impredicative quantification be admitted?
description: A definition is impredicative if it quantifies over a totality that includes the thing being defined.
---

# When should impredicative quantification be admitted?

A definition is *impredicative* if it quantifies over a totality that includes the thing being defined. Naïvely: $\Pi(A : \mathrm{Type}_i).\,B(A) : \mathrm{Type}_i$ — quantifying over $\mathrm{Type}_i$ to define an inhabitant of $\mathrm{Type}_i$. With unrestricted impredicativity ($\mathrm{Type} : \mathrm{Type}$), the theory becomes inconsistent (Girard's paradox). With *restricted* impredicativity (Coq's `Prop`, the Calculus of Constructions), consistency is recovered.

## What is established

- *Predicative MLTT* (with strict [universe-level](../../research/2026/07/31/lenticule-import/_archive/teaching/explanations/universe-level.md) stratification) is consistent and well-understood; it is what Agda and (mostly) Lean 4 use.
- *Impredicative `Prop`* (Coq, and Lean's `Prop` to a lesser extent): a single distinguished proposition universe sits at the bottom and is closed under all type constructors, including ones that quantify over `Prop` itself. This is consistent but proof-irrelevant.
- *Impredicative `Set`*: was an option in Coq, removed because it conflicts with classical axioms (excluded middle in `Set` plus impredicativity gives Diaconescu's argument, breaking proof relevance).

## What remains open

- *Which posture should this directory adopt?* Currently the [universe](../../../../glossary/terms/universe.md) note presents the predicative hierarchy as standard, with impredicativity flagged as a deferred topic. Whether the corpus's preferred formalisation language (Lean) requires explicit endorsement of `Prop`'s impredicativity is a choice the [questions/lean-binding](../../research-articles/questions/lean-binding.md) plan must settle.
- *Does corpus use need impredicative `Prop`?* Most mathematics proofs in mathlib live in `Prop` and benefit from impredicativity (subset definitions, predicate quantification). A corpus that does not bind to mathlib could in principle stay predicative; one that does has already accepted impredicative `Prop`.
- *How to teach the trade-off.* The corpus would benefit from a concrete worked example showing where impredicativity buys real expressiveness (e.g. defining "least closed set" without an inductive declaration). Currently absent from `examples/`.
