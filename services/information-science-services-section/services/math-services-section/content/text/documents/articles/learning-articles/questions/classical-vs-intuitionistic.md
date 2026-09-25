---
type: question
status: open
depends-on: [dependent-type-theory, empty-type, sum-type]
title: When should this directory admit classical axioms?
description: "Type theory as presented here is intuitionistic by default: a proof of $A \\vee \\neg A$ requires producing either a proof of $A$ or a refutation of $A$, and double-negation elimination ($\\neg\\neg A \\to A$) is not derivable."
---

# When should this directory admit classical axioms?

Type theory as presented here is *intuitionistic* by default: a proof of $A \vee \neg A$ requires producing either a proof of $A$ or a refutation of $A$, and double-negation elimination ($\neg\neg A \to A$) is not derivable. Classical reasoning — excluded middle, choice, double-negation elimination — must be added as an *axiom*.

The corpus's mathematical content is largely intuitionistic-friendly: the [Heyting-algebra](../../research/2026/07/31/logic/objects/heyting-algebra.md) and [Kripke-semantics](../../../../glossary/terms/kripke-semantics.md) machinery is the order-theoretic backbone of intuitionism, and the [predication-categories](../../research/2026/07/31/categories/theories/predication-categories/_index.md) treatment of typed predication is naturally intuitionistic. But the corpus contains *classical* mathematics too — most of [graph-theory](../../research/2026/07/31/graph-theory/_index.md), [analysis](../../research/2026/07/31/number-theory/_index.md), and [topology](../../research/2026/07/31/topology/_index.md) is presented classically.

## What is established

- The standard MLTT typing rules in [dependent-type-theory](../../../../glossary/terms/dependent-type-theory.md) are intuitionistic, and the [consistency-of-mltt](../../research-articles/consistency-of-mltt.md) theorem applies to that intuitionistic core.
- Adding excluded middle as a closed inhabitant of $\Pi(A : \mathrm{Prop}).\,A + (A \to \mathbf{0})$ is consistent (it has standard set-theoretic models) but breaks the *computational* reading of [sum-types](../../../../glossary/terms/sum-type.md): a closed term of $A + (A \to \mathbf{0})$ produced by classical means does not actually decide $A$.
- The Lean kernel admits the classical axiom, gated behind `Classical.em`; mathlib uses it freely.

## What remains open

- *Should this directory's theorems mark classical-vs-intuitionistic provenance?* No current convention; the [curry-howard-correspondence](../../research-articles/curry-howard-correspondence.md) is presented intuitionistically without flagging which corpus theorems require classical extension.
- *Should the corpus's `proof:` style indicate constructive content?* When a theorem is proved both classically (e.g. Diestel's standard graph-theory proofs) and constructively, the directory should record both — currently it does not.
- *Where does the line sit between corpus-default-intuitionistic and corpus-default-classical?* The cleanest answer would be: corpus is constructively-presented when possible, and any use of classical axioms is flagged at the proof site. Implementing that as a convention is open work.
