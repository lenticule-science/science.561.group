---
type: narrative
introduces: [bigraded-settling-cohomology]
---

# Bigraded cohomology refinements

The standard [settling cohomology](../objects/settling-cohomology.md) $H^n(\mathbf{T}^*, \mathcal{F}_U)$ collapses the truth-order and knowledge-order data into a single graded invariant. A finer development resolves them separately into a *bigraded cohomology* $H^{m,n}_{k,t}$ on the [bitopological settling site](../objects/bitopological-settling-site.md), with one grading axis tracking knowledge-order ($\leq_k$) sheaves and the other tracking truth-order ($\leq_t$) sheaves.

The chapter develops:

- The [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) — the bigraded chain complex and its derived functors.

- The [truth–knowledge comparison long exact sequence](../theorems/truth-knowledge-cohomology-long-exact-sequence.md) — the fundamental tool relating the two adjoint systems' cohomologies.

- [Bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md) — a refinement of the aperiodic-regime classification that distinguishes three bigraded patterns within the aperiodic stratum.

- [Bigraded cohomology as a mapping cone](../theorems/bigraded-cohomology-via-mapping-cone.md) — a presentation of the bigraded cohomology as the mapping cone of the comparison map between $\leq_k$- and $\leq_t$-cohomologies.

The bigraded refinement is structurally finer than the standard cohomology — it resolves invariants that the single-graded cohomology averages out. For settlings with non-trivial paraconsistent content, the bigraded version is what carries the full classifying data.

## Two distinct "bigraded" structures in the corpus

A naming clarification, surfaced by the May 2026 [bigraded common knowledge theorem](../theorems/bigraded-common-knowledge.md): the corpus now contains *two* mathematically distinct bigradings, both natural and both called "bigraded":

1. **Bigraded settling cohomology** (this chapter): bigraded by *evidential degree* via the splitting $\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$ (consistent ⊕ paraconsistent components). Indices $(m, n)$ with $m \in \{0, 1\}$ tracking consistent vs paraconsistent and $n$ the cohomological degree.

2. **Bigraded common knowledge** (the modal/epistemic chapter): bigraded by *bilattice order* via the predication hyperdoctrine's two parallel adjoint systems. Truth-axis $C^t \phi := \mathrm{gfp}_{\leq_t}\, \psi.\, \phi \wedge_t E^t \psi$ and knowledge-axis $C^k \phi := \mathrm{gfp}_{\leq_k}\, \psi.\, \phi \wedge_k E^k \psi$ are *two independent* greatest-fixed-point operators on the same input formula, with potentially different bottoms (e.g., on benchmark-5: $C^t p = (\mathbf{f},\mathbf{f},\mathbf{f})$ vs $C^k p = (\bot,\bot,\bot)$).

Both bigradings derive from the predication hyperdoctrine's two parallel adjoint systems, but operate at different layers (sheaf-cohomology layer for the cohomology bigrading; modal-operator layer for the common-knowledge bigrading). The structural relationship between them — how $C^t \phi$ relates to the consistent-component sheaf $\mathcal{F}^{(t)}$, how $C^k \phi$ relates to $\mathcal{F}^{(k)}$ as a whole — is the natural follow-up. See the [two-bigraded-structures-relationship question](../questions/two-bigraded-structures-relationship.md) for this open territory.
