---
kind: morphism
type: operator
symbol: "\\Diamond_R"
depends-on: [world-set, bilattice-accessibility-relation, predication-fiber-algebra, twist-product-fusion, truth-order]
title: Modal possibility operator
description: "The modal possibility operator $\\DiamondR$ acts dually to the modal necessity operator: for a family $u = (uw){w \\in W}$ over a world set $W$, where each $uw \\in Ap$ is in the predication fiber algebra at some predicate $p$,"
---

# Modal possibility operator

The **modal possibility operator** $\Diamond_R$ acts dually to the [modal necessity operator](modal-necessity-operator.md): for a family $u = (u_w)_{w \in W}$ over a [world set](../../research/2026/07/31/objects/world-set.md) $W$, where each $u_w \in A_p$ is in the [predication fiber algebra](../../research/2026/07/31/objects/predication-fiber-algebra.md) at some [predicate](../../research/2026/07/31/concepts/predicate.md) $p$,

$$(\Diamond_R u)_w(s, o) := \bigvee_t \{ R(w, w') \odot u_{w'}(s, o) : w' \in W \},$$

where $\bigvee_t$ is the [truth-order](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) join on $\mathbf{L}^\bowtie$, $R$ is a [bilattice accessibility relation](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md), and $\odot$ is the [twist-product fusion](../../research/2026/07/31/lenticule-import/twist-product-fusion.md) per-cell.

This is the four-valued analogue of the classical Kripke possibility operator. When $\mathbf{L} = \mathbf{2}$ and $R$ is $\{0, 1\}$-valued, $\Diamond_R$ reduces to the classical Boolean possibility operator.
