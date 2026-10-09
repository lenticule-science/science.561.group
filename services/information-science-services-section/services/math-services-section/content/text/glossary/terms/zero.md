---
name: "Zero"
aliases:
  - "zero"
  - "0"
date-created: 2025-12-26
introduces: definition
tags: []
part-of:
  - "Peano arithmetic"
requires:
  - ./natural-numbers.md
  - ./peano-axioms.md
  - ./successor.md
term-kind: definition
---

Zero is the number that represents nothing — the quantity you have when you have none of something. It is at once the simplest and most profound of numbers. Every child learns to count from zero (or, historically, from one, because zero took a long time to earn its place). Mathematically, zero is the starting point for the natural numbers, the identity element for addition, and the annihilator for multiplication. It is the only number that is neither positive nor negative. It is a boundary, a balancing point, and a foundation.

In the [Peano axioms](./peano-axioms.md) — the formal foundation for arithmetic — zero is the base element: it is a [natural number](./natural-numbers.md), and it is not the [successor](./successor.md) of any natural number. Every other natural number is obtained from zero by applying the successor operation some finite number of times: 1 = S(0), 2 = S(S(0)), 3 = S(S(S(0))), and so on. Zero is where the counting begins.

Zero is the [identity element](./identity-element.md) for [addition](./addition.md): $n + 0 = 0 + n = n$ for all $n$. Adding zero does nothing — it leaves every number unchanged. Zero is the annihilator for [multiplication](./multiplication.md): $n \times 0 = 0$ for all $n$. Multiplying by zero collapses everything to zero. These two properties together give zero a dual character: it is inert under addition but destructive under multiplication.

The annihilation property leads directly to the concept of zero divisors in abstract algebra. In the integers, if $a \times b = 0$ then either $a = 0$ or $b = 0$ — there is no way for two nonzero integers to multiply to zero. A ring where this holds is called an [integral domain](./integral-domain.md). But in other rings, zero divisors can exist: in $\mathbb{Z}/6\mathbb{Z}$, $2 \times 3 = 0$ even though neither 2 nor 3 is zero. The presence or absence of zero divisors is one of the fundamental structural features of a ring.

Zero was not always recognized as a number. Ancient Greek mathematicians worked without it — their number concept began at one. The Babylonians used a placeholder symbol (two slanted wedges) by around 300 BCE to indicate an empty position in their base-60 numeral system, but they did not treat it as a number in its own right. The breakthrough came from Indian mathematics. Brahmagupta, in *Brahmasphutasiddhanta* (628 CE), gave explicit rules for arithmetic with zero: $a + 0 = a$, $a \times 0 = 0$, and $a - a = 0$. He also attempted to define division by zero (arriving at some incorrect results, but the attempt itself was remarkable). The concept reached the Islamic world through Muhammad ibn Musa al-Khwarizmi's *Kitab al-Jam' wal-Tafreeq bil-Hisab al-Hindi* (c. 825 CE) and entered Europe through Fibonacci's *Liber Abaci* (1202), which introduced the Hindu-Arabic numeral system — including zero — to European commerce and mathematics.

In [set](./set.md) theory, zero is represented by the empty set $\emptyset$ — the set with no [elements](./element.md). The cardinality of the empty set is 0. The von Neumann construction builds all the natural numbers from this starting point: $0 = \emptyset$, $1 = \{\emptyset\}$, $2 = \{\emptyset, \{\emptyset\}\}$, and in general $n$ is the set of all natural numbers less than $n$. Nothing gives rise to everything.

## Additional material from the Google Drive library

Zero is the base [natural number](./natural-numbers.md), written 0. In the [Peano axioms](./peano-axioms.md), zero is the starting element: it is a natural number, and it is not the [successor](./successor.md) of any natural number. Every other natural number is obtained from zero by applying the successor operation some finite number of times.

Zero is the [identity element](./identity-element.md) for [addition](./addition.md): n + 0 = 0 + n = n for all n. It is the annihilator for [multiplication](./multiplication.md): n × 0 = 0 for all n. In the integers, zero is the unique number that is neither positive nor negative.

In [set](./set.md) theory, zero is represented by the empty set ∅ — the set with no [elements](./element.md). The cardinality of the empty set is 0, and the empty set serves as the starting point for the von Neumann construction of the natural numbers: 0 = ∅, 1 = {∅}, 2 = {∅, {∅}}, and so on.
