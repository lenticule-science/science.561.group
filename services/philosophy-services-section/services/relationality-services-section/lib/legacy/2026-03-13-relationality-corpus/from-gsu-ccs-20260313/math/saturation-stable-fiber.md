---

name: saturation-stable-fiber
description: "Object: the saturation-stable fiber — the sub-Heyting-algebra Fix(σ_t) ⊆ H_t of propositions already at their saturation value; those fully determined by their restriction profile to all shorter histories."
---

### Definition — The Saturation-Stable Sub-Algebra {#saturation-stable-fiber}

The **saturation-stable sub-algebra** at $t$ is the fixed-point set of the saturation nucleus $\sigma_t$:
$$
\mathrm{Fix}(\sigma_t) \;:=\; \{\, a \in H_t \mid \sigma_t(a) = a \,\}.
$$

Its elements are the propositions of $H_t$ that are already at their saturation value: no element $b > a$ has the same restriction profile as $a$ to all shorter histories. Equivalently,
$$
a \in \mathrm{Fix}(\sigma_t) \;\Longleftrightarrow\; \nexists\, b > a
\;\text{with}\; \rho_{t_0}(b) = \rho_{t_0}(a) \;\text{for all } t_0 < t.
$$

#### Sub-Heyting-Algebra Structure {#saturation-stable-fiber-structure}

By standard nucleus theory, $\mathrm{Fix}(\sigma_t)$ is a sub-Heyting-algebra of $H_t$:

- Meets are inherited from $H_t$: $a \wedge b$ in $\mathrm{Fix}(\sigma_t)$ equals $a \wedge_t b$ in $H_t$.
- Joins are reflected: the join of $a, b \in \mathrm{Fix}(\sigma_t)$ is $\sigma_t(a \vee_t b)$ — the saturation of their $H_t$-join.
- Heyting implication is inherited: since $\sigma_t$ is meet-preserving, $a \Rightarrow_t b \in \mathrm{Fix}(\sigma_t)$ when $a, b \in \mathrm{Fix}(\sigma_t)$.

The inclusion $\iota : \mathrm{Fix}(\sigma_t) \hookrightarrow H_t$ has left adjoint $\sigma_t : H_t \to \mathrm{Fix}(\sigma_t)$: the adjunction $\sigma_t(a) \leq_t b \Leftrightarrow a \leq_t \iota(b)$ holds for all $a \in H_t$, $b \in \mathrm{Fix}(\sigma_t)$.

#### What the Sub-History-Determined Layer Is {#saturation-stable-fiber-meaning}

An element $a \in \mathrm{Fix}(\sigma_t)$ is one whose truth at $t$ is already fully determined by how it looks from all shorter histories $t_0 < t$: the restriction profile $(\rho_{t_0}(a))_{t_0 < t}$ characterizes $a$ uniquely among elements with that profile. The saturation nucleus $\sigma_t$ maps each $a \in H_t$ to the largest element of $H_t$ with the same restriction profile — its saturation. Elements already at their saturation are exactly $\mathrm{Fix}(\sigma_t)$.

The saturation-stable fiber is the smaller of the two single-nucleus layers in the fiber nuclear square ([CommutativeNuclearSquare](commutative-nuclear-square.md)). The other single-nucleus layer is the transfer-stable fiber (§transfer-active-fiber). Their intersection is the fixed fiber (§fixed-fiber).
