---
type: concept
class: regime-claim
status: draft
depends-on:
  - ../../teaching/explanations/derivation.md
  - ../../../../../../predicated-computing/concepts/closure-rule.md
see-also:
  - derivation-as-cell-shape.md
  - thin-value-domain.md
---

# Scott-continuous closure-rule system

A specific, ground-able claim about Nix in the substrate's vocabulary: **Nix's closure-rule system is Scott-continuous**, and therefore Nix sits in the strict / Scott-continuous regime under (the not-yet-read) four-regime-dichotomy theorem.

## What this means

Per [closure-rule](../../../../../../predicated-computing/concepts/closure-rule.md) line 14, a closure rule has the schema

$$\forall x_1 \cdots \forall x_n.\; \phi(\vec{x};\, \vec{y};\, v) \;\Longrightarrow\; v'(p)(t_1, t_2) \geq_k V$$

with antecedent in the closure-rule language defined in predication-categories: positive Boolean combinations of cell atoms ($v(q)(s_1, s_2) \geq_k V$) and signature atoms, optionally preceded by a single $\forall$-block over entity variables.

The Scott-continuity test (per the closure-rule-language convention summarized in `closure-rule.md`'s referent): a rule with **quantifier-free** antecedent generates a Scott-continuous closure operator; a rule with a $\forall$-block over an *infinite* entity domain generates a non-Scott-continuous closure operator.

## Why Nix passes the test

A Nix derivation's evaluation rule, stripped down, says:

> *Given that the cells `(input-path-1, present, _)`, …, `(input-path-n, present, _)` are settled (i.e., their outputs are realized in the store), the cell `(output-path, content, bytes)` settles to the result of running the builder on those inputs.*

The antecedent is a *finite, explicit* list of cell-presence atoms: `(input-path-1, present, _) ∧ (input-path-2, present, _) ∧ … ∧ (input-path-n, present, _)`. There is no universal quantifier over the entity set $E$; there is no quantification over the universe of derivations. The antecedent is a Boolean combination of finitely many specific cell atoms — *quantifier-free*.

This is true of every Nix evaluation rule. There is no Nix construct that fires on a property like "for every store path $x$ in the universe, if $x$ has property $P$, then …" — Nix's antecedents are always per-derivation, finite, and explicit. This is structural: Nix's hermetic-build commitment requires that a derivation declare its inputs explicitly, which means *no rule can have an antecedent that ranges over inputs not yet known*.

Therefore: every Nix closure rule is quantifier-free; therefore, by the closure-rule-language Scott-continuity criterion, Nix's closure operator is Scott-continuous.

## Consequence

Per the (not-yet-read) [four-regime-dichotomy](../../../../../../predicated-computing/concepts/closure-rule.md) referenced from the closure-rule concept, the substrate's regime is determined by the rule-language fragment its closure rules sit in. Scott-continuity locates Nix in the strict or Scott-continuous regime — distinct from the transfinite-bounded and aperiodic regimes that arise when $\forall$-blocks over infinite entity domains are admitted.

Per `non-scott-continuous-firing-ordinal.md` (cited in `closure-rule-language.md`), in a Scott-continuous closure operator the set $L_{\mathrm{ns}}(\kappa)$ of non-Scott-continuous firing ordinals is empty — every settling firing is determined by some finite sub-collection of antecedents. The transfinite-bounded-regime cohomology generators that arise from non-Scott-continuous firings (each contributing a $\mathbb{Z}$-generator to $H^1$ of the substrate's settling-associated sheaf) do not arise for Nix.

## What this does and does not imply

Implies:
- Nix's settling reaches a fixed point at $\omega$ (the first infinite ordinal) at the latest — the closure ordinal is bounded by $\omega$ for Scott-continuous closure operators.
- Nix's wavefront (every dependent rebuilds when its inputs change) is structurally local in the sense the substrate's wavefront-locality discipline names — bounded by the closure rule's match radius.
- Nix's federation, were it lifted into the substrate's apparatus, would inherit the simpler federation theorems that hold in the Scott-continuous regime.

Does not imply:
- That Nix is *complete* against the substrate's seven [closure-conditions](../../../../../../predicated-computing/concepts/closure-conditions.md). The Scott-continuity claim is about the *regime* of the rule system, not about whether the rule system is closed under the substrate's seven conditions for being a complete predicated computer. See [partial-self-representation](partial-self-representation.md) for what Nix lacks at the closure-condition level.
- That Nix's value-domain admits the substrate's full apparatus. See [thin-value-domain](thin-value-domain.md): Scott-continuity is a regime claim about closure-rule structure, orthogonal to the value-domain claim that Nix lacks the substrate's bilattice.

## Status

Sketch. The claim is grounded in the closure-rule-language criterion as stated in `closure-rule-language.md` (read directly), but the four-regime-dichotomy theorem and the cohomological consequences cited above have not been read by me. See the question [four-regime-classification-of-nix](questions/four-regime-classification-of-nix.md) for what the regime claim specifically requires of Nix that I have not yet verified.
