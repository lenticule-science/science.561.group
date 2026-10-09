---
type: morphism
realizes: [truth-order]
class: preorder
symbol: "\\models"
depends-on: [predication-settling, predication-fiber-algebra, truth-order, knowledge-order, predicate-category, settling-bound]
see-also: [predication-settling-preorder-morphism, predication-model, modeling-preorder-independence]
title: Modeling morphism
description: A modeling morphism $v \models v'$ between predication settlings over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ holds iff for every predicate $p \in \mathcal{C}$, every step $\tau < \lambda$, and every cell $(s, o) \in E…
---

# Modeling morphism

A **modeling morphism** $v \models v'$ between [predication settlings](../../research/2026/07/31/lenticule-import/objects/predication-settling.md) over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ holds iff for every predicate $p \in \mathcal{C}$, every step $\tau < \lambda$, and every cell $(s, o) \in E \times E$:

$$v_\tau(p)(s, o) \leq_t v'_\tau(p)(s, o),$$

where $\leq_t$ is the [truth order](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) on the [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie\, E \times E}$. When the relation holds, the morphism is unique — hom-sets are singletons or empty, determined by the pointwise truth order.

## Role

Modeling morphisms are the truth-order analog of [predication-settling preorder morphisms](../../research/2026/07/31/lenticule-import/from-predicate-category/predication-settling-preorder-morphism.md), which use the [knowledge order](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/knowledge-order.md) $\leq_k$ in the same position. The two morphism classes together describe the two independent semantic dimensions of a predication settling: what is known ($\leq_k$) and what is made true ($\leq_t$). Their independence is the content of the [modeling-preorder independence theorem](../../research/2026/07/31/lenticule-import/theorems/modeling-preorder-independence.md).

## Reading

A modeling morphism $v \models v'$ asserts that $v'$ is a **model** of $v$ in the truth-order sense: everywhere $v$ assigns a truth value $x$ to a cell, $v'$ assigns a value at least as true. The most semantically sensitive case is $x = \mathbf{t}$ (told true): since $\mathbf{t}$ is the $\leq_t$-maximum in $\mathbf{L}^\bowtie$, $v_\tau(p)(s, o) = \mathbf{t}$ forces $v'_\tau(p)(s, o) = \mathbf{t}$. Cells that $v$ leaves at $\bot$ (neither told) or $\mathbf{f}$ (told false) impose correspondingly weaker or no constraint on $v'$.

The direction $v \models v'$ reads: $v'$ satisfies the truth commitments of $v$. This is the bilattice-valued analog of the classical satisfaction relation $\mathcal{M} \models T$ in model theory: a settling $v'$ is a model of the theory expressed by $v$.

## Two parallel morphism classes

| morphism | condition | reads as |
|---|---|---|
| [preorder morphism](../../research/2026/07/31/lenticule-import/from-predicate-category/predication-settling-preorder-morphism.md) | $v_\tau(p) \leq_k v'_\tau(p)$ | $v'$ has learned everything $v$ has |
| **modeling morphism** | $v_\tau(p) \leq_t v'_\tau(p)$ | $v'$ makes true everything $v$ makes true |

Both are same-base preorder relations. Both yield preorder-enriched category structures on the collection of predication settlings over a fixed base. Neither implies the other.

## Closed settlings and models

A predication settling $v$ that has reached a $\mathrm{cl}$-fixpoint — a [predication model](../../research/2026/07/31/lenticule-import/objects/predication-model.md) — is the natural target of modeling morphisms: for any source settling $v_0$, a modeling morphism $v_0 \models v$ expresses that $v$ satisfies all of $v_0$'s truth assignments and is itself closed under inference.
