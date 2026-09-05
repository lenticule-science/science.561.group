---
id: transfer-stable-fiber
name: TransferStableFiber
description: "Object: the transfer-stable fiber — the sub-Heyting-algebra Fix(Δ_t) ⊆ H_t of propositions already witnessed by every one-step extension of t; the intersection of restriction-map images from independent extensions."
---

### Definition — The Transfer-Stable Sub-Algebra {#transfer-stable-fiber}

The **transfer-stable sub-algebra** at $t$ is the fixed-point set of the transfer nucleus $\Delta_t$:
$$
\mathrm{Fix}(\Delta_t) \;:=\; \{\, a \in H_t \mid \Delta_t(a) = a \,\}.
$$

Its elements are the propositions already transferred from every one-step extension of $t$: a proposition $a \in H_t$ is transfer-stable when it is the restriction of some proposition at every history $s \star t$ obtained by prepending a single step $s \perp t$. Equivalently,
$$
\mathrm{Fix}(\Delta_t) \;=\; \bigcap_{\substack{s \in \Sigma \\ s \perp t}} \mathrm{image}\bigl(H(i_{s,t}) : H_{s \star t} \to H_t\bigr),
$$
where $i_{s,t} : t \to s \star t$ is the canonical prefix-extension morphism.

#### Sub-Heyting-Algebra Structure {#transfer-stable-fiber-structure}

By standard nucleus theory, $\mathrm{Fix}(\Delta_t)$ is a sub-Heyting-algebra of $H_t$:

- Meets are inherited from $H_t$.
- Joins are reflected through $\Delta_t$: the join of $a, b \in \mathrm{Fix}(\Delta_t)$ is $\Delta_t(a \vee_t b)$.
- Heyting implication is inherited.

The inclusion $\iota : \mathrm{Fix}(\Delta_t) \hookrightarrow H_t$ has left adjoint $\Delta_t : H_t \to \mathrm{Fix}(\Delta_t)$: the adjunction $\Delta_t(a) \leq_t b \Leftrightarrow a \leq_t \iota(b)$ holds for all $a \in H_t$, $b \in \mathrm{Fix}(\Delta_t)$.

#### What the Extension-Witnessed Layer Is {#transfer-stable-fiber-meaning}

An element $a \in \mathrm{Fix}(\Delta_t)$ is one whose presence at $t$ is already committed by all one-step extensions: every history that could be the next step in the relational history already confirms $a$. The transfer nucleus $\Delta_t$ maps each $a \in H_t$ to the smallest transfer-stable element above it — the smallest proposition at $t$ that is already witnessed by all extensions.

The transfer-stable fiber is the second single-nucleus layer in the fiber nuclear square ([CommutativeNuclearSquare](commutative-nuclear-square.md)). The other single-nucleus layer is the saturation-stable fiber (§saturation-stable-fiber). Their intersection is the fixed fiber (§fixed-fiber).
