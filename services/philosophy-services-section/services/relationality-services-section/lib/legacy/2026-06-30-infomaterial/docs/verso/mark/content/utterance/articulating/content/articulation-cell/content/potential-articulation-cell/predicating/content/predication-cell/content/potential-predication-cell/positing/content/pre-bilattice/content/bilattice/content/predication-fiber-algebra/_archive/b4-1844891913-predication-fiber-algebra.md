---
name: predication-fiber-algebra
description: The pointwise twist product A_p := L^⋈^(E×E) at a predicate p. An element of A_p is a function from entity-pairs to twist-product elements; it is the carrier of the cell-value at every (s, p, o) with predicate coordinate fixed at p. As an abstract algebra A_p is the same for every predicate — the subscript records which predicate's values are held. The bilattice operations on L^⋈ lift pointwise to A_p.
homomorphizing-as-bilattice: bilattice
negating: predication-fiber-algebra
fusing-by-twist-product: predication-fiber-algebra
right-residuating-by-twist-product: predication-fiber-algebra
parameterized-by-residuated-lattice: residuated-lattice
indexed-by-entity-set: entity-set
fiber-of-predication-fibration: predication-fibration
---

Fix a residuated lattice $\mathbf{L}$ and an [entity-set](../entity-set/entity-set.md) $E$. For each predicate $p$, the **predication fiber algebra** at $p$ is the pointwise twist product on the entity-pair index:

$$A_p := \mathbf{L}^{\bowtie\, E \times E}.$$

As an abstract algebra, $A_p$ is the same for every predicate; the subscript $p$ records which predicate's values are held. An element of $A_p$ is a function $E \times E \to L \times L$ — a value $v(s, o) \in \mathbf{L}^\bowtie$ at each predication cell $(s, p, o)$ with predicate coordinate fixed at $p$.

The bilattice operations $\sqcap_t, \sqcup_t, \sqcap_k, \sqcup_k, \sim$ on $\mathbf{L}^\bowtie$ lift pointwise to $A_p$: for example, $(v \sqcap_k v')(s, o) := v(s, o) \sqcap_k v'(s, o)$. When $\mathbf{L}$ is distributive, so is $A_p$.

## Partiality

The function $E \times E \to L \times L$ may be presented partially — some entity-pairs have explicit assignments, others are implicit. The implicit default is the knowledge-bottom $\bot = \langle \bot_L, \bot_L \rangle$ of the twist product, corresponding to "no evidence either way" at that pair under the valuation that produced this fiber. The partial presentation is logically equivalent to the total presentation completed by the bottom-default: the resulting element of $A_p$ is the same.

## Pointwise operations

Each bilattice operation on $\mathbf{L}^\bowtie$ lifts to a morphism on $A_p$ by pointwise application at every entity-pair. The lifted operations satisfy the same algebraic laws — lattice axioms in both orders, involutivity of negation, monotonicity of negation in the knowledge order and antitonicity in the truth order — because they hold at every pair and pointwise application preserves universally-quantified equations.
