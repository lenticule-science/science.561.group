---
kind: concept
type: condition
depends-on: [spatiotemporal-knowledge-presheaf, knowledge-order]
---

# Settling continuity

A [spatiotemporal knowledge presheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) $v = (v_\tau)_{\tau < \lambda}$ is **continuous** if for every limit ordinal $\mu < \lambda$ and every [predicate](predicate.md) $p$,

$$v_\mu(p) = \bigvee_k \{ v_\sigma(p) : \sigma < \mu \}$$

pointwise — the cellwise [knowledge-order](knowledge-order.md) join (colimit) of the values at all earlier settling steps.

Settling continuity says the value at a limit ordinal is determined as the directed knowledge-join of values at preceding steps; no new content is introduced at limits beyond what is approached from below.
