---
name: order of knowledge
description: The order ≤_k on a bilattice — the order associated with the second lattice ⟨B, ∧_k, ∨_k⟩ of a pre-bilattice, ranking values by how much has been settled independent of which way the evidence is leaning. Has bottom ⊥ and top ⊤ when bounded. Negation is monotone in this order; conflation is antitone. Predication settlings are ≤_k-monotone trajectories; the pointwise ∨_k of two settlings is the merge operation that makes a distributed family of settlings CRDT-convergent.
---

The order, denoted $\leq_k$, associated with the second lattice $\langle B, \wedge_k, \vee_k\rangle$ of a [pre-bilattice](../../../../../pre-bilattice.md). It ranks values by *how much* has been settled at a given coordinate, independent of *which way* the evidence is leaning. The transverse role is the [order-of-truth](order-of-truth.md), which ranks values by direction-of-support.

## The role

The order-of-knowledge is the order along which a value can be *more determinate* or *less determinate* about an assertion, gathering both for-evidence and against-evidence as a single quantity. Three pressures distinguish the role:

**Accumulation.** Receiving additional evidence at a coordinate moves the value upward in $\leq_k$, never downward. Strict upward when the evidence is genuinely new; unchanged when already absorbed.

**Indifference to direction.** A value with only for-evidence and a value with only against-evidence carry the same amount of information. The order leaves such values incomparable in $\leq_k$ while ranking each strictly above the empty value $\bot$ and strictly below the both-sided value $\top$.

**Compatibility with conflict.** When a source asserting *for* and a source asserting *against* are both received, the result is *more determinate* than either, though no more truth-leaning. The order has a top $\top$ — "told both" — that is the join in $\leq_k$ of the for-only and against-only values.

## Realization on the bilattice family

On a [pre-bilattice](../../../../../pre-bilattice.md) $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k\rangle$, $\leq_k$ is the partial order associated with the second lattice. Bounded gives $\bot$ (bottom) and $\top$ (top). Meet $\wedge_k$ and join $\vee_k$ are the lattice operations of the second lattice.

On a [bilattice](../../../../code/structures/bilattice.md), the [negation](../../../../code/transformers/negating.md) $\sim$ is monotone in $\leq_k$: swapping for-evidence and against-evidence preserves how much there is. The [conflation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/conflating.md) $-$ is antitone in $\leq_k$: interchanging $\bot$ and $\top$ reverses how-much rank.

On the [four-bilattice](../../../../code/structures/four-bilattice.md) $\mathbf{FOUR}$, the order runs $\bot \leq_k \mathbf{f} \leq_k \top$ and $\bot \leq_k \mathbf{t} \leq_k \top$. The two middles $\mathbf{t}$ and $\mathbf{f}$ are incomparable in $\leq_k$ — *told true* and *told false* are equally informative, both strictly between *told nothing* and *told both*.

On the [twist-product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the order is coordinate-wise:

$$\langle a_+, a_-\rangle \leq_k \langle b_+, b_-\rangle \iff a_+ \leq_1 b_+ \text{ and } a_- \leq_2 b_-.$$

Both coordinates rise together. The contrast with $\leq_t$ — where the negative coordinate goes the other way — is the explicit shape of the two orders' transversality.

## Settling dynamics

A [predication-settling](../../../../code/structures/predication-settling.md) is a $\leq_k$-monotone trajectory of valuations indexed by ordinals. The defining settling-monotonicity condition

$$v_\sigma(p) \leq_k v_\tau(p) \quad \text{for } \sigma \leq \tau$$

is stated in $\leq_k$ pointwise in the [predication-fiber-algebra](../../../../code/structures/predication-fiber-algebra.md) at each predicate $p$. The [predication-settling-preorder-morphism](../../../../code/transformers/predication-settling-preorder-morphism.md) — the morphism class of the predication-settling category — is exactly the pointwise-and-stepwise $\leq_k$ relation: a morphism $v \to v'$ exists iff $v$'s values are everywhere-and-always below $v'$'s in $\leq_k$.

The closure-driven dynamics of a predication-settling advances by

$$v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p) \vee_k u_{\tau+1}(p)),$$

