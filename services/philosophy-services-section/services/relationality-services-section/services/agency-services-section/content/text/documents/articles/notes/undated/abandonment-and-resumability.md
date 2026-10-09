---
type: question
status: open
explores: [task-cell-system, completion-as-quiescence]
title: What is the substrate state of an abandoned task, and is it resumable?
description: "The task-cell-system object and completion-as-quiescence theorem treat abandonment as a separate predicate: $\\langle T, \\texttt{abandoned-by}, A^\\rangle = \\mathbf{t}$ for some agent $A^$, leaving the task's goal cells $GT$ in whatever…"
---

# What is the substrate state of an abandoned task, and is it resumable?

The [task-cell-system object](../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) and [completion-as-quiescence theorem](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) treat *abandonment* as a separate predicate: $\langle T, \texttt{abandoned-by}, A^*\rangle = \mathbf{t}$ for some agent $A^*$, leaving the task's goal cells $G_T$ in whatever bilattice state they had when work stopped.

Open questions on abandonment:

- **Goal-cell state after abandonment.** What happens to an abandoned task's goal cells under continued substrate operation?
  Whether the closure rules continue to potentially settle them, or whether the substrate carries an explicit pinning-at-abandonment that excludes them from further activity, is unsettled.
- **Resumability.** The work vocabulary's [task term](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/library/theories/humanities/theories/sociology/theories/work/terms/task.md) terminates on abandonment — termination is a final state.
  By [settling-monotonicity](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the `abandoned-by` cell once at $\mathbf{t}$ remains at $\mathbf{t}$.
  Whether and how resumption is admitted — under what operation, with what relationship to the prior abandonment witness — is unsettled.
- **Distinction from failure.** Failed tasks have goal cells at $\mathbf{f}$; abandoned tasks have goal cells at whatever value they had when work stopped.
  Whether this substrate-level difference carries operational meaning is unsettled.

The question matters because the audit log's reconstruction of "what happened to task $T$" depends on these substrate-state distinctions; a downstream agent or auditor cannot tell whether a non-completed task is failed or abandoned without consulting the relevant cells.
