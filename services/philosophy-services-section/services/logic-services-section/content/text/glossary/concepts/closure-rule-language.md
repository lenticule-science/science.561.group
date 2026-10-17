---
type: concept
class: language
depends-on: [closure-rule, predication-fiber-algebra, predicate-category, entity-set, knowledge-order, residuated-lattice, parameter-base-category]
see-also: [scott-continuous-closure, non-scott-continuous-firing-ordinal]
title: Closure-rule language
description: The formal language in which closure rules are written.
---

# Closure-rule language

The formal language in which [closure rules](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/hacking/library/closure-rule-language/docs/dev/scraps/closure-rule.md) are written. *First-order, positive in the cell values, single $\forall$-block over entities,* with primitives inherited from the [parameter base](../../documents/articles/notes/undated/parameter-base-category.md) $(\mathbf{L}, \mathcal{C}, E, \lambda)$.

## Atomic formulas

Two kinds of atomic formula appear in antecedents:

1. *Cell atoms* — $v(q)(s_1, s_2) \geq_k V$ for $q \in \mathcal{C}$, entity terms $s_1, s_2$, and a value $V \in \mathbf{L}^\bowtie$ in the [predication fiber algebra](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/hacking/library/closure-rule-language/docs/dev/objects/predication-fiber-algebra.md). The atom asserts a $\geq_k$-lower-bound on the cell value at $(s_1, s_2, q)$.
2. *Signature atoms* — literals in the inherited signature. From $E$, this includes whatever relations the entity set carries (e.g., $<$ when $E$ is well-ordered, equality with constants $c \in E$). From $\mathcal{C}$, this includes the four-generator structure (specialization, converse, subject- and object-projection class membership). From $\mathbf{L}$, this includes residuated-lattice relations on values.

## Antecedent shape

A positive Boolean combination (conjunction and disjunction, no negation) of atoms, optionally preceded by a single block $\forall x_1 \cdots \forall x_n$ of universal quantifiers over entity variables.

## Consequent

A single cell-update assertion $v'(p)(t_1, t_2) \geq_k V$ with $p \in \mathcal{C}$, entity terms $t_1, t_2$ in the free variables $\vec{y}$, and a value $V$.

## Predicate uniformity

When a rule schema is to satisfy [closure-operator naturality](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/hacking/library/closure-rule-language/docs/dev/morphisms/closure-operator.md) (axiom 4), it is stated *uniformly across the predicate category* — using a generator-class variable for $p, q$ rather than a specific named predicate — so that the same rule applied at $f(q) = p$ via a $\mathcal{C}$-morphism $f$ produces a consequent equal to $f^*$ of the original. Rules at a single specific predicate are admissible when there is no $\mathcal{C}$-morphism out of that predicate to constrain them.

## Quantifier complexity and Scott-continuity

The [Scott-continuity](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md) of the generated closure operator is determined by the *antecedent quantifier structure* of the rules:

- A rule with **quantifier-free** antecedent is Scott-continuous: its firing depends on a finite Boolean combination of cell atoms, and each cell atom commits at some finite stage of any directed family.
- A rule with a **single $\forall$-block over an infinite domain** *can* be non-Scott-continuous: universal witness collection may first become satisfied at a directed limit. Its mere syntactic presence is **not sufficient** to prove discontinuity. A vacuous or already fixed universal premise can be continuous. An actual directed family separating the limit from every preceding stage is required.

This is a possible syntactic mechanism for [non-Scott-continuous firing ordinals](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md). At a limit ordinal $\mu$, a rule with $\forall x.\, \phi(x; v)$ fires non-Scott-continuously iff $\phi$'s truth was achieved by the $\leq_k$-join $\bigvee_{\sigma < \mu} v_\sigma$ but not by any single $v_\sigma$ with $\sigma < \mu$. The set $L_{\mathrm{ns}}(\mathcal{S})$ of such firing ordinals is the structural source of [transfinite-bounded and aperiodic regime](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) cohomology generators.

Restricting the rule language to *quantifier-free* antecedents gives a Scott-continuous closure operator and constrains the settling to the strict or Scott-continuous regime. Permitting $\forall$-antecedents over infinite domains is what unlocks the transfinite-bounded and aperiodic regimes.

## A notational clarification

Informal corpus notation often writes antecedent atoms as $v(q)(s_1, s_2) = V$ — exact equality with a value. Read literally this is *not* positive in $\leq_k$: if the cell value rises from $V$ to a higher $\leq_k$-element (e.g., $\mathbf{t} \to \top$), an exact-equality atom fails despite the underlying state increasing.

The formal rule language uses $\geq_k V$ atoms, which are positive in $\leq_k$. In the canonical examples (e.g., [transfinite-induction settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/hacking/library/closure-rule-language/docs/dev/examples/transfinite-induction-settling.md)) values reach $\{\bot, \mathbf{t}\}$ only, where $= \mathbf{t}$ and $\geq_k \mathbf{t}$ coincide, so the informal and formal readings agree pointwise. The shift to $\geq_k$-atoms is a clarification, not a change of content.

## Qualified executable boundary (2026-10-17)

The finite positive-threshold fragment used by
[Engineering's Metrologic closure engine](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/lib/metrologic/src/articulation/predicating/positing/settling/analysis/closure-rule-system.mjs)
contains only finite conjunctions of upward-closed FOUR knowledge predicates and constant knowledge-join consequents. It is monotone and stabilizes after at most two strict evidence additions per cell; the runtime implements this finite result without a four-cell enumeration cutoff.

The more expressive `∀∃` fragment has a **finite truth-order projection**
implemented by composition of the *existing*
[hyperdoctrine adjoints](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/lib/metrologic/src/hyperdoctrine/adjoints.mjs)
over total, schema-declared index morphisms. Both evidence sides are preserved, including opposing evidence. This is not a positive-threshold **closure rule with infinite quantification**. Such rules may have non-Scott-continuous limit-stage behavior; a finite schema program cannot detect a genuinely limit-only premise by inspecting finite prefixes.

The [Π₂-rule-schema research glossary](rule-language-pi2-schemas-realizability.md)
states the external directed-union counterexample and names the remaining native-generation and transfinite proof obligations. Keep that one owning source for the transfinite question; this entry defines only the rule-language boundary.
