---
type: morphism
class: office-installation
status: draft
symbol: "\\mathrm{install\\text{-}naca}_{(a, P)}"
depends-on:
  - naca-office
  - office-as-double-settlement
  - four-virtues-as-evaluation-predicates
  - wolakhota-closure-system
realizes: [installation]
title: Naca-installation
description: The naca-installation morphism produces a new naca-incumbent in the polity.
---

# Naca-installation

The naca-installation morphism produces a new naca-incumbent in the polity.
The structural form: a double-settlement on recognition and induction with a four-virtue-gate condition.
This is the explicit form of the closure-rule referenced in [naca-office](../../../philA/code/structures/naca-office.md) §"Installation: the four-virtue gate."

## The morphism

For an agent $a$ and a polity $P$ (oyate or confederacy):

$$\mathrm{install\text{-}naca}_{(a, P)} : v \;\longmapsto\; v'$$

with stage-firings:

**Stage 1: virtue-standing-verification.** The substrate-state at the firing-moment must have all four virtue-standing cells on $a$ at $\mathbf{t}$:

$$\bigwedge_{\nu \in V_4} \langle a, \texttt{has-standing-as-}\nu\rangle \geq_k \mathbf{t}$$

These cells have accumulated under (W2) over the agent's life.
The naca-installation does not *install* the virtue-standing; it *reads* it.
An agent without the standing-cell-accumulation cannot be naca-installed regardless of any council decision; the closure-rule's antecedent fails.

**Stage 2: induction-ceremony.** A wakȟáŋ-bearing ceremony installs the induction-cell:

$$\langle a, \texttt{induction-ceremony-conducted}\rangle = \mathbf{t},\ w_\mathrm{lak}(\cdot) = 1$$

The ceremony is conducted by a wičháša wakȟáŋ (cf. [wicasa-wakhan-office](../structures/wicasa-wakhan-office.md)); the pipe is smoked; specific songs are sung; specific prayers are offered.
Without a wakȟáŋ-bearing ceremony, the induction-cell is not wakȟáŋ-marked, and the closure-rule's antecedent fails.

**Stage 3: recognition-aggregation.** The populace's individual recognition-cells aggregate:

$$\bigwedge_{b \in \mathrm{pop}(P)} \langle b, \texttt{recognizes-as-naca}, a\rangle = \mathbf{t}$$

This is *not* a vote-tally — it is an aggregating-substrate-fact that the polity reads off the populace's individual cells.
Iyúhá-šni is available: a populace-member who does not recognize $a$ as naca does not have the cell at $\mathbf{t}$, and the conjunction fails to that extent.

If *enough* populace-members recognize, the recognition-aggregate is read as installing — but "enough" is not a numerical threshold; it is the substrate-recognition of *whether the populace as a whole recognizes*.
The polity reads its own substrate.

**Stage 4: closure-rule firing.** With all three stages firing positively, the naca-office-installation rule fires:

$$\mathrm{Stage\ 1} \wedge \mathrm{Stage\ 2} \wedge \mathrm{Stage\ 3} \;\Longrightarrow\; \langle N, \texttt{incumbent}, a\rangle = \mathbf{t}$$

The naca-office entity $N$ now has $a$ as incumbent.
The office-cell is wakȟáŋ-marked (inheriting from the induction-cell's marking).

## Compared to standard installation

The predicated-governance [installation morphism](../../../../../../../../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md) installs an officer into an office via a single positing operation.
The Lakota naca-installation is *not* a single positing — it is the *firing of a closure-rule with three distinct antecedent stages*.
The morphism does not *install* the cells; it *requires the cells to be in place* and produces the consequent only when they are.

The structural consequence: the naca-installation cannot be done by a single act.
It requires the substrate-state to have evolved to where all three antecedents fire.
The polity *recognizes* a naca; it does not *create* one by decree.

## Continuing-qualification

Per [naca-office](../../../philA/code/structures/naca-office.md) §"Loss of office", the naca's office-cell follows the recognition-cell, which follows the virtue-standing-cells, which respond to the incumbent's continuing conduct.
The closure-rule fires *continuously* — at every substrate-state, it checks the antecedents and produces the consequent.

If the incumbent's conduct produces cells that drop the virtue-standing cells below $\mathbf{t}$, the closure-rule's Stage 1 antecedent fails; the rule's continuing-firing stops; the incumbent-cell falls automatically.

This is structurally different from impeachment (a procedural removal).
The naca's loss is *substrate-automatic*: the office-cell follows the antecedent-cells; the antecedent-cells follow the conduct.

## Sources

- Walker 1982, *Lakota Society* — naca-installation in pre-reservation practice.
- Ella Deloria, *Speaking of Indians* (1944) — naca-recognition as substrate-aggregating.
- Powers, *Oglala Religion* (1977) — naca-induction-ceremony structure.
- Marshall, *The Lakota Way* (2002) — the four virtues as continuing-qualification.