the [closure-operator](../../../../code/transformers/closure-operator.md) applied to the knowledge-order join of the previous valuation with the next increment. Successive valuations are connected by knowledge-order joins with new evidence; the trajectory is $\leq_k$-monotone by construction.

The closure-operator is itself $\leq_k$-monotone, inflationary, and idempotent — all three closure axioms are stated in the order-of-knowledge.

## Distributed merge

The order's join $\vee_k$ is the operation that reconciles independently-evolving instances of a predication-settling without coordination. Two instances' accumulated states merge by pointwise $\vee_k$, producing a single state with the union of their information. The bilattice's $\vee_k$ is commutative, associative, idempotent, with $\bot$ as identity — a bounded join-semilattice — making the merge a state-based CRDT join operation. Independently-evolving instances exchanging information and merging by $\vee_k$ converge to the same state regardless of message order.

The same algebra realizes both temporal accumulation (across stages of a single settling) and distributed accumulation (across replicas). One operation answers both pressures; the [claim federation-is-parallel-composition](../../../learning/claims/federation-is-parallel-composition.md) reads this as the action on values induced by the monoidal $\|$ in $\mathbf{CGS}$.

## No-decay

Because $\vee_k$ raises both operands' positions in $\leq_k$ (or leaves them unchanged when one absorbs the other), every knowledge-order join is knowledge-monotone:

$$v \leq_k v \vee_k v' \quad \text{and} \quad v' \leq_k v \vee_k v'.$$

There is no admissible sequence of $\vee_k$-joins that lowers a value's $\leq_k$-position. Retractions and corrections appear as further $\vee_k$-rises toward $\top$ (the "held contradiction"), not as decreases. The [claim substrate-layer-stigmergy](../../../learning/claims/substrate-layer-stigmergy.md) reads this no-decay as the algebra-side reason no instance of `posit` admits an inverse.

## Realization at the fiber-algebra level

A [predication-valuation](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predication-valuation.md) assigns to each predicate $p$ an element of the [predication-fiber-algebra](../../../../code/structures/predication-fiber-algebra.md) $A_p$. The fiber algebra is the pointwise twist product over the entity-pair index $E \times E$, so it inherits its $\leq_k$ pointwise: $v_1(p) \leq_k v_2(p)$ at $A_p$ iff $v_1(p)(s, o) \leq_k v_2(p)(s, o)$ at $\mathbf{L}^\bowtie$ for every entity pair $(s, o)$. Settling-monotonicity is checked at this pointwise level.

## Settled-threshold coarsening

The order admits a coarsening into *settled* vs *unsettled* values: the settled values are those above a chosen threshold in $\leq_k$, typically anything strictly above $\bot$. This coarsening is independent of the [order-of-truth](order-of-truth.md)'s designation. A value can be settled-for-true ($\mathbf{t}$), settled-for-false ($\mathbf{f}$), settled-as-contested ($\top$), or unsettled ($\bot$).

## Transversality to order-of-truth

The order-of-knowledge and the [order-of-truth](order-of-truth.md) are transverse. The two orders disagree on which values are extremes and which are middles: $\bot$ and $\top$ are knowledge-order extremes and truth-order middles; $\mathbf{t}$ and $\mathbf{f}$ are truth-order extremes and knowledge-order middles. The two orders are connected through the bilattice's involutions: negation preserves $\leq_k$ and reverses $\leq_t$; conflation reverses $\leq_k$ and preserves $\leq_t$. Together the two involutions generate the [Klein-four symmetry](../../../../bilattice/content/klein-four-symmetry/klein-four-symmetry.md).

## What this concept does not name

- The truth-order direction. The transverse role lives at [order-of-truth](order-of-truth.md).
- The Δ-pass stabilization. The bilattice-stabilization nucleus $T_a^*$ acts in $\leq_t$, not $\leq_k$.
- The dihedral $D_4$ symmetry on twist products. The order-swap $\sigma$ exchanges $\leq_k$ and $\leq_t$ rather than preserving or reversing either; its content is a meta-theoretic equivalence between bilattice orders, sitting outside the $K_4 = \langle \sim, -\rangle$ generated by the involutions named here.
