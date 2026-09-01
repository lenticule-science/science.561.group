---
title: "Homotopy Equivalence"
aliases:
  - "homotopy equivalence"
  - "homotopy equivalences"
  - "homotopy equivalent"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Hatcher, Algebraic Topology, Cambridge University Press, 2002"
---

Let $X$ and $Y$ be topological spaces.

**Definition.** A continuous map $f: X \to Y$ is a *homotopy equivalence* if there exists a continuous map $g: Y \to X$ (called a *homotopy inverse*) such that $g \circ f \simeq \mathrm{id}_X$ and $f \circ g \simeq \mathrm{id}_Y$, where $\simeq$ denotes [homotopy](./homotopy.md) of maps. When such an $f$ exists, $X$ and $Y$ are *homotopy equivalent*, written $X \simeq Y$.

**Proposition.** *Homotopy equivalence of spaces is an equivalence relation.*

*Proof sketch.* Reflexivity: $\mathrm{id}_X$ is a homotopy equivalence with homotopy inverse $\mathrm{id}_X$. Symmetry: if $f: X \to Y$ has homotopy inverse $g$, then $g: Y \to X$ has homotopy inverse $f$. Transitivity: if $f: X \to Y$ and $h: Y \to Z$ are homotopy equivalences with homotopy inverses $g$ and $k$ respectively, then $h \circ f: X \to Z$ has homotopy inverse $g \circ k$, since $g \circ k \circ h \circ f \simeq g \circ \mathrm{id}_Y \circ f = g \circ f \simeq \mathrm{id}_X$ and similarly for the other composite. $\square$

**Proposition.** *A homotopy equivalence $f: X \to Y$ induces isomorphisms on all [homotopy groups](./homotopy-group.md): $f_*: \pi_n(X, x_0) \xrightarrow{\;\sim\;} \pi_n(Y, f(x_0))$ for all $n \geq 0$.*

*Proof sketch.* The induced maps satisfy $(g \circ f)_* = g_* \circ f_*$ by functoriality. Since $g \circ f \simeq \mathrm{id}_X$, the homotopy invariance of $\pi_n$ gives $g_* \circ f_* = \mathrm{id}$. Similarly $f_* \circ g_* = \mathrm{id}$, so $f_*$ is an isomorphism. $\square$

**Proposition (Whitehead).** *If $f: X \to Y$ is a continuous map between CW complexes that induces isomorphisms $f_*: \pi_n(X, x_0) \to \pi_n(Y, f(x_0))$ for all $n \geq 0$, then $f$ is a homotopy equivalence.*

**Examples.**
- $D^n \simeq \{*\}$: the inclusion $\{0\} \hookrightarrow D^n$ and the constant map $D^n \to \{0\}$ are homotopy inverses (the disk is [contractible](./contractible.md)).
- $S^1 \times [0,1] \simeq S^1$ and the Möbius band $\simeq S^1$: in each case $S^1$ is a deformation retract.
- $\mathbb{R}^n \setminus \{0\} \simeq S^{n-1}$: the radial projection $x \mapsto x/\|x\|$ and the inclusion $S^{n-1} \hookrightarrow \mathbb{R}^n \setminus \{0\}$ are homotopy inverses.
- The [homotopy type](./homotopy-type.md) of $X$ is its equivalence class under this relation.

**Remark.** Homotopy equivalences are the [isomorphisms](../../../objects/categories/ordinary-categories/terms/isomorphism.md) in the homotopy category $\mathsf{hTop}$, whose objects are topological spaces and whose [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) are homotopy classes of continuous maps. In higher [category theory](../../../objects/categories/index.md), this generalizes to equivalence in an [(∞,1)-category](../../higher-topos-theory/terms/infinity-1-category.md).
