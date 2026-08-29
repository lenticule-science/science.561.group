---
title: "Pre-bilattice"
description: "An algebra carrying two parallel lattice structures on a common carrier — one for the truth order, one for the knowledge order — without yet the negation that makes a bilattice. The structural skeleton on which the voidmath bilattice is built."
defines:
  - pre-bilattice
  - interlaced pre-bilattice
  - distributive pre-bilattice
related:
  - bilattice
  - knowledge-order
  - truth-order
  - negation
date-created: 2026-04-29
---

A **pre-bilattice** is an algebra $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$ in which both $\langle B, \wedge_t, \vee_t \rangle$ and $\langle B, \wedge_k, \vee_k \rangle$ are lattices on the common carrier $B$.

The order associated with the first lattice is the [truth order](truth-order.md) $\leq_t$; the order associated with the second is the [knowledge order](knowledge-order.md) $\leq_k$. When both lattices are bounded, their extremes are denoted $\mathbf{f}, \mathbf{t}$ (bottom and top in $\leq_t$) and $\bot, \top$ (bottom and top in $\leq_k$).

## Interlacing and distributivity

A pre-bilattice is **interlaced** if each of the four lattice operations is monotone with respect to *both* orders: e.g., $\wedge_t$ is monotone in $\leq_k$ as well as in $\leq_t$. Interlacing is what couples the two lattice structures into a single coherent algebra rather than two independent lattices on the same carrier.

A pre-bilattice is **distributive** if all twelve distributive laws

$$x \circ (y \bullet z) \approx (x \circ y) \bullet (x \circ z)$$

hold for distinct $\circ, \bullet \in \{\wedge_t, \vee_t, \wedge_k, \vee_k\}$.

## Pre-bilattice vs. bilattice

A pre-bilattice equipped with a unary [negation](negation.md) operation — antitone in $\leq_t$, monotone in $\leq_k$, and involutive — is a [bilattice](bilattice.md). The pre-bilattice is the structure *before* negation is supplied; the bilattice is the structure *with* negation.

The framework's underlying value algebras are interlaced distributive pre-bilattices that admit negation: the [twist product](twist-product.md) $\mathbf{L}^\bowtie$ over a residuated lattice produces an interlaced distributive pre-bilattice as its $(\wedge_t, \vee_t, \wedge_k, \vee_k)$-reduct, and the swap-of-components negation upgrades it to a bilattice.

## See also

- [Bilattice](bilattice.md) — pre-bilattice plus negation.
- [Knowledge order](knowledge-order.md), [Truth order](truth-order.md) — the two orders the pre-bilattice carries.
- [Negation](negation.md) — the unary operation whose addition produces a bilattice.
- [Twist product](twist-product.md) — the construction whose pre-bilattice reduct is interlaced and distributive.
