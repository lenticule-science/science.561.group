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
  - id: ref1
    type: document
    title: Johnstone, Stone Spaces, Cambridge University Press, 1982
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

A connective is a logical operation that builds compound [propositions](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/proposition.md) from simpler ones. "It is raining *and* it is cold" combines two propositions using the connective *and*. "If it rains, *then* the ground is wet" uses the connective *if-then*. "It is *not* raining" uses negation. Connectives are the glue of logical reasoning — they determine how the truth of a compound statement depends on the truth of its parts.

The standard connectives are five:

- **Conjunction** ($\wedge$, "and"): $a \wedge b$ is true when both $a$ and $b$ are true.
- **Disjunction** ($\vee$, "or"): $a \vee b$ is true when at least one of $a$ or $b$ is true.
- **Implication** ($\to$, "if...then"): $a \to b$ is true when $a$ being true guarantees $b$ is true.
- **Negation** ($\neg$, "not"): $\neg a$ is true when $a$ is false.
- **Biconditional** ($\leftrightarrow$, "if and only if"): $a \leftrightarrow b$ is true when $a$ and $b$ have the same truth value.

George Boole was the first to treat these operations algebraically, representing propositions as elements of an algebra and connectives as algebraic operations in *An Investigation of the Laws of Thought* (1854). Augustus De Morgan established the laws that bear his name, relating negation to conjunction and disjunction: $\neg(a \wedge b) = \neg a \vee \neg b$ and $\neg(a \vee b) = \neg a \wedge \neg b$. Gottlob Frege introduced a fully formalized notation for connectives, including the conditional, in *Begriffsschrift* (1879) — the first formal logical language capable of expressing all of mathematics.

In a [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md) $H$, the connectives have precise algebraic definitions. Conjunction is the binary meet: $a \wedge b = \inf\{a, b\}$. Disjunction is the binary join: $a \vee b = \sup\{a, b\}$. [Implication](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/heyting-implication.md) is defined as $a \to b = \max\{c \in H : a \wedge c \leq b\}$ — the largest element that, combined with $a$, does not exceed $b$. Negation is $\neg a = a \to \bot$. The biconditional is $(a \to b) \wedge (b \to a)$.

The central structural fact is that conjunction and implication form an adjunction: $c \leq (a \to b)$ if and only if $a \wedge c \leq b$. This residuation property is what *defines* the Heyting implication and governs how logical deduction works within the algebra.

In classical logic — where the underlying algebra is Boolean and $\neg\neg a = a$ for all $a$ — implication simplifies to $a \to b = \neg a \vee b$, and the law of excluded middle $a \vee \neg a = \top$ holds universally. But in [intuitionistic logic](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/teaching-articles/explanations/intuitionistic-logic.md), where the algebra may be non-Boolean, double negation does not collapse and excluded middle can fail. The connectives take on a constructive reading: a proof of $a \wedge b$ is a pair of proofs, a proof of $a \vee b$ is a proof of one specific disjunct (you must know which), and a proof of $a \to b$ is a method that transforms any proof of $a$ into a proof of $b$.

In the open-set [lattice](../../order/objects/lattice.md) $\mathcal{O}(X)$ of a topological space $X$, the connectives become geometric operations: $U \wedge V = U \cap V$, $U \vee V = U \cup V$, $U \to V = \mathrm{int}(U^c \cup V)$, and $\neg U = \mathrm{int}(U^c)$. This is the concrete setting where intuitionistic logic lives inside topology.
