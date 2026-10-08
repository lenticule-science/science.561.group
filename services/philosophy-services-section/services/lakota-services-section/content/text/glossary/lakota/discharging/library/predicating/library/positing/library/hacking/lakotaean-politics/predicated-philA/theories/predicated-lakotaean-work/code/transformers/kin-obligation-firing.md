---
type: morphism
class: owes-cell-installation
status: draft
symbol: "\\mathrm{kin\\text{-}obligate}_{(a, b, \\nu)}"
depends-on:
  - work-cell-system
  - wolakhota-closure-system
  - kin-relation-as-primitive
realizes: [dispatch]
title: Kin-obligation firing
description: "The kin-obligation-firing morphism is the Lakota analog of dispatch in predicated-work: it is the substrate-operation by which work originates."
---

# Kin-obligation firing

The kin-obligation-firing morphism is the Lakota analog of *dispatch* in predicated-work: it is the substrate-operation by which work originates.
Where predicated-work's dispatch fires from an authority-cell onto an assignment-cell, the Lakota form fires from a kin-cell onto an owes-virtue-to cell — *no authority is involved*.
The owes-cell then sources the work-cell-firing.

## The morphism

For agents $a, b$ with a kin-relation $\langle a, \texttt{kin-of}, b\rangle \geq_k \mathbf{t}$ in the polity's substrate, and a virtue $\nu \in V_4$ (the four virtues: wówačhantognaka, wóksape, wóohitika, wówačhiŋtȟaŋka):

$$\mathrm{kin\text{-}obligate}_{(a, b, \nu)} : v \;\longmapsto\; v'$$

with

$$\langle a, \texttt{kin-of}, b\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle a, \texttt{owes-}\nu\texttt{-to}, b\rangle \geq_k \mathbf{t}$$

The owes-cell fires *automatically* once the kin-cell is at $\mathbf{t}$.
There is no choice-point; there is no dispatching authority.
The (W3) rule of $\mathcal{S}_\mathrm{wolak}$ fires the owes-cell as a closure-consequent of the kin-cell.

## Why this is not dispatch

In the predicated-work [dispatch](../../../../../../work/theories/predicated-work/morphisms/dispatch.md) morphism:

- A task-cell exists.
- An authority-cell on the agent (or on a manager who has authority over the agent) fires the dispatch.
- An assignment-cell installs over the (agent, task) pair.
- The agent is now obligated to do the task.

The chain is: *task → authority → dispatch → assignment → agent-obligation*.

In the Lakota form:

- A kin-cell exists (by birth, marriage, huŋkápi, or other kin-installation).
- The (W3) closure rule fires owes-virtue-to cells across the kin-pair.
- The agent's wótakuye-conduct, wówašake-conduct, or other work-cells *discharge* the owes-cell.

The chain is: *kin → (W3) firing → owes-cell → work-cell-firing discharges*.

There is no dispatch-step; there is no authority-step.
The closure-rule fires the owes-cell directly from the kin-cell.
The agent's discretion is not "do I accept this dispatch?" but "how and when do I discharge this continuing obligation?"

## Multiple owes-cells

A typical adult Lakota agent has *many simultaneous owes-cells* — owes-wówačhantognaka to dozens of kin (every relative, near or extended), owes-wóksape to younger kin (one is owed wisdom by the elders), owes-wówačhiŋtȟaŋka to the polity-as-a-whole (one is owed fortitude by all).
The owes-cells accumulate; they do not resolve into a queue of dispatchable tasks.

The agent's lived work is a *continuing-pattern of discharge* across the simultaneous owes-cell set.
The annual-cycle structures *when* certain owes-cells get primary discharge: spring-gathering discharges owes-wówačhantognaka-to-tiyóšpaye on the food side; sun-dance preparation discharges owes-wóohitika-to-polity; winter-teaching discharges owes-wóksape-to-younger-kin.
The cycle organizes the discharge-pattern but does not prioritize one owes-cell over another — they all run continuously.

## When the kin-cell drops

If a kin-cell drops — through banishment, death, or (rarely) revocation of a huŋkápi-installed kinship — the corresponding owes-cells drop.
The agent no longer owes wówačhantognaka to the now-non-kin.
This is the substrate-content of "kin-obligation is bound to kin-relation."

When an agent dies, the survivors' owes-cells to the deceased convert: owes-virtue-to-the-living becomes owes-witness-and-grieving and owes-ancestor-relation.
The owes-cells don't vanish; they re-class.

When a non-Lakota person is adopted via huŋkápi (cf. [huŋkápi-as-kin-cell-installation](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/morphisms/hunka-as-kin-cell-installation.md)), the (W3) firing creates new owes-cells across the polity for and toward the adopted person, with full force.

## Comparison to contract

In predicated-work, *contract* (cf. [contract](../../../../../../work/theories/predicated-work/theories/predicated-governance/objects/contract.md)) is the structural-mechanism for *creating* an obligation between two non-kin parties: A and B agree to specific exchange; obligation-cells install with specific scope and term.

The Lakota form has no continuous-relations-from-contract analog.
Inter-polity treaty (cf. [treaty-as-wakhan-declaration](../../../../../../../settling/library/hacking/lakotaean-governance/philB/code/transformers/treaty-as-wakhan-declaration.md)) creates inter-polity obligation-cells but is wakȟáŋ-bearing and at polity-scope, not agent-scope.
Inter-agent obligation in the Lakota form is *kin-form* — installed via huŋkápi or marriage, not via contract.

This is the substrate-content of "the Lakota polity does not have contract-labor."
There is no morphism for "I'll work for you in exchange for X" between unrelated agents.
Work flows through kin or it does not flow.
The reservation-period imposition of wage-labor systems introduced contract-like cells that do not fire under $\mathcal{S}_\mathrm{wolak}$; they fire under $\mathcal{S}_\mathrm{wage}$ overlaid by the federal/state economic apparatus.
The accountability-disposition conflict is parallel to the legal-pluralism crisis (cf. [reservation-overlay-as-bc-failure](../../../../../../../settling/library/hacking/lakotaean-governance/philA/prose/learning/claims/reservation-overlay-as-bc-failure.md)).

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — kin-obligation as the substrate of Dakota/Lakota work.
- Walker 1982, *Lakota Society* — kin-conduct expectations.
- Beatrice Medicine, *Learning to Be an Anthropologist* (2001) — kin-obligation in contemporary Lakota life.
- Estes, *Our History is the Future* (2019) — reservation-era labor and the imposition of contract-form.
