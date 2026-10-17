---
title: "Path"
aliases:
  - "path"
  - "paths"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Hatcher, Algebraic Topology, Cambridge University Press, 2002"
---

Let $X$ be a topological space.

**Definition.** A *path* in $X$ is a continuous map $\gamma: [0,1] \to X$. The point $\gamma(0)$ is the *initial point* and $\gamma(1)$ is the *terminal point*. A path from $x$ to $y$ is a path with $\gamma(0) = x$ and $\gamma(1) = y$. A *loop at $x_0$* is a path with $\gamma(0) = \gamma(1) = x_0$.

**Definition.** The *concatenation* of a path $\alpha$ from $x$ to $y$ with a path $\beta$ from $y$ to $z$ is the path $\alpha * \beta: [0,1] \to X$ defined by

$$(\alpha * \beta)(t) = \begin{cases} \alpha(2t) & t \leq 1/2, \\ \beta(2t - 1) & t \geq 1/2. \end{cases}$$

The *reverse* of a path $\gamma$ is $\bar{\gamma}(t) = \gamma(1 - t)$.

**Definition.** $X$ is *path-connected* if for every $x, y \in X$ there exists a path from $x$ to $y$.

**Proposition.** *Two paths $\gamma, \delta$ from $x$ to $y$ are [homotopic](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/homotopy.md) rel $\{0,1\}$ if and only if $\gamma * \bar{\delta}$ is null-homotopic as a loop at $x$.*

**Proposition.** *Concatenation of paths is associative, unital, and invertible up to homotopy rel $\{0,1\}$. That is, for paths $\alpha: x \to y$, $\beta: y \to z$, $\gamma: z \to w$:*
1. *$(\alpha * \beta) * \gamma \simeq \alpha * (\beta * \gamma)$ rel $\{0,1\}$,*
2. *$c_x * \alpha \simeq \alpha \simeq \alpha * c_y$ rel $\{0,1\}$, where $c_x$ is the constant path at $x$,*
3. *$\alpha * \bar{\alpha} \simeq c_x$ and $\bar{\alpha} * \alpha \simeq c_y$ rel $\{0,1\}$.*

*Proof sketch.* Each statement is verified by an explicit reparametrization homotopy. For instance, associativity uses a homotopy that linearly shifts the "breakpoints" from $(1/4, 1/2)$ to $(1/2, 3/4)$. $\square$

**Definition.** The *fundamental groupoid* $\Pi_1(X)$ is the category whose objects are the points of $X$ and whose [morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md) $\mathrm{Hom}(x,y)$ are homotopy classes (rel $\{0,1\}$) of paths from $x$ to $y$, with composition given by concatenation. The preceding proposition ensures this is a well-defined groupoid. The [fundamental group](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/fundamental-group.md) $\pi_1(X, x_0)$ is the automorphism group of $x_0$ in $\Pi_1(X)$.

**Examples.**
- In $\mathbb{R}^n$, any two paths from $x$ to $y$ are homotopic rel $\{0,1\}$ via the linear homotopy $H(s,t) = (1-s)\gamma(t) + s\delta(t)$.
- In $S^1$, the homotopy class of a loop at $* = 1$ is determined by its winding number.
- In [directed homotopy](./directed-homotopy.md), paths carry a preferred direction and the reverse $\bar{\gamma}$ is a directed path only when $\bar{\gamma} \in dX$.
