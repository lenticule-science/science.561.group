---
title: "quotient group"
type: term
---


A quotient group is what you get when you take a [group](./group.md) and "collapse" part of it — treating certain elements as identical. The elements you collapse form a [normal subgroup](./normal-subgroup.md), and the quotient group consists of the [cosets](./coset.md) of that subgroup, with a natural group operation inherited from the original group.

The most familiar example is the integers modulo $n$. Start with the group $(\mathbb{Z}, +)$ of integers under addition. The multiples of $n$ — the set $n\mathbb{Z} = \{\ldots, -2n, -n, 0, n, 2n, \ldots\}$ — form a normal subgroup. The quotient group $\mathbb{Z}/n\mathbb{Z}$ consists of the $n$ cosets: $\{0 + n\mathbb{Z}, 1 + n\mathbb{Z}, \ldots, (n-1) + n\mathbb{Z}\}$. Two integers end up in the same coset if and only if they differ by a multiple of $n$ — that is, if they are [congruent](./congruence.md) modulo $n$. The quotient group is the group of residue classes, with addition modulo $n$ as the operation. The group $\mathbb{Z}/12\mathbb{Z}$ is clock arithmetic: $7 + 8 = 15 \equiv 3 \pmod{12}$.

Formally, given a group $G$ and a normal subgroup $N \trianglelefteq G$, the quotient group $G/N$ is the set of cosets $\{gN : g \in G\}$ with the operation $(gN)(hN) = (gh)N$. The normality of $N$ is exactly what makes this operation well-defined: it ensures that the result does not depend on which representatives $g$ and $h$ you choose from their respective cosets.

The quotient group captures the structure of $G$ "up to $N$" — it sees only the differences between cosets, not the differences within them. The canonical projection $\pi: G \to G/N$ defined by $\pi(g) = gN$ is a surjective [group homomorphism](./group-homomorphism.md) whose kernel is $N$. This means that $N$ is precisely the information that the projection forgets.

The first isomorphism theorem makes this precise: for any group homomorphism $\phi: G \to H$, the quotient $G/\ker(\phi)$ is isomorphic to the image of $\phi$. A homomorphism factors cleanly into "collapse the kernel" followed by "embed into the target." This theorem, along with the second and third isomorphism theorems, forms the backbone of the structural theory of groups. It was implicit in the work of Évariste Galois (1832) and made explicit by Emmy Noether and her school in the 1920s as part of the abstract algebra program that unified group theory, ring theory, and module theory under a common framework.
