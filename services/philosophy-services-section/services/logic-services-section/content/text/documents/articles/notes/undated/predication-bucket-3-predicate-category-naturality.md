---
kind: concept
type: condition
depends-on: [spatiotemporal-knowledge-presheaf, predicate-category, predication-fiber-functor]
title: Predicate-category naturality
description: "A spatiotemporal knowledge presheaf $v = (v\\tau){\\tau < \\lambda}$ is $\\mathcal{C}$-closed at step $\\tau$ if for every morphism $f : q \\to p$ in the predicate category $\\mathcal{C}$,"
---

# Predicate-category naturality

A [spatiotemporal knowledge presheaf](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) $v = (v_\tau)_{\tau < \lambda}$ is **$\mathcal{C}$-closed at step $\tau$** if for every morphism $f : q \to p$ in the [predicate category](../../research/2026/07/31/lenticule-import/objects/predicate-category.md) $\mathcal{C}$,

$$f^*(v_\tau(p)) = v_\tau(q),$$

where $f^*$ is the action of $f$ under the [predication fiber functor](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/references/predication-fiber-functor.md). It is **fully $\mathcal{C}$-closed** if it is $\mathcal{C}$-closed at every $\tau < \lambda$.

The $\mathcal{C}$-naturality condition is not required of arbitrary knowledge presheaves. A pre-closure settling state may assert evidence at a specialized predicate $q$ without the corresponding evidence having been derived at its super-predicate $p$; the [closure operator](../../research/2026/07/31/lenticule-import/morphisms/closure-operator.md) fires to restore naturality. At quiescence, a [closure-driven](../../research/2026/07/31/lenticule-import/from-predicate-category/closure-drivenness.md) knowledge presheaf is fully $\mathcal{C}$-closed.

A fully $\mathcal{C}$-closed knowledge presheaf is equivalently a functor $\mathbf{M} : \mathcal{C}^{\mathrm{op}} \times \lambda \to \mathbf{DBiLat}_\ast(\mathbf{L})$ into the category of pointed distributive bilattices, sending $(p, \tau)$ to the pointed algebra $(A_p, v_\tau(p))$ — predicate-functoriality is the $\mathcal{C}$-naturality condition, and settling-functoriality is [knowledge-order](../../research/2026/07/31/lenticule-import/from-predicate-category/knowledge-order.md) monotonicity of the distinguished point. A general knowledge presheaf is a pre-functorial object that *becomes* a presheaf under closure — the name reflects this limit.
