---
kind: example
status: verified
depends-on: [d-frame-valued-sheaf, d-frame, strict-regime-d-frame-cohomology, spatiotemporal-knowledge-presheaf, paired-priestley-space, four-bilattice, trivial-settling]
instantiates: [strict-regime-d-frame-cohomology, d-frame-cohomology-comparison]
lineage: 1
---

# Strict-regime d-frame cohomology — single-cell two-stage settling

A minimal concrete instance of the [strict-regime d-frame cohomology theorem](../theorems/strict-regime-d-frame-cohomology.md). Shows the framework actually computing on a worked example, with the d-frame structure traced through every step. **Lineage 1**'s first non-degenerate instance, building on the [trivial-settling](trivial-settling.md) entry by adding $\lambda = 2$ and one increment.

## Setup

**Base.** $\mathbf{L} = \mathbf{2} = \{0 \leq 1\}$. [Entity set](../objects/entity-set.md) $E = \{a\}$. [Predicate set](../objects/predicate-set.md) $\Pi = \{P\}$. [Settling bound](../objects/settling-bound.md) $\lambda = 2$. The [predicate category](../objects/predicate-category.md) $\mathcal{C}$ is trivial — single object, only identity morphism.

The [predication fiber algebra](../objects/predication-fiber-algebra.md) is

$$A_P \;=\; \mathbf{2}^{\bowtie\, E \times E} \;=\; \mathbf{FOUR}^{\{(a, a)\}} \;=\; \mathbf{FOUR},$$

a single-cell fiber with values in [$\mathbf{FOUR}$](../objects/four-bilattice.md). The cell index is the singleton $\{(a, a)\}$.

**Settling.** Increment sequence $u_1 = (\text{told } P(a, a) = \mathbf{t})$.
- $\tau = 0$: $v_0(P)(a, a) = \bot$ (uninstantiated initial state).
- $\tau = 1$: $v_1(P)(a, a) = \bot \vee_k \mathbf{t} = \mathbf{t}$. Closure does nothing (nothing to derive).
- Quiescent at $\tau^* = 1$.

The settling is **strict**: closure ordinal $\kappa = 1 < \omega$.

## Cells and Priestley dual

Newly-truth-positive cells:
$$\Delta^{+}_0 = \emptyset, \qquad \Delta^{+}_1 = \{(a, a)\}.$$

Newly-falsity-positive cells:
$$\Delta^{-}_0 = \emptyset, \qquad \Delta^{-}_1 = \emptyset.$$

(The $\mathbf{f}$-component is never asserted.)

The [paired Priestley dual](../objects/paired-priestley-space.md) of $\mathbf{FOUR}$ is the two-point space $X = \{+, -\}$ with the swap involution $\sigma : + \leftrightarrow -$. Each cell $(a, a) \in E \times E$ contributes a pair $((a, a), +) \in X^+$ and $((a, a), -) \in X^-$ — the truth-positive and falsity-positive Priestley points.

So the dualized cell sets are:
$$\Delta^{+, *}_0 = \emptyset, \quad \Delta^{+, *}_1 = \{((a, a), +)\}, \quad \Delta^{-, *}_0 = \Delta^{-, *}_1 = \emptyset.$$

The bitopological settling site has objects $(P, \tau, U)$ for $\tau \in \{0, 1\}$ and $U$ ranging over clopens of $X$. Clopens of $\{+, -\}$ are the four subsets $\emptyset, \{+\}, \{-\}, \{+, -\}$.

## d-frame-valued sheaf

For each section $(P, \tau, U)$, the [d-frame-valued settling sheaf](../objects/d-frame-valued-sheaf.md) value is

$$\mathbb{F}_v(P, \tau, U) \;=\; (L_+, L_-, \mathrm{con}, \mathrm{tot})$$

with components computed below.

**At $\tau = 0$, any $U$:** $\Delta^{+, *}_0 = \emptyset$ and $\Delta^{-, *}_0 = \emptyset$, so

$$L_+ = \mathcal{P}(\emptyset) = \{\emptyset\}, \quad L_- = \mathcal{P}(\emptyset) = \{\emptyset\}, \quad \mathrm{con} = \{(\emptyset, \emptyset)\}, \quad \mathrm{tot} = \emptyset.$$

(No cells are settled at $\tau = 0$, so totality is vacuous on the empty cell set.)

**At $\tau = 1$, $U = \{+\}$ or $\{+, -\}$:** $\Delta^{+, *}_1 \cap U = \{((a,a), +)\}$ and $\Delta^{-, *}_1 \cap U = \emptyset$, so

$$L_+ = \mathcal{P}(\{((a,a), +)\}) = \{\emptyset,\, \{((a,a), +)\}\}, \quad L_- = \{\emptyset\}.$$

Consistency $\mathrm{con}$: holds for all $(A, B) \in L_+ \times L_-$ since $L_- = \{\emptyset\}$ — a pair $(A, \emptyset)$ trivially co-witnesses no $\top$-cell.

Totality $\mathrm{tot}$: $(A, \emptyset)$ is total on $U$ iff $A$ covers the settled cells of $U$. The only settled cell is $((a, a), +)$ at $\tau = 1$, so $\mathrm{tot} = \{(\{((a,a), +)\}, \emptyset)\}$ — only the full $L_+$-element pairs with $\emptyset$ totally.

**At $\tau = 1$, $U = \{-\}$ or $\emptyset$:** $\Delta^{+, *}_1 \cap U = \emptyset$, so $L_+ = L_- = \{\emptyset\}$, $\mathrm{con} = \{(\emptyset, \emptyset)\}$, $\mathrm{tot} = \{(\emptyset, \emptyset)\}$ (vacuous).

