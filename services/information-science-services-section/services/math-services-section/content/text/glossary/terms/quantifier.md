---
title: "Quantifier"
description: "Let $mathcal{C}$ be a category with finite limits, and let $pi colon X \times D \to X$ be the projection morphism for objects $X, D in mathcal{C}$."
aliases:
  - "quantifier"
  - "quantifiers"
date-created: 2025-12-26
introduces: definition
tags: []
mathematical-object: category
references:
  ref1:
    title: "Mac Lane & Moerdijk, Sheaves in Geometry and Logic, Springer, 1994"
notation:
  - symbol: "∀"
    for: "universal quantifier"
  - symbol: "∃"
    for: "existential quantifier"
defines:
  - "Quantifier"
  - "quantifiers"
type: term
term-kind: definition
---

Let $\mathcal{C}$ be a category with finite limits, and let $\pi \colon X \times D \to X$ be the projection morphism for objects $X, D \in \mathcal{C}$.

**Definition.** A *quantifier* along $\pi$ is a functor adjoint to the pullback (substitution) functor $\pi^* \colon \mathrm{Sub}(X) \to \mathrm{Sub}(X \times D)$, where $\mathrm{Sub}(-)$ denotes the poset of subobjects. Specifically:

1. The *existential quantifier* $\exists_\pi \colon \mathrm{Sub}(X \times D) \to \mathrm{Sub}(X)$ is the left adjoint of $\pi^*$:
$$\exists_\pi(S) \leq T \quad \Longleftrightarrow \quad S \leq \pi^*(T).$$

2. The *universal quantifier* $\forall_\pi \colon \mathrm{Sub}(X \times D) \to \mathrm{Sub}(X)$ is the right adjoint of $\pi^*$:
$$T \leq \forall_\pi(S) \quad \Longleftrightarrow \quad \pi^*(T) \leq S.$$

In a first-order language interpreted in a [model](./model.md) $M$ with domain $|M|$, quantifiers bind variables: in $\forall x.\; \varphi(x)$, the variable $x$ is bound and ranges over $|M|$. A [formula](./formula.md) with all variables bound is a sentence; a formula with free variables is an open formula defining a property.

**Proposition.** *In $\mathbf{Set}$, the categorical quantifiers recover the classical ones: $\exists_\pi(S) = \{x \in X : \exists d \in D,\, (x, d) \in S\}$ and $\forall_\pi(S) = \{x \in X : \forall d \in D,\, (x, d) \in S\}$.*

*Proof sketch.* Direct verification of the adjunction conditions against subset inclusion. $\square$

**Proposition.** *$\neg\exists x.\;\neg\varphi(x)$ entails $\forall x.\;\varphi(x)$ iff the logic is classical. In intuitionistic logic, the entailment $\neg\exists x.\;\neg\varphi(x) \vdash \forall x.\;\varphi(x)$ fails.*

*Proof sketch.* The classical equivalence relies on $\neg\neg a = a$, which fails in a non-Boolean Heyting algebra. A countermodel exists in the open-set lattice of any non-discrete topological space. $\square$

**Examples.**

- In $\mathbf{Set}$, $\mathrm{Sub}(X) \cong \mathcal{P}(X)$, and $\exists_\pi \dashv \pi^* \dashv \forall_\pi$ is the familiar [adjunction](./adjunction.md) triple on power sets.
- In a topos $\mathcal{E}$, both adjoints exist for every morphism $f$, giving the internal quantifiers of the topos's logic. The Beck-Chevalley condition ensures that substitution commutes with quantification along pullback squares.
