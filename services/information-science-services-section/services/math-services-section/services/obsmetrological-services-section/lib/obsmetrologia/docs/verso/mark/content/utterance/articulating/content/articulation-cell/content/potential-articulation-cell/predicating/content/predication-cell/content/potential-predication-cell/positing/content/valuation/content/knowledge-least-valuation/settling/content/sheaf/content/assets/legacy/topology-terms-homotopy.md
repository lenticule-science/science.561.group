---
title: "Homotopy"
aliases:
  - "homotopy"
  - "homotopies"
  - "homotopic"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Hatcher, Algebraic Topology, Cambridge University Press, 2002"
---

Let $X$ and $Y$ be topological spaces, and let $f, g: X \to Y$ be continuous maps.

**Definition.** A *homotopy* from $f$ to $g$ is a continuous map $H: X \times [0,1] \to Y$ satisfying $H(x, 0) = f(x)$ and $H(x, 1) = g(x)$ for all $x \in X$. If such an $H$ exists, $f$ and $g$ are *homotopic*, written $f \simeq g$. For each $t \in [0,1]$, the map $H_t = H(-, t): X \to Y$ is called the *stage* of the homotopy at time $t$.

**Definition.** Let $A \subseteq X$. A homotopy $H: X \times [0,1] \to Y$ is *relative to $A$* (written $f \simeq g$ rel $A$) if $H(a, t) = f(a) = g(a)$ for all $a \in A$ and all $t \in [0,1]$.

**Proposition.** *Homotopy (respectively, homotopy rel $A$) is an equivalence relation on the set of continuous maps $X \to Y$ (respectively, on maps agreeing on $A$).*

*Proof sketch.* Reflexivity: $H(x,t) = f(x)$. Symmetry: $H'(x,t) = H(x, 1-t)$. Transitivity: given $H: f \simeq g$ and $K: g \simeq h$, define $(H \cdot K)(x,t) = H(x, 2t)$ for $t \leq 1/2$ and $K(x, 2t-1)$ for $t \geq 1/2$; continuity follows from the pasting lemma. $\square$

**Proposition.** *Homotopy is compatible with composition: if $f_0 \simeq f_1: X \to Y$ and $g_0 \simeq g_1: Y \to Z$, then $g_0 \circ f_0 \simeq g_1 \circ f_1: X \to Z$.*

*Proof sketch.* If $H$ is a homotopy from $f_0$ to $f_1$ and $K$ is a homotopy from $g_0$ to $g_1$, then $(x, t) \mapsto K(H(x, t), t)$ is a homotopy from $g_0 \circ f_0$ to $g_1 \circ f_1$. $\square$

**Examples.**
- A [path](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/path.md) in $Y$ is a map $\gamma: [0,1] \to Y$, equivalently a homotopy $H: \{*\} \times [0,1] \to Y$ between two points viewed as maps $\{*\} \to Y$.
- A homotopy rel $\{0,1\}$ between two paths is the data underlying the [fundamental group](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/fundamental-group.md) and higher [homotopy groups](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/homotopy-group.md).
- Any two maps $f, g: X \to \mathbb{R}^n$ are homotopic via the linear homotopy $H(x,t) = (1-t)f(x) + tg(x)$.
- Two spaces are [homotopy equivalent](./homotopy-equivalence.md) when there exist maps between them whose composites are homotopic to the respective identities.

**Remark.** In higher [category theory](../../../objects/categories/index.md), homotopies are the 2-[morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md) of the [∞-category](../../higher-topos-theory/terms/infinity-category.md) of spaces, homotopies between homotopies are 3-[morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md), and so on.
