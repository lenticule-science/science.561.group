---
name: closure-rule
description: "A syntactic generator of a closure-operator on a predication-fiber-algebra. One rule asserts one conditional cell-update: when a positive Π_1 antecedent on the predication state holds, a target cell value must be at least a particular knowledge-order threshold. The unit positing issues; what gets written down when a settling is specified."
depends-on: [closure-operator, predication-fiber-algebra, predicate-category, knowledge-order]
derives-from: docs/dev/scraps/closure-rule.md
---

# Closure-rule

A closure-rule is the **syntactic unit positing issues**. One rule asserts one conditional cell-update: when an antecedent over the predication state holds, a particular cell value must be at least a particular knowledge-order threshold.

## Schema

$$\underbrace{\forall x_1 \cdots \forall x_n.\; \phi(\vec{x};\, \vec{y};\, v)}_{\text{positive }\Pi_1\text{ antecedent}} \;\Longrightarrow\; \underbrace{v'(p)(t_1, t_2) \geq_k V}_{\text{cell-update consequent}}$$

with:

- **Free entity variables** `\vec{y}`: the rule's **fire-on parameters**. The rule fires once per `\vec{y}`-instantiation drawn from the entity-set `E`.
- **Universally-bound entity variables** `\vec{x}`: quantified over in the antecedent. These produce the rule's universal-content (e.g., "for every entity `x` such that...").
- **Antecedent `φ(\vec{x}; \vec{y}; v)`**: a positive Π₁ formula over the current valuation state. It can mention cell-atoms `v(q)(s, o) ≥_k V'` and signature atoms (entity-relations, predicate-category-generator class membership, residuated-lattice value relations).
- **Consequent**: a `≥_k`-lower bound on the cell `(t_1, t_2, p)` — that is, an assertion that the new valuation's value at that cell must be at least `V`.

The cell-update is a **monotone raise**: the rule can only push the cell's value UP in `≤_k`, never down. This is the formal guarantee that closure-operators built from closure-rules are inflationary and `≤_k`-monotone.

## Why "Π₁" and "positive"

**Π₁** means: the antecedent has a single block of universal quantifiers over entity variables. No nested alternation `∀ x ∃ y` is allowed. This restriction is what keeps the closure-rule's firing decidable in many regimes (one can check the antecedent by iterating over `E`).

**Positive** means: no negation of cell-atoms in the antecedent. One can demand that a cell's value be `≥_k V` (positive evidence threshold) but not that it be `<_k V` (negative — "the value is at most this"). Positivity is what guarantees the generated closure-operator is `≤_k`-monotone: pushing other cells up in `≤_k` can only make the antecedent EASIER to satisfy, never harder. Without positivity, monotonicity fails and the rule could un-fire when other cells grow.

These two constraints (Π₁, positive) define the **closure-rule-language** — the formal syntax that closure-rules must inhabit. See sibling $thing `closure-rule-language` for the formal specification.

## Why a closure-rule cannot retract

The consequent is `v'(p)(t_1, t_2) ≥_k V`. Reading: when applied, the rule asserts the cell's value is at least `V`. It does NOT assert the value equals `V`; existing higher values are preserved.

Formally, if `v(p)(t_1, t_2) = W` already and the rule fires with consequent `≥_k V`, the new value is `W ∨_k V` — the join of existing and required. If `W ≥_k V` already, no change; if not, the value moves up to `W ∨_k V`. Either way, monotone in `≤_k`. The rule cannot push a cell DOWN.

This is the formal source of settling-monotonicity. Every rule firing produces a `≤_k`-non-decreasing update; the orbit is `≤_k`-monotone by induction.

## Rule-language fragments stratify the regime

The fragment of the closure-rule-language a rule uses determines the regime its generated closure-operator can inhabit:

| Antecedent shape | Closure-ordinal | Regime |
|---|---|---|
| No `∀`-block (finite atoms only) | `κ < ω` | strict-finite |
| Finite `∀`-block over finite content | `κ = ω` | Scott-continuous |
| `∀` over infinite `E` | `ω < κ < ω₁` | transfinite-bounded |
| `∀` + infinitary connectives | `κ ≥ ω₁` | aperiodic |

So merely reading the rule's antecedent reveals which regime its orbit will live in. The four-regime tower is exactly the stratification of closure-rules by language fragment.

## Worked example: a simple closure-rule

Suppose `C` has predicates `is-parent` and `is-grandparent`, and we want to encode "if `x` is parent of `y` and `y` is parent of `z` then `x` is grandparent of `z`."

Rule:

$$\forall x \forall y \forall z.\; \bigl(v(\text{is-parent})(x, y) \geq_k \mathbf{t}\bigr) \;\wedge\; \bigl(v(\text{is-parent})(y, z) \geq_k \mathbf{t}\bigr) \;\Longrightarrow\; v'(\text{is-grandparent})(x, z) \geq_k \mathbf{t}.$$

- `\vec{x} = (x, y, z)` — three universally-quantified entity variables.
- `\vec{y} = ()` — no free fire-on parameters; the rule's content is the same for every `(x, z)`.
- Antecedent: two cell-atoms (both `≥_k t`), conjoined.
- Consequent: cell-atom on `is-grandparent` with `≥_k t`.

When this rule is added to a closure-rule-system, applying the operator forces: for any `x, z` such that the parent chain `x → y → z` holds, the grandparent cell `(x, z)` gets `t`. The closure pushes the grandparent relation to its closure under transitivity.

The antecedent has a finite `∀`-block (`∀ x ∀ y ∀ z`) over `E`. If `E` is finite, the fragment is Scott-continuous and the closure converges at `ω`. If `E` is infinite, the rule fires over an infinite quantifier range, putting the closure in the transfinite-bounded regime.

## Position in the four-regime grammar

A closure-rule is what positing issues — the syntactic act of committing to a rule. The act of positing IS the act of issuing one or more closure-rules for inclusion in the closure-rule-system that drives settling.

- A closure-rule with finite antecedent is **Scott-continuous**: its action commutes with directed `∨_k`-joins. Sets of such rules generate Scott-continuous closure operators, populating `scott-continuous-posit-category` — the regime category positing inhabits.
- A closure-rule with infinitary antecedent (`∀ x ∈ E` over infinite `E`) is NOT Scott-continuous. Its closure-ordinal lives in higher regimes.

## Relation to closure-rule-system and closure-operator

The progression from syntax to operation:

| Level | Object | Description |
|---|---|---|
| Syntactic atom | **closure-rule** | one rule |
| Syntactic collection | **closure-rule-system** | a set `S` of closure-rules |
| Generated operator | **closure-operator** | `cl^S` produced by closure of `S` |
| Orbit | **settlement** | `(F_U^τ(v_0))_{τ < λ}` driven by `cl^S` |

Each level is one step from syntax toward computed orbit. The closure-rule is the basic unit at the syntactic end; the settlement is the computed object at the orbit end.

## Position

`scott-continuous-posit-category/hacking/library/closure-rule/`. Positing tier — closure-rules are syntactic objects that positing issues; positing's regime category is therefore their canonical home. Wrapped in `hacking/` because the derivation that closure-rule is a typed object at this regime is admitted from substrate setup.

## Derivation source

Adapted from `predication-categories/concepts/closure-rule.md`, preserved at `docs/dev/scraps/`. The archive content is already in essentially current grammar.
