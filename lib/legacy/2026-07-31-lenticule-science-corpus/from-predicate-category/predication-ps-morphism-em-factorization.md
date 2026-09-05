---
type: theorem
status: sketch
depends-on: [predication-settling-category, predication-settling, closure-operator, knowledge-order, predication-cell, closure-2-monad]
see-also: [positing-realizable-factorization, positing-naturality, positing-morphism, closure-2-monad-lax-idempotence]
---

# Operationally-realizable PS-morphisms are exactly those targeting closure fixpoints above cl(v₀)

A morphism $v_0 \to v_1$ in the [predication settling category](../objects/predication-settling-category.md) $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ is **operationally realizable** — factors as a batch of atomic positing steps followed by exactly one closure step — if and only if:

1. $v_1$ is a closure fixpoint: $\mathrm{cl}(v_1) = v_1$.
2. $v_1 \geq_k \mathrm{cl}(v_0)$: $v_1$ is above the closure of the source.

The full subcategory of $\mathbf{PS}$ on closure-fixpoint settlings — the Eilenberg-Moore category $\mathbf{PS}^{\mathrm{cl}}$ of the closure 2-monad — is therefore the canonical domain of the (positing, closure) factorization system: every morphism in $\mathbf{PS}^{\mathrm{cl}}$ is operationally realizable.

## Statement

**Characterization theorem.** Let $v_0 \to v_1$ be a $\mathbf{PS}$-morphism (i.e., $v_0 \leq_k v_1$ pointwise). The following are equivalent:

(a) $v_0 \to v_1$ is operationally realizable: there exists a positing collection $W$ (a valuation $W \leq_k v_1$) such that $v_1 = \mathrm{cl}(v_0 \vee_k W)$.

(b) $\mathrm{cl}(v_1) = v_1$ and $v_1 \geq_k \mathrm{cl}(v_0)$.

**Corollary (EM-subcategory).** Let $\mathbf{PS}^{\mathrm{cl}}$ denote the full subcategory of $\mathbf{PS}$ whose objects are the closure fixpoints $\{v : \mathrm{cl}(v) = v\}$. Every morphism in $\mathbf{PS}^{\mathrm{cl}}$ is operationally realizable. Concretely: for any $v_0, v_1 \in \mathbf{PS}^{\mathrm{cl}}$ with $v_0 \leq_k v_1$, the morphism $v_0 \to v_1$ is realized by taking $W = v_1$ and observing $\mathrm{cl}(v_0 \vee_k v_1) = \mathrm{cl}(v_1) = v_1$.

**Corollary (EM-category identification).** $\mathbf{PS}^{\mathrm{cl}}$ is the Eilenberg-Moore category of algebras for the closure 2-monad $\mathbb{T}$: the objects are the $\mathbb{T}$-algebras $(v, \mathrm{cl})$ with $\mathrm{cl}(v) = v$, and the algebra maps are the $\leq_k$-increases (which automatically commute with $\mathrm{cl}$ since $v_0, v_1$ are both fixpoints).

## Proof

**(a ⇒ b).** If $v_1 = \mathrm{cl}(v_0 \vee_k W)$, then by the idempotence of $\mathrm{cl}$: $\mathrm{cl}(v_1) = \mathrm{cl}(\mathrm{cl}(v_0 \vee_k W)) = \mathrm{cl}(v_0 \vee_k W) = v_1$, so $v_1$ is a fixpoint. By monotonicity of $\mathrm{cl}$: $v_0 \vee_k W \geq_k v_0$, so $v_1 = \mathrm{cl}(v_0 \vee_k W) \geq_k \mathrm{cl}(v_0)$.

**(b ⇒ a).** If $v_1$ is a fixpoint and $v_1 \geq_k \mathrm{cl}(v_0)$, take $W = v_1$. Then:
$$\mathrm{cl}(v_0 \vee_k v_1) = \mathrm{cl}(v_1) = v_1,$$
where the first equality uses $v_1 \geq_k v_0$ (so $v_0 \vee_k v_1 = v_1$) and the second uses $v_1$ being a fixpoint. $\square$

## Why condition (b) is not automatically satisfied

For a general $\mathbf{PS}$-morphism $v_0 \leq_k v_1$, condition (b) can fail in two ways:

- **$v_1$ is not a fixpoint.** Example: $v_0 = \bot$ and $v_1$ is a settling that adds evidence at one cell but has not yet applied closure (so $\mathrm{cl}(v_1) >_k v_1$). The morphism $v_0 \to v_1$ is a valid $\mathbf{PS}$-morphism but has no factorization through one closure step — any single closure step overshoot $v_1$.
- **$v_1 <_k \mathrm{cl}(v_0)$.** Example: $v_0$ already has enough evidence that $\mathrm{cl}(v_0) >_k v_1$. Then $v_1$ is below what closure alone derives from $v_0$ — the morphism $v_0 \to v_1$ would require "un-closing," which is impossible in $\mathbf{PS}$ (morphisms are $\leq_k$-increasing). This case cannot arise for $\mathbf{PS}$-morphisms (since $v_0 \leq_k v_1$ and $v_1 < \mathrm{cl}(v_0)$ would require $v_0 \leq v_1 < \mathrm{cl}(v_0)$, which is consistent but shows $v_1$ is not a fixpoint). Actually this case IS possible: $v_0 \leq_k v_1 <_k \mathrm{cl}(v_0)$ is a valid $\leq_k$-chain.

## Factorization on the EM-subcategory

The pair $(\mathcal{L}, \mathcal{R})$ on $\mathbf{PS}^{\mathrm{cl}}$ where:
- $\mathcal{L}$: atomic positing morphisms and their finite composites (injecting evidence)
- $\mathcal{R}$: closure morphisms $v \mapsto \mathrm{cl}(v)$ (which are the identity on fixpoints: $\mathrm{cl}(v) = v$)

Every morphism in $\mathbf{PS}^{\mathrm{cl}}$ is in $\mathcal{L}$ (since closure is the identity on fixpoints, the $\mathcal{L}$-factor carries the entire morphism and the $\mathcal{R}$-factor is the identity). The factorization degenerates: the positing batch $W = v_1$ followed by the identity $\mathrm{cl} = \mathrm{id}$ is the canonical factorization.

The non-trivial content of the factorization lives in the **bridge from $\mathbf{PS}$ to $\mathbf{PS}^{\mathrm{cl}}$**: any $\mathbf{PS}$-morphism $v_0 \to v_1$ with $v_1$ a fixpoint but $v_0$ not a fixpoint factors as ($v_0 \to v_0 \vee_k W$, positing) followed by ($v_0 \vee_k W \to v_1$, closure), where the intermediate settling $v_0 \vee_k W$ is not necessarily in $\mathbf{PS}^{\mathrm{cl}}$. This is the factorization proved in [positing-realizable-factorization](positing-realizable-factorization.md).

## Relation to [positing-realizable-factorization](positing-realizable-factorization.md)

The existing [operationally-realizable factorization theorem](positing-realizable-factorization.md) proves existence and uniqueness (up to $\mathcal{L}$-commutativity) of the factorization for operationally-realizable morphisms, but does not characterize which morphisms are operationally realizable. This theorem provides the characterization: the operationally-realizable morphisms are exactly those in (b), and the EM-subcategory $\mathbf{PS}^{\mathrm{cl}}$ is the natural home of the factorization system.
