---
kind: narrative
status: current
introduces: [q-fuzzy-equivalence, quantale-enriched-cosheaf, transfinite-cell-complex, q-enriched-transfinite-cellular-sheaf, q-enriched-curry-2-cell, q-enriched-curry-2-cell-fuzzy, q-enriched-curry-finite-graph, q-enriched-curry-2-dim-degree-0, q-enriched-curry-cw-complex, q-enriched-curry-transfinite-cw, q-enriched-curry-grothendieck-site, verdier-duality-bitopological-site, d-frame-verdier-composition]
discusses: [bilattice-cohomology-opener, paired-priestley-space, jung-rivieccio-duality, internal-z2-gauge]
title: Verdier duality on the bitopological settling site
description: "The bilattice-valued cohomology chapter developed sheaf-side machinery in the d-frame setting: definitions, framework choice (Tarski / Lawvere Laplacian), regime-by-regime cohomology theorems, and Q-enriched cohomology infrastructure."
---

# Verdier duality on the bitopological settling site

The [bilattice-valued cohomology chapter](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/narratives/bilattice-cohomology-opener.md) developed sheaf-side machinery in the d-frame setting: definitions, framework choice (Tarski / Lawvere Laplacian), regime-by-regime cohomology theorems, and Q-enriched cohomology infrastructure. The natural sequel is the **cosheaf side** — the dual notion to a sheaf, with its own cohomology / homology theory and a Verdier duality relating the two.

## Why Verdier duality matters here

Three reasons the duality is structurally important for our setting:

1. **Aperiodic co-classification.** The [aperiodic-regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) classifies aperiodic settlings up to MLD via the aperiodic classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$. Under Verdier duality, this admits a *dual* presentation: a cosheaf-homology invariant classifying the same MLD-classes from the cosheaf side. This is more than rephrasing — the two presentations are different cohomological perspectives on the same data, with different computational properties. The [Anderson–Putnam direct-limit](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/objects/anderson-putnam-direct-limit.md) construction's inverse/direct-limit duality is exactly this kind of structural pairing.

2. **The d-frame's value-category swap composes with the spatial Verdier duality.** The d-frame's $(L_+, L_-, \mathrm{con}, \mathrm{tot})$ structure has an intrinsic swap symmetry — bilattice [negation](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/morphisms/negation.md) $\neg$ exchanges $L_+ \leftrightarrow L_-$, the [internal $\mathbb{Z}/2$-gauge](internal-z2-gauge.md). Combined with the spatial sheaf-cosheaf swap from Verdier duality, the d-frame Verdier duality has *two dualities composing*. Pure $\top$-firings (where both components fire simultaneously) are self-dual under the composition; truth-only and falsity-only firings exchange. This is genuinely new content that Curry's original framework doesn't have — the value category's internal duality interacts with the spatial duality in a way the abelian setting can't.

3. **Six-functor formalism scaffolding.** Verdier duality is the $\mathbb{D}$-functor of the standard six-functor package. Establishing the duality is a substantial step toward the full six-functor formalism for settling cohomology, which the corpus has identified as a research direction ([six-functor question](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/questions/six-functor-formalism-for-settling-cohomology.md)).

## Literature situation

The chapter builds on three lines of published work:

- **[@curry2014] cellular sheaf-cosheaf derived equivalence.** The original framework: cellular sheaves and cellular cosheaves on regular CW complexes are derived equivalent, and this recovers Verdier duality. The framework is for $\mathbf{Ab}$-valued (or vector-space-valued) data on finite cell complexes.
- **[@lopez2024] quantale-enriched cosheaves.** Develops the Lawvere Laplacian on quantale-enriched network sheaves *and cosheaves* valued in weighted lattices. The cosheaf-side machinery in the enriched setting; companion to [@ghrist-et-al2025]'s sheaf-side Lawvere Laplacian work.
- **[@kishimoto-yushima2022] cosheaf-cosheaf-homology.** Resolves the technical issue of cosheafification: cellular cosheaf homology (defined via formal duality with cellular sheaf cohomology) equals cosheaf homology (Borel-Moore-style) when the underlying CW complex is a simplicial complex.

The corpus's contribution beyond these: extension from the network/graph and CW-complex bases to general Grothendieck sites (specifically, the bitopological settling site), specialization to d-frame value categories, and exploiting the d-frame's intrinsic swap symmetry to expose the two-dualities-composing structure.

The relevant *gaps* in the literature: nobody has explicitly worked out enriched Verdier duality on Grothendieck sites with cellular fibers, and nobody has noticed the value-category-swap composition that the d-frame setting exposes.

## What this chapter develops

- The [Q-enriched cellular cosheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/content/quantale-enriched-cosheaf/quantale-enriched-cosheaf.md) on a Grothendieck site — the cosheaf-side counterpart to the [Q-enriched sheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md) of the bilattice-valued cohomology chapter.
- The [Verdier duality theorem](verdier-duality-bitopological-site.md) (draft) — derived equivalence between sheaves and cosheaves on the bitopological settling site, established uniformly across all four regimes via the cellular extension plan, with the two-dualities-composing structure on the d-frame side.
- Connection to the aperiodic-regime classification: the dual classifying invariant via cosheaf homology.
- Connection to downstream questions: six-functor formalism, deformation theory, strong-MLD classification.

## What's open

The chapter's main theorem is established at draft level via the cellular extension plan, executed across three layers:

1. **Layer 1 (per-fiber, finite): $\mathsf{Q}$-enriched Curry equivalence on regular CW complexes.** Established (draft) via the [CW-complex theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/q-enriched-curry-cw-complex.md), subsuming the prior 2-cell, finite-graph, and 2-dim-degree-0 cases under a single induction on dimension.
2. **Layer 3 (per-fiber, transfinite): $\mathsf{Q}$-enriched Curry equivalence on transfinite cell complexes.** Established (draft) via the [transfinite-CW theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/q-enriched-curry-transfinite-cw.md), extending Layer 1 to countable-cofinal cell complexes via directed-colimit assembly.
3. **Layer 2 (fiber-to-global on Grothendieck sites): assembly across the bitopological settling site's fibration.** Established (draft) via the [Grothendieck-site theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/q-enriched-curry-grothendieck-site.md), accepting either Layer 1 (finite) or Layer 3 (transfinite) per-fiber input. Covers all four regimes uniformly.

Plus the d-frame specialization (the two-dualities-composing structure) which uses Layer 1+2+3 as input — now usable across all regimes, with strict-regime worked examples in place and transfinite-regime examples ready for development.

The chapter's substantive open work shifts to **downstream consequences**: the aperiodic co-classification, strong-MLD classification refinement, six-functor formalism extending Verdier, and the d-frame composition theorem's concrete instances in transfinite regimes.

## Position in the program

Part 2 chapter, building on the bilattice-valued cohomology chapter. The chapter is a substantive new direction — not a refinement of existing material but a structurally new addition that pays off across multiple downstream questions. With the central theorem now established at draft level via the cellular extension plan (Layers 1, 2, and 3), the chapter unlocks the dual cohomological picture and provides infrastructure for the six-functor formalism, deformation theory, and aperiodic co-classification work — each a downstream consequence ready for development.
