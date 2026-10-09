---
title: "Connective"
aliases:
  - "connective"
  - "connectives"
  - "logical connective"
date-created: 2025-12-26
type: definition
tags: []
mathematical-object: heyting-algebra
references:
  - "Johnstone, Stone Spaces, Cambridge University Press, 1982"
notation:
  - symbol: "∧"
    for: "conjunction"
  - symbol: "∨"
    for: "disjunction"
  - symbol: "→"
    for: "implication"
  - symbol: "¬"
    for: "negation"
  - symbol: "↔"
    for: "biconditional"
---

Let $H$ be a [Heyting algebra](../../../concepts/heyting-algebra/index.md).

**Definition.** A *connective* is one of the fundamental operations of $H$ that builds compound [formulas](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/formula.md) from simpler ones. The connectives of $H$ are:

1. **Conjunction** ($\wedge$): the binary meet. For $a, b \in H$, $a \wedge b = \inf\{a, b\}$.
2. **Disjunction** ($\vee$): the binary join. For $a, b \in H$, $a \vee b = \sup\{a, b\}$.
3. **Implication** ($\to$): the [Heyting implication](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/heyting-implication.md). For $a, b \in H$, $a \to b = \max\{c \in H : a \wedge c \leq b\}$.
4. **Negation** ($\neg$): defined by $\neg a = a \to \bot$, where $\bot$ is the least element of $H$.
5. **Biconditional** ($\leftrightarrow$): defined by $a \leftrightarrow b = (a \to b) \wedge (b \to a)$.

**Proposition.** *The connectives $\wedge$ and $\to$ form an adjunction: for all $a, b, c \in H$,*
$$c \leq (a \to b) \quad \Longleftrightarrow \quad a \wedge c \leq b.$$

*Proof sketch.* This is the defining property (residuation) of the [Heyting implication](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/heyting-implication.md). $\square$

**Proposition.** *In a Heyting algebra, $\neg\neg a \geq a$ always holds. $\neg\neg a = a$ holds iff $H$ is Boolean. The law of excluded middle $a \vee \neg a = \top$ holds for all $a$ iff $H$ is Boolean.*

*Proof sketch.* From $a \wedge \neg a = a \wedge (a \to \bot) \leq \bot$, we get $a \leq \neg\neg a$ by residuation. Equality fails, e.g., in the open-set lattice of $\mathbb{R}$. $\square$

**Examples.**

- In a Boolean algebra (where $\neg\neg a = a$ for all $a$), $a \to b = \neg a \vee b$, and all five connectives reduce to their classical truth-functional counterparts.
- In the open-set [lattice](../../../objects/posets/terms/lattice.md) $\mathcal{O}(X)$ of a topological space $X$, $U \wedge V = U \cap V$, $U \vee V = U \cup V$, $U \to V = \mathrm{int}(U^c \cup V)$, and $\neg U = \mathrm{int}(U^c)$.
- In [intuitionistic logic](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/teaching-articles/explanations/intuitionistic-logic.md), these operations give the constructive reading of the connectives: a proof of $a \wedge b$ is a pair of proofs, a proof of $a \vee b$ is a proof of one disjunct, and a proof of $a \to b$ is a method transforming proofs of $a$ into proofs of $b$.
