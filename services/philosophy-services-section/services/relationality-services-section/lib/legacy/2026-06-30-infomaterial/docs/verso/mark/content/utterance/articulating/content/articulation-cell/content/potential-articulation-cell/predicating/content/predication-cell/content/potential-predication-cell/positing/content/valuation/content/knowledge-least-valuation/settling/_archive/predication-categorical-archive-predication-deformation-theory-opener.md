---
type: narrative
status: current
introduces: [skh-deformation-ext-classification]
discusses: [settling-moduli-stack-theorem, settling-cohomology, predication-hyperdoctrine, settling-cohomology-vanishes-above-degree-1, q-enriched-cohomology-higher-degree-vanishing, d-frame-verdier-composition]
---

# Deformation theory of predication settlings

The [settling moduli stack theorem](../../theorems/settling-moduli-stack-theorem.md) gives a 2-stack of settlings over the [parameter base category](../../objects/parameter-base-category.md) — a global picture of which settlings are equivalent and how they relate. **Deformation theory** is the local version: given a settling $v$, what *infinitesimal* perturbations are possible, and what classifies them?

This chapter develops deformation theory for predication settlings, building on the cohomological infrastructure now substantially in place (the [settling cohomology](../../objects/settling-cohomology.md) framework, the d-frame chapter's [Q-enriched cohomology](../../objects/q-enriched-cohomology.md), and the [Verdier duality chapter](verdier-duality-opener.md)'s six-functor formalism). The natural deformation-theoretic apparatus — Ext-classification, tangent complex, obstruction theory — fits cleanly into predication categories' existing structure, with predication categories' [vanishing-above-degree-1](../../theorems/settling-cohomology-vanishes-above-degree-1.md) theorem giving an *unobstructed* deformation theory at predication categories' typical regimes.

## Why this chapter exists

Three reasons:

1. **The natural sequel to moduli.** Moduli stacks ↔ tangent complexes ↔ deformations is the standard chain in derived algebraic geometry. The corpus has the moduli stack; the tangent and deformation structure is the next layer.

2. **An immediate payoff from $H^{\geq 2} = 0$.** The corpus's [vanishing-above-degree-1 theorem](../../theorems/settling-cohomology-vanishes-above-degree-1.md) (and its [Q-enriched analog](../../theorems/q-enriched-cohomology-higher-degree-vanishing.md)) gives an unusual structural feature: obstruction theory is degenerate above degree 1. Every first-order deformation extends to higher orders without obstruction. This is *uncommon* — most deformation problems carry non-trivial obstruction theories — and predication categories' structural setup gives it for free.

3. **The d-frame chapter's tangent refinement.** The bilattice-valued cohomology chapter shows predication categories' cohomology has *strictly more* structure than the $\mathbf{Ab}$-shadow — consistency / totality / negation-gauge data not visible to the abelianized version. The deformation theory inherits this richness: d-frame tangent classes distinguish perturbations of truth-only firings, falsity-only firings, and $\top$-firings, where the $\mathbf{Ab}$-shadow sees only the firing-ordinal set. The deformation theory is a place where the d-frame chapter's added structure pays off concretely.

## What the chapter develops

