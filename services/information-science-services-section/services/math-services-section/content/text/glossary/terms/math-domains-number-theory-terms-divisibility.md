---
title: "Divisibility"
type: "term"
date-created: 2026-03-05
---

Divisibility is the fundamental relation of multiplicative number theory: it asks whether one integer fits evenly into another. We say that $a$ divides $b$ (written $a \mid b$) if there exists an integer $k$ such that $b = ak$ — that is, $b$ is a multiple of $a$, and $a$ is a divisor (or factor) of $b$. The number 3 divides 12 because $12 = 3 \times 4$. The number 5 does not divide 12 because there is no integer $k$ with $12 = 5k$.

Divisibility gives the positive integers a natural ordering — not the usual ordering by size, but an ordering by &ldquo;fits into.&rdquo; The number 1 divides everything and sits at the bottom. The [primes](prime.md) sit just above 1: each is divisible only by 1 and itself. Composite numbers sit higher, divisible by more factors. This ordering is a [partial order](partial-order.md): it is reflexive ($a \mid a$ for all $a$), antisymmetric (if $a \mid b$ and $b \mid a$ then $a = b$ for positive integers), and transitive (if $a \mid b$ and $b \mid c$ then $a \mid c$, since if $b = ak$ and $c = bj$ then c=akjc = akj). It is only a partial order, not a total one: 4 does not divide 6, and 6 does not divide 4 — the two are incomparable.

Under the divisibility ordering, the positive integers form a [lattice](../../documents/articles/research/2026/07/objects/posets/terms/lattice.md). The [meet](../../documents/articles/research/2026/07/objects/posets/terms/meet.md) of two numbers — their greatest lower bound under divisibility — is the [greatest common divisor](greatest-common-divisor.md). The [join](../../documents/articles/research/2026/07/objects/posets/terms/join.md) — their least upper bound — is the least common multiple. The meet of 12 and 18 is 6 (the largest number dividing both), and the join is 36 (the smallest number both divide into). The fundamental theorem of arithmetic ensures that this lattice is well-behaved: every positive integer has a unique prime factorization, and the GCD and LCM can be read off by taking the minimum and maximum exponent of each prime, respectively.

Divisibility is the starting point for modular arithmetic, ring theory, and algebraic number theory. The concept of an [ideal](ideal.md) in a ring generalizes divisibility from integers to abstract algebraic structures, and the failure of divisibility to behave as expected in certain number rings — the failure of unique factorization — motivated the entire theory of ideals.
