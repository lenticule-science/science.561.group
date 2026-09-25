---
type: structure
status: active
see-also:
  - k1.md
  - opca.md
  - eff.md
references:
  - Kleene 1945
  - van Oosten 2008
title: PCA — Partial Combinatory Algebra
description: "A partial combinatory algebra (PCA) is a set $A$ with a partial binary operation $\\cdot$ satisfying the existence of two elements $k, s \\in A$ such that for all $a, b, c \\in A$:"
---

# PCA — Partial Combinatory Algebra

A **partial combinatory algebra** (PCA) is a set $A$ with a partial binary operation $\cdot$ satisfying the existence of two elements $k, s \in A$ such that for all $a, b, c \in A$:

$$k \cdot a \cdot b = a \qquad s \cdot a \cdot b \cdot c \simeq a \cdot c \cdot (b \cdot c)$$

where $\simeq$ means "if either side is defined, so is the other and they are equal." Application associates to the left: $a \cdot b \cdot c = (a \cdot b) \cdot c$.

The combinator $k$ encodes the constant function (discard of a value); $s$ encodes substitution/application. Together they generate the full untyped $\lambda$-calculus by the Curry-Howard-Lambek encoding: every closed $\lambda$-term translates to a $k$-$s$ combinator expression.

## What PCAs model

A PCA models untyped computation over a set of codes. Each element $a \in A$ is simultaneously a code and a value: $a$ codes a partial function $\lambda b.\, a \cdot b: A \rightharpoonup A$, and it is also a possible output of computation. The partiality — $a \cdot b$ may be undefined — models non-termination.

PCAs are the algebraic setting for realizability: a proposition $P$ is *realized* by $a \in A$ if $a$ "computes" a witness to $P$. Predicates over sets are formalized as subsets of $A$ (propositions-as-types), with realizers as proof-terms.

## Morphisms

A *plain applicative morphism* $\gamma: A \to B$ is a function tracked by a realizer $r \in B$ satisfying $r \cdot \gamma(a) \cdot \gamma(b) \simeq \gamma(a \cdot b)$ wherever $a \cdot b$ is defined. Applicative morphisms are the 1-cells of the 2-category $\mathbf{PCA}$.

The correct 2-categorical structure for realizability is $\mathbf{oPCA}$ (ordered PCAs with ordered applicative morphisms): see [opca](opca.md) and [opca-equivalent-to-reat](../concepts/opca-equivalent-to-reat.md).

## The key examples

- $\mathcal{K}_1 = (\omega, \cdot)$ with $a \cdot b = \varphi_a(b)$: Kleene's first algebra, modeling discrete Turing computation. See [k1](k1.md).
- $\mathcal{K}_2$: Scott's graph model, modeling continuous (Baire-space) computation.
- $\mathcal{K}_1^{0'}$: $\mathcal{K}_1$ extended with an oracle for the halting problem, modeling $\Delta^0_2$ computation.

Different PCAs yield different realizability toposes $RT(A)$ — not alternative presentations of the same mathematics but genuinely different mathematical structures.
