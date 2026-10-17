---
type: conjecture
status: sketch
relates-to: paraconsistent-settling-associated-sheaf
depends-on: [aperiodic-regime-classification, aperiodic-classifying-invariant, inconsistency-sheaf, mutually-locally-derivable, settling-morphism, bigraded-settling-cohomology]
title: Paraconsistent aperiodic-regime classification
aliases: [predication-paraconsistent-classification-1, predication-paraconsistent-classification-2]
description: For aperiodic-regime predication settlings $v, v'$ over a common base whose settlings may generate $\top$-valued cells, define the bigraded classifying invariant
---

# Paraconsistent aperiodic-regime classification

For [aperiodic-regime](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) [predication settlings](../../research/2026/07/31/objects/predication-settling.md) $v, v'$ over a common base whose settlings may generate $\top$-valued cells, define the **bigraded classifying invariant**

$$\mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v) \;:=\; \bigl([\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v)],\; [\mathrm{cl}\text{-}\mathrm{inv}^{(\top)}(v)]\bigr) \;\in\; H^1_t(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{(t)}) \,\oplus\, H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{(\top)}),$$

with $\mathrm{cl}\text{-}\mathrm{inv}^{(t)}$ the truth-order [aperiodic classifying invariant](../../research/2026/07/31/objects/aperiodic-classifying-invariant.md) and $\mathrm{cl}\text{-}\mathrm{inv}^{(\top)}$ the analogous class in the [inconsistency sheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md)'s cohomology.

The proposed completeness condition is

$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v) = \mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v').$$

## Historical argument (unqualified proof sketch)

The [mutually-locally-derivable](../../research/2026/07/31/lenticule-import/teaching/explanations/mutually-locally-derivable.md) equivalence is defined via [settling-morphisms](../../research/2026/07/31/morphisms/settling-morphism.md), which are bilattice homomorphisms — hence preserve the designation decomposition $\{\mathbf{t}, \top\}$ separately. The [aperiodic-regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) proof applied to the $\mathbf{t}$-only part gives the first component; the same proof applied to the $\top$-only part (using the [inconsistency sheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) $\mathcal{F}_U^{(\top)}$ in place of $\mathcal{F}_U^{(t)}$ throughout) gives the second component. Joint equality was asserted to imply joint MLD-equivalence; this implication is not established by the preceding premises.

## Reading (retained from the second historical telling)

For *consistent* settlings the second component is trivially zero and the proposition reduces to the truth-only [aperiodic-regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md). For *inconsistent* settlings the second component contributes genuine extra distinguishing power: two settlings can have the same truth-order classifying invariant but differ in the pattern of inconsistency-cell production, and the bigraded invariant separates them.

This realizes the bigraded structure of [bigraded settling cohomology](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md) as more than a formal refinement: in the paraconsistent setting it sharpens the classification.

## Qualification boundary and proof obligations

The displayed pair is a **candidate invariant**, not yet a demonstrated complete classification. The archived argument assumes, but does not establish, that the truth-only aperiodic classification theorem transfers unchanged to the inconsistency-only sheaf, that both components are invariant under every admitted settling morphism, and that equality of the pair is *sufficient* for mutual local derivability. A homomorphism preserving a FOUR decomposition alone does not prove this biconditional. Do not treat this text as a Lean-certified theorem or a runtime transfinite capability.

To qualify the biconditional, identify exact Obsmetrologia declarations and prove both directions on explicitly typed carriers; give a counterexample search over finite predication structures and show a nontrivial pair with equal truth-only projections but distinct inconsistency components. Keep any separately checked finite mask computation distinguished from the conjectured aperiodic cohomology.

**Computational consequence that is already safe to demand:** an executable schema can carry positive and negative witnesses for exactly the same typed predication, project its four-valued reading to truth-only and inconsistent subsets, and preserve both projections through a source-bound, knowledge-monotone finite closure. This is a finite Engineering requirement, not a claim that a symbolic omega-stage calculation or sheaf classification has been implemented.

**Source consolidation (2026-10-17):** historical versions `predication-paraconsistent-classification-1.md` (which uniquely contained the Reading section) and `predication-paraconsistent-classification-2.md` (a prose-equivalent duplicate) were integrated into this one canonical document. The original revisions remain recoverable through Git history; use this path for future updates.
