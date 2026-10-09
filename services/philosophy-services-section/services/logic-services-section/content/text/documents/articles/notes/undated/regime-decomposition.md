---
type: theorem
status: proved
depends-on: [coarse-settling-moduli, regime-mld-invariance, four-regime-dichotomy]
title: Regime decomposition of the coarse moduli
description: "For each base $B$, the coarse settling moduli decomposes as a disjoint union indexed by regime:"
---

# Regime decomposition of the coarse moduli

For each base $B$, the [coarse settling moduli](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/coarse-settling-moduli.md) decomposes as a disjoint union indexed by [regime](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md):

$$|\mathrm{KP}^{\mathrm{vis}}(B)| \;=\; \bigsqcup_{X \in \{A, B, C, D\}} \, |\mathrm{KP}^{\mathrm{vis}}(B)|_X,$$

where $|\mathrm{KP}^{\mathrm{vis}}(B)|_X := \{[v] : \mathrm{reg}(v) = X\}$ is the stratum of MLD-classes with regime $X$.

## Proof

Every settling has a unique regime ([four-regime dichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md)). By [regime MLD-invariance](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/coarse-settlement-moduli/docs/dev/theorems/regime-mld-invariance.md) the regime label lifts to MLD-classes. The decomposition is the partition by regime label. $\square$

## Set-theoretic, not topological

By [regime stratification non-semicontinuity](regime-stratification-non-semicontinuity.md), the strata are *not* locally closed under any $\leq_k$-derived topology on the moduli. The decomposition is set-theoretic and combinatorial — well-defined as a partition but not as a topological stratification.

## Refinement

Within each regime stratum, the [rigid moduli point](../../../../../../../relationality-services-section/services/agency-services-section/content/text/glossary/concepts/rigid-moduli-point.md) / [orbifold moduli point](../../../../../../../relationality-services-section/services/agency-services-section/content/text/glossary/concepts/orbifold-moduli-point.md) substratification by visible-automorphism symmetry produces a finer partition. The [moduli classifying function](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/coarse-settlement-moduli/docs/dev/morphisms/moduli-classifying-function.md) further refines the orbifold loci of the transfinite-bounded and aperiodic regimes by classifying-invariant.
