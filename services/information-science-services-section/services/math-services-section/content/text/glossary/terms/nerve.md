---
title: "Nerve"
aliases:
  - "nerve"
  - "nerve of a category"
date-created: 2026-08-26
tags: []
defines:
  - "Nerve"
  - "nerve of a category"
type: term
---

The nerve of a small [category](./category.md) $C$ is the [simplicial set](./simplicial-set.md) $NC: \Delta^{\mathrm{op}} \to \mathbf{Set}$ that records $C$'s composable strings of [morphisms](./morphism.md). An $n$-simplex of $NC$ is a composable chain $X_0 \to X_1 \to \cdots \to X_n$; the [objects](./object.md) of $C$ are the $0$-simplices, the morphisms are the $1$-simplices, and a $2$-simplex $X_0 \to X_1 \to X_2$ witnesses that its long edge $X_0 \to X_2$ is the [composition](./composition.md) of the other two. Face maps drop an object and compose the two edges meeting there (or drop an endpoint); degeneracy maps insert an [identity morphism](./identity-morphism.md).

The nerve is a fully faithful embedding of categories into simplicial sets: $C$ can be recovered exactly from $NC$, and a map of simplicial sets between two nerves is exactly a [functor](./functor.md) between the categories. This is the precise sense in which "category theory embeds into simplicial homotopy theory" — every categorical construction has a nerve-level shadow, and $NC$ is $2$-coskeletal (an $n$-simplex for $n \geq 3$ is uniquely determined by its faces, since composition of $\geq 3$ morphisms is determined by composing pairs).

The geometric realization $|NC|$ is the classifying space $BC$ of the category. When $C$ is a [group](./group.md) regarded as a one-object category, $BC$ is the classical classifying space $BG$; when $C$ is a [partial order](./partial-order.md), $|NC|$ is the order complex. Weak equivalence of nerves — a functor $F: C \to D$ such that $NF$ is a weak homotopy equivalence — is the basis for Quillen's Theorem A and Theorem B, which detect when a functor induces a homotopy equivalence on classifying spaces from purely categorical data (fibers being contractible, roughly).

The nerve can also be described via [right Kan extension](./kan-extension.md): $\Delta$, the category of nonempty finite ordinals, includes into $\mathbf{Cat}$ by regarding each ordinal $[n] = \{0 < 1 < \cdots < n\}$ as a category, and $NC(n) = \mathrm{Hom}_{\mathbf{Cat}}([n], C)$ is the restricted Yoneda embedding along this inclusion. A [simplicial set](./simplicial-set.md) $X$ arises as a nerve exactly when it satisfies the inner Kan condition uniquely — an extra rigidity beyond the [quasi-category](./quasi-category.md)/[$\infty$-category](./infinity-category.md) condition, which only asks for inner horns to fill, not to fill uniquely.

The linear shape of $\Delta$ — chains of composable arrows — is what makes the nerve a *categorical* invariant. Replacing linear chains with trees produces the [operadic nerve](./operadic-nerve.md), the analogous presentation of an [operad](./operad.md) as a presheaf on a category of trees rather than a category of ordinals.
