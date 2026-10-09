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
depends-on:
  - pi-type
references:
  - id: ref1
    type: document
    title: Mac Lane & Moerdijk, Sheaves in Geometry and Logic, Springer, 1994
notation:
  - symbol: "∀"
    for: "universal quantifier"
  - symbol: "∃"
    for: "existential quantifier"
---

Let $\mathcal{C}$ be a category with finite limits, and let $\pi \colon X \times D \to X$ be the projection morphism for objects $X, D \in \mathcal{C}$.

**Definition.** A *quantifier* along $\pi$ is a functor adjoint to the pullback (substitution) functor $\pi^* \colon \mathrm{Sub}(X) \to \mathrm{Sub}(X \times D)$, where $\mathrm{Sub}(-)$ denotes the poset of subobjects. Specifically:

1. The *existential quantifier* $\exists_\pi \colon \mathrm{Sub}(X \times D) \to \mathrm{Sub}(X)$ is the left adjoint of $\pi^*$:
$$\exists_\pi(S) \leq T \quad \Longleftrightarrow \quad S \leq \pi^*(T).$$

2. The *universal quantifier* $\forall_\pi \colon \mathrm{Sub}(X \times D) \to \mathrm{Sub}(X)$ is the right adjoint of $\pi^*$:
$$T \leq \forall_\pi(S) \quad \Longleftrightarrow \quad \pi^*(T) \leq S.$$

In a first-order language interpreted in a [model](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/model.md) $M$ with domain $|M|$, quantifiers bind variables: in $\forall x.\; \varphi(x)$, the variable $x$ is bound and ranges over $|M|$. A [formula](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/formula.md) with all variables bound is a sentence; a formula with free variables is an open formula defining a [property](../../../../../humanities/theories/philosophy/terms/property.md).

**Proposition.** *In $\mathbf{Set}$, the categorical quantifiers recover the classical ones: $\exists_\pi(S) = \{x \in X : \exists d \in D,\, (x, d) \in S\}$ and $\forall_\pi(S) = \{x \in X : \forall d \in D,\, (x, d) \in S\}$.*

*Proof sketch.* Direct verification of the adjunction conditions against subset inclusion. $\square$

**Proposition.** *$\neg\exists x.\;\neg\varphi(x)$ entails $\forall x.\;\varphi(x)$ iff the logic is classical. In intuitionistic logic, the entailment $\neg\exists x.\;\neg\varphi(x) \vdash \forall x.\;\varphi(x)$ fails.*

*Proof sketch.* The classical equivalence relies on $\neg\neg a = a$, which fails in a non-Boolean Heyting algebra. A countermodel exists in the open-set lattice of any non-discrete topological space. $\square$

**Examples.**

- In $\mathbf{Set}$, $\mathrm{Sub}(X) \cong \mathcal{P}(X)$, and $\exists_\pi \dashv \pi^* \dashv \forall_\pi$ is the familiar [adjunction](../../topology/morphisms/adjunction.md) triple on power sets.
- In a topos $\mathcal{E}$, both adjoints exist for every morphism $f$, giving the internal quantifiers of the topos's logic. The Beck-Chevalley condition ensures that substitution commutes with quantification along pullback squares.

**Type-theoretic counterpart.** Under the [Curry-Howard correspondence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/curry-howard-correspondence.md), the universal quantifier $\forall x : A.\,\varphi(x)$ along a projection $\pi$ *is* the [Π-type](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/pi-type.md) $\Pi(x : A).\,\varphi(x)$, with the same adjoint characterisation: Π is right-adjoint to substitution along $\pi$ exactly as $\forall_\pi$ is right-adjoint to $\pi^*$ here. The categorical and type-theoretic accounts are not analogous — they are the same construction, viewed from two sides. The `depends-on: [pi-type]` edge above makes this typographically explicit.
