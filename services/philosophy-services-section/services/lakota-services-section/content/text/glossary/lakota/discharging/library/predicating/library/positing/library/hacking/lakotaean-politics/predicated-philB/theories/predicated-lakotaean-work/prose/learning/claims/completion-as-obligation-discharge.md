---
type: theorem
status: sketch
depends-on:
  - work-cell-system
  - wolakhota-closure-system
  - kin-obligation-firing
realizes: [completion-as-quiescence]
title: Completion is obligation-discharge
description: Statement.
---

# Completion is obligation-discharge

**Statement.** For a work-cell $\phi^w = (a, p, b)$ in the polity's substrate, *completion* of the work is the discharge of the owes-virtue-to cell that originated the work-cell.
Specifically: the work is complete at $\tau^*$ iff $\langle a, \texttt{owes-virtue-to}, b\rangle$ drops to $\bot$ at $\tau^*$ for the specific instance the work-cell discharged.
The work-cell's own value does *not* drop; the *owes-cell* drops.

This is the Lakota analog of [completion-as-quiescence](../../../../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) — the predicated-work theorem that completion is settling-quiescence on the task-cells.
The structural-difference: in the Western form, *the task-cell* reaches quiescence; in the Lakota form, *the obligation-cell* discharges.
The work-cell remains at $\mathbf{t}$ as a historical record of the work having been done.

## Proof sketch

The (W3) kin-obligation rule of $\mathcal{S}_\mathrm{wolak}$:

$$\langle a, \texttt{kin-of}, b\rangle = \mathbf{t} \;\Longrightarrow\; \langle a, \texttt{owes-virtue-to}, b\rangle = \mathbf{t}$$

installs the owes-cell as a *standing* obligation cell — the kin-cell is the firing-source and the owes-cell is the consequent.
The owes-cell is *instance-indexed*: each specific instance of obligation (this child to feed today; this elder to honor at this ceremony) is a separate owes-cell instance.

The work-cell firing — agent $a$ performs work-class $p$ on object $b$ — is the *discharge* of the corresponding owes-cell instance.
The discharge-firing:

$$\langle a, p, b\rangle = \mathbf{t} \;\wedge\; \mathrm{matches\text{-}instance}(p, b, \mathrm{instance}_i) \;\Longrightarrow\; \langle a, \texttt{owes-virtue-to}, b\rangle_{\mathrm{instance}_i} = \bot$$

The specific-instance owes-cell drops; the general owes-cell over the kin-relation remains (because the kin-cell persists), but the specific-instance owes-cell is discharged.
Completion of the work *is* the discharge.

The work-cell $\langle a, p, b\rangle$ stays at $\mathbf{t}$ — the substrate retains the work-historical-record.
This is a $\leq_k$-monotone fact: once the work was done, the work-cell remains as record.
The substrate's audit-trail for the agent's wówačhantognaka-conduct rests on this preservation. $\square$

## Structural consequences

(a) **Work is not a project to be completed-and-archived.** The owes-cell discharge does not mark the *end* of a project; it marks the discharge of a specific obligation-instance.
New instances install as kin-life continues.
The continuous-discharge pattern is the substrate-content of "work in Lakota life is not a queue of tasks to clear."

(b) **The audit-trail is the wówačhantognaka-conduct record.** The accumulated work-cells at $\mathbf{t}$ for an agent record the agent's continuing conduct.
Standing-as-wówačhantognaka (cf. (W2) of [wolakhota-closure-system](../../../../../../../../settling/library/hacking/lakotaean-governance/philA/code/structures/wolakhota-closure-system.md)) rises in $\leq_k$ as the cells accumulate.
The polity's substrate-recognition of who-is-a-good-relative reads off this accumulation.

(c) **Refusal-of-work has a substrate-content.** When an agent refuses to perform a work-cell that an owes-cell-instance would discharge, the owes-cell *does not drop*.
It accumulates.
A pattern of refusal — owes-cell accumulation without discharge over time — drops the agent's standing-as-wówačhantognaka.
The agent is *not sanctioned* by the polity (no punitive cells fire); they are *known by their record* — the polity reads the accumulated-undischarged-cell pattern as standing-loss.

(d) **There is no formal deadline mechanism.** The predicated-work [deadline-as-settling-bound theorem](../../../../../../../../../../../../../../../../../../../relationality-services-section/services/agency-services-section/content/text/glossary/concepts/deadline-as-settling-bound.md) treats deadlines as ordinal-bounds on the task-cell-settling.
The Lakota form has no deadline-installation: the owes-cell's discharge can happen at any time. *Some* owes-cells have natural completion-windows (a meal must be prepared *for this meal*; a child must be fed *today*; a sun-dance offering must be made *during this sun dance*).
These are *natural-cadence completions* keyed to the [annual-cycle](../../../../../../../../settling/library/hacking/lakotaean-governance/philA/code/structures/annual-cycle.md), not imposed-deadline cells.

## Significance

The theorem makes precise the difference between Western task-completion and Lakota work-completion.
The Western form's substrate quiesces on the task; the Lakota form's substrate discharges the obligation.
The audit-trail is preserved in both cases, but the cell-class that quiesces differs.
The structural consequence: a Lakota agent's life-record is a continuing-discharge pattern across many simultaneous owes-cells; a Western agent's life-record is a sequence of completed-task-cells.

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — work as continuing kin-conduct.
- Beatrice Medicine, *Learning to Be an Anthropologist* (2001) — kin-obligation discharge patterns.
- Walker 1982, *Lakota Society* — recorded wówačhantognaka-conduct.
- Marshall, *The Lakota Way* (2002) — the four virtues as continuing-conduct.
