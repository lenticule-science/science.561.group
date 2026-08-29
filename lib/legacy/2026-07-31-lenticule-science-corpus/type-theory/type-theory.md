---
title: Type Theory
description: The mathematics of typed terms — formal systems where every well-formed expression carries a type, computation is reduction on terms, and the propositions-as-types correspondence makes a proof and a program the same object. The node landing page for this corpus's type-theoretic base.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["type-theory", "curry-howard", "propositions-as-types", "lambda-calculus", "dependent-types", "intuitionistic-logic", "proof-assistant", "constructive-mathematics"]
---

# Type Theory

## What this node is

This node holds type theory as a working library: the study of formal systems in which an expression is **typed before it is evaluated**, the typing rules reject ill-formed terms before reduction begins, and — the load-bearing fact for everything downstream — the *propositions-as-types correspondence* makes a proof and a program the same kind of object. A type is a proposition; a term of that type is a proof of it; running the program is normalizing the proof.

Type theory is one of the three bases this corpus evaluates its single law at. Predication supplies the law — a node defined by its morphisms, descent as entailment — and type theory is where that law is read **syntactically**: the typing judgment `Γ ⊢ t : A` is the proof that term `t` inhabits type `A`, and the path from a typing context to a conclusion is a proof read from premise to conclusion. This is why the corpus reads a filepath with Curry–Howard directionality: a path *is* a typed term, each segment one entailment edge, exactly as a typing derivation is.

## Why it matters

- **A proof is a program; inhabitation is provability.** A type `A` is *inhabited* when there is a closed term `t` with `⊢ t : A`. Under Curry–Howard that is precisely the provability of the proposition `A`. The corpus's own `status: proved` is an inhabitation marker — a proved claim has a known inhabitant of its type; an open one does not.
- **The leaf carries the least.** The empty type has no inhabitants (it is falsity, with no proof); the unit type has exactly one (trivial truth). Function types are implications, products are conjunctions, sums are disjunctions. The shape of a type *bounds what a term of it can assert* — the same discipline by which the codec leaf `eavt` carries evidence only, no polarity.
- **Types are the grammar of meaning.** From Church's 1932 simply-typed λ-calculus through Martin-Löf's dependent type theory to the homotopy-theoretic extensions of the 2010s, type theory has been both a foundation for constructive mathematics and the operational substrate under every modern proof assistant (Lean, Agda, Coq).

## The four Diátaxis documents

- **Explanations** — [`docs/explanations`](docs/explanations) — the understanding-oriented treatment, anchored by [propositions as types](docs/explanations/propositions-as-types.md): why a proof and a program are one object, and what that buys the corpus's reading of a path as a proof.
- **Tutorials** — [`docs/tutorials`](docs/tutorials) — learning-oriented walkthroughs: type a term by hand, watch β-reduction normalize a proof.
- **Guides** — [`docs/guides`](docs/guides) — task-oriented procedures for working with typed material.
- **References** — [`docs/references`](docs/references) — the specification surface: typing rules, the calculi, and primary sources (Church, Martin-Löf, Sørensen & Urzyczyn, Girard–Lafont–Taylor).

## Orientation

Start at **Explanations / propositions-as-types** for the correspondence that makes this node load-bearing, then descend into `content/` as the fiber earns subnodes (simply-typed λ-calculus, dependent type theory, the substructural and cubical regimes). Un-canonicalized source material sits in [`_archive`](_archive) until it settles. The neighbouring bases are [category theory](../../../category-theory/category-theory.md) (the semantic reading of the same law) and [mathematical logic](../../../positing/content/mathematical-logic/mathematical-logic.md) (the proof-theoretic reading); all three are predication read three ways.
