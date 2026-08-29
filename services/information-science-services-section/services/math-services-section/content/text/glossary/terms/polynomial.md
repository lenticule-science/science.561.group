---
title: "Polynomial"
aliases:
  - "polynomial"
  - "polynomials"
  - "polynomial ring"
date-created: 2026-03-05
type: term
tags: []
defines:
  - "Polynomial"
  - "polynomial"
---

A polynomial is an expression built from a variable and constants using only addition, subtraction, and multiplication — no division by the variable, no square roots, no infinite series. The expression $3x^2 - 5x + 1$ is a polynomial. So is $x^7 + 2x^3 - x$. The constant 4 is also a polynomial (of degree zero). What makes polynomials special is their simplicity: they are the most basic expressions you can write down using algebraic operations, and yet they are rich enough to encode deep mathematical structure.

Formally, a polynomial over a [ring](./ring.md) $R$ is a finite formal sum $a_0 + a_1 x + a_2 x^2 + \cdots + a_n x^n$, where each coefficient $a_i$ belongs to $R$ and $x$ is an indeterminate — a formal symbol, not a number. The highest power with a nonzero coefficient is the degree of the polynomial. The set of all polynomials over $R$, with the usual rules for adding and multiplying them, forms the polynomial ring $R[x]$. If $R$ is commutative, so is $R[x]$. If $R$ is an [integral domain](./integral-domain.md), so is $R[x]$.

The history of polynomials is essentially the history of algebra. Babylonian scribes solved quadratic equations by geometric methods around 2000 BCE. Diophantus of Alexandria introduced symbolic notation for powers of unknowns in *Arithmetica* (c. 250 CE). But the decisive era was the Renaissance. Scipione del Ferro discovered how to solve the general cubic (degree 3) around 1515. Niccolò Fontana Tartaglia rediscovered the solution independently, and Gerolamo Cardano published both the cubic and quartic (degree 4) solutions — the latter found by his student Lodovico Ferrari — in *Ars Magna* (1545). For two centuries afterward, mathematicians hunted for a formula to solve the quintic (degree 5). They failed, and eventually Niels Henrik Abel proved in 1824 that no such formula can exist. Évariste Galois, in work written shortly before his death in 1832 and published posthumously in 1846, explained *why*: whether a polynomial equation is solvable by radicals depends on the symmetry group of its roots. Galois's insight created group theory and the field that bears his name.

Polynomial rings are the fundamental construction tool of algebra. You can build new rings from old ones by adjoining a variable: $\mathbb{Z}[x]$ is polynomials with integer coefficients, $\mathbb{R}[x]$ is polynomials with real coefficients. You can then impose relations — setting $x^2 + 1 = 0$ in $\mathbb{R}[x]$ produces the complex numbers. This perspective, formalized through the abstract algebra of Emmy Noether and codified in Bartel Leendert van der Waerden's *Moderne Algebra* (1930–1931), makes polynomial rings the engine of algebraic construction.

Polynomials also underpin algebraic geometry, where the zeros of polynomials define geometric objects. The equation $x^2 + y^2 = 1$ defines a circle; $y^2 = x^3 - x$ defines an elliptic curve. The deep interplay between the algebra of polynomial rings and the geometry of their zero sets is one of the central themes of modern mathematics.