## Cohomology computation

By [strict-regime d-frame cohomology](../theorems/strict-regime-d-frame-cohomology.md), $H^n_{\mathbf{dFrm}} = 0$ for $n \geq 1$, with $H^0$ given by the global d-frame.

**Direct computation of $H^0$ via Tarski Laplacian.** On the truncated site $\mathbf{T}^*_{\leq 1}$, the global sections are the d-frame data on $(P, 1, X) = (P, 1, \{+, -\})$ (the maximal clopen at the maximal ordinal). This is

$$H^0_{\mathbf{dFrm}}(\mathbb{F}_v) \;=\; \bigl(\mathcal{P}(\{((a,a), +)\}),\, \{\emptyset\},\, \mathrm{con}_{\mathrm{global}},\, \mathrm{tot}_{\mathrm{global}}\bigr).$$

Concretely: $L_+$ has two elements (empty set and the singleton positive-Priestley point); $L_-$ is the trivial frame; consistency holds globally; totality requires the full $L_+$ element.

## Shadow comparison

The [shadow functor](../theorems/d-frame-cohomology-comparison.md) gives

$$\mathbb{S}(H^0_{\mathbf{dFrm}}) \;=\; (\mathbb{Z}^{\{((a,a), +)\}},\, \mathbb{Z}^{\emptyset}) \;=\; (\mathbb{Z}^1,\, 0).$$

This matches the existing [paraconsistent settling-associated sheaf](../objects/paraconsistent-settling-associated-sheaf.md) and [negative-paraconsistent settling-associated sheaf](../objects/negative-paraconsistent-settling-sheaf.md) globals: $\mathcal{F}_v^{(k)} = \mathbb{Z}$ (one paraconsistent-positive cell, namely $(a, a)$ ending at $\mathbf{t}$); $\mathcal{F}_v^{(k, -)} = 0$ (no negative-paraconsistent cells).

The shadow agrees with the existing [strict-regime cohomology vanishing](../theorems/strict-regime-cohomology-vanishing.md): $H^0(\mathcal{F}_v^{(k)}) = \mathbb{Z}$, $H^0(\mathcal{F}_v^{(k, -)}) = 0$, $H^n = 0$ for $n \geq 1$ on both.

## What the d-frame setting adds beyond the shadow

Three pieces of structure visible at $H^0$ in the d-frame setting that the shadow drops:

1. **Consistency relation.** $\mathrm{con}$ records that the truth-positive single-cell content $\{((a,a), +)\}$ is jointly consistent with empty negative content — no $\top$-witness. Trivial here because $L_- = \{\emptyset\}$, but in richer examples (where both $L_+$ and $L_-$ are non-trivial) consistency carries the inconsistency-tracking content the shadow can only recover via $\mathcal{F}_v^{(k)} \cap \mathcal{F}_v^{(k, -)} = \mathcal{F}_v^{(\top)}$ as a relational projection.
2. **Totality relation.** $\mathrm{tot}$ records that the global cell $(a, a)$ IS settled at $\tau = 1$ (it's covered by $L_+$), distinguishing it from cells that remain $\bot$. The shadow doesn't track this distinction directly — $\bot$-cells are simply absent from the abelianized count.
3. **Lattice / Galois connection structure.** $L_+$ and $L_-$ are powerset frames with their natural lattice structure; the d-frame inherits frame morphisms via Galois connections under restriction. The shadow strips this to free abelian groups, losing the lattice / Galois content.

For this single-cell example, the additional structure is minimal — there's only one cell, so consistency and totality are essentially trivial. Multi-cell examples (e.g., a settling with both $\mathbf{t}$ and $\mathbf{f}$ assertions on different cells) exhibit the d-frame structure more richly. See [mixed-stratum two-firing settling](mixed-stratum-two-firing-settling.md) for a corpus example with non-trivial $\top$-content where the d-frame shadow recovers the bigraded refinement non-trivially.

## Role

This example is the framework's first concrete computation. It validates that:

- The Tarski Laplacian framework computes the right thing on a finite cellular site.
- The shadow comparison (proved at section level) extends to the cohomological level in the finite-cell case.
- The d-frame setting carries genuinely more $H^0$-information than the shadow, even in trivial-looking single-cell cases.

The methodology — recognize cellular structure, apply Tarski Laplacian, compute fiber-by-fiber, assemble globally, compare via shadow — generalizes to richer strict-regime examples and to the Scott-continuous regime. Beyond Scott-continuous, the [cellular extension plan](../narratives/cellular-extension-plan.md) takes over.

## Position in Lineage 1

This is the first non-degenerate L1 example. The increment $u_1 = $ told $P(a, a) = \mathbf{t}$ produces a truth-only firing at $\tau = 1$. Subsequent L1 examples vary the increment ($\top$-firing, two-cell variants) and apply later-chapter machinery to the same base:

- [trivial-settling](trivial-settling.md) — entry; $\lambda = 1$, no closure activity.
- (this file) — the d-frame $H^0$ computation with truth-only increment.
- [strict-regime-verdier-dual](strict-regime-verdier-dual.md) — Verdier dual of the truth-only firing settling.
- [strict-regime-top-firing-verdier-self-dual](strict-regime-top-firing-verdier-self-dual.md) — variant with $\top$-firing increment, self-dual orbit.
- [single-entity-moduli](single-entity-moduli.md) — moduli stack on the single-entity base.
- [trivial-base-meta-classification](trivial-base-meta-classification.md) — meta-classifier of L1.
- [strict-regime-deformation-tangent](strict-regime-deformation-tangent.md) (forthcoming) — deformation theory; $\mathrm{Ext}^1 = 0$ rigidly.
