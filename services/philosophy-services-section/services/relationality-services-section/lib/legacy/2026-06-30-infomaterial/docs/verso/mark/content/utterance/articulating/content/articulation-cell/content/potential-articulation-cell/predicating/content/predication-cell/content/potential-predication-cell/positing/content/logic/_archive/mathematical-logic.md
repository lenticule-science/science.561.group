---
title: Mathematical Logic
description: The mathematics of proof, consequence, and what follows from what. Mathematical logic is the proof-theoretic base at which this corpus reads its single law — an arrow as an entailment — spanning intuitionistic, modal, many-valued, paraconsistent, and substructural systems.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["mathematical-logic", "proof-theory", "entailment", "intuitionistic-logic", "substructural-logic", "modal-logic", "paraconsistent-logic", "sequent-calculus"]
---

# Mathematical Logic

## What this node is

This node holds mathematical logic: the formal study of **consequence** — what follows from what, and by which licensed steps. Its objects are propositions, sequents, and proofs; its central relation is entailment, `Γ ⊢ A`, "from the assumptions `Γ` the conclusion `A` follows." Every other base in this cluster is logic seen at a slant: [type theory](../../../typed-theory/content/type-theory/type-theory.md) is logic with proofs made into programs, [category theory](../../../category-theory/category-theory.md) is logic with entailments made into arrows, [order theory](../settling/content/order-theory/order-theory.md) is logic with truth values made into a lattice. Logic is where entailment is studied as itself.

This is the corpus's **proof-theoretic** base. The reading of a filepath as a Curry–Howard proof coordinate is, on this side, the statement that descending a path is *deriving* — each segment a licensed step, `recognize_child = recognize_parent ∧ local` the conjunction rule that builds a sequent. Which logic governs the derivation is not incidental: the corpus is **intuitionistic** (so constructive content is preserved), **substructural** at its language base (so order and resource matter — the Lambek face of the correspondence), and **paraconsistent** at its evidence base (so contradiction is carried, not exploded). This node collects those systems and the proof theory that relates them.

## Why it matters

- **Entailment is an arrow.** A proof of `A ⊢ B` is the same object as a program `A → B`, a morphism `A → B`, and a Hoare triple `{A} C {B}`. Logic supplies the premise→conclusion direction the corpus reads off every path.
- **The structural rules are choices, not laws.** Whether you may use an assumption twice (contraction), ignore one (weakening), or reorder them (exchange) are *options*; dropping them yields the substructural logics where resources and word order become first-class. The corpus's language base lives here.
- **Consistency is not the only way to survive contradiction.** Classical logic explodes from a contradiction; paraconsistent logic does not. The corpus's four-valued evidence is a logic that keeps reasoning with inconsistent inputs — proof theory made contradiction-tolerant.

## The four Diátaxis documents

- **Explanations** — [`docs/explanations`](docs/explanations) — anchored by [the structural rules and what they cost](docs/explanations/the-structural-rules-and-what-they-cost.md): why dropping weakening and contraction makes logic about resources.
- **Tutorials** — [`docs/tutorials`](docs/tutorials) — build a natural-deduction proof, run a sequent-calculus derivation.
- **Guides** — [`docs/guides`](docs/guides) — task-oriented procedures over logical material.
- **References** — [`docs/references`](docs/references) — definitions and primary sources (Gentzen, Lambek, Girard, Belnap).

## Orientation

Start at **Explanations / the-structural-rules-and-what-they-cost**, then descend into [`content/`](content), where the systems already carry branches: [intuitionistic-logic](content/intuitionistic-logic/), [modal-logic](content/modal-logic/), [many-valued-logic](content/many-valued-logic/) (with bilattice-theory), [paraconsistent-logic](content/paraconsistent-logic/), [substructural-logic](content/substructural-logic/) (with Lambek calculus and linear logic), [categorical-logic](content/categorical-logic/), [first-order-logic](content/first-order-logic/), [propositional-logic](content/propositional-logic/), [decidability](content/decidability/), and [foundations](content/foundations/). Un-canonicalized material sits in [`_archive`](_archive).
