---
type: definition
class: structure-preserving-translation
status: current
depends-on: [simply-typed-lambda-calculus, typing-judgment, function-type, product-type, sum-type, empty-type, unit-type]
title: Curry-Howard translation
description: The Curry-Howard translation is the bidirectional structure-preserving correspondence between proofs in intuitionistic natural deduction and terms of the simply-typed-lambda-calculus (and, in extended form, between intuitionistic logic…
---

# Curry-Howard translation

The **Curry-Howard translation** is the bidirectional structure-preserving correspondence between proofs in intuitionistic natural deduction and terms of the [simply-typed-lambda-calculus](../../documents/articles/research/2026/07/31/lenticule-import/objects/simply-typed-lambda-calculus.md) (and, in extended form, between [intuitionistic logic](../../documents/articles/research/2026/07/31/logic/concepts/decidability.md) and [dependent-type-theory](dependent-type-theory.md)).

## Definition

The translation maps:

- *Proposition* $\leftrightarrow$ *type*.
- *Proof of $A$* $\leftrightarrow$ *term of type $A$*.
- *Implication* $A \Rightarrow B$ $\leftrightarrow$ *function type* [$A \to B$](function-type.md).
- *Conjunction* $A \wedge B$ $\leftrightarrow$ *product type* [$A \times B$](product-type.md).
- *Disjunction* $A \vee B$ $\leftrightarrow$ *sum type* [$A + B$](sum-type.md).
- *Truth* $\top$ $\leftrightarrow$ *unit type* [$\mathbf{1}$](unit-type.md).
- *Falsehood* $\bot$ $\leftrightarrow$ *empty type* [$\mathbf{0}$](empty-type.md).
- *Universal quantification* $\forall x : A.\,P(x)$ $\leftrightarrow$ *Pi-type* [$\Pi(x : A).\,P(x)$](pi-type.md).
- *Existential quantification* $\exists x : A.\,P(x)$ $\leftrightarrow$ *Sigma-type* [$\Sigma(x : A).\,P(x)$](sigma-type.md).
- *Proof construction* $\leftrightarrow$ *term construction*.
- *Proof normalization (cut elimination)* $\leftrightarrow$ [*beta-reduction*](beta-reduction-step.md).

The full statement is the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md) theorem.

## Properties

- *Structure-preserving*: derivations and reductions on the logic side correspond to derivations and reductions on the type side.
- *Sound and complete*: a proposition is provable iff its corresponding type is [inhabited](inhabitation.md).
- *Computational content*: the translation makes proofs *executable* — extracting a program from a proof of $\forall n.\,\exists m.\,P(n, m)$ produces a function $n \mapsto m$ realising the existence claim.

## Position

The Curry-Howard translation is the load-bearing semantic operator between [logic](../../documents/articles/research/2026/07/31/logic) and type theory. It is what makes a proof assistant a *program-development environment*: writing a proof IS writing a program, and type-checking the program IS verifying the proof. Reference: [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md), [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §9.4.
