---
title: "Model"
description: "A model is a mathematical structure that makes a set of logical sentences true. It is the bridge between syntax (the formal sentences of a theory) and semantics (what those sentences are *about*). The axioms of group theory are sentences in a formal language. The integers under addition are a model of those axioms — a concrete mathematical object in which every axiom holds true."
aliases:
  - "model"
  - "models"
  - "structure"
date-created: 2025-12-26
introduces: definition
tags: []
mathematical-object: first-order-theory
references:
  ref1:
    title: "Enderton, A Mathematical Introduction to Logic, 2nd ed., Academic Press, 2001"
requires:
  - ./formula.md
notation:
  - symbol: "M"
    for: "model"
  - symbol: "M ⊨ φ"
    for: "M satisfies φ"
defines:
  - "Model"
  - "models"
  - "structure"
type: term
term-kind: definition
---

A model is a mathematical structure that makes a set of logical sentences true. It is the bridge between syntax (the formal sentences of a theory) and semantics (what those sentences are *about*). The axioms of group theory are sentences in a formal language. The integers under addition are a model of those axioms — a concrete mathematical object in which every axiom holds true.

The concept solves a fundamental problem: formal logic manipulates symbols according to rules, but symbols by themselves do not refer to anything. A model gives them reference. The symbol "0" becomes the number zero. The symbol "+" becomes the addition operation. The sentence "$\forall x\, (x + 0 = x)$" becomes a claim about actual numbers — and in the model of integers under addition, that claim is true.

Formally, given a first-order theory $T$ over a signature $\Sigma$ (a list of constant symbols, function symbols, and relation symbols), a model $M$ consists of: (1) a nonempty set $|M|$ called the domain or universe; (2) for each constant symbol $c$, an element $c^M \in |M|$; (3) for each $n$-ary function symbol $f$, a function $f^M: |M|^n \to |M|$; and (4) for each $n$-ary relation symbol $R$, a subset $R^M \subseteq |M|^n$. Truth is then defined recursively through the satisfaction relation: $M, \sigma \models \varphi$ (read "$M$ satisfies $\varphi$ under assignment $\sigma$"), where $\sigma$ maps variables to elements of the domain. Atomic [formulas](./formula.md) are checked against the model's interpretation of relation symbols; connectives work as expected; and quantifiers range over the domain.

Alfred Tarski formalized this semantic definition of truth in "The Concept of Truth in Formalized Languages" (1933), making precise for the first time what it means for a sentence to be true in a structure. His approach — truth is a relationship between sentences and models, defined by recursion on the structure of formulas — remains the foundation of model theory.

The deepest connection between syntax and semantics is Kurt Gödel's completeness theorem, proved in 1930 and published in "Die Vollständigkeit der Axiome des logischen Funktionenkalküls." It states that a theory $T$ has a model if and only if $T$ is consistent — that is, $T$ does not prove a contradiction. This means the purely syntactic notion of consistency (you cannot derive $\bot$) coincides exactly with the semantic notion of satisfiability (there exists a world where the theory holds). Proof and truth are two sides of the same coin, at least for first-order logic.

The standard model of Peano arithmetic is $(\mathbb{N}, 0, S, +, \times)$ — the natural numbers with zero, successor, addition, and multiplication. The standard model of the theory of real closed fields is $(\mathbb{R}, 0, 1, +, \times, <)$. But theories typically have many models, not just one. The Löwenheim-Skolem theorem states that any consistent theory with an infinite model has models of every infinite cardinality — a first-order theory cannot pin down the "size" of its models. Abraham Robinson exploited this fact to create non-standard analysis in *Non-standard Analysis* (1966), constructing models of arithmetic and analysis containing infinitesimal and infinite elements.

In [Heyting algebra](./heyting-algebra.md) semantics, a model of $T$ is a Heyting algebra homomorphism from the Lindenbaum-Tarski algebra of $T$ into a Heyting algebra $H$. Truth values are elements of $H$ rather than the two-element [Boolean algebra](./boolean-algebra.md), so a formula may receive intermediate truth values between $\top$ and $\bot$, representing partial truth.

## Additional material from the Google Drive library

Let $T$ be a first-order theory over a signature $\Sigma$.

**Definition.** A *model* (or *$\Sigma$-structure*) $M$ for $T$ consists of:

1. A nonempty set $|M|$ called the *domain* (or *universe*).
2. For each constant symbol $c \in \Sigma$, an element $c^M \in |M|$.
3. For each $n$-ary function symbol $f \in \Sigma$, a function $f^M \colon |M|^n \to |M|$.
4. For each $n$-ary relation symbol $R \in \Sigma$, a subset $R^M \subseteq |M|^n$.

We say $M$ is a *model of $T$* if $M \models \varphi$ for every sentence $\varphi \in T$.

**Definition.** Given a $\Sigma$-structure $M$ and a variable assignment $\sigma \colon \mathrm{Var} \to |M|$, the *satisfaction relation* $M, \sigma \models \varphi$ is defined recursively on [formulas](./formula.md):

- $M, \sigma \models R(t_1, \ldots, t_n)$ iff $(t_1^{M,\sigma}, \ldots, t_n^{M,\sigma}) \in R^M$.
- $M, \sigma \models \varphi \wedge \psi$ iff $M, \sigma \models \varphi$ and $M, \sigma \models \psi$.
- $M, \sigma \models \neg\varphi$ iff $M, \sigma \not\models \varphi$.
- $M, \sigma \models \forall x.\, \varphi$ iff $M, \sigma[x \mapsto a] \models \varphi$ for all $a \in |M|$.

For a sentence $\varphi$ (no free variables), the assignment $\sigma$ is irrelevant, and we write $M \models \varphi$.

**Proposition.** *$T$ has a model if and only if $T$ is consistent (i.e., $T \not\vdash \bot$).*

*Proof sketch.* This is the completeness theorem (Godel, 1930). Soundness gives the forward direction; the Henkin construction gives the reverse. $\square$

**Proposition.** *Two $\Sigma$-structures $M$ and $N$ are elementarily equivalent ($M \equiv N$) if and only if they satisfy the same first-order sentences.*

**Examples.**

- $(\mathbb{N}, 0, S, +, \times)$ is the standard model of Peano arithmetic.
- $(\mathbb{R}, 0, 1, +, \times, <)$ is a model of the theory of real closed fields.
- By the Lowenheim-Skolem theorem, any consistent theory with an infinite model has models of every infinite cardinality.

In [Heyting algebra](./heyting-algebra.md) semantics, a model of $T$ is a Heyting algebra homomorphism from the Lindenbaum-Tarski algebra of $T$ into a [Heyting algebra](./heyting-algebra.md) $H$. Truth values are elements of $H$ rather than the two-element [Boolean algebra](./boolean-algebra.md), so a formula receives a truth value in $H$, with $\top$ and $\bot$ as the extreme cases and intermediate values representing partial truth.
