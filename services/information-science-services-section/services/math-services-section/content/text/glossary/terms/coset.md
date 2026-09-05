---
name: "coset"
---


A coset is a "shifted copy" of a [subgroup](./subgroup.md) within a larger [group](./group.md). Given a subgroup $H$ of a group $G$ and an element $g \in G$, the left coset of $H$ by $g$ is $gH = \{g \cdot h : h \in H\}$ — you take every element of $H$ and multiply it on the left by $g$. The right coset is $Hg = \{h \cdot g : h \in H\}$ — you multiply on the right instead.

Consider the integers $\mathbb{Z}$ with addition as the group operation, and the even integers $2\mathbb{Z}$ as the subgroup. The cosets of $2\mathbb{Z}$ are the even integers themselves ($0 + 2\mathbb{Z} = \{\ldots, -4, -2, 0, 2, 4, \ldots\}$) and the odd integers ($1 + 2\mathbb{Z} = \{\ldots, -3, -1, 1, 3, 5, \ldots\}$). Every integer is in exactly one of these two cosets. The cosets partition $\mathbb{Z}$ into two disjoint pieces of "equal size."

This partitioning property holds in general: the distinct left cosets of $H$ in $G$ are pairwise disjoint and cover all of $G$. Every element of $G$ belongs to exactly one coset. Two cosets $gH$ and $g'H$ are either identical (when $g^{-1}g' \in H$) or completely disjoint (when $g^{-1}g' \notin H$). Moreover, all cosets have the same size as $H$ — the map $h \mapsto gh$ is a bijection from $H$ to $gH$.

This partition is the engine behind Lagrange's theorem: if $G$ is finite, then $|G| = |G:H| \cdot |H|$, where $|G:H|$ is the number of distinct cosets (called the index of $H$ in $G$). Since $G$ splits into $|G:H|$ disjoint pieces of size $|H|$, the order of $H$ must divide the order of $G$. Joseph-Louis Lagrange proved this in the context of permutation groups in *Réflexions sur la résolution algébrique des équations* (1770–1771).

Cosets also determine when a subgroup allows a quotient construction. When the left and right cosets coincide — $gH = Hg$ for all $g \in G$ — the subgroup is [normal](./normal-subgroup.md), and the set of cosets inherits a well-defined group operation: $(gH)(hH) = (gh)H$. The resulting structure is the [quotient group](./quotient-group.md) $G/H$. When left and right cosets differ, this multiplication is ambiguous and no quotient group exists.
