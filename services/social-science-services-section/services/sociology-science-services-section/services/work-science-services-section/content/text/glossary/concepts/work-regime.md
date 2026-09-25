---
type: concept
class: semantic-anchor
status: draft
depends-on: [operations-settling, four-regime-dichotomy, regime-classification-scope]
title: Work regime
description: "The four-regime classification of predication-categories specialized to work-themed settlings: strict, Scott-continuous, transfinite-bounded, and aperiodic, applied to the operations settling and its sub-settlings."
---

# Work regime

The [four-regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) of predication-categories specialized to work-themed settlings: *strict*, *Scott-continuous*, *transfinite-bounded*, and *aperiodic*, applied to the operations settling and its sub-settlings.

Work regime is determined by the closure ordinal $\kappa$ of the relevant closure operator. The four cases carry distinct operational interpretations:

| Regime | $\kappa$ | Operational interpretation |
|---|---|---|
| Strict | $< \omega$ | Bounded work — finite task with finite capability dependencies. Polynomial-time decidability of completion. The regime in which most line-item tasks live. |
| Scott-continuous | $= \omega$ | Asymptotic work — recurrent practice with finite-history closure rules; completion "in the limit." |
| Transfinite-bounded | $\omega < \kappa < \omega_1$ | Cycle-aggregating work — closure rules that quantify across all prior cycles, with countable cofinality. Generational reviews, multi-period audits. |
| Aperiodic | $\kappa \geq \omega_1$ | Function-class work — the [function](../../theorems/function-as-aperiodic-settling.md), aim-generative enterprises, pursuits whose aim-set evolves under their own pursuit. |

## Operator-regime vs. settling-regime

The four-regime dichotomy classifies *closure operators* (more precisely: the worst-case closure ordinal over all possible increment sequences). This is the *operator-regime*. But the actual settling of a specific operational run may have a *settling-regime* strictly lower than the operator-regime.

**Operator-regime** $\rho(\mathrm{cl})$: the supremum over all increment sequences of the closure ordinal. Determined by the structural properties of $\mathcal{S}_{\mathrm{op}}$ — whether it contains limit-aggregating rules, uncountable-cofinality aggregations, etc.

**Settling-regime** $\rho(v^{\mathrm{op}}, u)$: the closure ordinal of the specific orbit $v_0, v_1, v_2, \ldots$ under the given increment sequence $u = (u_\tau)$.

The relationship: $\rho(v^{\mathrm{op}}, u) \leq \rho(\mathrm{cl})$ always. A settling's actual regime is bounded above by the operator-regime but may be lower if the increment sequence never triggers the rules responsible for the worst-case behavior.

**Example.** The operations settling's $\mathcal{S}_{\mathrm{op}}$ includes aim-settling rules (aperiodic-class) and task-lifecycle rules (strict-class). The operator-regime is aperiodic. But for a specific bounded operational period with no aim-settling activity — only task dispatch, completion, and charter-rule checks — all fired rules are strict-class. The settling-regime for that period is strict.

This means: the regime classification theorems — [regime-of-task](../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-task.md), [regime-of-recurrent-practice](../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-recurrent-practice.md) — give *upper bounds* (operator-regimes) on what any execution of the described work-unit can require. A specific execution may be in a lower settling-regime if the relevant high-regime rules never fire.

See [regime-classification-scope](../../triage/questions/regime-classification-scope.md) for the full treatment.

## Completion notions by regime

The regime of a work-unit determines which *completion notion* is available:

**Strict regime.** Completion is quiescence: all goal cells reach their target values in finitely many closure steps. The [completion-as-quiescence](../../../../services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) theorem applies directly. Decidable in finite time.

**Scott-continuous regime.** Completion is the $\omega$-limit: all goal cells reach their target values by the $\omega$-th closure step, but not necessarily in any finite number of steps. For a recurrent practice, "completion" means the practice has produced a settled fixed point across all its cycles' closures. Not individually finite but limit-decidable.

**Transfinite-bounded regime.** Completion is the transfinite fixed point: the settling stabilizes at some ordinal $\kappa$ with $\omega < \kappa < \omega_1$. For a generational review practice, "completion" means the review has incorporated all prior cycles' settled content — achieved in the transfinite limit. Not limit-decidable by any $\omega$-length computation; requires transfinite settling analysis.

**Aperiodic regime.** There is no quiescence-based completion notion: the settling never stabilizes to a single fixed point in any countable settling. For the function, "progress" is not reduction in residual tasks but movement of the $H^1$-class through the cohomology group $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$. The cohomological diagnostic is not a completion test but a *direction* test: the enterprise is making progress iff its $H^1$-class is moving in the right direction within the cohomology group.

