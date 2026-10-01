---
type: question
status: open
explores: [task-cell-system, operations-settling, completion-as-quiescence, operations-base]
title: What is the substrate formal structure of task abandonment?
description: Completion-as-quiescence characterizes task completion as the settling's task-cell-system reaching its target valuation — all required cells at their target values, the task's completion cell at $\mathbf{t}$.
---

# What is the substrate formal structure of task abandonment?

[Completion-as-quiescence](../../../../../../services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) characterizes task completion as the settling's task-cell-system reaching its target valuation — all required cells at their target values, the task's completion cell at $\mathbf{t}$. Abandonment is the deliberate halt of a task execution that does not reach this target: the task is stopped, the completion cell is not at $\mathbf{t}$, but the halt is intentional rather than a failure of evidence. The substrate structure of this act is unclear.

## Why abandonment is not completion's negation

In the four-bilattice, the completion cell $\langle T, \texttt{complete}\rangle$ progresses from $\bot$ (not yet determined) toward $\mathbf{t}$ (completed) as evidence accumulates via [witness-as-increment](../../../../../../services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md). The cell can also land at $\mathbf{f}$ (task definitively not complete — declared failed) or $\top$ (contested completion). Abandonment cannot simply be $\langle T, \texttt{complete}\rangle = \mathbf{f}$: that would mean the task is *declared failed*, not *deliberately stopped*. Abandonment is a third normative act distinct from both failure and completion.

One candidate: a distinct abandonment cell $\langle T, \texttt{abandoned}\rangle = \mathbf{t}$, installed by a deliberate act with governance standing, that triggers closure rules blocking further work-increment on $T$.

## Sub-questions

### (a) Does abandonment require governance standing?

Completion is triggered by evidence accumulation — any agent with witnessing capability can push a cell toward $\mathbf{t}$ via witness-as-increment. Abandonment, by contrast, halts the task, affecting all dependent cells and agents. Does abandonment require authority-gate standing? If so, which principal holds the abandonment right — the original assigning principal, the assigned agent, or a quorum?

### (b) What is the formal difference between abandonment and indefinite deferral?

A task that has not been touched — whose completion cell remains at $\bot$ — looks identical in the settling to an abandoned task if abandonment leaves no trace. Is indefinite deferral structurally equivalent to abandonment, or does abandonment require an explicit cell (e.g., $\langle T, \texttt{abandoned}\rangle = \mathbf{t}$) to distinguish them?

### (c) How do dependent tasks respond?

If task $T_2$ has a dependency expressed as $\langle T_2, \texttt{depends-on}, T_1\rangle = \mathbf{t}$, and $T_1$ is abandoned, what closure rules fire on $T_2$? A cascade-abandonment rule would set $\langle T_2, \texttt{abandoned}\rangle = \mathbf{t}$; a release rule would fire $\langle T_2, \texttt{dependency-released}\rangle = \mathbf{t}$ instead. The choice between cascade and release depends on the task plan's dependency semantics — not derivable from the substrate alone.

### (d) Can an abandoned task be revived?

Settling monotonicity prohibits $\mathbf{t} \to \bot$ — a cell that has settled to $\mathbf{t}$ cannot retract. If abandonment is represented as $\langle T, \texttt{abandoned}\rangle = \mathbf{t}$, then the abandonment itself cannot be undone. Revival would require either: (i) creating a new task $T'$ that inherits $T$'s partial settling; or (ii) a [visible automorphism](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md) that explicitly resets the abandonment cell — the substrate's equivalent of a formal reinstatement act.

### (e) Regime interaction

The [deadline-as-settling-bound](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/deadline-as-settling-bound.md) theorem shows that finite deadlines require strict-regime settling. Does reaching a deadline without completion trigger automatic abandonment? Or is deadline-expiry a distinct event from abandonment — expiry being an objective settling-bound event, abandonment a normative decision? The distinction has practical import: a lapsed deadline may excuse the agent while an abandonment may not.
