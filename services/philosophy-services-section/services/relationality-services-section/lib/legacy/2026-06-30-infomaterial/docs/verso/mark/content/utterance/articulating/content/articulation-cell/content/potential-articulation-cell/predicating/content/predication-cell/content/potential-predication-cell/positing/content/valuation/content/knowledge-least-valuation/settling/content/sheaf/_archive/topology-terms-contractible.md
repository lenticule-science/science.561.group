---
title: "Contractible"
aliases:
  - "contractible"
  - "contractibility"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Hatcher, Algebraic Topology, Cambridge University Press, 2002"
defines:
  - "Contractible"
  - "contractibility"
---

Let $X$ be a topological space.

**Definition.** $X$ is *contractible* if it is [homotopy equivalent](./homotopy-equivalence.md) to a one-point space $\{*\}$. Equivalently, $X$ is contractible if the identity map $\mathrm{id}_X$ is [homotopic](./homotopy.md) to a constant map $c_{x_0}: X \to X$ for some $x_0 \in X$, i.e., there exists a continuous map $H: X \times [0,1] \to X$ satisfying $H(x,0) = x$ and $H(x,1) = x_0$ for all $x \in X$. Such an $H$ is called a *contraction* of $X$ to $x_0$.

**Proposition.** *$X$ is contractible if and only if for every topological space $Y$, any two continuous maps $f, g: Y \to X$ are [homotopic](./homotopy.md).*

*Proof sketch.* ($\Rightarrow$) Let $H: X \times [0,1] \to X$ be a contraction to $x_0$. Define $G: Y \times [0,1] \to X$ by $G(y,t) = H(f(y), 2t)$ for $t \leq 1/2$ and $G(y,t) = H(g(y), 2-2t)$ for $t \geq 1/2$. Then $G$ is a homotopy from $f$ to $g$ through the constant map $c_{x_0}$. ($\Leftarrow$) Taking $Y = X$, the maps $\mathrm{id}_X$ and $c_{x_0}$ are homotopic, so $X$ is contractible. $\square$

**Proposition.** *If $X$ is contractible, then $\pi_n(X, x_0) = 0$ for all $n \geq 0$ and all $x_0 \in X$.*

*Proof sketch.* A [homotopy equivalence](./homotopy-equivalence.md) $f: X \to \{*\}$ induces isomorphisms $f_*: \pi_n(X, x_0) \xrightarrow{\;\sim\;} \pi_n(\{*\}, *) = 0$ for all $n$. $\square$

**Proposition.** *A CW complex is contractible if and only if all its [homotopy groups](./homotopy-group.md) vanish.*

*Proof sketch.* The forward direction follows from the preceding proposition. The converse is Whitehead's theorem: a map between CW complexes inducing isomorphisms on all homotopy groups is a homotopy equivalence. The constant map $X \to \{*\}$ induces isomorphisms on all $\pi_n$ when every $\pi_n(X, x_0) = 0$, so $X \simeq \{*\}$. $\square$

**Examples.**
- The one-point space $\{*\}$, any convex subset of $\mathbb{R}^n$, the closed disk $D^n$, and the cone $CY$ over any space $Y$ are all contractible.
- The circle $S^1$ has $\pi_1(S^1) \cong \mathbb{Z} \neq 0$, so $S^1$ fails the contractibility criterion.
- The sphere $S^n$ for $n \geq 1$ has $\pi_n(S^n) \cong \mathbb{Z} \neq 0$, so $S^n$ fails the contractibility criterion.

**Remark.** In [category theory](../../../objects/categories/index.md), contractibility generalizes to the notion of a terminal object in the homotopy category. In an [(∞,1)-category](../../higher-topos-theory/terms/infinity-1-category.md), an object $X$ is contractible when the mapping space $\mathrm{Map}(Y, X)$ is contractible for every object $Y$.
