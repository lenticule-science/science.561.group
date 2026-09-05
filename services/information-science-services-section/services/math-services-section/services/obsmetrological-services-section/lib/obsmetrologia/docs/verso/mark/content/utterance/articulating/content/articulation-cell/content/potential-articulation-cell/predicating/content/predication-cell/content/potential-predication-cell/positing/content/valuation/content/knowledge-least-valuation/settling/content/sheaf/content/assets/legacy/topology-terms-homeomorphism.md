---
title: "Homeomorphism"
aliases:
  - "homeomorphism"
  - "homeomorphisms"
  - "homeomorphic"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Munkres, Topology, 2nd ed., Pearson, 2000"
---

Let $(X, \tau_X)$ and $(Y, \tau_Y)$ be [topological spaces](./topological-space.md).

**Definition.** A *homeomorphism* is a bijective [continuous map](./continuous-map.md) $f : X \to Y$ whose inverse $f^{-1} : Y \to X$ is also continuous. The spaces $X$ and $Y$ are *homeomorphic* if there exists a homeomorphism between them.

**Proposition.** *A bijection $f : X \to Y$ is a homeomorphism if and only if $f$ induces a bijection $\tau_X \to \tau_Y$ given by $U \mapsto f(U)$, i.e., $U$ is [open](./open-set.md) in $X$ if and only if $f(U)$ is open in $Y$.*

*Proof sketch.* If $f$ is a homeomorphism, then $V \in \tau_Y$ iff $f^{-1}(V) \in \tau_X$, so $U \mapsto f(U)$ bijects $\tau_X$ onto $\tau_Y$. Conversely, if $f$ bijects open sets, then both $f$ and $f^{-1}$ preserve open sets, so both are continuous. $\square$

**Proposition.** *Every topological invariant ([compactness](./compactness.md), connectedness, number of connected components, [fundamental group](../../homotopy-theory/terms/fundamental-group.md), etc.) is preserved by homeomorphism.*

*Proof sketch.* A [property](../../../../sociology/terms/property.md) defined purely in terms of the open-set structure is invariant under any bijection that preserves that structure. $\square$

**Proposition.** *A continuous bijection from a compact space to a Hausdorff space is a homeomorphism.*

*Proof sketch.* A closed subset of a compact space is compact; its image under a continuous map is compact; a compact subset of a Hausdorff space is closed. So $f$ maps closed sets to closed sets, hence $f^{-1}$ is continuous. $\square$

**Proposition.** *Homeomorphisms are precisely the [isomorphisms](../../../objects/categories/ordinary-categories/terms/isomorphism.md) in the category $\mathbf{Top}$ of topological spaces and continuous maps.*

**Examples.**

1. **$(0, 1) \cong \mathbb{R}$.** The map $x \mapsto \tan(\pi x - \pi/2)$ is a homeomorphism.
2. **$S^1 \not\cong [0, 1]$.** Removing any point from $S^1$ leaves a connected space; removing an interior point from $[0, 1]$ does not. So no homeomorphism exists.
3. **Non-example.** The map $t \mapsto (\cos 2\pi t, \sin 2\pi t)$ from $[0, 1)$ to $S^1$ is a continuous bijection that fails to be a homeomorphism because removing $0$ from $[0,1)$ disconnects the domain while removing its image does not disconnect $S^1$, so the spaces have different topological invariants.

---

*Remark.* In [homotopy theory](../../homotopy-theory/index.md), the weaker notion of [homotopy equivalence](../../homotopy-theory/terms/homotopy-equivalence.md) identifies spaces that are not homeomorphic but have the same "shape" up to continuous deformation. This passage from homeomorphism to homotopy equivalence underlies the move from point-set topology to [∞-categories](../../higher-topos-theory/terms/infinity-category.md).
