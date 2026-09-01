---
title: "Continuous Map"
aliases:
  - "continuous map"
  - "continuous maps"
  - "continuous function"
  - "continuity"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Munkres, Topology, 2nd ed., Pearson, 2000"
---

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

**Proposition.** *Topological spaces and continuous maps form a [category](../../../objects/categories/ordinary-categories/terms/category.md) $\mathbf{Top}$, with [homeomorphisms](./homeomorphism.md) as isomorphisms.*

**Examples.**

1. **Constant maps.** Every constant function $f : X \to Y$ is continuous.
2. **Inclusion maps.** If $A \subseteq X$ carries the subspace topology, the inclusion $A \hookrightarrow X$ is continuous.
3. **Projections.** The projection $\pi_i : \prod_j X_j \to X_i$ from a product space is continuous (by definition of the product topology).

---

*Remark.* A continuous map $f : X \to Y$ induces a [geometric morphism](../../higher-topos-theory/terms/geometric-morphism.md) between the sheaf topoi $\mathbf{Sh}(X)$ and $\mathbf{Sh}(Y)$: the direct image $f_*$ pushes sheaves forward, and its left adjoint $f^*$ pulls them back.
