---
type: reference
authors: [Bonchi, Filippo, Petrişan, Daniela, Pous, Damien, Rot, Jurriaan]
year: 2014
title: "Coinduction up-to in a Fibrational Setting"
venue: "Proceedings of CSL-LICS 2014"
description: F.
---

## Full citation

F. Bonchi, D. Petrişan, D. Pous, J. Rot. "Coinduction up-to in a Fibrational Setting." In *Joint Meeting of CSL and LICS 2014*, ACM, 2014.

## Status

Read locally; not in `sources/`. Open access on the authors' sites.

## Annotation

Develops the **up-to coinduction** technique in the fibrational framework of [@hermida-jacobs1998]. The key apparatus: a *compatible* up-to function $f$ — one that commutes (laxly) with the predicate-lifting along the coalgebra structure — preserves the greatest-fixed-point semantics. This means proofs of bisimilarity can use $f$-up-to relations rather than full bisimulations, which is a major reduction in proof obligations.

For the program: not currently load-bearing, but methodologically aligned with two threads in the [hyperdoctrinal layer](../research/2026/07/31/lenticule-import/from-predicate-category/prose/teaching/explanations/settling-as-coalgebra.md) and [cohomological layer](../research/2026/07/31/lenticule-import/from-predicate-category/prose/teaching/explanations/cohomology-series-position.md):

- **Closure as up-to.** The [closure 2-monad](../research/2026/07/31/lenticule-import/morphisms/closure-2-monad.md) $\mathrm{Cl}$ on predication fibrations is, formally, an up-to function on the settling coalgebra: replacing any state $v_\tau$ by its closure $\mathrm{Cl}(v_\tau)$ and re-running the settling gives the same orbit modulo saturation. This is a Bonchi-et-al-style compatibility — closure commutes with the settling endofunctor in a precise sense, and that commutation is what licenses [predicate-category naturality](../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predicate-category/content/predicate-category-naturality/predicate-category-naturality.md).
- **Mutually-locally-derivable as up-to equivalence.** The MLD equivalence used in the [aperiodic-regime classification](../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) is an up-to relation in the same sense — two settlings MLD-equivalent are bisimilar up to a local-derivability function. The classification theorem reads cleanly as: aperiodic settlings up to a compatible up-to are classified by their $H^1$-invariant.

Proving that the closure-as-up-to is *compatible* in the Bonchi-et-al sense would give a fibrational-coinduction proof of settling convergence, complementary to the current sheaf-theoretic proof. Open as a research direction.
