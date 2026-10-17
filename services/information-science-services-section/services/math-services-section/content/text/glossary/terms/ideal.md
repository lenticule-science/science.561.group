---
name: "Ideal"
aliases:
  - "ideal"
  - "ideals"
date-created: 2026-03-05
tags: []
---

An ideal is a special kind of subset of a [ring](./ring.md) — one that is closed under addition and that "absorbs" multiplication by any element of the ring. More precisely, a subset $I$ of a ring $R$ is an ideal if it is an additive [subgroup](./subgroup.md) of $(R, +)$ and for every $r \in R$ and every $a \in I$, both $ra$ and $ar$ belong to $I$. The absorption property is what distinguishes ideals from mere subgroups: you can multiply an ideal element by anything in the ring and stay inside the ideal.

The simplest example is the even integers $2\mathbb{Z}$ inside the integers $\mathbb{Z}$. The even integers are closed under addition (even plus even is even) and absorb multiplication (any integer times an even integer is even). More generally, for any integer $n$, the multiples of $n$ form an ideal $n\mathbb{Z}$ of $\mathbb{Z}$. In fact, every ideal of $\mathbb{Z}$ has this form — the integers are what algebraists call a principal ideal domain.

Ideals exist because mathematicians needed a way to "divide out" part of a ring's structure and get a well-behaved quotient. The quotient ring $R/I$ consists of cosets $r + I$, and the absorption property is exactly what guarantees that multiplication in this quotient is well-defined. This parallels how [normal subgroups](./normal-subgroup.md) are exactly the subgroups you can divide out of a group to get a well-defined quotient group.

The concept has its roots in a concrete problem: the failure of unique factorization. In ordinary integers, every number factors uniquely into [primes](./prime.md). But in other rings — like the algebraic integers $\mathbb{Z}[\sqrt{-5}]$ — unique factorization breaks down. The number 6 factors as both $2 \times 3$ and $(1 + \sqrt{-5})(1 - \sqrt{-5})$, and neither factorization refines to the other. Ernst Eduard Kummer discovered this problem in the 1840s while working on Fermat's Last Theorem, and introduced auxiliary "ideal numbers" to restore a kind of unique factorization. Richard Dedekind, in his supplements to Peter Gustav Lejeune Dirichlet's *Vorlesungen über Zahlentheorie* (1871), replaced Kummer's extrinsic construction with intrinsic subsets of the ring — what he called *Ideale*. Dedekind's key theorem was that in rings of algebraic integers, every ideal factors uniquely into prime ideals, recovering unique factorization at the level of ideals even when it fails for individual elements.

Amalie Emmy Noether generalized the theory from number rings to arbitrary commutative rings in her 1921 paper "Idealtheorie in Ringbereichen" in *Mathematische Annalen*. She proved that rings satisfying the ascending chain condition on ideals — now called Noetherian rings in her honor — admit a decomposition of every ideal into primary components, extending both Dedekind's factorization theorem and Emanuel Lasker's earlier work on polynomial ideals. This paper effectively founded abstract ring theory as a discipline.

An ideal $I$ is called prime if whenever $ab \in I$, either $a \in I$ or $b \in I$ — mirroring the defining property of prime numbers. It is called maximal if no strictly larger ideal exists besides $R$ itself. In commutative rings, maximal ideals are always prime, and the quotient by a maximal ideal is always a [field](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md). The quotient $\mathbb{Z}/2\mathbb{Z}$, for instance, is the field with two elements — precisely because $2\mathbb{Z}$ is a maximal ideal of $\mathbb{Z}$.
