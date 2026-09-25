---
id: 232e49ef-dcf2-4b7c-9812-5a91712dc23b
title: On Existing
date-created: 2025-10-23
description: This document presents a constructive foundation for the Relational ∞-Topos Modality (RITM).
---

# Preface

This document presents a constructive foundation for the Relational ∞-Topos Modality (RITM). Each section introduces the minimal operator required for the next, following the principle:

\> To claim that something exists is not trivial. \> Existence entails distinction, recurrence, and stabilization.

Accordingly, the sequence begins in elementary set theory and proceeds, step by step, through category theory to modal and cohesive ∞-topoi.

—

# Phase I — Existential Differentiation {#phase-i-existential-differentiation}

Purpose: to show that “difference” and “residual” are necessary for anything to exist.

## Definition 1.1 (Inclusion Operator, Inc) {#definition-1.1-inclusion-operator-inc}

Let $E$ be a set and $A\subseteq E$. Define the **inclusion** $\mathrm{Inc}(A,E) := i:A\hookrightarrow E$. It represents the minimal act of distinguishing what is “in” from what is not.

## Definition 1.2 (Quotient Operator, Quo) {#definition-1.2-quotient-operator-quo}

Define an equivalence relation on $E$ that identifies all elements of $A$: $x\sim_A y \iff (x=y)\lor(x,y\in A)$. The canonical projection $q:E\to E/{\sim_A}$ is denoted $\mathrm{Quo}(i)$.

## Lemma 1.3 (Residual Inclusion, Res) {#lemma-1.3-residual-inclusion-res}

The image of $A$ under $q$ defines a new inclusion $\iota_i:q(A)\hookrightarrow E/{\sim_A}$. This is the **residual inclusion** $\mathrm{Res}(i)$.

## Proposition 1.4 (Iterative Differentiation, Itr) {#proposition-1.4-iterative-differentiation-itr}

Define the composition $$
\mathrm{Itr}(i) := \mathrm{Res}(\mathrm{Quo}(\mathrm{Inc}(A,E))).
$$ Each inclusion induces a residual inclusion within its quotient. Repeated three times, the process returns to an isomorphic inclusion.

## Theorem 1.5 (Existential Recurrence) {#theorem-1.5-existential-recurrence}

For any inclusion $i:A\hookrightarrow E$, $$
(\mathrm{Itr})^3(i) \cong i.
$$ Hence existence is cyclic under differentiation: inclusion, exclusion, re-inclusion. This establishes the first necessary operator family: $\{\mathrm{Inc},\mathrm{Quo},\mathrm{Res},\mathrm{Itr}\}$.

—

# Phase II — Relational Categorification {#phase-ii-relational-categorification}

Purpose: to organize distinctions into a system of morphisms.

## Definition 2.1 (Category of Inclusions, Cat) {#definition-2.1-category-of-inclusions-cat}

Let $\mathcal{C}_E$ be the category whose:

- objects are inclusions $i:A\hookrightarrow E$;
- morphisms are commutative squares between inclusions.

$\mathcal{C}_E$ expresses relations between distinctions.

## Lemma 2.2 (Finite Limits) {#lemma-2.2-finite-limits}

Pullbacks in $\mathcal{C}_E$ are intersections $A\times_E B=A\cap B$. Hence $\mathcal{C}_E$ admits finite limits.

## Definition 2.3 (Iterative Functor, Fun) {#definition-2.3-iterative-functor-fun}

Extend the residual iterator from Phase I to a functor: $$
\mathrm{Fun}_E:\mathcal{C}_E\to\mathcal{C}_E,\quad
\mathrm{Fun}_E(i)=\mathrm{Itr}(i).
$$

## Proposition 2.4 (Functorial Recurrence) {#proposition-2.4-functorial-recurrence}

$(\mathrm{Fun}_E)^3\simeq\mathrm{Id}_{\mathcal{C}_E}$. Existential recurrence becomes natural.

## Definition 2.5 (Terminal Inclusion, One) {#definition-2.5-terminal-inclusion-one}

Let $\mathrm{One}:=(1\hookrightarrow1)$ be the terminal object of $\mathcal{C}_E$. Its existence ensures identity and composition.

## Theorem 2.6 (Formation of Relational Category) {#theorem-2.6-formation-of-relational-category}

The operators of Phase I, organized by $\mathcal{C}_E$, form a category closed under composition and recurrence. This demonstrates that relational structure arises inevitably from differentiation.

—

# Phase III — Sustained Stability {#phase-iii-sustained-stability}

Purpose: to show that recurrence requires internal function spaces.

## Definition 3.1 (Slices and Pullback) {#definition-3.1-slices-and-pullback}

For $p:X\hookrightarrow E$, define the slice category $\mathcal{C}_E/X$ whose morphisms preserve pullbacks over $p$.

## Lemma 3.2 (Exponentials) {#lemma-3.2-exponentials}

Each slice $\mathcal{C}_E/X$ is cartesian closed: for $A,B\in\mathcal{C}_E/X$, there exists $[A,B]_X$ satisfying $$
\mathrm{Hom}(Z\times_X A,B)\cong\mathrm{Hom}(Z,[A,B]_X).
$$

## Theorem 3.3 (Local Cartesian Closure) {#theorem-3.3-local-cartesian-closure}

