---
title: "Adic"
aliases:
  - "adic"
  - "I-adic"
  - "adic completion"
  - "adic topology"
date-created: 2026-08-26
tags: []
defines:
  - "Adic"
  - "adic completion"
  - "adic topology"
type: term
---

"Adic" names a structure built by completing a tower of successive approximations. In its original setting: for a commutative [ring](./ring.md) $R$ and an ideal $I \subseteq R$, the powers $I \supseteq I^2 \supseteq I^3 \supseteq \cdots$ give a decreasing filtration, and the $I$-adic topology on $R$ takes these powers as a neighborhood basis of $0$. The quotients $R/I \leftarrow R/I^2 \leftarrow R/I^3 \leftarrow \cdots$ form a tower of successively finer approximations to $R$ modulo $I$, and $R$ is $I$-adically complete when the natural map $R \to \varprojlim_n R/I^n$ is an isomorphism — every compatible family of approximations, one at each stage, comes from a unique element of $R$.

The pattern generalizes far beyond commutative rings: given any tower $X_0 \twoheadleftarrow X_1 \twoheadleftarrow X_2 \twoheadleftarrow \cdots$ of objects and transition maps in any [category](./category.md), its inverse limit $\varprojlim_n X_n$ — when it exists — is the completion of the tower, realized concretely as the set (or object) of *threads*: compatible families $(x_n)_n$ with $x_n \in X_n$ and each $x_n$ the image of $x_{n+1}$ under the transition map. Data assembled compatibly across every stage of such a tower, or the completed limit object itself, is called adic.

The classical examples fix the pattern. The $p$-adic integers $\mathbb Z_p := \varprojlim_n \mathbb Z/p^n\mathbb Z$ complete the integers along the tower of residues modulo powers of a prime $p$; the formal power series ring $k[[x]] := \varprojlim_n k[x]/(x^n)$ is the $(x)$-adic completion of the polynomial ring $k[x]$; a profinite [group](./group.md) is an inverse limit of finite quotient groups. In each case the completed object is typically much larger than any finite stage, yet is entirely determined by the compatible-family condition across all of them.

A caveat governs when adic constructions behave well: if the images of the transition maps do not stabilize, the derived functor $\varprojlim^1$ can be nonzero, and short exact sequences of towers need not stay exact after passing to the limit. A tower satisfying the Mittag–Leffler condition — the images of $X_{n+k} \to X_n$ eventually stabilize in $k$ for each $n$ — avoids this failure; most towers arising from a genuine filtration (as opposed to an arbitrary inverse system) satisfy it.
