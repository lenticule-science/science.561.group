---
type: reference
authors: [Hermida, Claudio, Jacobs, Bart]
year: 1998
title: "Structural Induction and Coinduction in a Fibrational Setting"
venue: "Information and Computation 145(2), 107–152"
description: C.
kind: reference
---

## Full citation

C. Hermida and B. Jacobs. "Structural Induction and Coinduction in a Fibrational Setting." *Information and Computation* 145(2), 107–152, 1998.

## Status

Read locally. Open access via Jacobs's homepage; not currently in `sources/`.

## Annotation

The paper that lifts induction and coinduction principles from preorders to **fibrations**: an induction principle for an inductive type in a base category $\mathcal{B}$ becomes a property of the predicate fibration $P(-) \to \mathcal{B}$. Predicate lifting along reindexing functors is the key construction.

For the program: the settling-as-coalgebra view used in the [hyperdoctrinal layer](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/narratives/settling-as-coalgebra.md) sits in a 2-categorical analogue of the Hermida–Jacobs setting. The [settling endofunctor](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/morphisms/settling-endofunctor.md) acts on the 2-category $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ of [predication fibrations](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/predication-fibration.md); a coalgebra for this endofunctor is exactly a predication settling. The Hermida–Jacobs framework is the 1-categorical template — the upgrade to 2-categories is what is new.

Two specific borrowings:
- **Predicate lifting along reindexing.** The four-generator reindexing of the [predication fiber functor](../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/references/predication-fiber-functor.md) lifts predicates fiberwise along each generator. This is the bilattice-valued, four-generator analogue of the standard Hermida–Jacobs lift.
- **Coinductive characterization of settling orbits.** The orbit $(v_\tau)_{\tau < \lambda}$ of the settling is a coinductive construction in the sense the paper develops: a greatest fixed point of an endofunctor on the fiber-algebra sheaf, computed by transfinite iteration. The [aperiodic-regime classification](../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) of settlings that fail to stabilize at a countable ordinal uses the indexed-coalgebra existence story this paper opens.

Structurally complementary to [@jacobs2016] (textbook treatment) and [@bonchi-et-al2014] (up-to techniques in the same fibrational setting).
