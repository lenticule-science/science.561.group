---
kind: definition
realizes: [cohomological-equivalence, kz-coherent-sheaf, settling-local-constancy]
type: sheaf
symbol: "\\mathcal{F}_U"
depends-on: [bitopological-settling-site, kz-coherent-sheaf, increment-sequence, spatiotemporal-knowledge-presheaf, paired-priestley-space, predication-cell]
---

# Settling-associated sheaf

The central object of the cohomological development. An $\mathbf{Ab}$-valued [KZ-coherent sheaf](../concepts/kz-coherent-sheaf.md) on the [bitopological settling site](bitopological-settling-site.md) whose values count newly-added designated [predication cells](../concepts/predication-cell.md) at each settling stage.

## Construction

Fix an [knowledge presheaf](spatiotemporal-knowledge-presheaf.md) $(\mathcal{E}, c)$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with [increment sequence](increment-sequence.md) $U = (u_\tau)_{\tau < \lambda}$. For each $(q, \tau) \in \mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}$, the **set of newly-added designated cells** at stage $\tau$ is

$$\Delta^+_\tau(q) \;:=\; \{(s, o) \in E \times E \,:\, v_\tau(q)(s, o) = \mathbf{t} \text{ and } v_{\tau'}(q)(s, o) \neq \mathbf{t} \text{ for all } \tau' < \tau\},$$

with the convention that $\Delta^+_0(q)$ equals the $\mathbf{t}$-support of the initial state $v_0(q)$. Via [Jung–Rivieccio duality](../theorems/jung-rivieccio-duality.md), each cell $(s, o) \in \Delta^+_\tau(q)$ corresponds to a $+$-point $(s, o, +)$ in the [paired Priestley dual](paired-priestley-space.md) $X_q^\tau$; write $\Delta^{+, *}_\tau(q) \subseteq X_q^\tau$ for the image.

The **settling-associated sheaf** is

$$\mathcal{F}_U(q, \tau, U) \;:=\; \mathbb{Z}^{\Delta^{+, *}_\tau(q) \,\cap\, U} \;\;\in \mathbf{Ab},$$

the free abelian group on the newly-added designated points lying in the pairwise-Stone clopen $U$. On a morphism $(f, h, j) : (q', \tau', U') \to (q, \tau, U)$, the dualized reindexing $(f \times h)^*$ sends $\Delta^{+,*}_{\tau'}(q') \cap U'$ into $\Delta^{+,*}_\tau(q) \cap U$ — newly-added-at-$\tau'$ points map to newly-added-at-$\tau$ or earlier-added points via the settling forgetful map, by [settling-monotonicity](../concepts/settling-monotonicity.md) on the primal becoming spectrum-shrinking on the dual. $\mathcal{F}_U$ acts by the induced $\mathbb{Z}$-linear map on free abelian groups.

Well-definedness: [settling-associated-sheaf well-defined](../theorems/settling-associated-sheaf-well-defined.md).

## Reading

$\mathcal{F}_U$ is a *local-increment-counting* sheaf: at each ordinal-predicate-clopen triple, it records which cells are newly added by the settling at that stage, tracked as $\mathbb{Z}$-coefficients for free-abelian-group computations. It is locally constant in [strict regime](../theorems/four-regime-dichotomy.md) (only one stage matters), acquires $\omega$-indexed structure in the Scott-continuous regime, transfinite-bounded structure in the transfinite-bounded regime, and $\omega_1$-indexed [aperiodic](../concepts/aperiodic-settling.md) structure in the aperiodic regime.

## Variants

The construction above uses *only* $\mathbf{t}$-valued cells, corresponding to classical truth-order designation. The parallel [paraconsistent settling-associated sheaf](paraconsistent-settling-associated-sheaf.md) uses the full Belnap-designated set $\{\mathbf{t}, \top\}$ and tracks the knowledge-order-sensitive increment data — input to the bigraded cohomology $H^{m,n}_{k,t}$.
