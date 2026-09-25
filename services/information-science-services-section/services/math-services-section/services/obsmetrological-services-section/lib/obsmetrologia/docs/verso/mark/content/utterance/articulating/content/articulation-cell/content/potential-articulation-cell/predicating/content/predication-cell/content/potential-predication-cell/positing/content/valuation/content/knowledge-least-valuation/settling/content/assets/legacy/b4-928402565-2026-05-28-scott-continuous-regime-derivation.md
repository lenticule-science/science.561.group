---
title: "Scott-continuous regime derivation, from the predication-categories archive"
date: 2026-05-28
draws-from: ["docs/dev/scraps/scott-continuous-closure.md", "docs/dev/scraps/closure-rule.md"]
---

## What this category IS

`scott-continuous-posit-category` is the category whose objects are settlings with **closure ordinal κ = ω** — closure operators on the predication-fiber algebra that are Scott-continuous in the knowledge order. Formally, for every `≤_k`-directed subset `S ⊆ A_p`,

$$\mathrm{cl}_p\!\left(\bigvee_k S\right) \;=\; \bigvee_k\{\mathrm{cl}_p(x) : x \in S\}.$$

The closure commutes with directed `∨_k`-suprema. Equivalently: the closure converges at exactly step ω.

## Why positing opens this regime

Positing is the act of committing a claim about a predication-cell's value. The archive concept-derivation says:

> Scott-continuity arises naturally when inference rules have finite antecedents: each rule fires on a `∨_k`-join iff it fires on some finite sub-join.

This is exactly the operational signature of positing: a posit IS an act of committing on the basis of finite evidence. Quantifier-induced closures with infinitary antecedents (`∀x ∈ E` over infinite `E`) are NOT Scott-continuous — they belong to higher regimes. The act of positing, restricted to finite-antecedent rules, generates exactly the Scott-continuous regime.

Concrete realizations the archive cites: Fitting's logic-programming closure (1991), description-logic TBox closure — both Scott-continuous.

## Closure-rule as the syntactic object of positing

The archive concept `closure-rule` (scrap at `docs/dev/scraps/closure-rule.md`) gives the syntactic generator of a closure operator. One rule schema:

$$\underbrace{\forall x_1 \cdots \forall x_n.\; \phi(\vec{x};\, \vec{y};\, v)}_{\text{positive }\Pi_1\text{ antecedent}} \;\Longrightarrow\; \underbrace{v'(p)(t_1, t_2) \geq_k V}_{\text{cell-update consequent}}$$

with free entity variables `\vec{y}` firing once per `\vec{y}`-instantiation from `E`, universally bound entity variables `\vec{x}`.

In current grammar: **a closure-rule is what positing posits**. The act of positing is the issuing of one such rule (or a set of them) for inclusion in the system that drives settling. Closure-rules live as terms of scott-continuous-posit-category — see the newly-minted `hacking/library/closure-rule/` at this category for the canonical-language $thing.

## Move log

- `scott-continuous-closure.md` preserved at `docs/dev/scraps/scott-continuous-closure.md`. Its `depends-on: [closure-operator, predication-fiber-algebra, knowledge-order]` — all three are downstream archive items.
- `closure-rule.md` preserved at `docs/dev/scraps/closure-rule.md`. Its content is the body of the new `hacking/library/closure-rule/closure-rule.md` $thing.
- Archive origin: `predication-categories/concepts/scott-continuous-closure.md` and `predication-categories/concepts/closure-rule.md`. Both treated as generic concepts; both are now placed at the regime category their substance defines.
