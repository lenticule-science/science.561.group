---
type: theorem
status: sketch
depends-on: [task-cell-system, operations-settling, settling-quiescence, four-regime-dichotomy, quiescence-as-closure-algebra]
title: Completion as quiescence at goal cells
description: "A task cell system $T = (GT, \\mathcal{S}T, v^T0)$ embedded in an operations settling $v^{\\mathrm{op}}$ is complete at stage $\\tau^$ if and only if $v^{\\mathrm{op}}$ is quiescent at $\\tau^$ on $GT$ with the target valuation $v^T$:"
---

# Completion as quiescence at goal cells

A [task cell system](../../../../../../../../social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) $T = (G_T, \mathcal{S}_T, v^T_0)$ embedded in an [operations settling](../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/operations-settling.md) $v^{\mathrm{op}}$ is *complete at stage $\tau^*$* if and only if $v^{\mathrm{op}}$ is [quiescent](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-quiescence/settling-quiescence.md) at $\tau^*$ on $G_T$ with the target valuation $v^*_T$:

$$T \text{ complete at } \tau^* \;\iff\; \bigl(\forall \phi \in G_T\,:\, v^{\mathrm{op}}_{\tau^*}(\phi) = v^*_T(\phi)\bigr) \;\wedge\; \bigl(\forall \tau \geq \tau^*,\, \forall \phi \in G_T\,:\, v^{\mathrm{op}}_\tau(\phi) = v^{\mathrm{op}}_{\tau^*}(\phi)\bigr)$$

## Sketch

(⇐) Suppose the right-hand side holds. The first conjunct says the goal cells carry the target values at $\tau^*$. The second says no further evidence will perturb them. By definition, this is exactly what the work vocabulary's [task](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/task.md) requires for completion: the goal is achieved and stable.

(⇒) Suppose $T$ is complete at $\tau^*$ in the work-vocabulary sense — the substrate's witnesses establish the goal achievement and no contradicting witnesses exist. Then by the [witness-as-increment correspondence](../terms/witness-as-increment.md), the goal cells carry the target values at $\tau^*$. By [settling-monotonicity](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), values only grow in $\leq_k$; by the absence of contradicting witnesses, no $\top$-state arises on the goal cells; hence the values are stable for $\tau \geq \tau^*$. $\square$

## Regime-dependent existence

By the [four-regime dichotomy](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md), the existence of $\tau^*$ depends on the regime of the operations settling restricted to the task's relevant cells:

- **Strict regime** ($\kappa < \omega$): $\tau^*$ exists and is finite. Computable in polynomial time per [finite-settling-$H^0$](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/finite-settling-h0-polynomial-time.md). This is the regime where most operational tasks live.
- **Scott-continuous regime** ($\kappa = \omega$): $\tau^*$ exists and equals $\omega$. The task is "complete in the limit" — a notion meaningful for tasks whose goal is asymptotic ("eventually all $X$ are tagged"), with the limit reached at the $\omega$-th stage.
- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$): $\tau^*$ exists at some countable ordinal. The task involves limit-ordinal aggregation; completion is reached only after a transfinite settling run. Rare for individual tasks; arises for cycle-aggregating tasks (e.g., "after every prior cycle has shown $P$").
- **Aperiodic regime** ($\kappa \geq \omega_1$): no countable $\tau^*$ exists. The task does not stabilize. The classifying invariant in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$ — see [aperiodic-regime classification](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) — is the available structural classification.

## Corollary — completion is decidable in the strict regime

For a task in the strict regime, the question "is $T$ complete at stage $\tau$?" is a finite computation: check $v^{\mathrm{op}}_\tau(\phi) = v^*_T(\phi)$ for each $\phi \in G_T$, then check stability over a finite ordinal range. This is the structural reason traditional task-tracking is feasible.

## Corollary — abandonment is not completion

The work vocabulary's [task](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/task.md) terminates on goal-achieved, goal-failed, or goal-abandoned. Abandonment is *not* settling-quiescence on the goal cells — it is an increment cell $\langle T, \texttt{abandoned-by}, A\rangle$ at $\mathbf{t}$, leaving the goal cells in whatever state they were when work stopped. By this theorem, an abandoned task is not "complete in the math's sense"; the operational closure-rule system $\mathcal{S}_{\mathrm{op}}$ contains a separate lifecycle rule that transitions an abandoned task out of the dispatch queue without requiring goal-cell quiescence.

## Earlier material

A *suspended* task (from [abandonment-and-resumability](../../../../../content/text/triage/questions/abandonment-and-resumability.md)) is neither completed nor abandoned. Suspension is implemented via an *activation guard*: a meta-level inhibitor on the closure rules in $\mathcal{S}_T$, expressed as an additional antecedent conjunct $v(\langle T, \texttt{activation-permitted}\rangle) = \mathbf{t}$ on every lifecycle-advancing rule. When the activation-permitted cell is $\bot$, all task-lifecycle rules are inert; the goal cells freeze at their current values.

On resumption — when the activation-permitted cell is reasserted to $\mathbf{t}$ — the lifecycle rules re-engage and the task continues its settling trajectory. The settling ordinal for the resumable task is the *sum* of the pre-suspension and post-resumption settling ordinals; the closure ordinal is not reset to 0 on resumption (settling-monotonicity holds throughout). A task that would have been in the strict regime in a single run remains in the strict regime after suspension and resumption, because the total number of closure steps is still finite.

The distinction: suspension is a *deferral* of quiescence, not its negation. Abandonment *terminates* the trajectory (no resumption). Suspension *pauses* it (resumption is possible). Only completion achieves quiescence at the target valuation.

Cancellation (the Cancelled state introduced in [task-cell-system](../../../../../../../../social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md)) is the working community's decision to abandon a task without assigning liability to any specific agent — a coordination decision rather than an individual agent decision. Like abandonment, cancellation does not produce goal-cell quiescence; the task's goal cells remain at whatever value they held when cancellation was asserted.

Cancellation differs from abandonment in the normative layer: abandonment may create accountability claims (did the abandoning agent discharge their duty?), while cancellation reflects a governance decision that the goal is no longer being pursued, releasing all agents from the associated duties. The substrate-algebraic effect is the same: no goal-cell quiescence, task removed from the dispatch queue.
