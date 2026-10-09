---
type: theorem
status: sketch
depends-on: [four-group-register-as-fibration, four-regime-dichotomy, closure-rule-language]
see-also: [pmest-as-five-axis-decomposition, predicate-category-stratification]
title: The four-group register is a regime structure (sketch)
description: Claim (sketch).
---

# The four-group register is a regime structure (sketch)

**Claim** (sketch). The four-group register — *governing*, *engaging*, *situating*, *defining* — is not just a directory layout but a substrate-level *regime structure*: each group $G \in \{\mathcal{C}_G, \mathcal{C}_E, \mathcal{C}_S, \mathcal{C}_D\}$ admits closure rules drawn from a characteristic fragment of the [closure-rule language](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md), and the closure-rule sub-language for each group has a *typical* [four-regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) characteristic of the kind of activity the group names.

## Setup

Let $\mathcal{K}$ be a predicated knowledge system whose predicate category is partitioned into four full subcategories $\mathcal{C} = \mathcal{C}_G \sqcup \mathcal{C}_E \sqcup \mathcal{C}_S \sqcup \mathcal{C}_D$ per [four-group-register-as-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/four-group-register-as-fibration.md). Each sub-category carries a closure-rule sub-language $\mathcal{S}_G, \mathcal{S}_E, \mathcal{S}_S, \mathcal{S}_D \subseteq \mathcal{S}$ — the rules whose firings produce cells in the respective sub-category.

For each sub-language $\mathcal{S}_X$ write $\mathrm{regime}(\mathcal{S}_X) \in \{\mathrm{strict}, \mathrm{Scott\text{-}cts}, \mathrm{transf\text{-}bdd}, \mathrm{aperiodic}\}$ for its [four-regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md).

## Statement (sketch)

**Theorem (sketch).** For a *typical* working knowledge system stratified into the four-group register, the regime classification of each sub-language is:

| Stratum | Typical sub-language | Typical regime |
|---|---|---|
| $\mathcal{S}_D$ (defining) | term-synonymy, concept-subsumption, part-whole | strict |
| $\mathcal{S}_S$ (situating) | discipline-inheritance, school-alignment, lineage-traversal | Scott-continuous |
| $\mathcal{S}_E$ (engaging) | learning-from, applying-to, citing | transfinite-bounded |
| $\mathcal{S}_G$ (governing) | method-output-typing, standard-compliance, normative-self-reference | aperiodic |

Moreover, the typicality assignments are *minimal* in the sense that:
- Each sub-language genuinely *requires* its assigned regime — there exist standard rules in the sub-language that cannot be expressed in any strictly weaker regime.
- Each sub-language *suffices* in its assigned regime for the activity the group names — the rules genuinely admitted by working communities for that activity stay within the assigned regime.

## Argument

**$\mathcal{S}_D$ at strict regime — necessity.** A pure synonymy rule "$T_1 = T_2$ and $T_2 = T_3 \Rightarrow T_1 = T_3$" is symmetric and transitive over a finite term-set, so its closure terminates in stages bounded by the term-set's cardinality. The typical defining sub-language adds part-whole and subsumption rules of the same finite-saturation shape. None of these forces $\omega$-stages.

**$\mathcal{S}_D$ — failure mode.** Cyclic synonymy ("computer = electronic-computer", "electronic-computer = computer-using-electronics") under a *strictly* fixpoint-finitely-saturating rule produces an infinite-equality class only if the equality predicate is reflexively chained through term-construction; if such constructions are admitted, the regime promotes to Scott-continuous. Most working terminologies bound this by stipulating term-constructions are not closure-derivable.

**$\mathcal{S}_S$ at Scott-continuous regime — necessity.** Discipline inheritance ("$D_1$ inherits from $D_2$ and $D_2$ inherits from $D_3$ ...") is a transitive-closure rule over potentially unbounded chains; its fixpoint requires $\omega$-stages and each stage is derivable from a finite earlier stage. This is the canonical Datalog shape (Abiteboul, Hull, Vianu 1995).

**$\mathcal{S}_S$ — failure mode.** Lineage rules of the form "$L$ is a *complete* lineage if every prior lineage in $L$'s history is included" require limit-stage consequences not derivable from any single earlier finite stage and promote $\mathcal{S}_S$ to transfinite-bounded.

**$\mathcal{S}_E$ at transfinite-bounded regime — necessity.** A rule like "the field's consensus on topic $X$ is the closure of all individual learnings about $X$" universally quantifies over a closure that itself requires $\omega$-stages. The closure of such rules requires limit-stage synthesis at $\omega$, $\omega + \omega$, etc., bounded by some countable ordinal but not by any single $\omega$-iteration.

**$\mathcal{S}_E$ — failure mode (downward).** A working community that does not admit field-consensus rules (i.e., whose engagement closure is purely individual: each learner's evidence is closed independently) keeps $\mathcal{S}_E$ at Scott-continuous.

**$\mathcal{S}_G$ at aperiodic regime — necessity (the most fragile claim).** Normative self-reference ("the standard's interpretation of itself is the closure of all prior interpretations of itself") iterates a closure-of-closures rule whose firings at successive limit ordinals are not reducible to any single finite stage *and* are not regular-cardinal stratified. Hart-style "rule-of-recognition" reasoning (per the work-stratum's normative-discipline literature) is one candidate.

**$\mathcal{S}_G$ — failure mode (downward).** A working governing community that adopts a *fixed* meta-rule for interpreting its standards (rather than letting interpretation be itself a substrate-derivable predication) collapses $\mathcal{S}_G$ to transfinite-bounded.

## What "typical" means

The theorem deliberately quantifies over *typical* working communities, not all possible ones. A community can in principle equip any stratum with any closure-rule sub-language and so reach any regime; what the theorem claims is that the working communities the four-group register names *for each group's intended activity* land in the assigned regime. The typicality is empirical, drawn from the patterns named in [knowledge-organization-survey](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/knowledge-organization-survey.md) §3 (integrative-levels working systems), [knowledge-representation-survey](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/knowledge-representation-survey.md) §6 (Datalog/closure-rule communities), and the [process-ontology-and-situated-learning](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/process-ontology-and-situated-learning.md) §4 reading of Knorr-Cetina's epistemic cultures.

## Status: sketch

`status: sketch` because:

- The "typicality" claim has not been verified by exhaustive survey of working communities' closure-rule subsets. The claim is plausible from the published literature on each group's activity, but the substrate-side analysis has not been performed for a representative sample.
- The aperiodic-regime assignment for governing is the most speculative; it requires self-reference structure in normative reasoning that has not been formally characterised in substrate terms.
- The boundary between Scott-continuous and transfinite-bounded for engaging depends on whether field-consensus rules are admitted; many working communities do not admit them, putting their engaging-stratum at Scott-continuous instead.

