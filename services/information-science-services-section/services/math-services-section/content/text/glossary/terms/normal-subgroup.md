---
name: "Normal Subgroup"
aliases:
  - "normal subgroup"
  - "normal subgroups"
date-created: 2026-03-05
tags: []
---

A normal subgroup is a [subgroup](./subgroup.md) $N$ of a [group](./group.md) $G$ that is "symmetric" with respect to the rest of the group — it looks the same from every vantage point within $G$. Formally, $N$ is normal (written $N \trianglelefteq G$) if $gNg^{-1} = N$ for every $g \in G$. This condition says that conjugating $N$ by any element of $G$ — moving to a different "perspective" within the group — gives $N$ back again. Equivalently, the left and right [cosets](./coset.md) of $N$ coincide: $gN = Ng$ for all $g$.

Why does this condition matter? Because normal subgroups are exactly the subgroups you can "divide out" to form a well-defined [quotient group](./quotient-group.md). When you try to define multiplication on cosets — $(gN)(hN) = (gh)N$ — you need the result to be independent of which representatives $g$ and $h$ you choose from each coset. This works if and only if $N$ is normal. Without normality, the coset multiplication is ambiguous and the quotient construction breaks down.

Normal subgroups are also exactly the kernels of group homomorphisms. If $\phi: G \to H$ is a homomorphism, then $\ker(\phi) = \{g \in G : \phi(g) = e_H\}$ is always a normal subgroup of $G$. Conversely, every normal subgroup is the kernel of the canonical projection $\pi: G \to G/N$ defined by $\pi(g) = gN$. This connection between normal subgroups, quotient groups, and homomorphisms is codified in the first isomorphism theorem: for any homomorphism $\phi: G \to H$, the quotient $G/\ker(\phi)$ is isomorphic to the image of $\phi$.

In an [abelian group](./abelian-group.md) — where the group operation is commutative — every subgroup is automatically normal, because $gNg^{-1} = gg^{-1}N = N$ for all $g$. In non-abelian groups, normality is a genuine constraint that must be checked. The symmetric group $S_3$, for example, has subgroups of order 2 that are not normal: conjugating them by different elements of $S_3$ moves them around.

Normal subgroups play the same role in group theory that [ideals](./ideal.md) play in ring theory: they are the substructures that enable quotient constructions. Évariste Galois implicitly used normal subgroups in his work on the solvability of polynomial equations by radicals (1832, published posthumously 1846) — a polynomial equation is solvable by radicals if and only if its Galois group has a composition series with abelian quotients, a condition that depends entirely on the normal subgroup structure.
