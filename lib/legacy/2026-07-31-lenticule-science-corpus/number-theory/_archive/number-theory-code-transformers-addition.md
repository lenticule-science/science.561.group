---

title: "Addition"
aliases:
  - "addition"
  - "sum"
date-created: 2025-12-26
introduces: definition
tags: []
requires:
  - ./natural-numbers.md
  - ./successor.md
  - ./zero.md
  - ./induction.md
defines:
  - "Addition"
  - "sum"
---

Addition is the most basic operation in arithmetic — it combines two quantities into their total. Three apples plus two apples is five apples. The idea is so intuitive that children learn it before they can read. But formalizing addition — specifying exactly what it means and proving that it works as expected — requires care, because addition is the foundation on which the rest of arithmetic is built.

In the formal development of the [natural numbers](teaching/explanations/natural-numbers.md) through the [Peano axioms](claims/peano-axioms.md), addition is defined recursively using the [successor](./successor.md) function $S$ (the function that takes each number to the next one). Two rules suffice: $n + 0 = n$ (adding [zero](teaching/explanations/zero.md) does nothing), and $n + S(m) = S(n + m)$ (adding the successor of $m$ is the successor of adding $m$). Together with the [induction](teaching/explanations/induction.md) principle, these two clauses determine the sum of any two natural numbers. To compute $3 + 2$, for example: $3 + 2 = 3 + S(1) = S(3 + 1) = S(3 + S(0)) = S(S(3 + 0)) = S(S(3)) = S(4) = 5$.

From these recursive clauses, all the familiar properties of addition can be proved. Addition is commutative: $a + b = b + a$. It is associative: $(a + b) + c = a + (b + c)$. Zero is the [identity element](../../algebra/concepts/identity-element.md): $a + 0 = a$. These proofs are not trivial — commutativity in particular requires two nested inductions — but they follow purely from the Peano axioms without any appeal to intuition.

The natural numbers under addition form a commutative [monoid](../../algebra/objects/monoid.md) — a set with an associative, commutative operation and an identity element. But the natural numbers have no additive inverses: there is no natural number you can add to 5 to get 0. Extending to the integers by adjoining negatives gives a commutative [group](../../algebra/objects/abelian-group.md) — the group $(\mathbb{Z}, +, 0)$, where every element $n$ has an inverse $-n$.

Addition extends unchanged to every larger number system: the rationals, the reals, the complex numbers. In each extension, commutativity and associativity are preserved. The same abstract pattern — a commutative group under addition — appears at every level of the number hierarchy.

In abstract algebra, addition generalizes further. In any ring or [semiring](../objects/semiring.md), the "additive" operation plays the role of addition: it is commutative and associative, with an identity element (usually written 0). In a [lattice](../../order/objects/lattice.md), the [join](../../order/morphisms/join.md) operation plays an analogous role — it combines two elements by producing their least upper bound, the smallest element that is "at least as large" as both. In a [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md), join is the semantic analogue of disjunction: $a \vee b$ represents "either $a$ or $b$ (or both)."
