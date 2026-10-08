---
name: modeling morphism
description: A morphism v ⊨ v' between predication settlings over a common base, holding iff v_τ(p)(s,o) ≤_t v'_τ(p)(s,o) for every predicate, step, and entity-pair. The truth-order analog of predication-settling-preorder-morphism.
title: modeling morphism
---

A **modeling morphism** $v \models v'$ between [predication settlings](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/model/library/structures/predication-settling.md) over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ holds iff for every predicate $p \in \mathcal{C}$, every step $\tau < \lambda$, and every cell $(s, o) \in E \times E$:

$$v_\tau(p)(s, o) \leq_t v'_\tau(p)(s, o),$$

where $\leq_t$ is the truth order on the [predication fiber algebra](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/model/library/structures/predication-fiber-algebra.md) $A_p$. When the relation holds, the morphism is unique — hom-sets are singletons or empty, determined by the pointwise truth order.

A modeling morphism $v \models v'$ asserts that $v'$ is a *model* of $v$ in the truth-order sense: everywhere $v$ assigns a truth value $x$ to a cell, $v'$ assigns a value at least as true. Since $\mathbf{t}$ is the $\leq_t$-maximum in $\mathbf{L}^\bowtie$, $v_\tau(p)(s, o) = \mathbf{t}$ forces $v'_\tau(p)(s, o) = \mathbf{t}$. Cells that $v$ leaves at $\bot$ (neither told) or $\mathbf{f}$ (told false) impose correspondingly weaker or no constraint on $v'$.
