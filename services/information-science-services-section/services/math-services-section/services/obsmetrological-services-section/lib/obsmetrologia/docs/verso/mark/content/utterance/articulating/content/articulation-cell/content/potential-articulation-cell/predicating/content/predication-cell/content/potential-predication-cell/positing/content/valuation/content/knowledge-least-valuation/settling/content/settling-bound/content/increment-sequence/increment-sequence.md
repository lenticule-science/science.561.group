---
kind: definition
realizes: [evidence]
symbol: U
depends-on: [predication-valuation, settling-bound, predicate-category, predicate-category-naturality]
---

# Increment sequence

A family $U = (u_\tau)_{\tau < \lambda}$ indexed by a [settling bound](settling-bound.md) $\lambda$, where each $u_\tau$ is a [predication valuation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predication-valuation.md) that is [$\mathcal{C}$-natural](../../../../../../../../../../../../../predicate-category/content/predicate-category-naturality/predicate-category-naturality.md) — that is, $f^*(u_\tau(p)) = u_\tau(q)$ for every morphism $f : q \to p$ in the [predicate category](predicate-category.md) $\mathcal{C}$.

The increment sequence is the input data driving a [closure-driven](../concepts/closure-drivenness.md) [spatiotemporal knowledge presheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md): each $u_\tau$ supplies the new evidence introduced at settling step $\tau$, joined into the previous settling state and then closed under the closure operator.
