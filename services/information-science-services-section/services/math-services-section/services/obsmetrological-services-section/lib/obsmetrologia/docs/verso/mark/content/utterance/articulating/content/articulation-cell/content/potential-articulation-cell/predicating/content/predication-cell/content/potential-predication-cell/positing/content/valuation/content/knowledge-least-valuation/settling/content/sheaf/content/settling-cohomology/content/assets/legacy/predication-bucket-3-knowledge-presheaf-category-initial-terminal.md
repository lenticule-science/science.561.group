---
kind: theorem
status: proved
depends-on: [spatiotemporal-knowledge-presheaf, knowledge-presheaf-category, knowledge-presheaf-preorder-morphism, knowledge-order]
---

# Initial and terminal objects in the knowledge presheaf category

The [knowledge presheaf category](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/knowledge-presheaf-category.md) $\mathbf{KP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has both a **terminal object** $\mathbf{1}$ — the constant-$\top$ [knowledge presheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md), defined by $v_\tau^{\mathbf{1}}(p)(s, o) = \top$ for all $p, \tau, s, o$ — and an **initial object** $\mathbf{0}$ — the constant-$\bot$ knowledge presheaf, defined by $v_\tau^{\mathbf{0}}(p)(s, o) = \bot$ for all $p, \tau, s, o$.

## Proof

Under the preorder-enriched morphism structure given by [knowledge-presheaf preorder morphisms](../morphisms/knowledge-presheaf-preorder-morphism.md), a morphism $v \to v'$ exists iff $v \leq_k v'$ pointwise in the [knowledge order](../concepts/knowledge-order.md). Every knowledge presheaf $v$ satisfies $v \leq_k \mathbf{1}$ (since $\top$ is the $\leq_k$-top), so $\mathbf{1}$ is terminal. Every knowledge presheaf $v$ satisfies $\mathbf{0} \leq_k v$ (since $\bot$ is the $\leq_k$-bottom), so $\mathbf{0}$ is initial. In both cases the morphism is unique because all morphisms between a given pair are identified in the preorder-enriched category. $\square$
