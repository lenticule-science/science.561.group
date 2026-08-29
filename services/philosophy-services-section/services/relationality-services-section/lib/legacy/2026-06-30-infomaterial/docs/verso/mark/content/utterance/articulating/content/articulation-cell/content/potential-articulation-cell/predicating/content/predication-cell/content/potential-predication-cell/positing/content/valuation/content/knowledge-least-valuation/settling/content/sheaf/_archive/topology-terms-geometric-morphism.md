---
title: "Geometric Morphism"
aliases:
  - "geometric morphism"
  - "geometric morphisms"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topos
references:
  - "Mac Lane & Moerdijk, Sheaves in Geometry and Logic, Springer, 1994"
defines:
  - "Geometric Morphism"
  - "geometric morphisms"
---

Let $\mathcal{E}$ and $\mathcal{F}$ be topoi (either elementary or Grothendieck).

**Definition.** A *geometric [morphism](../../../objects/categories/ordinary-categories/terms/morphism.md)* $f: \mathcal{E} \to \mathcal{F}$ is an [adjunction](./adjunction.md) $f^* \dashv f_*$ where:

- $f_*: \mathcal{E} \to \mathcal{F}$ is the *direct image* [functor](../../../objects/categories/ordinary-categories/terms/functor.md),
- $f^*: \mathcal{F} \to \mathcal{E}$ is the *inverse image* [functor](../../../objects/categories/ordinary-categories/terms/functor.md),

and $f^*$ is left exact (i.e., preserves finite limits).

The direction convention is: $f$ points in the direction of $f_*$, so that $f^*$ goes "backward," mirroring the situation for continuous maps of topological spaces.

**Proposition.** *The inverse image [functor](../../../objects/categories/ordinary-categories/terms/functor.md) $f^*$ preserves the terminal object, binary products, and equalizers. Since every finite limit is built from these, left exactness is equivalent to preserving these three classes of limits.*

**Proposition.** *Since $f^*$ is a left adjoint, it preserves all colimits. Hence $f^*$ is an exact [functor](../../../objects/categories/ordinary-categories/terms/functor.md): it preserves all finite limits and all colimits.*

**Proposition.** *A geometric [morphism](../../../objects/categories/ordinary-categories/terms/morphism.md) $f: \mathcal{E} \to \mathcal{F}$ is an equivalence if and only if $f^*$ is an equivalence of categories (equivalently, if and only if both $f^*$ and $f_*$ are).*

*Proof sketch.* If $f^*$ is an equivalence, its quasi-inverse serves as both a left and right adjoint to $f^*$, so $f_*$ is also an equivalence.

**Proposition (Geometric morphisms from sheaf topoi).** *Let $X$ and $Y$ be sober topological spaces. There is a bijection between geometric [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) $\mathrm{Sh}(X) \to \mathrm{Sh}(Y)$ and continuous maps $X \to Y$.*

*Proof sketch.* A continuous map $\varphi: X \to Y$ induces $\varphi_*(F)(V) = F(\varphi^{-1}(V))$, and $\varphi^*$ is obtained by sheafifying the inverse image presheaf. Left exactness of $\varphi^*$ follows from exactness of the stalk [functors](../../../objects/categories/ordinary-categories/terms/functor.md) and exactness of sheafification. Conversely, any geometric [morphism](../../../objects/categories/ordinary-categories/terms/morphism.md) between spatial topoi determines a continuous map on the underlying sober spaces via the correspondence between points of the topos and points of the space.

**Examples.**

- *Global sections:* For any Grothendieck topos $\mathcal{E}$, the unique geometric [morphism](../../../objects/categories/ordinary-categories/terms/morphism.md) $\gamma: \mathcal{E} \to \mathbf{Set}$ has direct image $\gamma_* = \Gamma = \mathrm{Hom}(1, -)$ (global sections) and inverse image $\gamma^* = \Delta$ (constant sheaf [functor](../../../objects/categories/ordinary-categories/terms/functor.md)).
- *Inclusions of subtopoi:* A [Lawvere-Tierney topology](./lawvere-tierney-topology.md) $j$ on $\mathcal{E}$ determines a geometric [morphism](../../../objects/categories/ordinary-categories/terms/morphism.md) $\mathrm{Sh}_j(\mathcal{E}) \hookrightarrow \mathcal{E}$ whose direct image is the inclusion and whose inverse image is $j$-sheafification. This is a geometric embedding: $f_*$ is full and faithful.
- *Higher setting:* For [($\infty$,1)-topoi](./infinity-1-topos.md), geometric [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) are [adjunctions](./adjunction.md) $f^* \dashv f_*$ where $f^*$ preserves finite $\infty$-limits. The [site](./site.md)-based correspondence generalizes accordingly.
