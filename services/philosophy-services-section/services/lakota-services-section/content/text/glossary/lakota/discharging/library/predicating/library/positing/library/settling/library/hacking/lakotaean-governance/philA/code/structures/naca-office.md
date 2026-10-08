---
type: definition
class: office
status: draft
symbol: "N"
depends-on:
  - polity-cell-system
  - office-as-double-settlement
  - four-virtues-as-evaluation-predicates
  - wolakhota-closure-system
realizes: [office]
title: Naca-office
description: A naca is the headman office at the oyate scale and at the confederacy scale.
---

# Naca-office

A *naca* is the headman office at the oyate scale and at the confederacy scale.
The naca-office $N$ is a [office-as-double-settlement](../../../objects/office-as-double-settlement.md) instance with installation conditions specialized by the four virtues.
A polity at oyate scale typically has multiple naca (the elder-naca who together form the deliberative body); the *head naca* is the single naca whose recognition cell is settled at $\mathbf{t}$ across the populace as senior speaker.

## Constituent predications

A naca-office entity $N \in E^\mathrm{off}_\mathrm{lak}$ carries:

- $\langle N, \texttt{polity-scope}, P\rangle$ for the polity-unit (oyate or confederacy) $N$ serves.
- $\langle N, \texttt{incumbent}, a\rangle$ for the agent who holds the office.
- $\langle N, \texttt{recognition-by}, b\rangle$ for each populace-member $b$ who recognizes the incumbent.
  Aggregated, these form the recognition-cell.
- $\langle N, \texttt{induction-ceremony}, c\rangle$ for the ceremony that installed the office on the incumbent.
- $\langle N, \texttt{four-virtues-record}, \nu\rangle$ for each virtue, recording the incumbent's standing.
- $\langle N, \texttt{senior}\rangle$ — set at $\mathbf{t}$ when this naca is the head naca for the polity.

## Installation: the four-virtue gate

By [office-as-double-settlement](../../../objects/office-as-double-settlement.md), an office installs when both a recognition-cell and an induction-cell settle at $\mathbf{t}$.
The naca-office adds a *four-virtue gate*: the recognition-cell can settle at $\mathbf{t}$ only if all four virtue-cells over the incumbent settle at $\mathbf{t}$.

Formally, the naca-installation closure rule:

$$\forall a, P.\quad \bigwedge_{\nu \in V_4} v(\mathrm{has\text{-}standing\text{-}as\text{-}}\nu)(a) \geq_k \mathbf{t} \;\wedge\; \langle N, \texttt{induction-ceremony}, c\rangle \geq_k \mathbf{t} \;\wedge\; w_\mathrm{lak}(c) = 1 \;\Longrightarrow\; \langle N, \texttt{incumbent}, a\rangle \geq_k \mathbf{t}$$

where $V_4 = \{\mathrm{wówačhantognaka}, \mathrm{wóksape}, \mathrm{wóohitika}, \mathrm{wówačhiŋtȟaŋka}\}$.
The four-virtues evaluation runs via (W2) of $\mathcal{S}_\mathrm{wolak}$ (cf. [wolakhota-closure-system](wolakhota-closure-system.md)): the standing-as-$\nu$ cell rises in $\leq_k$ as the agent accumulates virtue-conduct cells.

This is structurally distinct from elective or hereditary installation.
The naca's *qualification* is a settled fact about the substrate before the office is installed; the office-installation is the *recognition* of that already-settled qualification.
The two-step structure prevents installation-without-qualification.

## Naca-installation morphism

The [naca-installation morphism](../../../philB/code/transformers/naca-installation.md) is the operation that takes a settling in which the four virtue-cells over $a$ are at $\mathbf{t}$ and the wakȟáŋ-bearing induction ceremony has been conducted, and produces the settling in which $\langle N, \texttt{incumbent}, a\rangle$ is at $\mathbf{t}$.

## Senior-naca selection

When an oyate has multiple elder-naca, a senior naca is identified by the converse-naturality of the recognition-cell: among the elder-naca, the one for whom $\bigwedge_{b \in \mathrm{pop}(P)} v(\texttt{recognizes-as-senior})(b, a) \geq_k \mathbf{t}$ holds.

This is *not* an election: there is no explicit vote-tally.
The recognition is a substrate-fact that emerges as the populace's individual recognition-cells settle.
Iyúhá-šni is available throughout: a populace member who does not recognize a particular elder as senior simply does not have the corresponding cell at $\mathbf{t}$.

## What the naca does

The naca's authority is *moral* and *consultative*, not coercive.
The naca's substrate operations:

- **Speaking-in-council**: the naca posits at the omniciye on behalf of the polity.
  The naca's posits at omniciye carry weight (by virtue of the four-virtue standing) but do not bind; the council's settling depends on the engaged-majority.
- **Representing the polity to outside parties**: in treaty negotiations, in inter-oyate meetings, the senior naca speaks for the polity.
  The representation is a substrate-act: the naca-cell carries the populace's recognition-cells; speaking as the naca is speaking-from-recognition.
- **Recognizing youth and conduct**: when virtue-conduct accumulates over a young person, the naca's recognition-cell over that person can install standing-cells (e.g., installing a young man's first war-name; recognizing a young woman's preparation through the rite of išnáthi-awíčhalowaŋpi).
  These naca-recognition-cells are not ceremonial in the wakȟáŋ-bearing sense but are polity-substrate-installing.

The naca does *not*:

- Issue commands.
  The substrate has no closure rule of form *naca-says-X $\Rightarrow$ X-binding*; the naca's posits are inputs to council-settling, not direct rule-firings.
- Distribute resources.
  Resource-coordination is done by [akicita-band](../../../philB/code/structures/akicita-band.md) (hunt-akicita) or by gift-economy redistribution at the tiyóšpaye level.
- Adjudicate disputes by judgment.
  Disputes are adjudicated through the polity's council (omniciye) or restorative-rite (wiping-of-tears, ceremonial reconciliation) — not by naca-issued ruling.

## Loss of office

The naca-office can lose its incumbent through:

- **Death**: the incumbent-cell drops to $\bot$ at death; the office-cell persists until succession; a new incumbent is identified through (W5) firing on a new candidate.
- **Virtue-failure**: if the incumbent's conduct produces cells that drop the standing-as-$\nu$ cells for some virtue $\nu$ below $\mathbf{t}$, the recognition-cell can no longer settle at $\mathbf{t}$, and the incumbent-cell falls.
  The substrate enforces a continuing-qualification: the four virtues are not installation-time conditions only; they are running conditions.
- **Recognition-withdrawal**: enough populace-members can iyúhá-šni from the recognition-cell; if the conjunction in (T3)/senior-selection fails, the senior-naca-cell falls.
  The agent remains an elder naca (their personal virtue-standing persists), but loses the senior-speaker role.

This is structurally different from impeachment (a procedural removal with formal trial).
The naca's loss is *substrate-automatic*: the office-cell follows the recognition-cell; the recognition-cell follows the populace's individual cells; the populace's individual cells respond to the incumbent's conduct.

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — naca-role and the qualification-by-virtues structure.
- Walker 1982, *Lakota Society* — naca and the council structure with attention to multiple-naca and senior-selection.
- Marshall, *The Lakota Way* (2002) — the four virtues as the naca's qualification.
- Powers, *Oglala Religion* (1977) — naca and wakíčhuŋza distinction in nineteenth-century Oglala practice.
- White Hat, *Life's Journey — Zuya* (2012) — contemporary Sicangu commentary on naca-role and selection.
