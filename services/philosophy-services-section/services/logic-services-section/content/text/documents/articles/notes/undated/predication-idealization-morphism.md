---
type: morphism
class: preorder-morphism
symbol: "\\eta^T_R"
depends-on: [theory-relative-ideal, resource-deficit, predication-settling-preorder-morphism, predication-settling-category, knowledge-order]
see-also: [idealization-morphism-existence, improvement-automorphism-distinction, settling-morphism, closure-2-monad]
title: Idealization morphism
description: Let $v^R$ be a resource settling over $(\mathbf{L}, \mathcal{C}^R, E, \lambdaR)$ and let $v^R{T,\infty}$ be its theory-relative ideal within host theory $T$.
---

# Idealization morphism

Let $v^R$ be a resource settling over $(\mathbf{L}, \mathcal{C}^R, E, \lambda_R)$ and let $v^R_{T,\infty}$ be its [theory-relative ideal](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/content/theory-relative-ideal/theory-relative-ideal.md) within host theory $T$. An **idealization morphism** is a [predication-settling preorder morphism](../../research/2026/07/31/lenticule-import/from-predicate-category/predication-settling-preorder-morphism.md)

$$\eta^T_R : v^R \to v^R_{T,\infty}$$

in the [predication-settling category](../../research/2026/07/31/lenticule-import/objects/predication-settling-category.md) $\mathbf{PS}(\mathbf{L}, \mathcal{C}^R, E)$.

Such a morphism exists iff $v^R \leq_k v^R_{T,\infty}$ pointwise — iff the [resource deficit](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/content/theory-relative-ideal/content/resource-deficit/resource-deficit.md) satisfies $\mathrm{Ex}(v^R, T) = \mathrm{Co}(v^R, T) = \emptyset$. When it exists, it is unique (hom-sets in $\mathbf{PS}$ are singletons or empty). See [idealization morphism existence](../../research/2026/07/31/lenticule-import/theorems/idealization-morphism-existence.md).

## Reading

The idealization morphism is the canonical "improvement path": it witnesses that the resource is below the theory's ideal in the knowledge order and names the preorder morphism that closes the gap. Every cell in $\mathrm{De}(v^R, T)$ gains knowledge along $\eta^T_R$; every cell in $\mathrm{Al}(v^R, T)$ is fixed.

The word "idealization" is chosen deliberately: the morphism takes the resource toward the theory's ideal form of it. The resource does not arrive at some arbitrary better state; it arrives at the specific state the theory prescribes.

## What kind of morphism this is

The idealization morphism is a **preorder morphism**, not a [settling-morphism](../../research/2026/07/31/lenticule-import/from-predicate-category/settling-morphism.md). The distinction matters:

- A settling-morphism requires state *equality* at an ordinal shift, plus endofunctor commutation. It is the equivalence relation used for moduli classification.
- A preorder morphism requires only $\leq_k$ pointwise. It is the improvement relation.

An idealization morphism is one-directional in $\leq_k$: it goes from less-informed to more-informed. It is therefore NOT a settling-morphism (settling-morphisms are invertible; idealization morphisms are invertible only when $v^R = v^R_{T,\infty}$, i.e., when the resource is already theory-ideal). See [improvement-automorphism-distinction](../../research/2026/07/31/lenticule-import/theorems/improvement-automorphism-distinction.md).

## Contrast with the closure-2-monad

The [closure 2-monad](../../research/2026/07/31/lenticule-import/from-predicate-category/closure-2-monad.md) $\mathrm{Cl}^R$ applies the resource's own closure operator to itself, producing the resource's internally-settled form. The idealization morphism is different: its TARGET is $\iota^*(v^T_\infty)$, determined by the HOST THEORY's closure applied to the theory's own settling, not to the resource.

Concretely: $\mathrm{Cl}^R(v^R) \leq_k v^R_{T,\infty}$ in general (the resource's self-closure may not reach the theory ideal), and strict inequality is typical. The idealization morphism identifies what remains after the resource's own closure is exhausted — the gap that only the theory's broader inference apparatus can fill.

## The two-step improvement procedure

When $\mathrm{Ex}(v^R, T) \neq \emptyset$ or $\mathrm{Co}(v^R, T) \neq \emptyset$, the idealization morphism does not exist. Improvement in this case requires a two-step procedure:

1. **Contradiction resolution and excess adjudication**: resolve each contradicted cell (correct the resource or update the theory) and decide each excessive cell (ground it in theory, remove it, or extend the theory to absorb it). This step involves judgment and may itself require theory development.

2. **Idealization**: once $\mathrm{Ex} = \mathrm{Co} = \emptyset$, the idealization morphism $\eta^T_R$ exists and names the remaining path from current deficient state to theory-ideal.

The first step is not a morphism in $\mathbf{PS}$ — it involves substantive choices. The second step is.
