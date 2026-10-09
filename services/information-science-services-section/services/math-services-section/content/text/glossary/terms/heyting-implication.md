---
name: "Heyting Implication"
description: "Let $H$ be a [Heyting algebra](./heyting-algebra.md)."
aliases:
  - "Heyting implication"
  - "relative pseudocomplement"
  - "residual"
date-created: 2026-03-02
introduces: definition
tags: []
mathematical-object: heyting-algebra
references:
  ref1:
    title: "Johnstone, Stone Spaces, Cambridge University Press, 1982"
requires:
  - ./connective.md
  - ../../../concepts/heyting-algebra/index.md
notation:
  - symbol: "→"
    for: "Heyting implication"
  - symbol: "a → b"
    for: "largest c such that a ∧ c ≤ b"
term-kind: definition
---

Let $H$ be a [Heyting algebra](./heyting-algebra.md).

**Definition.** The *Heyting implication* (or *relative pseudocomplement*) is the binary operation $\to$ on $H$ defined by

$$a \to b \;=\; \max\{c \in H : a \wedge c \leq b\}.$$

Equivalently, $\to$ is characterized by the *residuation law*: for all $a, b, c \in H$,

$$c \leq (a \to b) \quad \Longleftrightarrow \quad a \wedge c \leq b.$$

**Proposition.** *For each $a \in H$, the [functor](./functor.md) $(a \wedge -)$ is left adjoint to $(a \to -)$. That is, $\wedge$ and $\to$ form an [adjunction](./adjunction.md) in the poset category $H$.*

*Proof sketch.* The residuation law is exactly the hom-set condition for the adjunction $(a \wedge -) \dashv (a \to -)$. $\square$

**Proposition.** *In a Boolean algebra, $a \to b = \neg a \vee b$. In a general Heyting algebra, $a \to b \geq \neg a \vee b$, with equality holding iff $H$ is Boolean.*

*Proof sketch.* In a Boolean algebra, complementation gives $\neg a \vee b = \max\{c : a \wedge c \leq b\}$. In a non-Boolean Heyting algebra (e.g., $\mathcal{O}(\mathbb{R})$), choose $a$ with $\neg a \vee a \neq \top$ to exhibit strict inequality. $\square$

**Proposition (Pseudocomplement).** *Define the [pseudocomplement](./complement.md) $\neg a = a \to \bot$ (intuitionistic negation in the literature; not the evidence-swap [negation](./negation.md)). Then:*
1. *$a \wedge \neg a = \bot$.*
2. *$a \leq \neg\neg a$.*
3. *$\neg\neg\neg a = \neg a$.*
4. *$\neg\neg a = a$ holds for all $a$ if and only if $H$ is Boolean.*

*Proof sketch.* (1) follows from the definition. (2) follows by applying residuation to (1). (3) follows from (2) applied to $\neg a$ and a dual argument. (4) is the standard characterization of Boolean algebras among Heyting algebras. $\square$

**Examples.**

- In $\mathcal{O}(X)$, the open-set [lattice](./lattice.md) of a topological space $X$: $U \to V = \mathrm{int}(U^c \cup V)$.
- In any Boolean algebra: $a \to b = \neg a \vee b$.
- The Heyting implication is the internal hom of the [lattice](./lattice.md) viewed as a category. In a topos, the Heyting implication on the [subobject classifier](./subobject-classifier.md) $\Omega$ gives the internal implication of the topos's logic.

## Sufficiency

Relationality reads residual implication as sufficiency and calls it *induces*: $a \to b$ is what must be added to $a$ for $b$ to hold, not "if $a$ then $b$" as a proposition. The residuation law says exactly this: $c$ suffices, together with $a$, for $b$ precisely when $c \leq a \to b$. Modus ponens is $a \wedge (a \to b) \leq b$.
