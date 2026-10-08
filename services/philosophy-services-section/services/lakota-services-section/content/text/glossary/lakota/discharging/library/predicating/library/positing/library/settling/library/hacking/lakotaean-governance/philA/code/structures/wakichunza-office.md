---
type: definition
class: office
status: draft
symbol: "W"
depends-on:
  - polity-cell-system
  - office-as-double-settlement
  - naca-office
  - wolakhota-closure-system
realizes: [office]
title: Wakíčhuŋza office
description: A wakíčhuŋza — "decider," "one who decides" — is the executive-decision office at the oyate scale.
---

# Wakíčhuŋza office

A *wakíčhuŋza* — "decider," "one who decides" — is the executive-decision office at the oyate scale.
Where the [naca](naca-office.md) is the consultative-speaker role, the wakíčhuŋza is the day-to-day decision-maker on routine matters that do not require council convocation.
An oyate typically has four wakíčhuŋza, often called the *Wakíčhuŋza Tópa* (Four Deciders), selected by the council from among the elder naca.

## Constituent predications

A wakíčhuŋza-office entity $W \in E^\mathrm{off}_\mathrm{lak}$ carries:

- $\langle W, \texttt{polity-scope}, P\rangle$ for the polity $W$ serves.
- $\langle W, \texttt{incumbent}, a\rangle$ for the holder.
- $\langle W, \texttt{appointed-by}, K\rangle$ for the omniciye that selected $W$ (the appointment cell distinguishes wakíčhuŋza from naca: wakíčhuŋza is *appointed* by the council; naca is recognized organically).
- $\langle W, \texttt{decision-scope}, X\rangle$ for the matters under wakíčhuŋza authority — typically encampment placement, day-to-day movement, mediation of small disputes, akicita-supervision.
- $\langle W, \texttt{term-bound-by}, t\rangle$ for the term-condition: typically until the next polity-scale convocation (annual at sun-dance), or until council-recall.

## Installation

The wakíčhuŋza closure rule:

$$\forall a, P, K.\quad \langle a, \texttt{is\text{-}elder\text{-}naca\text{-}of}, P\rangle \geq_k \mathbf{t} \;\wedge\; \langle K, \texttt{appoints\text{-}as\text{-}wakichunza}, a\rangle \geq_k \mathbf{t} \;\wedge\; \langle a, \texttt{accepts\text{-}appointment}\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle W, \texttt{incumbent}, a\rangle \geq_k \mathbf{t}$$

The wakíčhuŋza is necessarily an elder naca (the four-virtue qualification carries over); the council *appoints*, the candidate *accepts*.
Acceptance is its own positing-act and is not automatic: the candidate may refuse the appointment, which collapses the rule's firing.

## Authority structure: bounded delegation from the council

The wakíčhuŋza-office is a [bounded-delegation morphism](../morphisms/bounded-delegation.md): the council's settling delegates to the wakíčhuŋza the authority to settle cells in the $\texttt{decision-scope}$ without further council action.
The bound is two-fold:

- **Scope bound**: only cells in $\texttt{decision-scope}$ are settleable by wakíčhuŋza-fiat.
  Outside the scope, the wakíčhuŋza must convene the council.
- **Term bound**: the delegation lapses at the term-condition (next sun dance, or council recall).

By [residuated-restriction-as-authority-gate](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md), the bounded-delegation is exactly the authority-gate residuation pattern: the wakíčhuŋza's authority on cells in $\texttt{decision-scope}$ is the right-residuation of the council's full authority along the inclusion of the scope into the full predicate-base.

## Day-to-day operation

The wakíčhuŋza's substrate operations during their term:

- **Camp-movement direction**: where to camp tonight; when to move; which route.
  The wakíčhuŋza's posits on these cells settle directly without council convocation.
- **Akicita supervision**: the wakíčhuŋza is the council's link to the standing [akicita band](../../../philB/code/structures/akicita-band.md).
  The akicita's scope-cells are settled in coordination with the wakíčhuŋza.
- **Mediation of small disputes**: disputes between persons, between tiyóšpaye, over minor matters (lost arrow, stray horse, words of insult) are typically mediated by the wakíčhuŋza without rising to council; the mediation is a substrate-restoration operation.
- **Hosting visitors**: when a visitor arrives — a person from another oyate, a non-Lakota — the wakíčhuŋza greets and arranges hospitality, which is a substrate-recognition-cell installation.

## The Four

The customary number is four wakíčhuŋza per oyate.
The four-fold structure mirrors the four-superior-Wakȟáŋ cosmology: the four wakíčhuŋza correspond functionally to the four cardinal directions, the four seasons, the four virtues.
The arrangement is structural in the cosmogonic sense — the polity's executive-decision body is shaped by the same four-pattern that runs through the rest of the substrate.

When the four wakíčhuŋza disagree on a decision under their joint scope, the matter rises to the omniciye.
The four-wakíčhuŋza body itself does not vote; their settling is consensus-by-withdrawal at executive scale — if they cannot all settle, they bring the matter to the council.

## Loss of office

The wakíčhuŋza-office is lost by:

- **Term completion**: at the term-condition, the wakíčhuŋza-cell drops; the council reappoints or selects a new wakíčhuŋza.
- **Council recall**: the council can withdraw the appointment-cell mid-term if the wakíčhuŋza's conduct has gone outside scope or against $\mathcal{S}_\mathrm{wolak}$.
- **Virtue-failure**: same automatic mechanism as naca-loss; the four-virtue continuing-qualification applies.

## Sources

- Powers, *Oglala Religion* (1977) — the wakíčhuŋza role in nineteenth-century Oglala practice and the Wakíčhuŋza Tópa structure.
- Walker 1982, *Lakota Society* — recorded executive-decision practice and the naca/wakíčhuŋza distinction.
- DeMallie, in *Handbook of North American Indians* vol.
  13 — wakíčhuŋza enumeration in the seven Tȟitȟúŋwaŋ oyate.
- White Hat, *Life's Journey — Zuya* (2012) — contemporary Sicangu commentary, including the contemporary tribal-government's partial replication of the wakíčhuŋza structure.
