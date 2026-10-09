---
kind: definition
type: cosheaf
depends-on: [quantale-enriched-sheaf, d-frame, bitopological-settling-site, paired-priestley-space]
---

# Q-enriched cosheaf on a Grothendieck site

The dual notion to a [Q-enriched sheaf](../../quantale-enriched-sheaf.md).
A **$\mathsf{Q}$-enriched cosheaf** on a Grothendieck site $(\mathbf{T}, J)$ is a *covariant* functor $\check{F} : \mathbf{T} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ satisfying a colimit (rather than limit) compatibility with the topology — values "spread out" along covers rather than restricting along them.

This is the cosheaf side of the [@ghrist-riess2022] / [@ghrist-et-al2025] / [@lopez2024] enriched cellular sheaf framework, generalized from network/graph bases to general Grothendieck sites.

## Definition

A $\mathsf{Q}$-enriched cosheaf is a covariant functor

$$\check{F} \,:\, \mathbf{T} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$$

such that for every covering family $\{f_i : U_i \to U\}_{i \in I} \in J$, the canonical $\mathsf{Q}$-functor

$$\mathrm{Coeq}\Bigl(\bigsqcup_{i, j} \check{F}(U_i \times_U U_j) \rightrightarrows \bigsqcup_i \check{F}(U_i)\Bigr) \,\longrightarrow\, \check{F}(U)$$

is an *equivalence* of complete weighted lattices, where $\mathrm{Coeq}$ is the coequalizer in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.

(Compare the [Q-enriched sheaf condition](../../quantale-enriched-sheaf.md), which uses an equalizer rather than a coequalizer, and contravariance rather than covariance.)

The category of $\mathsf{Q}$-enriched cosheaves $\mathrm{coShv}(\mathbf{T}, J; \mathsf{Q})$ is the full subcategory of $\mathsf{Q}$-enriched copresheaves satisfying this condition.

## Relationship to Q-enriched sheaves

In the abelian / vector-space setting, sheaves and cosheaves are formally dual: a sheaf has "restriction" maps going from larger to smaller objects (contravariant), a cosheaf has "extension" maps going from smaller to larger (covariant).
[@curry2014]'s derived equivalence between cellular sheaves and cellular cosheaves on regular CW complexes establishes that this formal duality lifts to a derived equivalence — recovering Verdier duality.

In the $\mathsf{Q}$-enriched setting, the same formal duality applies: a $\mathsf{Q}$-enriched sheaf has $\mathsf{Q}$-functor restrictions $F(\sigma \to \tau) : F(\tau) \to F(\sigma)$ for $\sigma \to \tau$ in $\mathbf{T}$; a $\mathsf{Q}$-enriched cosheaf has $\mathsf{Q}$-functor extensions $\check{F}(\sigma \to \tau) : \check{F}(\sigma) \to \check{F}(\tau)$ in the same direction as the morphism.
The right $\mathsf{Q}$-adjoints of the restrictions ($F(f)^*$) play the role of cosheaf extensions for the corresponding cosheaf, which is the structural basis for the [Verdier duality theorem](../theorems/verdier-duality-bitopological-site.md) on Q-enriched sheaves.

## Specialization to d-frame-valued cosheaves

For our [bitopological settling site](../../../../bitopological-settling-site.md) and the d-frame value category, the **d-frame-valued cosheaf** $\check{\mathbb{F}}_v$ associates to each $(q, \tau, U)$ a d-frame $\check{\mathbb{F}}_v(q, \tau, U) = (\check{L}_+, \check{L}_-, \check{\mathrm{con}}, \check{\mathrm{tot}})$, with extension maps along site morphisms (rather than restrictions).

A natural construction: for each $(q, \tau, U)$, the cosheaf value records *eventually-uncovered cells* — cells in $U$ at stage $\tau$ that are not yet designated.
As $U$ grows or $\tau$ advances, the uncovered cells decrease (extension is "shrinking" toward the cover-complement).
The d-frame structure on the uncovered cells records the same consistency-totality structure as on the covered cells, giving a Belnap-flavored cosheaf-side dual.

The relationship to the [d-frame-valued sheaf](../../../../../sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) $\mathbb{F}_v$ via Verdier duality: $\check{\mathbb{F}}_v$ is the cosheaf such that the [Verdier duality theorem](../theorems/verdier-duality-bitopological-site.md) gives a derived equivalence $\mathbb{F}_v \simeq \check{\mathbb{F}}_v$.

## Position in the program

Companion to [Q-enriched sheaf](../../quantale-enriched-sheaf.md).
The two together set up the categorical framework for Verdier duality in the bilattice-valued cohomology chapter's setting.
The substantive theorem stating their derived equivalence is [Verdier duality on the bitopological settling site](../theorems/verdier-duality-bitopological-site.md).
