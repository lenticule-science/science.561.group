---
name: "Permutation"
type: "term"
date-created: 2026-03-05
---

A permutation is an arrangement of objects in a specific order. Given the letters A, B, C, the arrangements ABC, ACB, BAC, BCA, CAB, and CBA are the six permutations. Change the order and you get a different permutation, even though the same objects are involved. The number of permutations of $n$ distinct objects is n!n! (n factorial): n×(n−1)×(n−2)×⋯×1n \times (n-1) \times (n-2) \times \cdots \times 1. For 3 objects, that is $3! = 6$. For 10 objects, it is 10!=3,628,80010! = 3{,}628{,}800. Factorials grow explosively fast, which is why permutation-counting problems quickly become computationally expensive.

The simplest way to see why the count is n!n! is to think of filling positions one at a time. You have $n$ choices for the first position, n−1n - 1 for the second (one object is already placed), n−2n - 2 for the third, and so on down to 1 choice for the last position. The total is n×(n−1)×⋯×1=n!n \times (n-1) \times \cdots \times 1 = n!.

A kk-permutation of $n$ objects is an ordered selection of $k$ objects from the $n$ available — you choose $k$ and arrange them. The count is n!(n−k)!\frac{n!}{(n-k)!}, which is n×(n−1)×⋯×(n−k+1)n \times (n-1) \times \cdots \times (n-k+1), since you fill only $k$ positions. This differs from a [combination](combination.md), where order does not matter.

Permutations have a deeper mathematical life beyond counting. A permutation of a set can be viewed as a bijective [function](../../documents/articles/research/2026/07/concepts/function/index.md) from the set to itself — a rearrangement map that sends each element to its new position. Under [composition](../../documents/articles/research/2026/07/objects/categories/ordinary-categories/terms/composition.md) (applying one rearrangement after another), the permutations of a set form a [group](../../documents/articles/research/2026/07/objects/groups/terms/group.md) — the symmetric group SnS_n. For $n \geq 3$, SnS_n is non-[abelian](abelian-group.md): the order in which you apply two permutations matters. The symmetric groups are among the most important objects in algebra. Arthur Cayley proved in 1854 that every finite group is isomorphic to a subgroup of some symmetric group (Cayley&rsquo;s theorem), making SnS_n a universal container for finite group theory.

Permutations also appear in combinatorics through Blaise Pascal&rsquo;s *Traité du Triangle Arithmétique* (published posthumously, 1665), where Pascal systematized the counting of arrangements and selections that had been studied earlier by Bhaskara $I$ in *Lilavati* (1150 CE) and by Yang Hui in China (c. 1261).
