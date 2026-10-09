---
title: "Heyting Implication"
aliases:
  - "Heyting implication"
  - "relative pseudocomplement"
  - "residual"
date-created: "2026-03-02T00:00:00"
type: definition
tags: []
mathematical-object: heyting-algebra
references:
  - "Johnstone, Stone Spaces, Cambridge University Press, 1982"
requires:
  - ./connective.md
  - ../../../concepts/heyting-algebra/index.md
notation:
  - symbol: "→"
    for: "Heyting implication"
  - symbol: "a → b"
    for: "largest c such that a ∧ c ≤ b"
---

Let $H$ be a [Heyting algebra](../../../concepts/heyting-algebra/index.md).

**Definition.** The *[Heyting](../../../../general/people/arend-heyting.md) implication* (or *relative pseudocomplement*) is the binary operation $\to$ on $H$ defined by

$$a \to b \;=\; \max\{c \in H : a \wedge c \leq b\}.$$

Equivalently, $\to$ is characterized by the *residuation law*: for all $a, b, c \in H$,

$$c \leq (a \to b) \quad \Longleftrightarrow \quad a \wedge c \leq b.$$

**Proposition.** *For each $a \in H$, the [functor](../../../objects/categories/ordinary-categories/terms/functor.md) $(a \wedge -)$ is left adjoint to $(a \to -)$. That is, $\wedge$ and $\to$ form an [adjunction](../../higher-topos-theory/terms/adjunction.md) in the poset category $H$.*

*Proof sketch.* The residuation law is exactly the hom-set condition for the adjunction $(a \wedge -) \dashv (a \to -)$. $\square$

**Proposition.** *In a Boolean algebra, $a \to b = \neg a \vee b$. In a general Heyting algebra, $a \to b \geq \neg a \vee b$, with equality holding iff $H$ is Boolean.*

*Proof sketch.* In a Boolean algebra, complementation gives $\neg a \vee b = \max\{c : a \wedge c \leq b\}$. In a non-Boolean Heyting algebra (e.g., $\mathcal{O}(\mathbb{R})$), choose $a$ with $\neg a \vee a \neq \top$ to exhibit strict inequality. $\square$

**Proposition (Intuitionistic negation).** *Define $\neg a = a \to \bot$. Then:*
1. *$a \wedge \neg a = \bot$.*
2. *$a \leq \neg\neg a$.*
3. *$\neg\neg\neg a = \neg a$.*
4. *$\neg\neg a = a$ holds for all $a$ if and only if $H$ is Boolean.*

*Proof sketch.* (1) follows from the definition. (2) follows by applying residuation to (1). (3) follows from (2) applied to $\neg a$ and a dual argument. (4) is the standard characterization of Boolean algebras among Heyting algebras. $\square$

**Examples.**

- In $\mathcal{O}(X)$, the open-set [lattice](../../../objects/posets/terms/lattice.md) of a topological space $X$: $U \to V = \mathrm{int}(U^c \cup V)$.
- In any Boolean algebra: $a \to b = \neg a \vee b$.
- The [Heyting](../../../../general/people/arend-heyting.md) implication is the internal hom of the [lattice](../../../objects/posets/terms/lattice.md) viewed as a category. In a topos, the [Heyting](../../../../general/people/arend-heyting.md) implication on the [subobject classifier](../../higher-topos-theory/terms/subobject-classifier.md) $\Omega$ gives the internal implication of the topos's logic.
