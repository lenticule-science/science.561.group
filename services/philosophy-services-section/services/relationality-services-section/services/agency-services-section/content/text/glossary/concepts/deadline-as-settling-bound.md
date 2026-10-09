---
type: theorem
status: sketch
depends-on: [task-cell-system, operations-settling, completion-as-quiescence, settling-quiescence]
see-also: [completion-as-quiescence, three-temporal-registers-in-settling]
title: A deadline-bounded task requires quiescence before the settling bound
description: A task cell system $T = (GT, \mathcal{S}T, v^T0)$ is deadline-bounded when the operations settling is required to reach completion-as-quiescence on $GT$ before a specified settling stage $\lambdad$.
---

# A deadline-bounded task requires quiescence before the settling bound

A [task cell system](../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) $T = (G_T, \mathcal{S}_T, v^T_0)$ is **deadline-bounded** when the operations settling is required to reach completion-as-quiescence on $G_T$ before a specified settling stage $\lambda_d$.
A task is *on time* iff completion is achieved at $\tau^* < \lambda_d$.

## Definition

Let the [settling bound](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/_archive/humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-bound.md) $\lambda$ of the operations settling be the upper index allowed.
A **deadline** on task $T$ is a designated sub-ordinal $\lambda_d < \lambda$.
The task is **on time** iff:

$$\exists \tau^* < \lambda_d \;:\; \bigl(\forall \phi \in G_T : v^{\mathrm{op}}_{\tau^*}(\phi) = v^*_T(\phi)\bigr) \;\wedge\; \bigl(\forall \tau \geq \tau^* : v^{\mathrm{op}}_\tau(\phi) = v^{\mathrm{op}}_{\tau^*}(\phi)\bigr)$$

The task is **late** iff the first condition holds for some $\tau^* \geq \lambda_d$ (completed after deadline) or not at all (not completed by closure ordinal).
The task is **at risk** during settling when $v^{\mathrm{op}}_\tau|_{G_T}$ has not yet reached $v^*_T$ and $\tau$ is approaching $\lambda_d$.

## Sketch

The settling bound $\lambda_d$ is an ordinal-valued predicate cell $\langle T, \texttt{deadline-at}, \lambda_d\rangle = \mathbf{t}$ in the task's operations base.
A monitoring closure rule fires at each settling step $\tau < \lambda_d$:

$$\tau \geq \lambda_d \;\wedge\; v|_{G_T} \neq v^*_T \;\Longrightarrow\; \langle T, \texttt{late}\rangle = \mathbf{t}$$

This rule fires once (monotone consequent: once the late-cell is at $\mathbf{t}$, it stays there).
By [settling-monotonicity](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/_archive/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the late-cell is never retracted after firing.

The four regime cases of [completion-as-quiescence](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) interact with the deadline as follows:

- **Strict regime** ($\tau^* < \omega$): the task completes at a finite stage.
  Whether it completes before $\lambda_d$ is a finite comparison $\tau^* < \lambda_d$.
  Computable from the closure-rule structure.
- **Scott-continuous regime** ($\tau^* = \omega$): completion is at the $\omega$-limit.
  If $\lambda_d = \omega$, the task completes exactly at its deadline — on time in the limit but never strictly before.
  If $\lambda_d < \omega$ (a finite deadline), a Scott-continuous-regime task *cannot* be on time: it does not complete at any finite stage.
- **Transfinite-bounded / aperiodic**: similar analysis by ordinal comparison.

## Corollary — deadline-bounded tasks select regime

Imposing a finite deadline $\lambda_d < \omega$ on a task *requires* that the task's relevant closure rules produce a strict-regime settling on $G_T$.
If the task's rule structure would produce Scott-continuous or transfinite-bounded settling, the deadline cannot be met by design.
The deadline is a regime constraint as much as a time constraint.

## Corollary — late detection is coordination-free

The late-cell $\langle T, \texttt{late}\rangle$ is a $\leq_k$-monotone cell: once at $\mathbf{t}$, it stays at $\mathbf{t}$.
By the [CALM property](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md), the query "is $T$ late?" is coordination-free: any replica observing the late-cell at $\mathbf{t}$ can report lateness without coordination.
Early completion, like charter compliance, requires coordination to confirm (checking the *absence* of lateness before $\lambda_d$).

## Connection to the work vocabulary

The [deadline](../../../../../../../../../social-science-services-section/content/text/glossary/terms/deadline.md), [duration](../../../../../../../../../social-science-services-section/content/text/glossary/terms/duration.md), and [horizon](../../../../../../../../../social-science-services-section/content/text/glossary/terms/horizon.md) vocabulary in the work theory maps onto this substrate:

- **Deadline** = the settling bound $\lambda_d$ as defined here.
- **Duration** = $\tau^* - 0$ — the number of settling steps from task creation to quiescence.
- **Horizon** = the settling bound $\lambda$ of the containing operations settling — the maximum ordinal the system can run before the broader context terminates.
  A task's deadline $\lambda_d$ must be less than the system horizon.

The open question [three-temporal-registers-in-settling](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/triage/three-temporal-registers-in-settling.md) asks how these three registers (task-local time, operational cycle time, strategic horizon) relate in the settling framework.
This theorem handles the deadline-horizon relation; the task-local vs. operational relation requires further work.
