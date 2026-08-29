---
title: "Connective"
aliases:
  - "connective"
  - "connectives"
  - "logical connective"
date-created: 2025-12-26
introduces: definition
tags: []
mathematical-object: heyting-algebra
references:
  ref1:
    title: "Johnstone, Stone Spaces, Cambridge University Press, 1982"
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
defines:
  - "Connective"
  - "connectives"
  - "logical connective"
type: term
term-kind: definition
---

A connective is a logical operation that builds compound [propositions](./proposition.md) from simpler ones. "It is raining *and* it is cold" combines two propositions using the connective *and*. "If it rains, *then* the ground is wet" uses the connective *if-then*. "It is *not* raining" uses negation. Connectives are the glue of logical reasoning — they determine how the truth of a compound statement depends on the truth of its parts.

The standard connectives are five:

- **Conjunction** ($\wedge$, "and"): $a \wedge b$ is true when both $a$ and $b$ are true.
- **Disjunction** ($\vee$, "or"): $a \vee b$ is true when at least one of $a$ or $b$ is true.
- **Implication** ($\to$, "if...then"): $a \to b$ is true when $a$ being true guarantees $b$ is true.
- **Negation** ($\neg$, "not"): $\neg a$ is true when $a$ is false.
- **Biconditional** ($\leftrightarrow$, "if and only if"): $a \leftrightarrow b$ is true when $a$ and $b$ have the same truth value.

George Boole was the first to treat these operations algebraically, representing propositions as elements of an algebra and connectives as algebraic operations in *An Investigation of the Laws of Thought* (1854). Augustus De Morgan established the laws that bear his name, relating negation to conjunction and disjunction: $\neg(a \wedge b) = \neg a \vee \neg b$ and $\neg(a \vee b) = \neg a \wedge \neg b$. Gottlob Frege introduced a fully formalized notation for connectives, including the conditional, in *Begriffsschrift* (1879) — the first formal logical language capable of expressing all of mathematics.

In a [Heyting algebra](./heyting-algebra.md) $H$, the connectives have precise algebraic definitions. Conjunction is the binary meet: $a \wedge b = \inf\{a, b\}$. Disjunction is the binary join: $a \vee b = \sup\{a, b\}$. [Implication](./heyting-implication.md) is defined as $a \to b = \max\{c \in H : a \wedge c \leq b\}$ — the largest element that, combined with $a$, does not exceed $b$. Negation is $\neg a = a \to \bot$. The biconditional is $(a \to b) \wedge (b \to a)$.

The central structural fact is that conjunction and implication form an adjunction: $c \leq (a \to b)$ if and only if $a \wedge c \leq b$. This residuation property is what *defines* the Heyting implication and governs how logical deduction works within the algebra.

In classical logic — where the underlying algebra is Boolean and $\neg\neg a = a$ for all $a$ — implication simplifies to $a \to b = \neg a \vee b$, and the law of excluded middle $a \vee \neg a = \top$ holds universally. But in [intuitionistic logic](../../documents/articles/teaching-articles/explanations/intuitionistic-logic.md), where the algebra may be non-Boolean, double negation does not collapse and excluded middle can fail. The connectives take on a constructive reading: a proof of $a \wedge b$ is a pair of proofs, a proof of $a \vee b$ is a proof of one specific disjunct (you must know which), and a proof of $a \to b$ is a method that transforms any proof of $a$ into a proof of $b$.

In the open-set [lattice](./lattice.md) $\mathcal{O}(X)$ of a topological space $X$, the connectives become geometric operations: $U \wedge V = U \cap V$, $U \vee V = U \cup V$, $U \to V = \mathrm{int}(U^c \cup V)$, and $\neg U = \mathrm{int}(U^c)$. This is the concrete setting where intuitionistic logic lives inside topology.

## Additional material from the Google Drive library

Let $H$ be a [Heyting algebra](./heyting-algebra.md).

**Definition.** A *connective* is one of the fundamental operations of $H$ that builds compound [formulas](./formula.md) from simpler ones. The connectives of $H$ are:

1. **Conjunction** ($\wedge$): the binary meet. For $a, b \in H$, $a \wedge b = \inf\{a, b\}$.
2. **Disjunction** ($\vee$): the binary join. For $a, b \in H$, $a \vee b = \sup\{a, b\}$.
3. **Implication** ($\to$): the [Heyting implication](./heyting-implication.md). For $a, b \in H$, $a \to b = \max\{c \in H : a \wedge c \leq b\}$.
4. **Negation** ($\neg$): defined by $\neg a = a \to \bot$, where $\bot$ is the least element of $H$.
5. **Biconditional** ($\leftrightarrow$): defined by $a \leftrightarrow b = (a \to b) \wedge (b \to a)$.

**Proposition.** *The connectives $\wedge$ and $\to$ form an adjunction: for all $a, b, c \in H$,*
$$c \leq (a \to b) \quad \Longleftrightarrow \quad a \wedge c \leq b.$$

*Proof sketch.* This is the defining property (residuation) of the [Heyting implication](./heyting-implication.md). $\square$

**Proposition.** *In a Heyting algebra, $\neg\neg a \geq a$ always holds. $\neg\neg a = a$ holds iff $H$ is Boolean. The law of excluded middle $a \vee \neg a = \top$ holds for all $a$ iff $H$ is Boolean.*

*Proof sketch.* From $a \wedge \neg a = a \wedge (a \to \bot) \leq \bot$, we get $a \leq \neg\neg a$ by residuation. Equality fails, e.g., in the open-set lattice of $\mathbb{R}$. $\square$

**Examples.**

- In a Boolean algebra (where $\neg\neg a = a$ for all $a$), $a \to b = \neg a \vee b$, and all five connectives reduce to their classical truth-functional counterparts.
- In the open-set [lattice](./lattice.md) $\mathcal{O}(X)$ of a topological space $X$, $U \wedge V = U \cap V$, $U \vee V = U \cup V$, $U \to V = \mathrm{int}(U^c \cup V)$, and $\neg U = \mathrm{int}(U^c)$.
- In [intuitionistic logic](../../documents/articles/teaching-articles/explanations/intuitionistic-logic.md), these operations give the constructive reading of the connectives: a proof of $a \wedge b$ is a pair of proofs, a proof of $a \vee b$ is a proof of one disjunct, and a proof of $a \to b$ is a method transforming proofs of $a$ into proofs of $b$.
