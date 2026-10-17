---
name: "Open Set"
aliases:
  - "open set"
  - "open sets"
date-created: 2025-12-26
tags: []
mathematical-object: topological-space
references:
  ref1:
    title: "Munkres, Topology, 2nd ed., Pearson, 2000"
---

An open set is a subset of a [topological space](./topological-space.md) that belongs to the space's topology. In the standard topology on $\mathbb{R}$, the open interval $(0, 1)$ is open — every point inside it has some breathing room, a little interval around it that stays entirely within the set. The closed interval $[0, 1]$ is not open, because the endpoints 0 and 1 have no room to spare: every interval around 0 includes negative numbers that lie outside $[0, 1]$.

This intuition — "every point has room around it" — is made precise in metric spaces. A subset $U$ of a metric space $(X, d)$ is open if for every point $x \in U$, there exists some $\varepsilon > 0$ such that the open ball $B(x, \varepsilon) = \{y : d(x, y) < \varepsilon\}$ fits entirely inside $U$. An open set has no boundary points: you can wiggle any point of an open set slightly in any direction and remain inside the set.

In the more general setting of topological spaces — where there may be no distance function — open sets become the primitive concept rather than a derived one. A topology on a set $X$ is a collection $\tau$ of subsets (called open sets) satisfying three axioms: (1) the empty set and $X$ itself are in $\tau$; (2) any union of sets in $\tau$ is in $\tau$; (3) any finite intersection of sets in $\tau$ is in $\tau$. A subset is open because the topology says it is. Different choices of topology on the same set declare different subsets open, producing different topological spaces with different geometric properties.

The asymmetry between unions and intersections in the axioms is important and reflects real geometry. You can take any union of open sets and get an open set — even an uncountable union. But you can only take *finite* intersections. To see why, consider the real line: $(-1/n, 1/n)$ is open for every positive integer $n$, but $\bigcap_{n=1}^{\infty} (-1/n, 1/n) = \{0\}$, a single point, which is not open in $\mathbb{R}$. Infinite intersections of open sets can collapse to something with no room at all.

The standard topology on $\mathbb{R}$ has as its open sets all unions of open intervals $(a, b)$. The discrete topology on any set declares every subset open — this is the finest possible topology, making every function out of the space [continuous](./continuous-map.md). The indiscrete topology declares only $\emptyset$ and $X$ open — this is the coarsest possible topology, making every function *into* the space continuous but carrying almost no topological information.

The collection $\tau$ of open sets, ordered by inclusion, forms a [frame](./lattice.md): a complete [lattice](./lattice.md) in which finite [meets](./meet.md) (intersections) distribute over arbitrary [joins](./join.md) (unions). This makes $\tau$ a complete Heyting algebra with [Heyting implication](./heyting-implication.md) $U \Rightarrow V = \bigcup\{W \in \tau : U \cap W \subseteq V\}$. This algebraic structure means that every topological space is a model of [intuitionistic logic](../../documents/articles/teaching-articles/explanations/intuitionistic-logic.md) — a deep connection between topology and logic that underpins much of modern category theory and topos theory.

## Additional material from the Google Drive library

Let $(X, \tau)$ be a [topological space](./topological-space.md).

**Definition.** A subset $U \subseteq X$ is an *open set* if $U \in \tau$.

Open sets are the primitive notion of a topology: they are not defined by an intrinsic property of $U$ but declared by membership in $\tau$. The axioms on $\tau$ require exactly:

1. $\emptyset \in \tau$ and $X \in \tau$.
2. If $\{U_i\}_{i \in I} \subseteq \tau$, then $\bigcup_{i \in I} U_i \in \tau$ (closure under arbitrary unions).
3. If $U_1, \ldots, U_n \in \tau$, then $U_1 \cap \cdots \cap U_n \in \tau$ (closure under finite intersections).

**Proposition.** *In a metric space $(X, d)$, a subset $U \subseteq X$ is open in the metric topology if and only if for every $x \in U$ there exists $\varepsilon > 0$ such that $B(x, \varepsilon) \subseteq U$.*

*Proof sketch.* The open balls $\{B(x, \varepsilon) : x \in X,\, \varepsilon > 0\}$ form a [basis](./basis.md) for the metric topology. A set is open if and only if it is a union of basis elements, which is equivalent to the stated condition. $\square$

**Proposition.** *The collection $\tau$, ordered by inclusion, is a complete [lattice](./lattice.md) that is a frame: [join](./join.md) is union, [meet](./meet.md) is intersection, and finite meets distribute over arbitrary joins. Consequently $\tau$ is a complete Heyting algebra with [Heyting implication](./heyting-implication.md) $U \Rightarrow V = \bigcup \{ W \in \tau : U \cap W \subseteq V \}$.*

*Proof sketch.* Arbitrary joins (unions) and binary meets (intersections) exist by axiom. Distributivity holds because $U \cap \bigcup_i V_i = \bigcup_i (U \cap V_i)$. A complete lattice in which finite meets distribute over arbitrary joins is a frame, and every frame is a complete Heyting algebra. $\square$

**Examples.**

1. **Discrete topology.** Every subset of $X$ is open, so $\tau = \mathcal{P}(X)$.
2. **Indiscrete topology.** Only $\emptyset$ and $X$ are open, so $\tau = \{\emptyset, X\}$.
3. **Standard topology on $\mathbb{R}$.** The open sets are exactly the arbitrary unions of open intervals $(a, b)$.

---

*Remark.* The frame structure of $\tau$ makes every topological space a model of [intuitionistic logic](../../documents/articles/teaching-articles/explanations/intuitionistic-logic.md). In this setting, the operator $j = \mathrm{int} \circ \mathrm{cl}$ (interior of closure) is a [Lawvere-Tierney topology](./lawvere-tierney-topology.md).