- The [Ext-classification of SKH deformations](../../theorems/skh-deformation-ext-classification.md) — first-order deformations of a settling $v$ classified by $\mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v)$ in the bitopological-settling-site sheaf category, with obstructions in $\mathrm{Ext}^2$ (vanishing per predication categories' structural theorems).
- The SKH tangent complex (future work) — the cochain complex computing $\mathrm{Ext}^\bullet$ of the universal settling-associated sheaf, containing the Ext-classification's tangent space data.
- The SKH obstruction theory (future work) — *unobstructed* in predication categories' typical setting via the vanishing-above-degree-1 result.

The chapter's distinctive content beyond the standard deformation-theory pattern:

- **Regime-stratification interactions.** The four-regime dichotomy stratifies the moduli; deformations can preserve or cross regime boundaries. Whether the regime is a locally-constant invariant under deformation, or whether deformations interpolate between regimes, is a substantive question (the [regime-stratification non-semicontinuity](../../theorems/regime-stratification-non-semicontinuity.md) suggests it is *not* locally constant in the topological sense).
- **d-frame tangent refinement.** First-order deformations in the d-frame setting carry strictly more structure than in the $\mathbf{Ab}$-shadow — consistency-relation perturbations and value-category-swap orbits give finer tangent data.
- **Strong-MLD interaction.** Deformations preserve or perturb the [composed-duality orbit type](../../theorems/strong-mld-classification.md) of a settling — refining the deformation theory by the orbit structure.

## Literature situation

Standard algebraic deformation theory (Gerstenhaber's foundational 1964 work; Hartshorne's standard treatment; @kashiwara-schapira2006 for the categorical setting) handles algebraic deformations via $\mathrm{Ext}$-classification. The bilattice-valued / Q-enriched extension is novel — quantale-graded deformation theory has been considered in some abstract categorical settings (Stubbe 2005 discusses Q-enriched limits and colimits foundationally) but not specifically applied to deformation problems on bilattice-flavored cohomology.

The corpus's deformation theory is positioned to:

- *Replicate the standard pattern* in the $\mathbf{Ab}$-valued shadow (giving baseline content via well-developed machinery).
- *Refine via the d-frame setting* to expose tangent-class structure invisible to the shadow.
- *Use the six-functor formalism* (now sketched at draft level) to transport deformation-theoretic results across hyperdoctrine morphisms.

## The openness-defect direction (cross-boundary deformation theory)

The chapter's existing apparatus is structurally local in a way the [frame-morphism openness characterization](../../theorems/frame-morphism-meet-preservation-openness.md) (proved) only just made visible. The Ext-classification's unobstructedness, the vanishing-above-degree-1 theorem on which it rests, and the four-regime tangent-dimension calculation are all *statements inside* the cellular stalk-product class — which the openness characterization identifies as the categorical-openness stratum of a structural boundary in sheaf-space (frame morphism preserves all meets ⟺ has left adjoint ⟺ spatially induced by an open map).

Crossing the openness boundary opens a direction the existing apparatus does not address. The natural conjecture, stated as the [openness-boundary deformation dichotomy theorem](../../theorems/openness-boundary-deformation-dichotomy.md) (sketch):

> Cellular-preserving deformations of a cellular sheaf are unobstructed (existing Ext-classification). Cellular-leaving deformations are obstructed at second order, with obstruction class $\delta \in \mathrm{Ext}^2$ given explicitly by the cosimplicial encoding of the meet-preservation discrepancy of the lost-adjoint restriction. In the d-frame setting $\delta$ decomposes into truth-side, falsity-side, and consistency-relation parts.

The [openness-defect deformation theory question](../../learning/questions/openness-defect-deformation-theory.md) develops this direction: the openness-defect class as a new deformation invariant, the deformation-theoretic dichotomy at the boundary, the d-frame trichotomy of obstruction types, and Schlessinger pro-representability across the boundary. Structurally analogous to wall-crossing in stability conditions ([@bridgeland2007], [@joyce-song2012]) but with categorical openness playing the role of stability and the bilattice value category producing strictly more obstruction structure than Ab-valued wall-crossing supplies.

This is novel territory the corpus is uniquely positioned to develop, since both ingredients — the openness characterization and the d-frame Ext-classification — are corpus-internal, and neither classical deformation theory nor d-frame theory has addressed the combination.

The literature engagement is mapped in the [openness-defect deformation literature](openness-defect-deformation-literature.md) narrative, which traces the four sub-directions to their relevant prior work: [@gerstenhaber1964] for the cup-product-square obstruction prototype, [@schlessinger1968] / [@manetti2009] / [@fantechi-manetti1998] / [@hartshorne2010] for pro-representability and DGLA-controlled deformations, [@bridgeland2007] / [@joyce-song2012] / [@kontsevich-soibelman2008] for stability-condition wall-crossing, and [@bousfield-kan1972] / [@hinich2001] for the cosimplicial / DG-coalgebra machinery. Each direction borrows substantially from the cited literature; the novelty is in the assembly onto the corpus's specific structural object.

## What's open

- **The openness-defect direction.** The [openness-boundary deformation dichotomy theorem](../../theorems/openness-boundary-deformation-dichotomy.md) is at sketch status; pushing the (b)-direction to proved requires the cosimplicial-resolution construction of $\delta$ to be made fully explicit and the d-frame decomposition $\delta = \delta^+ + \delta^- + \delta^\top$ to be verified on an explicit d-frame example. See the [openness-defect deformation theory question](../../learning/questions/openness-defect-deformation-theory.md) for the wider program.
- **The d-frame deformation theory's relationship to the strong-MLD classification.** Whether deformations of a strong-MLD class always remain in the same composed-duality orbit, or whether deformations can flip orbit types (e.g., truth-only firings becoming $\top$-firings).
- **Concrete deformations of specific settlings.** The [transfinite-induction settling](../../examples/transfinite-induction-settling.md) and [paraconsistent transfinite settling](../../examples/paraconsistent-transfinite-settling.md) admit explicit deformation calculations; what their tangent spaces look like is open, and grounding the abstract theory.
- **Cross-axis deformation with the realizability program.** Each axis of the realizability program (bigraded, $\mathcal{C}$-naturality, rule-language) gives a refinement of the moduli; the deformation theory should refine accordingly. Whether per-axis deformations are independent or coupled is open.

## Position in predication categories

This chapter opens the **moduli & deformation** layer of Part 2, building on the [moduli chapter](moduli-layer-opener.md) of Part 1 and the [cohomology chapter](cohomology-series-position.md) of the same. The chapter sits beyond the bilattice-valued cohomology chapter (which provides the d-frame infrastructure) and beyond the Verdier duality chapter (which provides the six-functor framework). With those substrates in place, the deformation theory becomes a tractable next chapter — using the existing infrastructure to extract a layer of structure that's been implicit in the moduli stack theorem all along.

The chapter is novel research mathematics: deformation theory of predication settlings has not been previously developed; predication categories' specific structural setup (vanishing-above-degree-1, d-frame value category, six-functor framework) gives it a distinctive flavor.
