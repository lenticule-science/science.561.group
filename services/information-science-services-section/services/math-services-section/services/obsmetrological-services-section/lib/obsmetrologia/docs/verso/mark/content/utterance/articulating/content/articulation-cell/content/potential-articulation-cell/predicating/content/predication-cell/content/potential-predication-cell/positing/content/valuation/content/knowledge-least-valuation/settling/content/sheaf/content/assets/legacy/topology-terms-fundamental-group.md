---
title: "Fundamental Group"
aliases:
  - "fundamental group"
  - "π₁"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: pointed-topological-space
references:
  - "Hatcher, Algebraic Topology, Cambridge University Press, 2002"
---

Let $(X, x_0)$ be a pointed topological space.

**Definition.** A *loop at $x_0$* is a continuous map $\gamma: [0,1] \to X$ with $\gamma(0) = \gamma(1) = x_0$. Two loops $\gamma, \delta$ at $x_0$ are *homotopic relative to* $\{0,1\}$ if there exists a continuous map $H: [0,1] \times [0,1] \to X$ satisfying $H(0,t) = \gamma(t)$, $H(1,t) = \delta(t)$, and $H(s,0) = H(s,1) = x_0$ for all $s, t \in [0,1]$. Write $[\gamma]$ for the [homotopy](./homotopy.md) class of $\gamma$.

**Definition.** The *fundamental group* $\pi_1(X, x_0)$ is the set of homotopy classes of loops at $x_0$, with group operation $[\gamma] \cdot [\delta] = [\gamma * \delta]$, where

$$(\gamma * \delta)(t) = \begin{cases} \gamma(2t) & t \leq 1/2, \\ \delta(2t-1) & t \geq 1/2. \end{cases}$$

**Proposition.** *$\pi_1(X, x_0)$ is a group.*

*Proof sketch.* Identity: the constant loop $c_{x_0}(t) = x_0$ satisfies $[\gamma * c_{x_0}] = [\gamma] = [c_{x_0} * \gamma]$ via linear reparametrization homotopies. Inverses: setting $\bar{\gamma}(t) = \gamma(1-t)$, one constructs explicit homotopies $\gamma * \bar{\gamma} \simeq c_{x_0} \simeq \bar{\gamma} * \gamma$ rel $\{0,1\}$. Associativity: $(\gamma * \delta) * \epsilon \simeq \gamma * (\delta * \epsilon)$ rel $\{0,1\}$ by reparametrization. $\square$

**Proposition.** *If $X$ is path-connected, then for any $x_0, x_1 \in X$, the groups $\pi_1(X, x_0)$ and $\pi_1(X, x_1)$ are isomorphic.*

*Proof sketch.* Let $\alpha$ be a [path](./path.md) from $x_0$ to $x_1$. The map $\beta_\alpha: \pi_1(X, x_0) \to \pi_1(X, x_1)$ defined by $[\gamma] \mapsto [\bar{\alpha} * \gamma * \alpha]$ is a group [isomorphism](../../../objects/categories/ordinary-categories/terms/isomorphism.md), with inverse $\beta_{\bar{\alpha}}$. The isomorphism depends on the homotopy class of $\alpha$, so $\pi_1$ of a path-connected space is well-defined up to inner automorphism. $\square$

**Proposition.** *A continuous map $f: (X, x_0) \to (Y, y_0)$ induces a group homomorphism $f_*: \pi_1(X, x_0) \to \pi_1(Y, y_0)$ by $f_*([\gamma]) = [f \circ \gamma]$. This assignment is functorial: $(g \circ f)_* = g_* \circ f_*$ and $(\mathrm{id}_X)_* = \mathrm{id}$.*

**Examples.**
- $\pi_1(S^1, *) \cong \mathbb{Z}$: loops are classified by winding number.
- $\pi_1(T^2, *) \cong \mathbb{Z} \times \mathbb{Z}$: the torus has two independent generating loops.
- $\pi_1(S^1 \vee S^1, *) \cong F_2$, the free group on two generators.
- $\pi_1(S^n, *) = 0$ for $n \geq 2$.
- $X$ is *simply connected* if it is path-connected and $\pi_1(X, x_0) = 0$.

**Remark.** The fundamental group is the case $n = 1$ of the [homotopy groups](./homotopy-group.md) $\pi_n(X, x_0)$. It is equivalently the automorphism group $\mathrm{Aut}(x_0)$ in the fundamental groupoid of $X$.
