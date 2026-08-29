---

title: "Fundamental Group"
aliases:
  - "fundamental group"
  - "π₁"
date-created: 2025-12-26
tags: []
mathematical-object: pointed-topological-space
references:
  - id: ref1
    type: document
    title: Hatcher, Algebraic Topology, Cambridge University Press, 2002
defines:
  - "Fundamental Group"
  - "π₁"
---

The fundamental group is an algebraic snapshot of the "holes" in a topological space. It answers a basic geometric question: if you walk in a loop, starting and ending at the same point, can you continuously shrink that loop down to a single point, or does the shape of the space force the loop to wrap around something? Loops that can be shrunk to a point are trivial. Loops that cannot are evidence of a hole. The fundamental group collects and organizes all the essentially different loops through a point.

Henri Poincaré introduced the fundamental group in *Analysis Situs* (1895), making it the first algebraic invariant of a topological space and launching the field of algebraic topology. His insight was that topology — the study of shape — could be translated into algebra, where computation and classification become possible.

Formally, fix a [topological space](./topological-space.md) $X$ and a basepoint $x_0 \in X$. A loop at $x_0$ is a continuous path $\gamma: [0,1] \to X$ with $\gamma(0) = \gamma(1) = x_0$ — it starts and ends at the same point. Two loops are considered "the same" if one can be continuously deformed into the other while keeping the endpoints fixed — that is, if they are [homotopic](../morphisms/homotopy.md) relative to $\{0, 1\}$. The homotopy class $[\gamma]$ represents all loops that can be deformed into $\gamma$.

The fundamental group $\pi_1(X, x_0)$ is the set of all such homotopy classes, with the group operation being concatenation: $[\gamma] \cdot [\delta] = [\gamma * \delta]$, where you walk the loop $\gamma$ in the first half of the time interval and $\delta$ in the second half. The identity element is the constant loop (stay at $x_0$ forever), and the inverse of $[\gamma]$ is $[\bar{\gamma}]$ — walk the same loop backward. Associativity holds up to homotopy: $(\gamma * \delta) * \epsilon$ and $\gamma * (\delta * \epsilon)$ traverse the same three loops in the same order, just at different speeds, and speed differences can be smoothed out continuously.

The most illuminating example is the circle $S^1$. A loop on the circle can wind around zero times (contractible to a point), once, twice, or any number of times, in either direction. Two loops that wind the same number of times in the same direction can be deformed into each other; loops with different winding numbers cannot. The fundamental group of the circle is therefore $\mathbb{Z}$ — the integers — with the winding number as the group element. Addition of integers corresponds to concatenation of loops: a loop that winds twice followed by one that winds three times gives a loop that winds five times.

The torus $T^2$ (the surface of a donut) has fundamental group $\mathbb{Z} \times \mathbb{Z}$: there are two independent generating loops, one going "around the hole" and one going "through the hole," and every loop can be expressed as a combination of these. The figure-eight space $S^1 \vee S^1$ has fundamental group $F_2$, the free group on two generators — here the two loops do not commute, so the order in which you traverse them matters. A sphere $S^n$ with $n \geq 2$ has trivial fundamental group: every loop on a sphere can be contracted to a point, because there are no one-dimensional holes. A space with trivial fundamental group is called simply connected.

If $X$ is path-connected, the choice of basepoint does not matter: $\pi_1(X, x_0)$ and $\pi_1(X, x_1)$ are isomorphic for any two basepoints, via conjugation by a path between them. Moreover, any [continuous map](../morphisms/continuous-map.md) $f: X \to Y$ sending $x_0$ to $y_0$ induces a group homomorphism $f_*: \pi_1(X, x_0) \to \pi_1(Y, y_0)$, and this assignment is functorial: it respects composition and identities. This functoriality is what makes the fundamental group a tool for proving that spaces are *not* homeomorphic — if their fundamental groups are different, the spaces cannot be topologically the same.

The fundamental group is the case $n = 1$ of the [homotopy groups](./homotopy-group.md) $\pi_n(X, x_0)$, which detect higher-dimensional holes using maps from spheres rather than circles.
