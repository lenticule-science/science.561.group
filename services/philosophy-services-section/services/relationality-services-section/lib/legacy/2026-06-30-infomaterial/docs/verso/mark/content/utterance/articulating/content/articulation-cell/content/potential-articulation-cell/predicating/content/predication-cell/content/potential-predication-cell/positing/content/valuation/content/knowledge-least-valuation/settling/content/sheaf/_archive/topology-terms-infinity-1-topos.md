---
title: "(Infinity,1)-Topos"
aliases:
  - "(infinity,1)-topos"
  - "(∞,1)-topos"
  - "infinity-topos"
  - "∞-topos"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: infinity-1-category
references:
  - "Lurie, Higher Topos Theory, Princeton University Press, 2009"
defines:
  - "(Infinity,1)-Topos"
  - "(∞,1)-topos"
  - "infinity-topos"
  - "∞-topos"
---

Let $\mathcal{E}$ be a presentable [$(\infty,1)$-category](./infinity-1-category.md).

**Definition.** An *$(\infty,1)$-topos* is a presentable $(\infty,1)$-category $\mathcal{E}$ satisfying the following $\infty$-Giraud axioms:

1. Colimits in $\mathcal{E}$ are *universal*: for every morphism $f: X \to Y$, the pullback functor $f^*: \mathcal{E}_{/Y} \to \mathcal{E}_{/X}$ preserves colimits.
2. Coproducts in $\mathcal{E}$ are *disjoint*: for any coproduct $X \amalg Y$, the pullback $X \times_{X \amalg Y} Y$ is initial.
3. Every groupoid object in $\mathcal{E}$ is *effective*: it is the Cech nerve of its own colimit.

Equivalently, $\mathcal{E}$ is an $(\infty,1)$-topos if and only if it arises as an accessible left-exact localization of a presheaf $(\infty,1)$-category $\mathrm{PSh}(\mathcal{C}) = \mathrm{Fun}(\mathcal{C}^{\mathrm{op}}, \mathcal{S})$ for some small $(\infty,1)$-category $\mathcal{C}$.

**Proposition.** *Every $(\infty,1)$-topos $\mathcal{E}$ is equivalent to the $(\infty,1)$-category $\mathrm{Sh}(\mathcal{C}, \tau)$ of [sheaves of spaces](./sheaf-of-spaces.md) on some [site](./site.md) $(\mathcal{C}, \tau)$.*

*Proof sketch.* By the equivalence above, $\mathcal{E}$ is a left-exact localization of $\mathrm{PSh}(\mathcal{C})$, and the localization is determined by a Grothendieck topology $\tau$ on $\mathcal{C}$.

**Proposition.** *The full subcategory $\tau_{\leq 0}\mathcal{E}$ of $0$-truncated objects in an $(\infty,1)$-topos $\mathcal{E}$ is a $1$-topos (Grothendieck topos).*

**Proposition.** *[Geometric morphisms](./geometric-morphism.md) between $(\infty,1)$-topoi are [adjunctions](./adjunction.md) $f^* \dashv f_*$ where $f^*$ preserves finite $\infty$-limits. The $(\infty,1)$-category $\mathbf{RTop}$ of $(\infty,1)$-topoi and geometric [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) admits all small limits.*

**Proposition.** *Every $(\infty,1)$-topos $\mathcal{E}$ has an internal logic that is constructive and higher-dimensional: the [law of excluded middle](../../../../philosophy/terms/law-of-excluded-middle.md) ($p \vee \neg p = \top$) holds iff $\mathcal{E}$ is Boolean (i.e., every subobject is complemented), propositions are $(-1)$-truncated objects, sets are $0$-truncated objects, and general objects are homotopy types of arbitrary truncation level. Identity types carry homotopical content.*

**Examples.**

- *Spaces:* The $(\infty,1)$-category $\mathcal{S}$ of spaces is the terminal $(\infty,1)$-topos: for every $(\infty,1)$-topos $\mathcal{E}$, there is a unique geometric morphism $\mathcal{E} \to \mathcal{S}$.
- *Sheaves on a space:* For a topological space $X$, the $(\infty,1)$-category $\mathrm{Sh}(X)$ of sheaves of spaces on $X$ is an $(\infty,1)$-topos. Its $0$-truncated part recovers the ordinary topos $\mathrm{Sh}(X, \mathbf{Set})$.
- *Etale sheaves:* For a scheme $X$, the $(\infty,1)$-category of hypercomplete etale sheaves of spaces on $X$ is an $(\infty,1)$-topos, providing the natural setting for etale cohomology with higher categorical coefficients.
- *Cohesive topoi:* A cohesive $(\infty,1)$-topos is one equipped with an adjoint quadruple $(\Pi \dashv \mathrm{Disc} \dashv \Gamma \dashv \mathrm{coDisc})$ over $\mathcal{S}$, encoding geometric structure via the shape, flat, and sharp modalities.
