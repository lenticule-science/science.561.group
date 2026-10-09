---
kind: narrative
status: current
introduces: [skh-deformation-ext-classification]
discusses: [settling-moduli-stack-theorem, settling-cohomology, predication-hyperdoctrine, settling-cohomology-vanishes-above-degree-1, q-enriched-cohomology-higher-degree-vanishing, d-frame-verdier-composition]
title: Deformation theory of spatiotemporal knowledge presheaves
description: The settling moduli stack theorem gives a 2-stack of settlings over the parameter base category — a global picture of which settlings are equivalent and how they relate.
---

# Deformation theory of spatiotemporal knowledge presheaves

The [settling moduli stack theorem](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md) gives a 2-stack of settlings over the [parameter base category](parameter-base-category.md) — a global picture of which settlings are equivalent and how they relate. **Deformation theory** is the local version: given a settling $v$, what *infinitesimal* perturbations are possible, and what classifies them?

This chapter develops deformation theory for spatiotemporal knowledge presheaves, building on the cohomological infrastructure now substantially in place (the [settling cohomology](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/settling-cohomology.md) framework, the d-frame chapter's [Q-enriched cohomology](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md), and the [Verdier duality chapter](narratives-verdier-duality-opener.md)'s six-functor formalism). The natural deformation-theoretic apparatus — Ext-classification, tangent complex, obstruction theory — fits cleanly into the corpus's existing structure, with the program's [vanishing-above-degree-1](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md) theorem giving an *unobstructed* deformation theory at the corpus's typical regimes.

## Why this chapter exists

Three reasons:

1. **The natural sequel to moduli.** Moduli stacks ↔ tangent complexes ↔ deformations is the standard chain in derived algebraic geometry. The corpus has the moduli stack; the tangent and deformation structure is the next layer.

2. **An immediate payoff from $H^{\geq 2} = 0$.** The corpus's [vanishing-above-degree-1 theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md) (and its [Q-enriched analog](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md)) gives an unusual structural feature: obstruction theory is degenerate above degree 1. Every first-order deformation extends to higher orders without obstruction. This is *uncommon* — most deformation problems carry non-trivial obstruction theories — and the corpus's structural setup gives it for free.

3. **The d-frame chapter's tangent refinement.** The bilattice-valued cohomology chapter shows the corpus's cohomology has *strictly more* structure than the $\mathbf{Ab}$-shadow — consistency / totality / negation-gauge data not visible to the abelianized version. The deformation theory inherits this richness: d-frame tangent classes distinguish perturbations of truth-only firings, falsity-only firings, and $\top$-firings, where the $\mathbf{Ab}$-shadow sees only the firing-ordinal set. The deformation theory is a place where the d-frame chapter's added structure pays off concretely.

## What the chapter develops

- The [Ext-classification of SKH deformations](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md) — first-order deformations of a settling $v$ classified by $\mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v)$ in the bitopological-settling-site sheaf category, with obstructions in $\mathrm{Ext}^2$ (vanishing per the corpus's structural theorems).
- The SKH tangent complex (future work) — the cochain complex computing $\mathrm{Ext}^\bullet$ of the universal settling-associated sheaf, containing the Ext-classification's tangent space data.
- The SKH obstruction theory (future work) — *unobstructed* in the corpus's typical setting via the vanishing-above-degree-1 result.

The chapter's distinctive content beyond the standard deformation-theory pattern:

- **Regime-stratification interactions.** The four-regime dichotomy stratifies the moduli; deformations can preserve or cross regime boundaries. Whether the regime is a locally-constant invariant under deformation, or whether deformations interpolate between regimes, is a substantive question (the [regime-stratification non-semicontinuity](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/regime-stratification-non-semicontinuity.md) suggests it is *not* locally constant in the topological sense).
- **d-frame tangent refinement.** First-order deformations in the d-frame setting carry strictly more structure than in the $\mathbf{Ab}$-shadow — consistency-relation perturbations and value-category-swap orbits give finer tangent data.
- **Strong-MLD interaction.** Deformations preserve or perturb the [composed-duality orbit type](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/strong-mld-classification.md) of a settling — refining the deformation theory by the orbit structure.

## Literature situation

Standard algebraic deformation theory (Gerstenhaber's foundational 1964 work; Hartshorne's standard treatment; @kashiwara-schapira2006 for the categorical setting) handles algebraic deformations via $\mathrm{Ext}$-classification. The bilattice-valued / Q-enriched extension is novel — quantale-graded deformation theory has been considered in some abstract categorical settings (Stubbe 2005 discusses Q-enriched limits and colimits foundationally) but not specifically applied to deformation problems on bilattice-flavored cohomology.

The corpus's deformation theory is positioned to:

- *Replicate the standard pattern* in the $\mathbf{Ab}$-valued shadow (giving baseline content via well-developed machinery).
- *Refine via the d-frame setting* to expose tangent-class structure invisible to the shadow.
- *Use the six-functor formalism* (now sketched at draft level) to transport deformation-theoretic results across hyperdoctrine morphisms.

## What's open

- **The d-frame deformation theory's relationship to the strong-MLD classification.** Whether deformations of a strong-MLD class always remain in the same composed-duality orbit, or whether deformations can flip orbit types (e.g., truth-only firings becoming $\top$-firings).
- **Concrete deformations of specific settlings.** The [transfinite-induction settling](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/transfinite-induction-settling.md) and [paraconsistent transfinite settling](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/paraconsistent-transfinite-settling.md) admit explicit deformation calculations; what their tangent spaces look like is open, and grounding the abstract theory.
- **Cross-axis deformation with the realizability program.** Each axis of the realizability program (bigraded, $\mathcal{C}$-naturality, rule-language) gives a refinement of the moduli; the deformation theory should refine accordingly. Whether per-axis deformations are independent or coupled is open.

## Position in the program

This chapter opens the **moduli & deformation** layer of Part 2, building on the [moduli chapter](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/narratives/moduli-layer-opener.md) of Part 1 and the [cohomology chapter](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/narratives/cohomology-series-position.md) of the same. The chapter sits beyond the bilattice-valued cohomology chapter (which provides the d-frame infrastructure) and beyond the Verdier duality chapter (which provides the six-functor framework). With those substrates in place, the deformation theory becomes a tractable next chapter — using the existing infrastructure to extract a layer of structure that's been implicit in the moduli stack theorem all along.

The chapter is novel research mathematics: deformation theory of spatiotemporal knowledge presheaves has not been previously developed; the corpus's specific structural setup (vanishing-above-degree-1, d-frame value category, six-functor framework) gives it a distinctive flavor.
