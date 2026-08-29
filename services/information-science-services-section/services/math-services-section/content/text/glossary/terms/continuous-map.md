---
title: "Continuous Map"
aliases:
  - "continuous map"
  - "continuous maps"
  - "continuous function"
  - "continuity"
date-created: 2025-12-26
tags: []
mathematical-object: topological-space
references:
  ref1:
    title: "Munkres, Topology, 2nd ed., Pearson, 2000"
defines:
  - "Continuous Map"
  - "continuous maps"
  - "continuous function"
  - "continuity"
type: term
---

A continuous map is a function between [topological spaces](./topological-space.md) that preserves the structure of nearness — it does not tear, break, or introduce sudden jumps. If two points are close in the source, their images are close in the target. Continuous maps are the structure-preserving functions of topology, just as [linear maps](./linear-map.md) are the structure-preserving functions of linear algebra and group homomorphisms are the structure-preserving functions of group theory.

The oldest formulation of continuity is the epsilon-delta definition from calculus. Given metric spaces $(X, d_X)$ and $(Y, d_Y)$, a function $f: X \to Y$ is continuous at a point $x$ if for every $\varepsilon > 0$ there exists $\delta > 0$ such that whenever $d_X(x, x') < \delta$, we have $d_Y(f(x), f(x')) < \varepsilon$. In plain language: you can make $f$'s output as close as you like to $f(x)$ by keeping the input close enough to $x$. Augustin-Louis Cauchy gave the first rigorous statement of this idea in *Cours d'analyse* (1821), and Karl Weierstrass sharpened it to the modern epsilon-delta form in his Berlin lectures of the 1860s.

But the epsilon-delta definition uses distances, and topological spaces don't necessarily have distances. The general definition uses [open sets](./open-set.md) instead. A function $f: X \to Y$ between topological spaces is continuous if for every open set $V$ in $Y$, the preimage $f^{-1}(V)$ is open in $X$. This single condition replaces epsilon-delta entirely. To see why, think about what an open set around a point $y$ represents — it is a "neighborhood" of $y$, the set of points near $y$. Saying $f^{-1}(V)$ is open means that the set of points that map into any neighborhood of $y$ is itself a neighborhood: nearness is preserved.

This definition is equivalent to several others. A function is continuous if and only if: the preimage of every closed set is closed; or for every point $x$ and every open set $V$ containing $f(x)$, there exists an open set $U$ containing $x$ with $f(U) \subseteq V$; or for every subset $A$, $f(\mathrm{cl}(A)) \subseteq \mathrm{cl}(f(A))$ (the image of the closure sits inside the closure of the image). Each formulation captures a different facet of the same geometric fact: continuous maps do not introduce discontinuities.

Continuous maps compose: if $f: X \to Y$ and $g: Y \to Z$ are both continuous, then $g \circ f: X \to Z$ is continuous. The identity map on any space is continuous. These two facts mean that topological spaces and continuous maps form a [category](./category.md) $\mathbf{Top}$, with [homeomorphisms](./homeomorphism.md) — continuous bijections with continuous inverses — as isomorphisms. Two spaces are homeomorphic when they are topologically identical: every topological property shared by one is shared by the other.

Familiar examples of continuous maps include constant functions (which are always continuous), inclusion maps from subspaces, and projections from product spaces. Less obviously, every continuous map $f: X \to Y$ induces a [geometric morphism](./geometric-morphism.md) between the sheaf topoi $\mathbf{Sh}(X)$ and $\mathbf{Sh}(Y)$: the direct image $f_*$ pushes sheaves forward, and its left adjoint $f^*$ pulls them back.

## Additional material from the Google Drive library

Let $(X, \tau_X)$ and $(Y, \tau_Y)$ be [topological spaces](./topological-space.md).

**Definition.** A function $f : X \to Y$ is a *continuous map* if for every [open set](./open-set.md) $V \in \tau_Y$, the preimage $f^{-1}(V) \in \tau_X$.

**Proposition.** *The following are equivalent:*
1. *$f$ is continuous.*
2. *The preimage of every closed set in $Y$ is closed in $X$.*
3. *For every $A \subseteq X$, $f(\mathrm{cl}(A)) \subseteq \mathrm{cl}(f(A))$.*
4. *For every $x \in X$ and every open set $V$ containing $f(x)$, there exists an open set $U$ containing $x$ with $f(U) \subseteq V$.*

*Proof sketch.* (1)$\Leftrightarrow$(2): complements commute with preimages. (1)$\Rightarrow$(3): if $C \supseteq f(A)$ is closed, then $f^{-1}(C) \supseteq A$ is closed, so $\mathrm{cl}(A) \subseteq f^{-1}(C)$, giving $f(\mathrm{cl}(A)) \subseteq C$; take $C = \mathrm{cl}(f(A))$. (3)$\Rightarrow$(1): if $V$ is open, set $A = X \setminus f^{-1}(V)$; then (3) gives $\mathrm{cl}(A) = A$, so $f^{-1}(V)$ is open. (1)$\Leftrightarrow$(4) is immediate from the definition. $\square$

**Proposition ($\varepsilon$-$\delta$ equivalence).** *If $(X, d_X)$ and $(Y, d_Y)$ are metric spaces with their metric topologies, then $f : X \to Y$ is continuous if and only if for every $x \in X$ and every $\varepsilon > 0$, there exists $\delta > 0$ such that $d_X(x, x') < \delta$ implies $d_Y(f(x), f(x')) < \varepsilon$.*

**Proposition.** *The composition of continuous maps is continuous. The identity map $\mathrm{id}_X : X \to X$ is continuous.*

**Proposition.** *Topological spaces and continuous maps form a [category](./category.md) $\mathbf{Top}$, with [homeomorphisms](./homeomorphism.md) as isomorphisms.*

**Examples.**

1. **Constant maps.** Every constant function $f : X \to Y$ is continuous.
2. **Inclusion maps.** If $A \subseteq X$ carries the subspace topology, the inclusion $A \hookrightarrow X$ is continuous.
3. **Projections.** The projection $\pi_i : \prod_j X_j \to X_i$ from a product space is continuous (by definition of the product topology).

---

*Remark.* A continuous map $f : X \to Y$ induces a [geometric morphism](./geometric-morphism.md) between the sheaf topoi $\mathbf{Sh}(X)$ and $\mathbf{Sh}(Y)$: the direct image $f_*$ pushes sheaves forward, and its left adjoint $f^*$ pulls them back.
