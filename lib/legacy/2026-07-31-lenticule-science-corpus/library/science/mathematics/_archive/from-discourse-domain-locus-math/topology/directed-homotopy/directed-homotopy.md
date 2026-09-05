---

title: "Directed Homotopy"
aliases:
  - "directed homotopy"
  - "directed homotopy theory"
  - "d-homotopy"
date-created: 2026-03-02T00:00:00
tags: []
mathematical-object: directed-space
references:
  - id: ref1
    type: document
    title: Grandis, Directed Algebraic Topology, Cambridge University Press, 2009
---

Let $(X, dX)$ be a d-space (directed space): a topological space $X$ equipped with a set $dX \subseteq C([0,1], X)$ of *directed paths* (d-paths) satisfying:

1. every constant path $c_x(t) = x$ belongs to $dX$,
2. if $\alpha, \beta \in dX$ and $\alpha(1) = \beta(0)$, then the concatenation $\alpha * \beta \in dX$,
3. if $\alpha \in dX$ and $\varphi: [0,1] \to [0,1]$ is continuous and non-decreasing, then $\alpha \circ \varphi \in dX$.

**Definition.** Let $\alpha, \beta \in dX$ be d-paths with $\alpha(0) = \beta(0) = x$ and $\alpha(1) = \beta(1) = y$. A *directed homotopy* (d-homotopy) from $\alpha$ to $\beta$ is a continuous map $H: [0,1] \times [0,1] \to X$ such that:

1. $H(0, t) = \alpha(t)$ and $H(1, t) = \beta(t)$ for all $t \in [0,1]$,
2. $H(s, 0) = x$ and $H(s, 1) = y$ for all $s \in [0,1]$ (endpoints are fixed),
3. for each $s \in [0,1]$, the map $t \mapsto H(s, t)$ is a d-path in $dX$.

If such an $H$ exists, $\alpha$ and $\beta$ are *d-homotopic*, written $\alpha \simeq_d \beta$.

**Proposition.** *D-homotopy with fixed endpoints is an equivalence relation on $dX(x,y) = \{\gamma \in dX : \gamma(0) = x,\; \gamma(1) = y\}$.*

*Proof sketch.* Reflexivity: take $H(s,t) = \alpha(t)$. Symmetry: given $H$ from $\alpha$ to $\beta$, the map $(s,t) \mapsto H(1-s, t)$ is a d-homotopy from $\beta$ to $\alpha$ (the deformation parameter $s$ carries no directedness constraint). Transitivity: given $H$ from $\alpha$ to $\beta$ and $K$ from $\beta$ to $\gamma$, concatenate in $s$. In each case, condition (3) is preserved because each $s$-slice remains a d-path. $\square$

**Definition.** The *fundamental category* $\vec{\pi}_1(X, dX)$ is the category with objects the points of $X$ and morphisms $\mathrm{Hom}(x, y) = dX(x,y)/{\simeq_d}$, with composition induced by concatenation of d-paths. This is well-defined: concatenation respects d-homotopy classes. The fundamental category $\vec{\pi}_1(X, dX)$ is a category (rather than a groupoid): a d-path from $x$ to $y$ provides a morphism $x \to y$, and an inverse morphism $y \to x$ exists only when a d-path from $y$ to $x$ also exists.

**Proposition.** *Composition in $\vec{\pi}_1(X, dX)$ is associative, and the class of the constant d-path $[c_x]$ is the identity morphism at $x$.*

*Proof sketch.* Associativity and unit laws hold up to reparametrization. A non-decreasing reparametrization of a d-path is again a d-path, so the standard reparametrization [homotopies](../morphisms/homotopy.md) used for ordinary paths yield d-homotopies here. $\square$

**Examples.**
- The directed interval $\vec{I} = ([0,1],\, \{\text{non-decreasing continuous maps } [0,1] \to [0,1]\})$ has fundamental category isomorphic to the [partial order](../../order/objects/partial-order.md) $([0,1], \leq)$: there is a unique morphism $a \to b$ when $a \leq b$ and none when $a > b$.
- The directed circle $\vec{S}^1$, obtained by identifying the endpoints of $\vec{I}$, satisfies $\vec{\pi}_1(\vec{S}^1) \cong (\mathbb{N}, +)$ as a monoid with one object: every morphism is an iterate of the generating loop, and reversal of the loop is absent from $dX$.
- In concurrency theory, the state space of a system of $n$ processes with mutual exclusion constraints carries a natural d-space structure. Execution traces are d-paths, and two interleavings reaching the same final state are d-homotopic. Directed obstructions (d-holes) correspond to deadlocks or unreachable states.
