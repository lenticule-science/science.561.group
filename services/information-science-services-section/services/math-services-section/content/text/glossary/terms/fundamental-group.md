---
title: "Fundamental Group"
aliases:
  - "fundamental group"
  - "π₁"
date-created: 2025-12-26
tags: []
mathematical-object: pointed-topological-space
references:
  ref1:
    title: "Hatcher, Algebraic Topology, Cambridge University Press, 2002"
defines:
  - "Fundamental Group"
  - "π₁"
type: term
---

The fundamental group is an algebraic snapshot of the "holes" in a topological space. It answers a basic geometric question: if you walk in a loop, starting and ending at the same point, can you continuously shrink that loop down to a single point, or does the shape of the space force the loop to wrap around something? Loops that can be shrunk to a point are trivial. Loops that cannot are evidence of a hole. The fundamental group collects and organizes all the essentially different loops through a point.

Henri Poincaré introduced the fundamental group in *Analysis Situs* (1895), making it the first algebraic invariant of a topological space and launching the field of algebraic topology. His insight was that topology — the study of shape — could be translated into algebra, where computation and classification become possible.

Formally, fix a [topological space](./topological-space.md) $X$ and a basepoint $x_0 \in X$. A loop at $x_0$ is a continuous path $\gamma: [0,1] \to X$ with $\gamma(0) = \gamma(1) = x_0$ — it starts and ends at the same point. Two loops are considered "the same" if one can be continuously deformed into the other while keeping the endpoints fixed — that is, if they are [homotopic](./homotopy.md) relative to $\{0, 1\}$. The homotopy class $[\gamma]$ represents all loops that can be deformed into $\gamma$.

The fundamental group $\pi_1(X, x_0)$ is the set of all such homotopy classes, with the group operation being concatenation: $[\gamma] \cdot [\delta] = [\gamma * \delta]$, where you walk the loop $\gamma$ in the first half of the time interval and $\delta$ in the second half. The identity element is the constant loop (stay at $x_0$ forever), and the inverse of $[\gamma]$ is $[\bar{\gamma}]$ — walk the same loop backward. Associativity holds up to homotopy: $(\gamma * \delta) * \epsilon$ and $\gamma * (\delta * \epsilon)$ traverse the same three loops in the same order, just at different speeds, and speed differences can be smoothed out continuously.

The most illuminating example is the circle $S^1$. A loop on the circle can wind around zero times (contractible to a point), once, twice, or any number of times, in either direction. Two loops that wind the same number of times in the same direction can be deformed into each other; loops with different winding numbers cannot. The fundamental group of the circle is therefore $\mathbb{Z}$ — the integers — with the winding number as the group element. Addition of integers corresponds to concatenation of loops: a loop that winds twice followed by one that winds three times gives a loop that winds five times.

The torus $T^2$ (the surface of a donut) has fundamental group $\mathbb{Z} \times \mathbb{Z}$: there are two independent generating loops, one going "around the hole" and one going "through the hole," and every loop can be expressed as a combination of these. The figure-eight space $S^1 \vee S^1$ has fundamental group $F_2$, the free group on two generators — here the two loops do not commute, so the order in which you traverse them matters. A sphere $S^n$ with $n \geq 2$ has trivial fundamental group: every loop on a sphere can be contracted to a point, because there are no one-dimensional holes. A space with trivial fundamental group is called simply connected.

If $X$ is path-connected, the choice of basepoint does not matter: $\pi_1(X, x_0)$ and $\pi_1(X, x_1)$ are isomorphic for any two basepoints, via conjugation by a path between them. Moreover, any [continuous map](./continuous-map.md) $f: X \to Y$ sending $x_0$ to $y_0$ induces a group homomorphism $f_*: \pi_1(X, x_0) \to \pi_1(Y, y_0)$, and this assignment is functorial: it respects composition and identities. This functoriality is what makes the fundamental group a tool for proving that spaces are *not* homeomorphic — if their fundamental groups are different, the spaces cannot be topologically the same.

