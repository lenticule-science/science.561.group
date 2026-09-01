---
kind: concept
type: schema
depends-on: [closure-operator, predication-fiber-algebra, predicate-category, knowledge-order]
see-also: [closure-rule-language, closure-rule-system, scott-continuous-closure, non-scott-continuous-firing-ordinal]
---

# Closure rule

A syntactic generator of a [closure operator](../morphisms/closure-operator.md). One rule asserts a single conditional cell-update: when an antecedent over the predication state holds, a particular cell value must be at least a particular knowledge-order threshold.

The rule schema:

$$\underbrace{\forall x_1 \cdots \forall x_n.\; \phi(\vec{x};\, \vec{y};\, v)}_{\text{positive } \Pi_1 \text{ antecedent}} \;\Longrightarrow\; \underbrace{v'(p)(t_1, t_2) \geq_k V}_{\text{cell-update consequent}}$$

with free entity variables $\vec{y}$ — the rule fires once per $\vec{y}$-instantiation from $E$ — and universally bound entity variables $\vec{x}$.

The formal specification of antecedent atoms, antecedent shape, consequent, and predicate uniformity is the [closure-rule language](closure-rule-language.md). Sets of rules and the closure operators they generate are [closure-rule systems](closure-rule-system.md).

## Role

The closure-rule formalism makes precise the *generators* of a closure operator — what gets specified in writing down a settling, as opposed to the abstract closure operator that the specification produces. It is the syntactic side of [closure-drivenness](closure-drivenness.md) and the natural setting for the [realizability question](../questions/realizability-of-cohomology-classes.md): which subsets of countable limit ordinals arise as $L_{\mathrm{ns}}(\mathcal{S})$ for some closure-rule system $\mathcal{S}$ over a fixed base.
