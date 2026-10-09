---
kind: theorem
status: proved
depends-on: [spatiotemporal-knowledge-presheaf, knowledge-presheaf-category, knowledge-presheaf-preorder-morphism, predication-fiber-algebra, knowledge-order]
title: knowledge presheaf category completeness and cocompleteness
description: The knowledge presheaf category $\mathbf{KP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has all small limits and colimits, computed pointwise.
---

# knowledge presheaf category completeness and cocompleteness

The [knowledge presheaf category](knowledge-presheaf-category.md) $\mathbf{KP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has all small limits and colimits, computed pointwise.

## Proof

An [knowledge presheaf](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) is a $\leq_k$-monotone family of valuations in $\prod_p A_p$, indexed by the set-sized ordinal $\lambda$.
Pointwise meet (respectively, join) of a small family of such knowledge presheaves gives another $\leq_k$-monotone family in $\prod_p A_p$, because each [predication fiber algebra](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/knowledge-presheaf-category/objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie E \times E}$ is a complete lattice in the [knowledge order](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/knowledge-presheaf-category/concepts/knowledge-order.md) and monotonicity is preserved by pointwise operations.
Under the preorder-enriched morphism structure given by [knowledge-presheaf preorder morphisms](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/knowledge-presheaf-category/morphisms/knowledge-presheaf-preorder-morphism.md), pointwise meet is the categorical product (limit over a discrete diagram) and pointwise join is the coproduct; general small limits and colimits follow the same pattern. $\square$

## Corollary

The pointwise $\vee_k$-join of two knowledge presheaves $v, v'$ — that is,

$$(v \vee_k v')_\tau(p)(s, o) := v_\tau(p)(s, o) \vee_k v'_\tau(p)(s, o)$$

— is a $\leq_k$-semilattice operation on knowledge presheaves.
This pointwise join serves as the merge operation for distributed knowledge presheaf replicas, established formally in the [CRDT convergence theorem](../../../../../../../../../logic-services-section/content/text/glossary/concepts/crdt-convergence.md).
