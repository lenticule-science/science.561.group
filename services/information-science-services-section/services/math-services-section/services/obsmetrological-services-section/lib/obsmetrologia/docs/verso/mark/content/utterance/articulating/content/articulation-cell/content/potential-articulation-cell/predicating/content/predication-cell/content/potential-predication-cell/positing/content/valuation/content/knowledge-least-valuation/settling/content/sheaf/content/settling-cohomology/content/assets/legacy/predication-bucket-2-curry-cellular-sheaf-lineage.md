---
type: narrative
discusses: [settling-cohomology, bitopological-settling-site, alexandrov-topology, anderson-putnam-direct-limit]
---

# The Curry cellular-sheaf lineage

The methodological backbone of the cohomology layer is [@curry2014]'s cellular-sheaf framework — *Sheaves, Cosheaves and Applications*. Curry established that cellular sheaves on finite cell complexes are equivalently sheaves on the face poset under the [Alexandrov topology](../objects/alexandrov-topology.md) (Ch. 4), with computable cohomology via the cellular cochain complex (Ch. 6) and enough projectives/injectives for homological algebra. The view "sheaves on a poset-like base carry the content" is what this layer inherits, and extends in three directions.

**From $\mathrm{Vect}$/$\mathbf{Ab}$ on posets to $\mathbf{Ab}$ on bitopological sites.** Curry works with finite-dimensional vector spaces and abelian groups on finite cell complexes. The [bitopological settling site](../objects/bitopological-settling-site.md) carries $\mathbf{Ab}$-valued sheaves on a paired-Priestley site that mixes Alexandrov-style poset structure (along the predicate-and-settling axes) with bitopological pairwise-Stone structure (within each fiber). The homological-algebra framework is unchanged; the topology is enriched.

**From finite complexes to transfinite settle-indexed sites.** Curry's cellular sheaves on finite complexes extend to infinite posets via the Roos complex and the [@ayzenberg-magai2025] minimal cochain complex — these tools cover the strict, Scott-continuous, and transfinite-bounded regimes cleanly. The aperiodic regime pushes further, into transfinite settling indexing where the closure ordinal is at least $\omega_1$. The [Anderson–Putnam direct limit](../objects/anderson-putnam-direct-limit.md) construction supplies the technical bridge, transporting Curry's finite-stage cellular cohomology into the direct-limit setting.

**From abelian coefficients to bilattice-enriched structure.** The sheaves of this layer live in $\mathbf{Ab}$ but track bilattice content via the paired-Priestley fiber structure. The [internal $\mathbb{Z}/2$-gauge](../concepts/internal-z2-gauge.md) from bilattice negation acts on the entire apparatus, giving the [equivariant settling cohomology](../theorems/equivariant-settling-cohomology.md) that Curry's framework does not see — though for $\mathbf{t}$-designated settling-associated sheaves the gauge is effectively trivial.

Curry's derived equivalence between cellular sheaves and cellular cosheaves — recovering [@shepard1985]'s Verdier duality — is not developed here; a paired-Priestley analogue is open as [Verdier duality on the bitopological site](../questions/verdier-duality-on-bitopological-site.md).
