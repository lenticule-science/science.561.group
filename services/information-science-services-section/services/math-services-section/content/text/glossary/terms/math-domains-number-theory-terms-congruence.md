---
title: "Congruence"
type: "term"
date-created: 2026-03-05
---

Congruence is a way of saying that two integers leave the same remainder when divided by a given number. The numbers 17 and 5 are congruent modulo 12 because both leave a remainder of 5 when divided by 12 — or equivalently, because their difference 17−5=1217 - 5 = 12 is divisible by 12. Clock arithmetic is the most familiar example: 3 o&rsquo;clock and 15 o&rsquo;clock are the &ldquo;same&rdquo; time on a 12-hour clock, because 15≡3(mod12)15 \equiv 3 \pmod{12}.

Formally, two integers $a$ and $b$ are congruent modulo $n$ (written a≡b(modn)a \equiv b \pmod{n}) if $n$ [divides](divisibility.md) a−ba - b. This relation was introduced by Carl Friedrich Gauss in *Disquisitiones Arithmeticae* (1801) — a book he published at the age of 24 that reshaped number theory. Gauss chose the $\equiv$ symbol and the &ldquo;mod&rdquo; notation, which remain standard today. Before Gauss, mathematicians worked with remainders and divisibility ad hoc; after him, congruence became a systematic tool.

Congruence modulo $n$ is an equivalence [relation](../../documents/articles/research/2026/07/concepts/relation/index.md) on $\mathbb{Z}$: it is reflexive ($a \equiv a$), symmetric (if $a \equiv b$ then $b \equiv a$), and transitive (if $a \equiv b$ and $b \equiv c$ then $a \equiv c$). It partitions the integers into $n$ equivalence classes — the residue classes [0],[1],…,[n−1][0], [1], \ldots, [n-1], where [r][r] is the set of all integers with remainder $r$ when divided by $n$.

What makes congruence powerful is its compatibility with arithmetic. If a≡a′(modn)a \equiv a&#x27; \pmod{n} and b≡b′(modn)b \equiv b&#x27; \pmod{n}, then a+b≡a′+b′(modn)a + b \equiv a&#x27; + b&#x27; \pmod{n} and ab≡a′b′(modn)ab \equiv a&#x27;b&#x27; \pmod{n}. You can add and multiply congruences freely, just as you add and multiply equations. This compatibility is not merely convenient — it is the structural fact that makes the residue classes into a [ring](ring.md). The [quotient group](quotient-group.md) $\mathbb{Z}/n\mathbb{Z}$ (the integers modulo $n$) inherits well-defined addition and multiplication from $\mathbb{Z}$, forming a commutative ring. When $n$ is [prime](prime.md), this ring is a [field](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) — every nonzero element has a multiplicative inverse — because a prime cannot divide a product without dividing one of the factors.

Modular arithmetic has applications far beyond pure number theory. Cryptography relies on it — the RSA algorithm works in $\mathbb{Z}/n\mathbb{Z}$ where $n$ is a product of two large primes. Computer science uses it for hash functions, error-correcting codes, and pseudorandom number generation. Calendar calculations, ISBN check digits, and bank routing number verification all use congruence arithmetic.
