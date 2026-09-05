---
kind: concept
type: language
depends-on: [closure-rule, predication-fiber-algebra, predicate-category, entity-set, knowledge-order, residuated-lattice, parameter-base-category]
see-also: [scott-continuous-closure, non-scott-continuous-firing-ordinal]
---

# Closure-rule language

The formal language in which [closure rules](closure-rule.md) are written. *First-order, positive in the cell values, single $\forall$-block over entities,* with primitives inherited from the [parameter base](../objects/parameter-base-category.md) $(\mathbf{L}, \mathcal{C}, E, \lambda)$.

## Atomic formulas

Two kinds of atomic formula appear in antecedents:

1. *Cell atoms* — $v(q)(s_1, s_2) \geq_k V$ for $q \in \mathcal{C}$, entity terms $s_1, s_2$, and a value $V \in \mathbf{L}^\bowtie$ in the [predication fiber algebra](../objects/predication-fiber-algebra.md). The atom asserts a $\geq_k$-lower-bound on the cell value at $(s_1, s_2, q)$.
2. *Signature atoms* — literals in the inherited signature. From $E$, this includes whatever relations the entity set carries (e.g., $<$ when $E$ is well-ordered, equality with constants $c \in E$). From $\mathcal{C}$, this includes the four-generator structure (specialization, converse, subject- and object-projection class membership). From $\mathbf{L}$, this includes residuated-lattice relations on values.

## Antecedent shape

A positive Boolean combination (conjunction and disjunction, no negation) of atoms, optionally preceded by a single block $\forall x_1 \cdots \forall x_n$ of universal quantifiers over entity variables.

## Consequent

A single cell-update assertion $v'(p)(t_1, t_2) \geq_k V$ with $p \in \mathcal{C}$, entity terms $t_1, t_2$ in the free variables $\vec{y}$, and a value $V$.

## Predicate uniformity

When a rule schema is to satisfy [closure-operator naturality](../morphisms/closure-operator.md) (axiom 4), it is stated *uniformly across the predicate category* — using a generator-class variable for $p, q$ rather than a specific named predicate — so that the same rule applied at $f(q) = p$ via a $\mathcal{C}$-morphism $f$ produces a consequent equal to $f^*$ of the original. Rules at a single specific predicate are admissible when there is no $\mathcal{C}$-morphism out of that predicate to constrain them.

## Quantifier complexity and Scott-continuity

The [Scott-continuity](scott-continuous-closure.md) of the generated closure operator is determined by the *antecedent quantifier structure* of the rules:

- A rule with **quantifier-free** antecedent is Scott-continuous: its firing depends on a finite Boolean combination of cell atoms, and each cell atom commits at some finite stage of any directed family.
- A rule with **single $\forall$-block over an infinite domain** is non-Scott-continuous: the universal antecedent commits only at the limit, not at any finite sub-stage.

This is the syntactic origin of [non-Scott-continuous firing ordinals](non-scott-continuous-firing-ordinal.md). At a limit ordinal $\mu$, a rule with $\forall x.\, \phi(x; v)$ fires non-Scott-continuously iff $\phi$'s truth was achieved by the $\leq_k$-join $\bigvee_{\sigma < \mu} v_\sigma$ but not by any single $v_\sigma$ with $\sigma < \mu$. The set $L_{\mathrm{ns}}(\mathcal{S})$ of such firing ordinals is the structural source of [transfinite-bounded and aperiodic regime](../theorems/four-regime-dichotomy.md) cohomology generators.

Restricting the rule language to *quantifier-free* antecedents gives a Scott-continuous closure operator and constrains the settling to the strict or Scott-continuous regime. Permitting $\forall$-antecedents over infinite domains is what unlocks the transfinite-bounded and aperiodic regimes.

## A notational clarification

Informal corpus notation often writes antecedent atoms as $v(q)(s_1, s_2) = V$ — exact equality with a value. Read literally this is *not* positive in $\leq_k$: if the cell value rises from $V$ to a higher $\leq_k$-element (e.g., $\mathbf{t} \to \top$), an exact-equality atom fails despite the underlying state increasing.

The formal rule language uses $\geq_k V$ atoms, which are positive in $\leq_k$. In the canonical examples (e.g., [transfinite-induction settling](../examples/transfinite-induction-settling.md)) values reach $\{\bot, \mathbf{t}\}$ only, where $= \mathbf{t}$ and $\geq_k \mathbf{t}$ coincide, so the informal and formal readings agree pointwise. The shift to $\geq_k$-atoms is a clarification, not a change of content.