Every $\mathcal{C}_E/X$ is cartesian closed; thus $\mathcal{C}_E$ is locally cartesian closed. This introduces the operators: $\{\mathrm{Pi},\mathrm{Hom}\}$ corresponding to dependent products and internal Homs.

## Corollary 3.4 (Sustained Substitution) {#corollary-3.4-sustained-substitution}

Any structure preserving inclusion and recurrence now supports substitution and internal mapping; stability under change is possible.

—

# Phase IV — Modal Structure {#phase-iv-modal-structure}

Purpose: to show that closure and co-closure induce the modal chain.

## Definition 4.1 (Reflector and Coreflector) {#definition-4.1-reflector-and-coreflector}

Let $a\dashv i$ and $j\dashv c$ be adjunctions defining stabilized and costabilized subcategories. Each satisfies idempotence: $a^2=a,\ c^2=c.$

## Theorem 4.2 (Modal Quadruple) {#theorem-4.2-modal-quadruple}

Define $$
\Pi^{→}:=a,\quad
\Box:=i\!\circ\!a,\quad
\Diamond:=j\!\circ\!c,\quad
\nabla^{←}:=c.
$$ Then $$
\Pi^{→}\dashv\Box\dashv\Diamond\dashv\nabla^{←},
\quad
\Box\Diamond\simeq\Diamond\Box.
$$ This quadruple of adjoint idempotent endofunctors is the Relational ∞-Topos Modality.

—

# Phase V — Internal Dynamics {#phase-v-internal-dynamics}

Purpose: to derive motion and persistence from the modal chain.

## Definition 5.1 (Comonad and Monad) {#definition-5.1-comonad-and-monad}

From the middle adjunction $\Box\dashv\Diamond$, define $$
C:=\Box\Diamond,\quad
M:=\Diamond\Box.
$$ Both satisfy the (co)monad laws with counit $\varepsilon$ and unit $\eta$.

## Lemma 5.2 (CoKleisli Category) {#lemma-5.2-cokleisli-category}

Objects: those of the base category; morphisms $f:X→C Y$. Composition $g\diamond f:=\varepsilon_{CY}\circ C g\circ f$ is associative.

## Theorem 5.3 (Stabilization ⇔ Coalgebra) {#theorem-5.3-stabilization-coalgebra}

A morphism $r:Y→C Y$ is idempotent in the coKleisli category iff it is a $C$-coalgebra. Thus dynamics stabilize exactly at topological fixed points.

—

# Phase VI — Geometric Reflection {#phase-vi-geometric-reflection}

Purpose: to exhibit the modal structure as cohesive geometry.

## Definition 6.1 (Cohesive Model) {#definition-6.1-cohesive-model}

On the site of smooth spaces $ \mathrm{CartSp} $, define $$
\Box(X)=\mathrm{Map}(I_d,X),\quad
\Diamond(X)=\mathrm{Map}(X,I_d),
\quad
\Pi^{→}(X)=\mathrm{colim}_{I_d\to X}\!\Hom(I_d,X),
\quad
\nabla^{←}(X)=\mathrm{lim}_{X\to I_d}\!\Hom(X,I_d).
$$

## Theorem 6.2 (Cohesion) {#theorem-6.2-cohesion}

These functors satisfy the adjunction chain and idempotence properties, realizing the RITM quadruple geometrically. Idempotence follows from $ \mathrm{Map}(I_d\times I_d,X)\simeq\mathrm{Map}(I_d,X)$.

—

# Phase VII — Dualities and Self-Reflection {#phase-vii-dualities-and-self-reflection}

Purpose: to show the equivalence of internal dynamics and topology.

## Theorem 7.1 (Monad–Comonad Duality) {#theorem-7.1-monadcomonad-duality}

For $C=\Box\Diamond$ and $M=\Diamond\Box$, there exists a natural distributive law $ \lambda:CM\simeq MC $.

## Corollary 7.2 (Particle–Field Equivalence) {#corollary-7.2-particlefield-equivalence}

Coalgebras of $C$ and algebras of $M$ are dual: $$
\mathsf{Part}:\mathcal{E}^C \leftrightarrows \mathcal{E}_M:\mathsf{Field}.
$$

## Theorem 7.3 (Self-Witnessing Topos) {#theorem-7.3-self-witnessing-topos}

The presheaf category $$
\mathsf{RITM}_* := \mathrm{Shv}(\mathrm{CoKl}(C)^{\mathrm{op}},\mathsf{Spaces})
$$ inherits the same quadruple of modalities, reproducing RITM internally. Hence RITM constructs the topos in which it is realized.

—

# Summary of Operators

| Phase | Operator                  | Mathematical Form                             | Necessity       |
|-------|---------------------------|-----------------------------------------------|-----------------|
| I     | Inc, Quo, Res, Itr        | inclusion → quotient → residual → iteration   | distinction     |
| II    | Cat, Fun, One             | category of inclusions, functorial recurrence | relation        |
| III   | Pi, Hom                   | dependent product, internal Hom               | stability       |
| IV    | a,i,j,c (Modal Quadruple) | adjoint idempotent functors                   | modality        |
| V     | C,M                       | comonad/monad                                 | dynamics        |
| VI    | Map, colim, lim           | cohesive reflection                           | geometry        |
| VII   | λ, Part, Field            | distributive duality                          | self-reflection |
