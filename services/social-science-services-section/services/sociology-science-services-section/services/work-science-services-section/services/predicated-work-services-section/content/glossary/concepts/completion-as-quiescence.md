---
type: theorem
status: sketch
depends-on: [task-cell-system, operations-settling, settling-quiescence, four-regime-dichotomy, quiescence-as-closure-algebra]
---

# Completion as quiescence at goal cells

A [task cell system](../terms/task-cell-system.md) $T = (G_T, \mathcal{S}_T, v^T_0)$ embedded in an [operations settling](../objects/operations-settling.md) $v^{\mathrm{op}}$ is *complete at stage $\tau^*$* if and only if $v^{\mathrm{op}}$ is [quiescent](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) at $\tau^*$ on $G_T$ with the target valuation $v^*_T$:

$$T \text{ complete at } \tau^* \;\iff\; \bigl(\forall \phi \in G_T\,:\, v^{\mathrm{op}}_{\tau^*}(\phi) = v^*_T(\phi)\bigr) \;\wedge\; \bigl(\forall \tau \geq \tau^*,\, \forall \phi \in G_T\,:\, v^{\mathrm{op}}_\tau(\phi) = v^{\mathrm{op}}_{\tau^*}(\phi)\bigr)$$

## Sketch

(⇐) Suppose the right-hand side holds. The first conjunct says the goal cells carry the target values at $\tau^*$. The second says no further evidence will perturb them. By definition, this is exactly what the work vocabulary's [task](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/task.md) requires for completion: the goal is achieved and stable.

(⇒) Suppose $T$ is complete at $\tau^*$ in the work-vocabulary sense — the substrate's witnesses establish the goal achievement and no contradicting witnesses exist. Then by the [witness-as-increment correspondence](../terms/witness-as-increment.md), the goal cells carry the target values at $\tau^*$. By [settling-monotonicity](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), values only grow in $\leq_k$; by the absence of contradicting witnesses, no $\top$-state arises on the goal cells; hence the values are stable for $\tau \geq \tau^*$. $\square$

## Regime-dependent existence

By the [four-regime dichotomy](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), the existence of $\tau^*$ depends on the regime of the operations settling restricted to the task's relevant cells:

- **Strict regime** ($\kappa < \omega$): $\tau^*$ exists and is finite. Computable in polynomial time per [finite-settling-$H^0$](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/finite-settling-h0-polynomial-time.md). This is the regime where most operational tasks live.
- **Scott-continuous regime** ($\kappa = \omega$): $\tau^*$ exists and equals $\omega$. The task is "complete in the limit" — a notion meaningful for tasks whose goal is asymptotic ("eventually all $X$ are tagged"), with the limit reached at the $\omega$-th stage.
- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$): $\tau^*$ exists at some countable ordinal. The task involves limit-ordinal aggregation; completion is reached only after a transfinite settling run. Rare for individual tasks; arises for cycle-aggregating tasks (e.g., "after every prior cycle has shown $P$").
- **Aperiodic regime** ($\kappa \geq \omega_1$): no countable $\tau^*$ exists. The task does not stabilize. The classifying invariant in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$ — see [aperiodic-regime classification](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-classification.md) — is the available structural classification.

## Corollary — completion is decidable in the strict regime

For a task in the strict regime, the question "is $T$ complete at stage $\tau$?" is a finite computation: check $v^{\mathrm{op}}_\tau(\phi) = v^*_T(\phi)$ for each $\phi \in G_T$, then check stability over a finite ordinal range. This is the structural reason traditional task-tracking is feasible.

## Corollary — abandonment is not completion

The work vocabulary's [task](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/task.md) terminates on goal-achieved, goal-failed, or goal-abandoned. Abandonment is *not* settling-quiescence on the goal cells — it is an increment cell $\langle T, \texttt{abandoned-by}, A\rangle$ at $\mathbf{t}$, leaving the goal cells in whatever state they were when work stopped. By this theorem, an abandoned task is not "complete in the math's sense"; the operational closure-rule system $\mathcal{S}_{\mathrm{op}}$ contains a separate lifecycle rule that transitions an abandoned task out of the dispatch queue without requiring goal-cell quiescence.
