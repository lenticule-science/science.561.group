---
name: "Greatest Common Divisor"
aliases:
  - "greatest common divisor"
  - "GCD"
  - "gcd"
date-created: 2026-03-05
tags: []
---

The greatest common divisor of two integers is the largest positive integer that [divides](./divisibility.md) both of them. The GCD of 12 and 18 is 6, because 6 divides both 12 and 18, and no larger number does. The GCD of 15 and 28 is 1 — they share no common factor other than 1, making them coprime. The GCD captures the "shared multiplicative structure" of two numbers: it is the largest factor they have in common.

The GCD is computed by the Euclidean algorithm, one of the oldest algorithms in mathematics. Euclid presented it in *Elements*, Book VII, Propositions 1–2 (c. 300 BCE), though the method was likely known earlier, perhaps to Eudoxus of Cnidus around 375 BCE. The algorithm rests on a single observation: $\gcd(a, b) = \gcd(b, a \bmod b)$. Replacing the larger number with the remainder of dividing by the smaller number does not change the GCD. Repeat until the remainder is zero; the last nonzero remainder is the GCD.

For example: $\gcd(252, 105)$. Divide 252 by 105: quotient 2, remainder 42. Now $\gcd(252, 105) = \gcd(105, 42)$. Divide 105 by 42: quotient 2, remainder 21. Now $\gcd(105, 42) = \gcd(42, 21)$. Divide 42 by 21: quotient 2, remainder 0. So $\gcd(252, 105) = 21$.

The Euclidean algorithm is not just fast — it also produces something extra. The extended Euclidean algorithm computes integers $s$ and $t$ such that $\gcd(a, b) = sa + tb$. This representation, called Bézout's identity (after Étienne Bézout, who studied it in the 18th century), is essential in number theory and algebra. It is the key tool for proving that if a [prime](./prime.md) $p$ divides a product $ab$, then $p$ divides $a$ or $p$ divides $b$ — the lemma underlying the fundamental theorem of arithmetic.

In the divisibility [lattice](./lattice.md) on positive integers, $\gcd(a, b)$ is the [meet](./meet.md) of $a$ and $b$ — the greatest lower bound under the divisibility ordering. Dually, the least common multiple $\text{lcm}(a, b)$ is the join. The two are linked by the identity $\gcd(a, b) \cdot \text{lcm}(a, b) = a \cdot b$ (for positive integers), which says that the shared structure and the combined structure together account for everything.

## Additional material from the Google Drive library

The greatest common divisor of two integers $a$ and $b$, written $\gcd(a, b)$, is the largest positive integer that [divides](./divisibility.md) both $a$ and $b$.

The Euclidean algorithm computes the GCD efficiently: $\gcd(a, b) = \gcd(b, a \bmod b)$, terminating when the remainder reaches zero. This algorithm also yields a representation $\gcd(a, b) = sa + tb$ for some integers $s$ and $t$ (Bézout's identity).

In the divisibility [lattice](./lattice.md) on positive integers, $\gcd(a, b)$ is the [meet](./meet.md) of $a$ and $b$.