The fundamental group is the case $n = 1$ of the [homotopy groups](./homotopy-group.md) $\pi_n(X, x_0)$, which detect higher-dimensional holes using maps from spheres rather than circles.

## Additional material from the Google Drive library

Let $(X, x_0)$ be a pointed topological space.

**Definition.** A *loop at $x_0$* is a continuous map $\gamma: [0,1] \to X$ with $\gamma(0) = \gamma(1) = x_0$. Two loops $\gamma, \delta$ at $x_0$ are *homotopic relative to* $\{0,1\}$ if there exists a continuous map $H: [0,1] \times [0,1] \to X$ satisfying $H(0,t) = \gamma(t)$, $H(1,t) = \delta(t)$, and $H(s,0) = H(s,1) = x_0$ for all $s, t \in [0,1]$. Write $[\gamma]$ for the [homotopy](./homotopy.md) class of $\gamma$.

**Definition.** The *fundamental group* $\pi_1(X, x_0)$ is the set of homotopy classes of loops at $x_0$, with group operation $[\gamma] \cdot [\delta] = [\gamma * \delta]$, where

$$(\gamma * \delta)(t) = \begin{cases} \gamma(2t) & t \leq 1/2, \\ \delta(2t-1) & t \geq 1/2. \end{cases}$$

**Proposition.** *$\pi_1(X, x_0)$ is a group.*

*Proof sketch.* Identity: the constant loop $c_{x_0}(t) = x_0$ satisfies $[\gamma * c_{x_0}] = [\gamma] = [c_{x_0} * \gamma]$ via linear reparametrization homotopies. Inverses: setting $\bar{\gamma}(t) = \gamma(1-t)$, one constructs explicit homotopies $\gamma * \bar{\gamma} \simeq c_{x_0} \simeq \bar{\gamma} * \gamma$ rel $\{0,1\}$. Associativity: $(\gamma * \delta) * \epsilon \simeq \gamma * (\delta * \epsilon)$ rel $\{0,1\}$ by reparametrization. $\square$

**Proposition.** *If $X$ is path-connected, then for any $x_0, x_1 \in X$, the groups $\pi_1(X, x_0)$ and $\pi_1(X, x_1)$ are isomorphic.*

*Proof sketch.* Let $\alpha$ be a [path](./path.md) from $x_0$ to $x_1$. The map $\beta_\alpha: \pi_1(X, x_0) \to \pi_1(X, x_1)$ defined by $[\gamma] \mapsto [\bar{\alpha} * \gamma * \alpha]$ is a group [isomorphism](./isomorphism.md), with inverse $\beta_{\bar{\alpha}}$. The isomorphism depends on the homotopy class of $\alpha$, so $\pi_1$ of a path-connected space is well-defined up to inner automorphism. $\square$

**Proposition.** *A continuous map $f: (X, x_0) \to (Y, y_0)$ induces a group homomorphism $f_*: \pi_1(X, x_0) \to \pi_1(Y, y_0)$ by $f_*([\gamma]) = [f \circ \gamma]$. This assignment is functorial: $(g \circ f)_* = g_* \circ f_*$ and $(\mathrm{id}_X)_* = \mathrm{id}$.*

**Examples.**
- $\pi_1(S^1, *) \cong \mathbb{Z}$: loops are classified by winding number.
- $\pi_1(T^2, *) \cong \mathbb{Z} \times \mathbb{Z}$: the torus has two independent generating loops.
- $\pi_1(S^1 \vee S^1, *) \cong F_2$, the free group on two generators.
- $\pi_1(S^n, *) = 0$ for $n \geq 2$.
- $X$ is *simply connected* if it is path-connected and $\pi_1(X, x_0) = 0$.

**Remark.** The fundamental group is the case $n = 1$ of the [homotopy groups](./homotopy-group.md) $\pi_n(X, x_0)$. It is equivalently the automorphism group $\mathrm{Aut}(x_0)$ in the fundamental groupoid of $X$.
