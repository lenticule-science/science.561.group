---
type: definition
realizes: [kz-coherent-sheaf, cohomological-equivalence]
class: sheaf
symbol: "\\mathcal{F}_U^{(k)}"
depends-on: [settling-associated-sheaf, knowledge-order, four-bilattice]
---

# Paraconsistent settling-associated sheaf

The Belnap-designated parallel of the [settling-associated sheaf](settling-associated-sheaf.md) $\mathcal{F}_U$, using the full designated set $\{\mathbf{t}, \top\} \subseteq \mathbf{FOUR}$ instead of just $\{\mathbf{t}\}$.

For each $(q, \tau)$, define the **set of newly-added Belnap-designated cells**:

$$\Delta^{+, \mathrm{Belnap}}_\tau(q) \;:=\; \{(s, o) \,:\, v_\tau(q)(s, o) \in \{\mathbf{t}, \top\} \text{ and } v_{\tau'}(q)(s, o) \notin \{\mathbf{t}, \top\} \text{ for all } \tau' < \tau\}.$$

Via duality each such cell corresponds to a Priestley point in $X_q^\tau$; write $\Delta^{+, *, \mathrm{Belnap}}_\tau(q) \subseteq X_q^\tau$ for the image. The **paraconsistent settling-associated sheaf** is

$$\mathcal{F}_U^{(k)}(q, \tau, U) \;:=\; \mathbb{Z}^{\Delta^{+, *, \mathrm{Belnap}}_\tau(q) \,\cap\, U},$$

with the same restriction maps as $\mathcal{F}_U$ extended over the larger designated set.

## Relation to the truth-side sheaf

The inclusion $\{\mathbf{t}\} \hookrightarrow \{\mathbf{t}, \top\}$ induces a natural transformation

$$\iota \,:\, \mathcal{F}_U \,\longrightarrow\, \mathcal{F}_U^{(k)}.$$

The cokernel $\mathcal{F}_U^{(\top)} := \mathcal{F}_U^{(k)} / \mathcal{F}_U$ tracks newly-added $\top$-cells alone — the "told both" inconsistency increments. The short exact sequence

$$0 \,\to\, \mathcal{F}_U \,\to\, \mathcal{F}_U^{(k)} \,\to\, \mathcal{F}_U^{(\top)} \,\to\, 0$$

induces the long exact sequence in cohomology that connects the truth-order and knowledge-order cohomologies, and is the input to the bigraded cohomology $H^{m, n}_{k, t}$ of the [two-internal-logics](../theorems/two-internal-logics.md) structure.

## Reading

Where [$\mathcal{F}_U$](settling-associated-sheaf.md) tracks classical $\mathbf{t}/\mathbf{f}$-style designations cell-by-cell, $\mathcal{F}_U^{(k)}$ also tracks paraconsistent $\top$ contributions — making it the right object when the application treats inconsistency ($\top$) as non-trivializing information rather than excluding it.
