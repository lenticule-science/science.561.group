---
kind: definition
type: bitopological-space
depends-on: [priestley-space]
class: bitopological-space
---

# Pairwise Stone space

A **pairwise Stone space** is a bitopological space $(X, \tau_+, \tau_-)$ — a set carrying *two* topologies — that is compact and pairwise-separated in a sense parallel to ordinary Stone spaces but applied to both topologies simultaneously.

The category $\mathbf{PStone}$ of pairwise Stone spaces with bicontinuous maps is isomorphic to the category $\mathbf{Spec}$ of spectral spaces and to the category $\mathbf{Pries}$ of [Priestley spaces](../../../../priestley-space/priestley-space.md) ([@bezhanishvili-et-al2010] Theorems 2.9, 3.4):

$$\mathbf{PStone} \;\cong\; \mathbf{Spec} \;\cong\; \mathbf{Pries}.$$

The bitopological framing treats the two topologies — typically interpreted as $\tau_+$ from "positive evidence" and $\tau_-$ from "negative evidence" — symmetrically, matching the [paired Priestley space](../../../../priestley-space/content/paired-priestley-space/paired-priestley-space.md) structure on the dual of a [twist product](../../../../../../../../../../residuated-lattice/content/twist-product/twist-product.md). The pairwise-Stone view is the framing of choice when sheaves valued on the dual side need to track both topologies independently — as on the bitopological site $(\mathbf{T}^*, J)$ of the [dual predication hyperdoctrine](../../../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/content/dual-predication-hyperdoctrine/dual-predication-hyperdoctrine.md), where covering sieves are pairwise-open.
