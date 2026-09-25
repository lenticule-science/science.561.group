---
type: theorem
status: sketch
depends-on: [recurrent-practice, four-regime-dichotomy, scott-continuous-closure, aperiodic-settling]
title: Regime of a recurrent practice
description: "A recurrent practice $R = (\\mathcal{S}R, TR, \\alphaR)$ embedded in an operations settling lives in a specific regime determined by its aggregation structure $\\alphaR$:"
---

# Regime of a recurrent practice

A [recurrent practice](../terms/recurrent-practice.md) $R = (\mathcal{S}_R, T_R, \alpha_R)$ embedded in an [operations settling](../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/operations-settling.md) lives in a specific regime determined by its aggregation structure $\alpha_R$:

| $\alpha_R$ | Regime of $R$ as a sub-settling |
|---|---|
| Cycle-independent | Strict-or-Scott-continuous (Scott-continuous if $T_R$ is countably infinite) |
| Markov | Scott-continuous |
| Finite-history (depth $k$) | Scott-continuous |
| Limit-aggregating, countable cofinality | Transfinite-bounded |
| Limit-aggregating, uncountable cofinality | Aperiodic |

## Sketch

By the [four-regime dichotomy](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md), regime is determined by the closure ordinal $\kappa$ of the closure operator. For a recurrent practice's closure-rule subsystem, $\kappa$ tracks the cycle-aggregation structure:

**Cycle-independent and Markov-and-finite-history.** Each cycle's closure rule depends on at most a finite history. A finite-history closure rule is [Scott-continuous](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md): its antecedent is determined by finitely many prior stages, which is preserved under directed joins. By the regime dichotomy, $\kappa = \omega$ when $T_R$ is countably infinite (the practice runs forever), or $\kappa < \omega$ if $T_R$ is finite.

**Limit-aggregating.** At limit ordinals in $T_R$, the closure rule's antecedent reads $\bigvee_k \{v_{\tau_i} : \tau_i < \mu\}$ — the join of all prior cycles' settled content. This is non-Scott-continuous: the join cannot be computed from any finite sub-family of the prior cycles. By the regime dichotomy, the closure ordinal is at least $\omega + 1$. The cofinality of the limit-aggregation determines the regime:

- Countable cofinality (the limit aggregations are over countable sub-families): $\omega < \kappa < \omega_1$ — transfinite-bounded.
- Uncountable cofinality (some limit aggregations require $\omega_1$-many cycles to stabilize): $\kappa \geq \omega_1$ — aperiodic. $\square$

## Examples per regime

- **Cycle-independent.** A daily standup whose content is determined entirely by that day's witnesses, with no carry-over between days. Strict per cycle; Scott-continuous overall.
- **Markov.** A weekly review whose agenda is determined by the prior week's review outputs and the current week's increments. Scott-continuous: each cycle's closure rule needs only one prior cycle.
- **Finite-history (depth $k$).** A quarterly planning that draws on the prior $k$ quarters' goals. Scott-continuous: depth-$k$ history is finite at any stage.
- **Limit-aggregating, countable cofinality.** An annual ceremony whose enacted form depends on all prior annual instances cumulatively (e.g., reciting names of all prior office-holders). Transfinite-bounded.
- **Limit-aggregating, uncountable cofinality.** The practice that aggregates across uncountably-many prior cycle stages — the natural home for the [function as aperiodic settling](function-as-aperiodic-settling.md). Aperiodic.

## Connection to function-as-aperiodic-settling

The [function-as-aperiodic-settling theorem](function-as-aperiodic-settling.md) places the function of an endeavor in the aperiodic regime. By the present theorem, this requires the function's closure-rule structure to include limit-aggregating rules with uncountable cofinality. The Haudenosaunee 7-generations principle — decisions evaluated against their consequences seven generations forward — is the operational shape of such a rule: each settlement consults aggregations over future-generational cohorts, and cumulatively over all prior generations as they pass into history. The aggregation structure is what places the function in aperiodic-regime; without it, even an indefinite endeavor would be Scott-continuous (running forever but with finite-history closure at each step).

## Connection to substitution-rule structure

The math program's [step-$n$ substitution rule](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/step-n-substitution-rule.md) is a finite-history closure rule (depth-$n$) whose iterated firing produces an aperiodic sequence — but the aperiodicity comes from the *combinatorial structure* of the substitution matrix, not from limit-aggregation in the closure rule itself. Step-$n$ rules are Scott-continuous as closure operators (depth-$n$ history is finite); the aperiodic sequences they produce live in the aperiodic regime via the cofinality of $E$, not the closure structure. So substitution-rule recurrent practices are Scott-continuous in the regime classification above, but their *associated combinatorial dynamical system* exhibits aperiodicity in a different (Sadun, Anderson-Putnam) sense.

This means: substitution-rule patterns and limit-aggregating recurrent practices are *two different routes* to non-trivial cohomology. Substitution rules produce aperiodic combinatorial dynamics on a Scott-continuous closure; limit-aggregating practices produce non-Scott-continuous closure with potentially aperiodic regime placement. The math program's [aperiodic-regime classification theorem](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) handles the second route directly; the substitution-rule examples (Fibonacci, Padovan, etc.) handle the first. The predicated-work program's recurrent practices may exhibit either or both.