## Regime and work-type correspondence

From [decomposition-patterns](../../triage/questions/decomposition-patterns.md) and [regime-of-recurrent-practice](../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-recurrent-practice.md):

| Work type | Decomposition | Operator-regime |
|---|---|---|
| Process | AND/sequential | Strict |
| Procedure | Sequential + conditional | Strict |
| Derivation | AND with DAG | Strict |
| Inquiry | Dynamic subtask-set | Scott-continuous |
| Recurrent practice (finite-history) | Cycle-aggregation | Scott-continuous |
| Recurrent practice (generational) | Limit-aggregation | Transfinite-bounded |
| Function / enterprise | Aim-generative | Aperiodic |

## Regime of a composite settling

The operations settling contains sub-settlings for each task, practice, and aim-settling subsystem. The regime of the composite settling is the *maximum* regime of any sub-settling — per the [regime-of-task theorem](../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-task.md)'s regime-preservation under composition.

A single aperiodic-class sub-settling (the function's aim-settling) lifts the entire operations settling to the aperiodic operator-regime, even if every individual task is strict. This is structurally correct: the function's character as non-completable in any countable settling is a property of the *whole* operations settling, not of any individual task within it.

The diagnostic value: a working community that understands its operations settling's regime knows which aspects of its work are decidably completable (the task layer) and which require cohomological assessment (the function layer). The regime classification draws this boundary structurally.

## Truth-knowledge LES and regime-dependent cohomological structure

The [truth-knowledge long exact sequence](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/truth-knowledge-cohomology-long-exact-sequence.md) behaves differently at each regime, yielding a regime-stratified cohomological picture of the operations settling.

**Strict regime** (closure ordinal $< \omega$): The settling reaches quiescence in finitely many steps. The inconsistency sheaf $\mathcal{F}^{(\top)}$ at quiescence is either zero (no contradictions) or carries finitely many contradicted cells. If $\mathcal{F}^{(\top)} = 0$, the LES collapses: $H^n_t \cong H^n_k$ for all $n$. The cohomological assessment is computationally trivial — the LES is always finite-dimensional and computable.

**Scott-continuous regime** (closure ordinal $= \omega$): The settling reaches its fixed point only at the $\omega$-limit. The inconsistency sheaf may accumulate over the $\omega$ steps, with each step potentially adding new contradicted cells. At the limit, $\mathcal{F}^{(\top)}_\omega$ is the colimit of the sheaves $\mathcal{F}^{(\top)}_n$. The LES connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}_\omega) \to H^1_t(\mathcal{F}^{(t)}_\omega)$ captures contradictions that only become visible at the limit — contradictions between the $\omega$-accumulation of different cycle-closures in a recurrent practice. These are the inter-cycle contradictions that no finite-step adjudication catches.

**Transfinite-bounded regime** ($\omega < \kappa < \omega_1$): Limit-stage closure rules fire at countable limit ordinals $\lambda \leq \kappa$. Each limit-stage closure step can create new inconsistency if the limit-aggregating antecedent reads cells from incompatible prior cycles. The LES at stage $\kappa$ has $H^1_t \neq 0$ precisely when there are unresolved limit-stage contradictions — contradictions between different cycle-epochs in a generational review. The LES is countably-infinite-dimensional at the limit; assessing it requires transfinite-induction arguments.

**Aperiodic regime** ($\kappa \geq \omega_1$): No quiescence. The LES does not stabilize to a final state. Progress assessment shifts from the LES's zero-ness to the *direction* of the $H^1$-class's movement through $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$ — as described in [function-as-aperiodic-settling](../../theorems/function-as-aperiodic-settling.md). The LES is replaced by the cohomological trajectory: the enterprise's health is whether its cohomological class is moving productively, not whether the inconsistency sheaf vanishes.

## Where used

- [regime-of-task](../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-task.md), [regime-of-recurrent-practice](../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-recurrent-practice.md) — characterization theorems for specific work-unit types.
- [completion-as-quiescence](../../../../services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) — completion's regime-dependent existence.
- [function-as-aperiodic-settling](../../theorems/function-as-aperiodic-settling.md) — the function lives in the aperiodic regime.
- [regime-classification-scope](../../triage/questions/regime-classification-scope.md) — the operator/settling regime distinction.
- [aim-generativity-iff-aperiodic](../../../../../../../social-theory-science-services-section/content/text/documents/articles/notes/undated/aim-generativity-iff-aperiodic.md) — the formal connection between aim-generativity and aperiodic regime.
