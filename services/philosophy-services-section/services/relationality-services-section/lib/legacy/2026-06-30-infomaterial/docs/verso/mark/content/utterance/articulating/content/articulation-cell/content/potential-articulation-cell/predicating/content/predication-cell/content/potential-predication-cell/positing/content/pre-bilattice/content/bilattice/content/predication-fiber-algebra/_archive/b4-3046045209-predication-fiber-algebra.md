---
name: predication fiber algebra
description: The pointwise twist product A_p := L^⋈^(E×E) at a predicate p. An element of A_p is a function from entity-pairs to bilattice values; it is the carrier of the cell-value at every (s, p, o) with predicate coordinate fixed at p. As an abstract algebra, A_p is the same for every predicate — the subscript records which predicate's values are held. The bilattice operations on L^⋈ lift pointwise to A_p.
homomorphizing-as-bilattice: bilattice
negating: predication-fiber-algebra
fusing-by-twist-product: predication-fiber-algebra
residuating-right-by-twist-product: predication-fiber-algebra
closure-operator: predication-fiber-algebra
---

Fix a residuated lattice $\mathbf{L}$ and an [entity set](entity-set.md) $E$. For each predicate $p$, the **predication fiber algebra** at $p$ is the pointwise twist product on the entity-pair index:

$$A_p := \mathbf{L}^{\bowtie\, E \times E}.$$

As an abstract algebra, $A_p$ is the same for every predicate; the subscript $p$ records which predicate's values are held. An element of $A_p$ is a function $E \times E \to L \times L$ — a value $v(s, o) \in \mathbf{L}^\bowtie$ at each predication cell $(s, p, o)$ with predicate coordinate fixed at $p$. The [bilattice](bilattice.md) operations $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ on $\mathbf{L}^\bowtie$ lift pointwise to $A_p$: for example, $(v \wedge_k v')(s, o) := v(s, o) \wedge_k v'(s, o)$. When $\mathbf{L}$ is distributive, so is $A_p$.
