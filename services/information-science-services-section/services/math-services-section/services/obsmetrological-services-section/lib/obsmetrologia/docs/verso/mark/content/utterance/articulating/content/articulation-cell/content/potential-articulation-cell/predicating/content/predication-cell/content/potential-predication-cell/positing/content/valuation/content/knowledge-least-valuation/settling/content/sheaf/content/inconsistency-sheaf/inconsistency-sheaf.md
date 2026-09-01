---
kind: definition
realizes: [kz-coherent-sheaf, cohomological-equivalence]
type: sheaf
symbol: "\\mathcal{F}_U^{(\\top)}"
depends-on: [settling-associated-sheaf, paraconsistent-settling-associated-sheaf, four-bilattice]
---

# Inconsistency sheaf

The cokernel of the inclusion $\mathcal{F}_U \hookrightarrow \mathcal{F}_U^{(k)}$, tracking newly-added $\top$-valued ("told both") cells alone — the paraconsistent-evidence content of an [knowledge presheaf](spatiotemporal-knowledge-presheaf.md) settling.

For each $(q, \tau)$, the newly-added designated cell set decomposes as the disjoint union

$$\Delta^+_\tau(q) \;=\; \Delta^{+, \mathbf{t}}_\tau(q) \;\sqcup\; \Delta^{+, \top}_\tau(q),$$

with $\Delta^{+, \mathbf{t}}_\tau(q)$ the $\mathbf{t}$-only part and $\Delta^{+, \top}_\tau(q)$ the $\top$-only part.
The [paraconsistent settling-associated sheaf](paraconsistent-settling-associated-sheaf.md) decomposes correspondingly:

$$\mathcal{F}_U^{(k)} \;\cong\; \mathcal{F}_U^{(t)} \,\oplus\, \mathcal{F}_U^{(\top)},$$

where $\mathcal{F}_U^{(t)} = \mathcal{F}_U$ is the [truth-side settling-associated sheaf](settling-associated-sheaf.md) and the **inconsistency sheaf**

$$\mathcal{F}_U^{(\top)}(q, \tau, U) \;:=\; \mathbb{Z}^{\Delta^{+, *, \top}_\tau(q) \,\cap\, U}$$

is the free abelian group on newly-added $\top$-valued cells lying in the pairwise-Stone clopen $U$, with restriction maps as in $\mathcal{F}_U$.

## Reading

$\mathcal{F}_U^{(\top)}$ tracks *contradictory* evidence cell-by-cell: cells where the settling has accumulated $\top$ — both positive and negative evidence — without trivializing because the bilattice setting treats $\top$ as a designated value rather than a logical collapse.
For a *consistent* knowledge presheaf that never produces $\top$-cells, $\mathcal{F}_U^{(\top)} = 0$ identically.
For an *inconsistent* knowledge presheaf, $\mathcal{F}_U^{(\top)}$ is non-zero and its cohomology measures the paraconsistent-evidence-structure of the settling independently of the $\mathbf{t}$-only classical content.

## Where this enters

The short exact sequence

$$0 \,\to\, \mathcal{F}_U^{(t)} \,\to\, \mathcal{F}_U^{(k)} \,\to\, \mathcal{F}_U^{(\top)} \,\to\, 0$$

induces the [truth-knowledge cohomology long exact sequence](../theorems/truth-knowledge-cohomology-long-exact-sequence.md) and is the input to the [bigraded settling cohomology](bigraded-settling-cohomology.md).
