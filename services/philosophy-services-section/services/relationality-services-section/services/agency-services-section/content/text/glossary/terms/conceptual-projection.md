---
type: morphism
class: lattice-quotient
status: stable
depends-on: [formal-context, concept-lattice]
see-also: [scale-measure, apposition]
name: Conceptual projection
description: The operation by which a sub-vocabulary of attributes induces a quotient on the concept lattice.
---

# Conceptual projection

The operation by which a sub-vocabulary of attributes induces a quotient on the concept lattice. Given a context $\mathbb{K} = (G, M, I)$ and a subset $N \subseteq M$, the **projected context** is $\mathbb{K}|_N := (G, N, I \cap (G \times N))$, restricting the incidence to the chosen attribute subset.

## Effect on the concept lattice

The concept lattice $\mathfrak{B}(\mathbb{K}|_N)$ embeds into $\mathfrak{B}(\mathbb{K})$ as a complete sub-meet-semilattice (intersections of $N$-extents are $N$-extents in $\mathbb{K}$ as well), but generally not as a sub-join-semilattice — joining two $N$-extents in $\mathbb{K}$ may produce an extent that is not an $N$-extent. The projection $\mathbb{K} \to \mathbb{K}|_N$ is therefore one-sided lattice-theoretically.

## When projection commutes with joins

When the projected attributes are *closed under union of intents* (i.e., for every two $N$-intents $B_1, B_2 \subseteq N$, we have $(B_1 \cup B_2)'' \cap N = (B_1 \cup B_2)$), the projection becomes a complete-lattice morphism. This condition is rarely automatic; the typical use of projection is exploratory (focusing on a subset of attributes for visualisation) rather than structural.

## Projection in the substrate

Conceptual projection corresponds to the substrate operation of *restricting the predicate vocabulary*. Projection to $N \subseteq M$ is the substrate restriction to the predicates corresponding to $N$, with the closure-rule system restricted accordingly. This is a degenerate case of the substrate's [classify](classify.md) operation applied at the predicate-vocabulary level.
