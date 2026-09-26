---
kind: definition
realizes: [orbifold-moduli-point, rigid-moduli-point]
type: set
symbol: "|\\mathrm{KP}^{\\mathrm{vis}}(B)|"
depends-on: [visible-settling-fiber-groupoid, mutually-locally-derivable, four-regime-dichotomy]
title: Coarse settling moduli
description: "For a fixed base $B = (\\mathbf{L}, \\mathcal{C}, E, \\lambda)$, the coarse settling moduli is the set of components of the visible settling fiber groupoid:"
---

# Coarse settling moduli

For a fixed base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, the **coarse settling moduli** is the set of components of the [visible settling fiber groupoid](visible-settling-fiber-groupoid.md):

$$|\mathrm{KP}^{\mathrm{vis}}(B)| \;:=\; \pi_0(\mathrm{KP}^{\mathrm{vis}}(B)) \;=\; \mathrm{KP}(B) \,/\, \sim_{\mathrm{MLD}}.$$

A point of the coarse moduli is an [MLD-equivalence class](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/content/concepts/mutually-locally-derivable.md) of settlings over $B$.
The 0-truncation functor $|\cdot| : \mathrm{Gpd} \to \mathrm{Set}$ — sending a groupoid to its set of connected components — produces the underlying point-set of the moduli.

## What lives on the coarse moduli

- The [moduli classifying function](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/content/coarse-settling-moduli/moduli-classifying-function.md) $\mathcal{I}_B : |\mathrm{KP}^{\mathrm{vis}}(B)| \to \{$ sheaf-iso classes $\}$ sending each MLD-class to its [settling-associated sheaf](../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md)'s isomorphism class.
- The [regime decomposition](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/content/theorems/regime-decomposition.md) $|\mathrm{KP}^{\mathrm{vis}}(B)| = \bigsqcup_X |\mathrm{KP}^{\mathrm{vis}}(B)|_X$ partitioning by [regime](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) label.
- Within each regime stratum, the [rigid](../../../../glossary/concepts/rigid-moduli-point.md) / [orbifold](../../../../glossary/concepts/orbifold-moduli-point.md) substratification by visible-auto symmetry of the underlying settling.

## What does not live here

Automorphism data is lost when passing to the coarse moduli — that data is in the visible settling fiber groupoid above.
For stack-theoretic questions the groupoid is the right object; for *classification* questions the set of MLD-classes suffices, and the coarse moduli is the natural target.
