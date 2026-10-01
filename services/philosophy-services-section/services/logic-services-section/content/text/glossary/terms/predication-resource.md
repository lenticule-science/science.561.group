---
type: definition
class: placed-settling
symbol: "(v^R, \\iota, T)"
depends-on: [predication-settling, predication-settling-base-morphism, predication-settling-category, predicate-category]
see-also: [theory-relative-ideal, resource-deficit, idealization-morphism, researching]
name: Resource
description: "A resource is a triple $(v^R, \\iota, T)$ consisting of:"
---

# Resource

A **resource** is a triple $(v^R, \iota, T)$ consisting of:

1. A **resource settling** $v^R$: a [predication settling](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-settling.md) over $(\mathbf{L}, \mathcal{C}^R, E, \lambda_R)$.
2. A **type embedding** $\iota : \mathcal{C}^R \hookrightarrow \mathcal{C}^T$: a functor between [predicate categories](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predicate-category.md) that is faithful and preserves generator classes.
3. A **host theory** $T$: a predication settling over $(\mathbf{L}, \mathcal{C}^T, E, \lambda_T)$ with a distinguished fully-settled state $v^T_\infty$ — its $\mathrm{Cl}^T$-fixed point.

The embedding $\iota$ is the predicate-category component of a [predication-settling base-morphism](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/predication-settling-base-morphism.md): it places the resource's predicate scope $\mathcal{C}^R$ inside the theory's predicate scope $\mathcal{C}^T$ faithfully, without collapsing or reordering generator classes. Via $\iota$, every predicate the resource tracks is a predicate the theory also tracks.

## The preorder on resources

Fix a host theory $T$ and an embedding $\iota : \mathcal{C}^R \hookrightarrow \mathcal{C}^T$. The set of resource settlings over $(\mathbf{L}, \mathcal{C}^R, E)$ with this fixed embedding carries the pointwise [knowledge order](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/knowledge-order.md) from $\mathbf{PS}(\mathbf{L}, \mathcal{C}^R, E)$:

$$(v^R, \iota, T) \leq (v^{R'}, \iota, T) \quad \iff \quad v^R \leq_k v^{R'} \text{ pointwise.}$$

Within this preorder, the [theory-relative ideal](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/content/theory-relative-ideal/theory-relative-ideal.md) $v^R_{T,\infty} = \iota^*(v^T_\infty)$ is the distinguished upper bound prescribed by the host theory — the element all resources in this scope are measured against.

## What the host theory provides

The host theory $T$ contributes three structures to any resource $(v^R, \iota, T)$:

- **The ideal** $v^R_{T,\infty} = \iota^*(v^T_\infty)$: the restriction of $T$'s settled state to the resource's predicate scope via the embedding. Defined in [theory-relative ideal](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/content/theory-relative-ideal/theory-relative-ideal.md).
- **The rubric**: the partition of the resource's cells into $\mathrm{Al}$, $\mathrm{De}$, $\mathrm{Ex}$, $\mathrm{Co}$ by comparison with the ideal. Defined in [resource-deficit](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/content/theory-relative-ideal/content/resource-deficit/resource-deficit.md).
- **The improvement criterion**: an [idealization morphism](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/idealization-morphism.md) $\eta^T_R : v^R \to v^R_{T,\infty}$ exists iff $\mathrm{Ex}(v^R, T) = \mathrm{Co}(v^R, T) = \emptyset$.

Without the embedding $\iota$ and host theory $T$, a predication settling has no ideal, no deficit structure, and no idealization morphism. The resource triple is the structure that enables all three.

## The settling alone is not enough

A predication settling $v^R$ in isolation has its own closure operator $\mathrm{Cl}^R$ and its own internal fixed point. But the theory-relative ideal $v^R_{T,\infty} = \iota^*(v^T_\infty)$ is determined by the HOST THEORY's closure $\mathrm{Cl}^T$, applied to $v^T$ and then restricted to $\mathcal{C}^R$ via $\iota$. In general $\mathrm{Cl}^R(v^R) \leq_k v^R_{T,\infty}$ with strict inequality possible — the theory derives things about the resource that the resource cannot derive about itself.

The resource triple makes this external standard explicit. The settling $v^R$ is the current state; the embedding $\iota$ is the scope relationship; the host theory $T$ is the source of the standard.
