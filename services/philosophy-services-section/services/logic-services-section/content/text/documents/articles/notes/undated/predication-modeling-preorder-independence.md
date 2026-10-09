---
type: theorem
status: proved
depends-on: [modeling-morphism, predication-settling-preorder-morphism, four-bilattice, truth-order, knowledge-order, predication-settling, predication-fiber-algebra, twist-product]
title: Modeling morphisms and preorder morphisms are independent
description: "The modeling morphism relation $\\models$ (pointwise $\\leqt$) and the preorder morphism relation $\\to$ (pointwise $\\leqk$) on same-base predication settlings are independent: neither implies the other."
---

# Modeling morphisms and preorder morphisms are independent

The [modeling morphism](modeling-morphism.md) relation $\models$ (pointwise $\leq_t$) and the [preorder morphism](../../research/2026/07/31/lenticule-import/morphisms/predication-settling-preorder-morphism.md) relation $\to$ (pointwise $\leq_k$) on same-base [predication settlings](../../research/2026/07/31/lenticule-import/objects/predication-settling.md) are independent: neither implies the other.

## Proof

Both directions are witnessed by constant settlings over the [four-element bilattice](../../research/2026/07/31/lenticule-import/objects/four-bilattice.md) $\mathbf{FOUR}$. For any base $(\mathbf{FOUR}, \mathcal{C}, E, \lambda)$ with $\mathcal{C}$ and $E$ non-empty, let $c_\alpha$ denote the predication settling assigning the constant value $\alpha \in \mathbf{FOUR}$ to every predicate, every cell, and every step.

**Preorder morphism does not imply modeling morphism.**

Take $v = c_\bot$ and $v' = c_\mathbf{f}$. Since $\bot$ is the $\leq_k$-minimum of $\mathbf{FOUR}$:
$$\bot \leq_k \mathbf{f},$$
so $c_\bot \to c_\mathbf{f}$ is a preorder morphism. However, in the truth order, $\mathbf{f}$ is the $\leq_t$-minimum:
$$\mathbf{f} \leq_t \bot \quad \text{but} \quad \bot \not\leq_t \mathbf{f},$$
since $\bot$ and $\mathbf{f}$ are $\leq_t$-comparable with $\mathbf{f}$ strictly below $\bot$. Hence $c_\bot \not\models c_\mathbf{f}$.

**Modeling morphism does not imply preorder morphism.**

Take $v = c_\mathbf{f}$ and $v' = c_\bot$. Since $\mathbf{f}$ is the $\leq_t$-minimum of $\mathbf{FOUR}$:
$$\mathbf{f} \leq_t \bot,$$
so $c_\mathbf{f} \models c_\bot$ is a modeling morphism. However, in the knowledge order, $\bot$ is the $\leq_k$-minimum:
$$\bot \leq_k \mathbf{f} \quad \text{but} \quad \mathbf{f} \not\leq_k \bot,$$
since $\bot$ is strictly below $\mathbf{f}$ in $\leq_k$. Hence $c_\mathbf{f} \not\to c_\bot$. $\square$

## The structural reason

The pair $(\mathbf{f}, \bot)$ is ordered in opposite directions by the two bilattice orders:
- Knowledge order: $\bot <_k \mathbf{f}$ — being told false is more informative than being told nothing.
- Truth order: $\mathbf{f} <_t \bot$ — being told nothing is more truthful than being told false.

This reversal is not an accident of $\mathbf{FOUR}$. In any non-trivial twist-product bilattice $\mathbf{L}^\bowtie$, the elements $\langle 0, 0 \rangle$ (the $\leq_k$-minimum $\bot$) and $\langle 0, 1 \rangle$ (the element told false) are ordered $\bot <_k \langle 0,1\rangle$ in $\leq_k$ (since $0 \leq 0$ and $0 \leq 1$) and $\langle 0,1\rangle <_t \bot$ in $\leq_t$ (since $0 \leq 0$ and $0 \leq 0$ fails the twist — specifically, the $\leq_t$ condition $a_1 \leq b_1$ and $b_2 \leq a_2$ gives $\langle 0,1 \rangle \leq_t \langle 0,0 \rangle$ because $0 \leq 0$ and $0 \leq 1$, not $\langle 0,0 \rangle \leq_t \langle 0,1 \rangle$). The independence holds in any such bilattice.

## Corollary — two independent preorder structures

The collection of predication settlings over a fixed base carries two independent preorder structures:

- The **epistemic preorder** $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$, with morphisms $v \to v'$ iff $v \leq_k v'$ pointwise. Colimits in this preorder are pointwise $\vee_k$-joins; the initial object is the all-$\bot$ settling.
- The **semantic preorder** $\mathbf{MS}(\mathbf{L}, \mathcal{C}, E, \lambda)$, with morphisms $v \models v'$ iff $v \leq_t v'$ pointwise. Colimits in this preorder are pointwise $\vee_t$-joins; the initial object is the all-$\mathbf{f}$ settling.

Neither is a subcategory of the other.
