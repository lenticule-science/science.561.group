---

title: "Homotopy"
description: "A homotopy is a continuous deformation of one map into another. Imagine two paths drawn on a surface, both starting at the same point and ending at the same point. If you can slide one path into the other without lifting your pen from the surface — smoothly, continuously, never tearing or jumping — then the two paths are homotopic, and the sliding process itself is a homotopy."
aliases:
  - "homotopy"
  - "homotopies"
  - "homotopic"
date-created: 2025-12-26
tags: []
mathematical-object: topological-space
references:
  - id: ref1
    type: document
    title: Hatcher, Algebraic Topology, Cambridge University Press, 2002
defines:
  - "Homotopy"
  - "homotopies"
  - "homotopic"
---

A homotopy is a continuous deformation of one map into another. Imagine two paths drawn on a surface, both starting at the same point and ending at the same point. If you can slide one path into the other without lifting your pen from the surface — smoothly, continuously, never tearing or jumping — then the two paths are homotopic, and the sliding process itself is a homotopy.

The formal definition captures this intuition precisely. Let $X$ and $Y$ be topological spaces, and let $f, g: X \to Y$ be continuous maps. A homotopy from $f$ to $g$ is a continuous map $H: X \times [0,1] \to Y$ such that $H(x, 0) = f(x)$ and $H(x, 1) = g(x)$ for all $x \in X$. The unit interval $[0, 1]$ plays the role of time: at time $0$ you have the map $f$, at time $1$ you have $g$, and at each intermediate time $t$ you have a map $H_t = H(-, t)$ that is partway through the deformation. The continuity of $H$ is what makes the deformation smooth — there are no jumps or discontinuities as $t$ varies.

When $f$ and $g$ are homotopic, we write $f \simeq g$. Sometimes you want to keep part of the map fixed during the deformation. If $A \subseteq X$ and $H(a, t) = f(a) = g(a)$ for all $a \in A$ and all $t$, the homotopy is *relative to $A$*, written $f \simeq g$ rel $A$. This matters most for paths: two paths from point $p$ to point $q$ are homotopic rel $\{0, 1\}$ if you can deform one into the other while keeping the endpoints pinned.

Homotopy is an equivalence relation. Any map is homotopic to itself (just don't deform at all). If $f$ is homotopic to $g$, then $g$ is homotopic to $f$ (run the deformation backward). If $f$ deforms to $g$ and $g$ deforms to $h$, then $f$ deforms to $h$ (do the first deformation in the first half of the time interval, the second in the second half). Homotopy is also compatible with composition: if $f_0 \simeq f_1$ and $g_0 \simeq g_1$, then $g_0 \circ f_0 \simeq g_1 \circ f_1$.

The concept originates with Henri Poincaré, who introduced both homotopy and the [fundamental group](../objects/fundamental-group.md) in *Analysis Situs* (1895). The fundamental group $\pi_1(X, x_0)$ consists of homotopy classes of loops at a basepoint — paths that start and end at the same point, identified up to homotopy rel endpoints. Two loops are "the same" if one can be deformed into the other. The group operation is concatenation: walk the first loop, then the second. Poincaré used this group to distinguish spaces that look different topologically — a torus has fundamental group $\mathbb{Z} \times \mathbb{Z}$ (two independent loops), while a sphere has trivial fundamental group (every loop can be contracted to a point).

The idea extends to higher dimensions. The higher [homotopy groups](../objects/homotopy-group.md) $\pi_n(X, x_0)$ use maps from the $n$-sphere instead of the circle. A [path](teaching/explanations/path.md) in $Y$ is itself a homotopy — a continuous map $\gamma: [0,1] \to Y$ can be viewed as a deformation of the starting point into the ending point.

Some spaces are remarkably flexible under homotopy. Any two maps into $\mathbb{R}^n$ are homotopic via the straight-line deformation $H(x,t) = (1-t)f(x) + tg(x)$. Two spaces are [homotopy equivalent](./homotopy-equivalence.md) when there exist maps between them whose composites are homotopic to the respective identities — meaning the spaces are "the same" from the perspective of homotopy theory, even if they look geometrically different. A solid disk and a single point are homotopy equivalent; a coffee mug and a donut are homotopy equivalent.

In higher [category theory](../../../objects/categories/index.md), homotopies become structural: they are the 2-[morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md) of the [∞-category](../../categories/theories/infinity-categories/objects/infinity-category.md) of spaces, homotopies between homotopies are 3-morphisms, and so on. Allen Hatcher's *Algebraic Topology* (2002) is the standard modern reference.
