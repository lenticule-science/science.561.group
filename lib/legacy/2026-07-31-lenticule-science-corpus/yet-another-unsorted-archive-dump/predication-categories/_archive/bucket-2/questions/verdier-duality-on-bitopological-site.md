---
type: question
class: internal
status: partial
explores: [bitopological-settling-site, settling-cohomology, aperiodic-regime-classification, anderson-putnam-direct-limit, verdier-duality-bitopological-site, quantale-enriched-cosheaf]
---

# Verdier duality on the bitopological settling site

[@curry2014] Ch. 12 establishes a derived equivalence between cellular sheaves and cellular cosheaves on a finite cell complex, recovering [@shepard1985]'s Verdier duality. The parallel on the [bitopological settling site](../objects/bitopological-settling-site.md) is natural but not developed.

Open: extend Curry's cellular-sheaf / cellular-cosheaf derived equivalence to the bitopological paired-Priestley site. The result should be a duality between [settling cohomology](../objects/settling-cohomology.md) and a dual "settling co-cohomology" that might yield alternative invariants.

Specific structural questions:

- What are the right cosheaves? Cellular cosheaves on Curry's setting reverse arrow direction; on the present site that becomes cosheaves on $\mathbf{T}^*_{\mathrm{site}}$ assigning sections to triples $(q, \tau, U)$ contravariantly.
- Does the duality carry the [aperiodic-regime classification](../theorems/aperiodic-regime-classification.md) to a co-classification? An "aperiodic co-invariant" sitting in $H^1$ of cosheaves rather than sheaves might be the same data viewed from the other side.
- What does the duality say about the [Anderson–Putnam direct-limit](../objects/anderson-putnam-direct-limit.md) construction? Inverse limits dualize to direct limits; cosheaves on transfinite indexings might give an inverse-limit framework dual to the direct-limit one of the cohomology.

Settling this would produce a parallel formulation of this layer, possibly cleaner in some computational respects, and would clarify the geometric content of the bitopological site.

Related: [Six-functor formalism for settling cohomology](six-functor-formalism-for-settling-cohomology.md) — Verdier duality is the $\mathbb{D}$-functor of the six-functor package; this question targets the duality piece specifically, the six-functor question targets the full package. [Bilattice-valued sheaves](bilattice-valued-sheaves.md) — paired Priestley spaces are the spatial framing of the bigraded value-type axis, and Verdier duality has its cleanest form on that side of the duality square. A bilattice-native Verdier duality would be substantively different from the $\mathbf{Ab}$-valued one this question stages.

**Update from the d-frame chapter.** The Q-enriched cohomology infrastructure ([Q-enriched cohomology](../objects/q-enriched-cohomology.md)) now provides the framework for stating Verdier duality in the d-frame setting precisely. The d-frame analogue would be: a derived equivalence between $\mathsf{Q}$-enriched cellular sheaves and $\mathsf{Q}$-enriched cellular cosheaves on the bitopological settling site, with both kernel/image quotients computed in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$. The d-frame's symmetric structure (paired $L_+$ and $L_-$ frames) is itself a Verdier-duality-flavored setup at the value-category level — the bilattice negation $\neg$ swaps $L_+ \leftrightarrow L_-$, paralleling the spatial swap involution on paired Priestley spaces. So a d-frame-native Verdier duality would have *two* dualities composing: the value-category swap and the spatial cellular-sheaf-cosheaf duality.

**Status: chapter opened.** The corpus now has a [Verdier duality chapter](../narratives/verdier-duality-opener.md) developing this question:

- [Q-enriched cellular cosheaf](../objects/quantale-enriched-cosheaf.md) defined.
- [Verdier duality theorem](../theorems/verdier-duality-bitopological-site.md) (sketch) stated, with proof structure in three pieces: Curry's derived equivalence lifted to Q-enrichment, fiber-to-global assembly, and the two-dualities-composing structure.
- Literature anchors: [@curry2014] cellular sheaf-cosheaf derived equivalence, [@lopez2024] quantale-enriched cosheaves, [@kishimoto-yushima2022] cosheaf homology, [@murali2020] cosheaf Verdier on rigid analytic spaces.

The question is no longer "open" in the framing-only sense — it's an in-progress chapter with sketch theorems and identified open work.
