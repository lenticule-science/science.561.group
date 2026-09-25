---
title: "Prime"
type: "term"
date-created: 2026-03-05
---

A prime is a natural number greater than 1 that cannot be divided evenly by any natural number other than 1 and itself. The number 7 is prime because no smaller number (besides 1) divides it. The number 6 is not prime because $6 = 2 \times 3$. The first several primes are 2, 3, 5, 7, 11, 13, 17, 19, 23, 29. Notice that 2 is the only even prime — every other even number is divisible by 2.

What makes primes fundamental is that every integer greater than 1 can be written as a product of primes in exactly one way (up to the order of the factors). The number 60, for example, is $2 \times 2 \times 3 \times 5$, and there is no other way to break it into primes. This fact — that primes are the multiplicative atoms from which all integers are built — is called the fundamental theorem of arithmetic. Carl Friedrich Gauss gave the first rigorous proof in *Disquisitiones Arithmeticae* (1801), though the key lemma (if a prime divides a product, it must divide one of the factors) goes back to Euclid&rsquo;s *Elements*, Book VII, Proposition 30.

The formal definition captures this atomic quality directly. An integer $p > 1$ is prime if whenever $p \mid ab$ (that is, $p$ divides the product abab), then $p \mid a$ or $p \mid b$. This is equivalent to saying that pp&rsquo;s only positive [divisors](divisibility.md) are 1 and $p$ itself, but the divisibility-of-products formulation is the one that generalizes to other mathematical structures.

There are infinitely many primes. Euclid proved this in *Elements*, Book IX, Proposition 20, with an argument that remains one of the most elegant in mathematics: given any finite list of primes, multiply them all together and add 1. The result is either prime itself or divisible by some prime not on the list. Either way, the list was incomplete.

Despite being infinite, primes thin out as numbers get larger. Carl Friedrich Gauss conjectured around 1792 that the number of primes up to $x$ is approximately x/ln⁡(x)x / \ln(x). This conjecture, the prime number theorem, was independently proved in 1896 by Jacques Hadamard and Charles-Jean de la Vallée-Poussin. The theorem says that primes become rarer at a logarithmic rate — but never stop appearing entirely.

In [ring](ring.md) theory, the concept generalizes beyond the integers. An element $p$ of an [integral domain](integral-domain.md) is prime if $p \neq 0$, $p$ is not a unit (not invertible), and $p \mid ab$ implies $p \mid a$ or $p \mid b$. This generalization matters because unique factorization can fail in other rings — a discovery by Ernst Eduard Kummer in the 1840s that led Richard Dedekind to invent the theory of [ideals](ideal.md), recovering unique factorization at a higher level of abstraction.
