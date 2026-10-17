---
title: "Model"
aliases:
  - "model"
  - "models"
  - "structure"
date-created: 2025-12-26
type: definition
tags: []
mathematical-object: first-order-theory
references:
  - "Enderton, A Mathematical Introduction to Logic, 2nd ed., Academic Press, 2001"
requires:
  - ./formula.md
notation:
  - symbol: "M"
    for: "model"
  - symbol: "M ⊨ φ"
    for: "M satisfies φ"
---

Let $T$ be a first-order theory over a signature $\Sigma$.

**Definition.** A *model* (or *$\Sigma$-structure*) $M$ for $T$ consists of:

1. A nonempty set $|M|$ called the *domain* (or *universe*).
2. For each constant [symbol](../../../../linguistics/topics/semiotics/terms/symbol.md) $c \in \Sigma$, an element $c^M \in |M|$.
3. For each $n$-ary function [symbol](../../../../linguistics/topics/semiotics/terms/symbol.md) $f \in \Sigma$, a function $f^M \colon |M|^n \to |M|$.
4. For each $n$-ary relation [symbol](../../../../linguistics/topics/semiotics/terms/symbol.md) $R \in \Sigma$, a subset $R^M \subseteq |M|^n$.

We say $M$ is a *model of $T$* if $M \models \varphi$ for every sentence $\varphi \in T$.

**Definition.** Given a $\Sigma$-structure $M$ and a variable assignment $\sigma \colon \mathrm{Var} \to |M|$, the *satisfaction relation* $M, \sigma \models \varphi$ is defined recursively on [formulas](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/formula.md):

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

In [Heyting algebra](../../../concepts/heyting-algebra/index.md) semantics, a model of $T$ is a Heyting algebra homomorphism from the Lindenbaum-Tarski algebra of $T$ into a [Heyting algebra](../../../concepts/heyting-algebra/index.md) $H$. Truth values are elements of $H$ rather than the two-element [Boolean algebra](../../../concepts/boolean-algebra/index.md), so a formula receives a truth value in $H$, with $\top$ and $\bot$ as the extreme cases and intermediate values representing partial truth.
