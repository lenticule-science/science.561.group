---
type: concept
class: schema
depends-on: [closure-operator, predication-fiber-algebra, predicate-category, knowledge-order]
see-also: [closure-rule-language, closure-rule-system, scott-continuous-closure, non-scott-continuous-firing-ordinal]
title: Closure rule
description: A syntactic generator of a closure operator.
---

# Closure rule

A syntactic generator of a [closure operator](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/docs/dev/morphisms/closure-operator.md). One rule asserts a single conditional cell-update: when an antecedent over the predication state holds, a particular cell value must be at least a particular knowledge-order threshold.

The rule schema:

$$\underbrace{\forall x_1 \cdots \forall x_n.\; \phi(\vec{x};\, \vec{y};\, v)}_{\text{positive } \Pi_1 \text{ antecedent}} \;\Longrightarrow\; \underbrace{v'(p)(t_1, t_2) \geq_k V}_{\text{cell-update consequent}}$$

with free entity variables $\vec{y}$ — the rule fires once per $\vec{y}$-instantiation from $E$ — and universally bound entity variables $\vec{x}$.

The formal specification of antecedent atoms, antecedent shape, consequent, and predicate uniformity is the [closure-rule language](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/docs/dev/scraps/closure-rule-language.md). Sets of rules and the closure operators they generate are [closure-rule systems](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/docs/dev/scraps/closure-rule-system.md).

## Role

The closure-rule formalism makes precise the *generators* of a closure operator — what gets specified in writing down a settling, as opposed to the abstract closure operator that the specification produces. It is the syntactic side of [closure-drivenness](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/docs/dev/scraps/closure-drivenness.md) and the natural setting for the [realizability question](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/docs/dev/questions/realizability-of-cohomology-classes.md): which subsets of countable limit ordinals arise as $L_{\mathrm{ns}}(\mathcal{S})$ for some closure-rule system $\mathcal{S}$ over a fixed base.
