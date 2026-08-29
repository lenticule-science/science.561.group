---
title: "Open Set"
aliases:
  - "open set"
  - "open sets"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Munkres, Topology, 2nd ed., Pearson, 2000"
defines:
  - "Open Set"
  - "open sets"
---

Let $(X, \tau)$ be a [topological space](./topological-space.md).

**Definition.** A subset $U \subseteq X$ is an *open set* if $U \in \tau$.

Open sets are the primitive notion of a topology: they are not defined by an intrinsic property of $U$ but declared by membership in $\tau$. The axioms on $\tau$ require exactly:

1. $\emptyset \in \tau$ and $X \in \tau$.
2. If $\{U_i\}_{i \in I} \subseteq \tau$, then $\bigcup_{i \in I} U_i \in \tau$ (closure under arbitrary unions).
3. If $U_1, \ldots, U_n \in \tau$, then $U_1 \cap \cdots \cap U_n \in \tau$ (closure under finite intersections).

**Proposition.** *In a metric space $(X, d)$, a subset $U \subseteq X$ is open in the metric topology if and only if for every $x \in U$ there exists $\varepsilon > 0$ such that $B(x, \varepsilon) \subseteq U$.*

*Proof sketch.* The open balls $\{B(x, \varepsilon) : x \in X,\, \varepsilon > 0\}$ form a [basis](./basis.md) for the metric topology. A set is open if and only if it is a union of basis elements, which is equivalent to the stated condition. $\square$

**Proposition.** *The collection $\tau$, ordered by inclusion, is a complete [lattice](../../../objects/posets/terms/lattice.md) that is a frame: [join](../../../objects/posets/terms/join.md) is union, [meet](../../../objects/posets/terms/meet.md) is intersection, and finite meets distribute over arbitrary joins. Consequently $\tau$ is a complete [Heyting algebra](../../../objects/universes/semiotic-universe/terms/complete-heyting-algebra.md) with [Heyting implication](../../logic/terms/heyting-implication.md) $U \Rightarrow V = \bigcup \{ W \in \tau : U \cap W \subseteq V \}$.*

*Proof sketch.* Arbitrary joins (unions) and binary meets (intersections) exist by axiom. Distributivity holds because $U \cap \bigcup_i V_i = \bigcup_i (U \cap V_i)$. A complete lattice in which finite meets distribute over arbitrary joins is a frame, and every frame is a complete Heyting algebra. $\square$

**Examples.**

1. **Discrete topology.** Every subset of $X$ is open, so $\tau = \mathcal{P}(X)$.
2. **Indiscrete topology.** Only $\emptyset$ and $X$ are open, so $\tau = \{\emptyset, X\}$.
3. **Standard topology on $\mathbb{R}$.** The open sets are exactly the arbitrary unions of open intervals $(a, b)$.

---

*Remark.* The frame structure of $\tau$ makes every topological space a model of [intuitionistic logic](../../logic/curricula/intuitionistic-logic.md). In this setting, the operator $j = \mathrm{int} \circ \mathrm{cl}$ (interior of closure) is a [Lawvere-Tierney topology](../../higher-topos-theory/terms/lawvere-tierney-topology.md).
