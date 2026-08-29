---
title: "Spatiotemporal knowledge presheaf"
description: "A settling-monotone family of predication valuations indexed by a settling bound. The full sheaf-theoretic object encoding the framework's evolution: a settle-indexed family of valuations whose pointwise values rise monotonically in the knowledge order. The bridge between static settlement structure and dynamic settlement structure."
defines:
  - spatiotemporal knowledge presheaf
symbol: "(v_\\tau)_{\\tau<\\lambda}"
related:
  - predication-valuation
  - settling-monotonicity
  - settling-bound
  - residuated-lattice
  - predicate-category
  - entity-set
  - knowledge-order
date-created: 2026-04-29
---

Fix a [residuated lattice](residuated-lattice.md) $\mathbf{L}$, a [predicate category](predicate-category.md) $\mathcal{C}$, an [entity set](entity-set.md) $E$, and a [settling bound](settling-bound.md) $\lambda$.

A **spatiotemporal knowledge presheaf** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a family $v = (v_\tau)_{\tau < \lambda}$ in which:

- each $v_\tau$ is a [predication valuation](predication-valuation.md), assigning to every predicate $p \in \mathcal{C}$ an element $v_\tau(p) \in A_p$ of the [predication fiber algebra](predication-fiber-algebra.md) at $p$;
- the family satisfies [settling monotonicity](settling-monotonicity.md) — for all $\sigma \leq \tau < \lambda$ and every $p$,

$$v_\sigma(p) \leq_k v_\tau(p)$$

pointwise in $A_p$, where $\leq_k$ is the [knowledge order](knowledge-order.md).

## What it encodes

A spatiotemporal knowledge presheaf is the framework's central temporal-evidence object. It packages, into a single coherent structure:

- the *spatial* dimension — the predication-cell layout $E \times \Pi \times E$ over which $v_\tau$ assigns values, with the [predicate category](predicate-category.md) coordinating across predicates;
- the *temporal* dimension — the settling index $\tau < \lambda$, ordering the steps of inquiry;
- the *evidential* dimension — the bilattice values $v_\tau(p)(s, o) \in \mathbf{L}^\bowtie$ recording how much affirming and denying evidence has accumulated, at each cell, by step $\tau$;
- the *honesty* dimension — the monotonicity condition, which forbids the loss of evidence under settling.

The four together are what the framework calls *spatiotemporal knowledge*: knowledge as positioned in space and time, accumulating monotonically, structured by the predicate category and valued in the bilattice.

## Bridge between static and dynamic

The static settlement structure — the bilattice fiber algebra at one moment $\tau$ — describes a *snapshot* of the inquiry. The dynamic settlement structure — a family $v$ evolving over $\lambda$ — describes the *trajectory*. Without monotonicity, the dynamic structure would be just a sequence of snapshots; with monotonicity, it is a presheaf with the knowledge-order-monotone evolution that the framework's commitments require.

The presheaf is the structural object that supports the framework's higher constructions: settling cohomology, settling-associated sheaves, paraconsistent settling, and the various moduli structures all live over the spatiotemporal knowledge presheaf as their base data.

## Lean mechanization scope

The Lean structure `SpatiotemporalKnowledgePresheaf L P E` covers a restricted parameter range:

- **Settling bound:** `Nat` (= $\omega$) instead of arbitrary $\lambda$. The strict and Scott-continuous regimes ($\kappa \leq \omega$) are in scope; transfinite-bounded and aperiodic regimes ($\omega < \kappa$) require additional ordinal infrastructure and live in a separate module.
- **Predicate index:** a bare type `P` instead of a predicate category $\mathcal{C}$ with the four-generator structure. The categorical structure on predicates — specialization, converse, projections — is deferred.
- **Lattice strength:** `[Lattice L]` instead of a residuated lattice. The residuated structure is needed for fusion and residual on the [predication fiber algebra](predication-fiber-algebra.md), not for the bare presheaf definition; the basic structure is genuinely independent of residuation.

The Lean type therefore mechanizes the strict / Scott-continuous fragment of the prose definition's parameter space. The full transfinite, categorical, and residuated structure is available in the prose corpus and pending mechanization in dedicated modules.

## See also

- [Predication valuation](predication-valuation.md) — what each $v_\tau$ is.
- [Settling monotonicity](settling-monotonicity.md) — the condition the family satisfies.
- [Settling bound](settling-bound.md) — the ordinal $\lambda$ indexing the family.
- [Knowledge order](knowledge-order.md) — the order along which monotonicity holds.
- [Residuated lattice](residuated-lattice.md), [Predicate category](predicate-category.md), [Entity set](entity-set.md) — the parameter triple plus $\lambda$ over which the presheaf is defined.
