---

title: "Open Set"
aliases:
  - "open set"
  - "open sets"
date-created: 2025-12-26
tags: []
mathematical-object: topological-space
references:
  - id: ref1
    type: document
    title: Munkres, Topology, 2nd ed., Pearson, 2000
---

An open set is a subset of a [topological space](../objects/topological-space.md) that belongs to the space's topology. In the standard topology on $\mathbb{R}$, the open interval $(0, 1)$ is open — every point inside it has some breathing room, a little interval around it that stays entirely within the set. The closed interval $[0, 1]$ is not open, because the endpoints 0 and 1 have no room to spare: every interval around 0 includes negative numbers that lie outside $[0, 1]$.

This intuition — "every point has room around it" — is made precise in metric spaces. A subset $U$ of a metric space $(X, d)$ is open if for every point $x \in U$, there exists some $\varepsilon > 0$ such that the open ball $B(x, \varepsilon) = \{y : d(x, y) < \varepsilon\}$ fits entirely inside $U$. An open set has no boundary points: you can wiggle any point of an open set slightly in any direction and remain inside the set.

In the more general setting of topological spaces — where there may be no distance function — open sets become the primitive concept rather than a derived one. A topology on a set $X$ is a collection $\tau$ of subsets (called open sets) satisfying three axioms: (1) the empty set and $X$ itself are in $\tau$; (2) any union of sets in $\tau$ is in $\tau$; (3) any finite intersection of sets in $\tau$ is in $\tau$. A subset is open because the topology says it is. Different choices of topology on the same set declare different subsets open, producing different topological spaces with different geometric properties.

The asymmetry between unions and intersections in the axioms is important and reflects real geometry. You can take any union of open sets and get an open set — even an uncountable union. But you can only take *finite* intersections. To see why, consider the real line: $(-1/n, 1/n)$ is open for every positive integer $n$, but $\bigcap_{n=1}^{\infty} (-1/n, 1/n) = \{0\}$, a single point, which is not open in $\mathbb{R}$. Infinite intersections of open sets can collapse to something with no room at all.

The standard topology on $\mathbb{R}$ has as its open sets all unions of open intervals $(a, b)$. The discrete topology on any set declares every subset open — this is the finest possible topology, making every function out of the space [continuous](../morphisms/continuous-map.md). The indiscrete topology declares only $\emptyset$ and $X$ open — this is the coarsest possible topology, making every function *into* the space continuous but carrying almost no topological information.

The collection $\tau$ of open sets, ordered by inclusion, forms a [frame](../../order/objects/lattice.md): a complete [lattice](../../order/objects/lattice.md) in which finite [meets](../../order/morphisms/meet.md) (intersections) distribute over arbitrary [joins](../../order/morphisms/join.md) (unions). This makes $\tau$ a complete [Heyting algebra](../../../objects/universes/semiotic-universe/terms/complete-heyting-algebra.md) with [Heyting implication](../../logic/morphisms/heyting-implication.md) $U \Rightarrow V = \bigcup\{W \in \tau : U \cap W \subseteq V\}$. This algebraic structure means that every topological space is a model of [intuitionistic logic](../../logic/texts/intuitionistic-logic.md) — a deep connection between topology and logic that underpins much of modern category theory and topos theory.
