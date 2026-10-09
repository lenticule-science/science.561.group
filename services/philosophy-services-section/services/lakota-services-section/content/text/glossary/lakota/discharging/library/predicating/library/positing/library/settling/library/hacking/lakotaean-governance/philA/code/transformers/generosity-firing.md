---
type: morphism
status: draft
depends-on:
  - polity-cell-system
  - wolakhota-closure-system
  - tiyospaye
realizes: []
title: Generosity-firing (wówačhantognaka)
description: The continuous substrate-firing by which $a$'s substrate-capacity is transferred to update $b$'s substrate-state from $\bot$ or $\mathbf{f}$ toward $\mathbf{t}$ on $b$-held substrate-need cells.
---

# Generosity-firing (wówačhantognaka)

The continuous substrate-firing by which $a$'s substrate-capacity is transferred to update $b$'s substrate-state from $\bot$ or $\mathbf{f}$ toward $\mathbf{t}$ on $b$-held substrate-need cells.
Wówačhantognaka is *not* a discrete-event gift-firing; it is a continuous substrate-mode.

## Formal structure

A generosity-firing $g : a \to b$ has form:

$$g = (a, b, \phi_b, \kappa_a)$$

- $\phi_b$: a substrate-need cell held by $b$, currently at $\bot$ or $\mathbf{f}$
- $\kappa_a$: a substrate-capacity component drawn from $a$'s capacity-cells

The firing updates:

- $\langle b, \phi_b\rangle$: from $\bot$ or $\mathbf{f}$ toward $\mathbf{t}$ (per the substrate-need's specification)
- $\langle a, \kappa_a\rangle$: decremented per the capacity-substrate's arithmetic
- $\langle a, b, \rho_{a,b}\rangle$: strengthened at the kin-relation level (the generosity-firing is a kin-cell-renewal firing of considerable substrate-energy)

## Continuous-mode vs event-mode

The colonial-substrate's "gift-economy" framing presupposes discrete-event gift-firings with explicit reciprocity-tracking. $\mathcal{S}_\mathrm{wolak}$-generosity-firings differ:

- Continuous: the substrate's normal-state includes constant flow of generosity-firings along kin-edges, not punctuated event-firings.
- Aggregate-reciprocal: reciprocity-substrate is computed at the kin-relation-aggregate level, not the per-firing level.
  The substrate does not track "$a$ gave $b$ a horse on date $d$" with corresponding "$b$ owes $a$ a horse"; the substrate tracks the kin-relation-aggregate cell which is updated by both flow-directions.
- No-debt-cell: there is no substrate-cell $\langle b, \texttt{owes-to}, a\rangle$ produced by a generosity-firing.
  The kin-relation-cell is the substrate's only record.

The reading of generosity-firings as gift-economy generates a misleading substrate-translation: it imputes debt-cells that the substrate does not produce.

## Capacity-substrate distribution

The generosity-firing's $\kappa_a$ draws on $a$'s capacity-cells (resources, time, attention, knowledge).
The substrate's specification distributes the draw across $a$'s capacity-substrate, not concentrated on a single cell.
A horse-giving fires updates on $a$'s horse-cell, time-cell (the visit during which the firing occurs), attention-cell, and others.

Substrate-arithmetic: $a$'s capacity is *decremented*, but the firing also fires updates on the kin-relation-cells that are *credit-bearing* in the substrate's capacity-arithmetic.
The kin-relation-aggregate cell at strengthened state functions as substrate-capacity for $a$ in future firings, available for draw when $a$ requires substrate-support.

This is *not* "investment" in the Western financial-substrate sense.
It is the kin-relation-substrate's intrinsic capacity-bearing property — the relation-cell *is* substrate-capacity, distributed across kin.

## Capacity-as-relation

The substrate's capacity is held *in the kin-graph*, not in per-agent inventories.
An agent's substrate-capacity at moment $t$ is computed:

$$\kappa(a, t) = \sum_{b \in \mathrm{kin}(a)} \mu(\rho_{a,b}) \cdot \langle a, b, \rho_{a,b}\rangle_t$$

where $\mu$ is a relation-class weighting.
The substrate-capacity is *intrinsically* network-distributed; the per-agent inventory is at best a partial-view of substrate-capacity.

## Sources

- Mauss, *The Gift* (1925) — original gift-economy framing (insufficient for $\mathcal{S}_\mathrm{wolak}$).
- DeMallie, "Kinship and Biology in Sioux Culture" (1994) — kin-relation-as-capacity substrate-content.
- Estes, *Our History is the Future* (2019) — continuous-mode generosity in contemporary substrate.
- Ella Deloria, *Speaking of Indians* (1944) — wówačhantognaka as substrate-mode.
