---
type: narrative
discusses: [settling-cohomology, bitopological-settling-site, aperiodic-regime-classification, crdt-convergence-via-mayer-vietoris, dual-predication-hyperdoctrine]
---

# Cohomology relations to prior work

The cohomological layer is, in the parts that matter, an *assembly* of techniques drawn from five distinct mathematical traditions onto the dualized predication hyperdoctrine. Most individual moves are not novel — sheaf cohomology is classical Grothendieck–Godement–SGA 4; cellular-sheaf methodology is [@curry2014]; aperiodic-tiling cohomology is [@anderson-putnam1998]; the CRDT and CALM frameworks are [@shapiro-et-al2011] and [@hellerstein-alvaro2020] — and the novel content lies in the assembly itself, on the specific dualized object the [hyperdoctrinal layer](cohomology-series-position.md) provides as a target.

This narrative names the five traditions and the threading between them. Three are already developed as standalone narratives; two are absorbed into the construction without separate narrative treatment.

## Cellular-sheaf methodology — [@curry2014], [@ayzenberg-magai2025]

The methodological backbone for the site theory: sheaves on a poset-like base carry the cohomological content, with explicit cochain complexes available for computation. See [Curry cellular-sheaf lineage](curry-cellular-sheaf-lineage.md). The extensions in the cohomological layer are bilattice-enrichment (via the paired-Priestley dual), transfinite settling indexing (via direct limits), and the bitopological structure that distinguishes positive and negative evidence at every fiber.

## Priestley and bitopological sheaves — [@gehrke-vangool2019], [@bezhanishvili-et-al2010]

The conceptual move "sheaves on the Priestley dual of a lattice are the right object to study" is what licenses the [bitopological settling site](../../../../../../bitopological-settling-site/bitopological-settling-site.md) on the [dual predication hyperdoctrine](../../../../../../predication-hyperdoctrine/content/dual-predication-hyperdoctrine/dual-predication-hyperdoctrine.md). Gehrke–van Gool work with a single distributive lattice; the cohomological layer assembles Priestley duals of all fibers $A_q$ across the predicate base $\mathcal{C}$ and settling ordinal $\lambda$ into a single 2-categorical site, with the dualized generator morphisms and dualized closure-operator advancements as site morphisms. Bezhanishvili et al. supply the bitopological framing: $\mathbf{PStone} \cong \mathbf{Spec} \cong \mathbf{Pries}$, with the $\mathbf{PStone}$ form carrying the twist-product structure most transparently. The Jung–Moshier / Jakl d-frame framework supplies an algebraic axiomatization that the cohomological layer does not directly use but flags as a candidate value category for sheaves — an alternative to $\mathbf{Ab}$ left for [bilattice-valued sheaves](../questions/bilattice-valued-sheaves.md) downstream.

## Fibered induction and coinduction — [@hermida-jacobs1998], [@bonchi-et-al2014]

The settling-as-coalgebra view of the [hyperdoctrinal layer](settling-as-coalgebra.md) sits in a 2-categorical analogue of the [@hermida-jacobs1998] setting. The [settling endofunctor](../morphisms/settling-endofunctor.md) acts on $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$; a coalgebra for it is a predication settling. Predicate lifting along reindexing — the bilattice-valued, four-generator analogue — is what licenses the [predication fiber functor](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/references/predication-fiber-functor.md). [@bonchi-et-al2014]'s up-to-coinduction framework supplies an additional reading: closure is, formally, an up-to function on the settling coalgebra, and MLD-equivalence is an up-to relation.

## Aperiodic dynamics — [@anderson-putnam1998], [@sadun2008]

The [aperiodic-regime classification](../../../../../../aperiodic-settling/references/aperiodic-regime-classification.md) is structurally analogous to Anderson–Putnam's classification of substitution tilings via inverse-limit cohomology. See [aperiodic-dynamics template](aperiodic-dynamics-template.md). The technical machinery differs — tilings use branched-manifold inverse limits and Čech cohomology; settlings use bitopological-site direct limits and derived-functor cohomology on $\mathbf{Ab}$ — but the underlying story is the same: aperiodic structure is classified cohomologically, via direct limits of finite-stage invariants.

## Distributed-systems topology — [@herlihy-et-al2013], [@felber-et-al2025], [@hellerstein-alvaro2020]

The [CRDT Mayer–Vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md) reformulation and the [cohomological CALM](../../../references/cohomological-calm.md) extension fit into the broader topology-applied-to-distributed-systems arc. See [distributed-systems topology relation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/distributed-systems-topology-relation.md). The closest technical parallel is the Felber-et-al task-sheaf framework — both express distributed-computation properties via sheaf cohomology — but the frameworks differ in fiber values, temporal structure, primary question, and site base.

## What this assembly does

Individually, none of the five traditions handles a bilattice-valued, transfinite-settle-indexed, paired-Priestley-bitopological cohomology with a CRDT Mayer–Vietoris bridge and an aperiodic classification theorem. The cohomological layer is the assembly of all five at the structural level the [hyperdoctrinal layer](cohomology-series-position.md) provides as a target. Each tradition contributes its own apparatus; the assembly is what is new.
