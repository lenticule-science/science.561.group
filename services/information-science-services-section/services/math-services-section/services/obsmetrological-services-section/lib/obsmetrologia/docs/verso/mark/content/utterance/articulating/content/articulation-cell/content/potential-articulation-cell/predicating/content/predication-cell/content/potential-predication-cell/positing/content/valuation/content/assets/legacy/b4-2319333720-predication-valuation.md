---
name: predication-valuation
description: A function v that assigns to each predicate p an element v(p) of the predication fiber algebra A_p at p. The assignment determines a value v(p)(s, o) ∈ L^⋈ at each predication cell (s, p, o). Many valuations may share a cell-set; the cell is invariant under valuation choice.
assigning-to-predicate: predication-fiber-algebra
domain-of-predicate-category: predicate-category
indexed-by-cell-set: predication-cell-set
element-of-predication-settling: predication-settling
closure-operator: predication-valuation
---

A **predication valuation** is a function $v$ that assigns to each predicate $p$ an element $v(p) \in A_p$ of the [predication fiber algebra](../predication-fiber-algebra/predication-fiber-algebra.md) at $p$. Evaluating at an entity-pair gives the cell's value: $v(p)(s, o) \in \mathbf{L}^\bowtie$ at the predication cell $(s, p, o)$.

Many valuations may live over the same cell-set. The cell is invariant under valuation choice; the value is what some valuation does to the cell. Two valuations $v, v'$ disagree at a cell $(s, p, o)$ exactly when $v(p)(s, o) \neq v'(p)(s, o)$ in $\mathbf{L}^\bowtie$.

## Valuation as a section of the fibration

A valuation $v$ is a section of the predication fibration $p : \mathcal{E} \to \mathcal{C}$ that picks, for each predicate $p \in \mathcal{C}$, a single element of the fiber $\mathcal{E}_p \cong A_p$. The category $\mathrm{Sect}(p)$ of sections of the fibration has valuations as objects and pointwise-and-stepwise $\leq_k$-comparisons as morphisms.

## Valuation as a step in a settling

When valuations are organized into a settling — a family $v = (v_\tau)_{\tau < \lambda}$ over a settling bound $\lambda$ — each $v_\tau$ is a predication valuation in this sense, recording the values assigned at settling step $\tau$. The family is a settling exactly when settling monotonicity $v_\sigma(p) \leq_k v_\tau(p)$ holds for all $\sigma \leq \tau$ pointwise in $A_p$.

## Cell-versus-value separation

A valuation produces values at cells; the cells themselves are not part of the valuation. Operations that evaluate a cell against a valuation return the pair $(cell, value)$ as sibling outputs, with the cell unchanged from input. The categorical content: the evaluation morphism factors as $\langle \mathrm{id}_{\Phi}, \mathrm{ev}_v \rangle : \Phi \to \Phi \times \mathbf{L}^\bowtie$, where the left projection is the identity on the cell and the right projection $\mathrm{ev}_v$ depends on the valuation. The cell appears in the output via $\mathrm{id}_\Phi$, not via a value-bearing map.
