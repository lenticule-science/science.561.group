---
type: narrative
discusses: [mutually-locally-derivable, cohomological-equivalence, biequivalence-cohomological-collapse, settling-morphism, four-regime-dichotomy]
kind: narrative
title: The equivalence hierarchy
description: "Three natural equivalences on settlings over a fixed base form a hierarchy:"
---

# The equivalence hierarchy

Three natural equivalences on settlings over a fixed base form a hierarchy:

$$\text{strict iso} \;\subsetneq\; \text{biequivalence} \;=\; \text{MLD} \;\subseteq\; \text{cohomological}.$$

## Strict isomorphism

Two settlings are **strictly isomorphic** iff their valuation families coincide identically — same orbit, same increment sequence, same closure operator, cell-by-cell identical at every stage. The equivalence classes are singletons; the corresponding "moduli" is in bijection with the set of settlings. Degenerate as an equivalence relation for moduli purposes.

## Biequivalence in the 2-category

Settlings over a fixed base form a 2-category. Its 1-cells are [settling-morphism](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/morphisms/settling-morphism.md) data: bilattice-homomorphism families $(\phi_{q, \tau})$ together with order-preserving maps $\phi_\lambda : \lambda \to \lambda$ on the [settling bound](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/settling-bound.md), satisfying compatibility. Its 2-cells are pointwise inequalities — thin 2-structure by [settling-automorphism 1-truncation](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-1-truncation.md).

Two settlings are **biequivalent** iff there exist mutually inverse 1-cells. By thin 2-structure the 2-isomorphism witnessing inverse-up-to-2-cell is forced to be identity, so biequivalence reduces to plain mutually-inverse 1-cells.

## MLD = biequivalence

[Mutually-locally-derivable](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/concepts/mutually-locally-derivable.md) equivalence — the equivalence under which the [aperiodic-regime classification theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) classifies settlings cohomologically — coincides with biequivalence: an MLD-morphism is exactly an invertible 1-cell of the 2-category whose ordinal-component $\phi_\lambda$ is a translation $\tau \mapsto \tau + \delta$. For ordinals $\lambda$ with no non-translation order-preserving self-maps (typical), every biequivalence is an MLD-equivalence and conversely.

## Cohomological equivalence

The coarsest equivalence: existence of a sheaf isomorphism $\mathcal{F}_U \cong \mathcal{F}_{U'}[\delta]$ for some shift $\delta$. Always implied by biequivalence — see [biequivalence-cohomological collapse](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/biequivalence-cohomological-collapse.md). Strictly weaker *a priori* — but on each [regime stratum](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) the implication reverses, so the two equivalences cut the settlings the same way regime by regime.

## What this hierarchy buys

The moduli quotients by biequivalence (= MLD), giving the natural classification level. Cohomological equivalence is the *detection mechanism*: the [moduli classifying function](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/morphisms/moduli-classifying-function.md) sends each MLD-class to its sheaf-iso class. The collapse on each regime guarantees this function is injective per stratum.

| Equivalence | Partition coarseness | Role |
|---|---|---|
| strict iso | singletons | degenerate; not used |
| biequivalence (= MLD) | non-trivial | primary moduli-quotient relation |
| cohomological | regime-equal to biequivalence | detection / classifying invariant |
