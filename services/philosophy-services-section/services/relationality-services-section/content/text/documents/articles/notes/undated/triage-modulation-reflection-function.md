---
symbol: ρ
type: "[pointwise modulation operator](pointwise modulation operator)"
domains:
  - "[constraint gradient field](constraint gradient field)"
  - "[modulation boundary](modulation boundary)"
codomain: "[reflected modulation vector](reflected modulation vector)"
induced by:
  - "[modulation interference function](modulation interference function)"
  - "[constraint completion function](constraint completion function)"
title: Modulation reflection function
description: The modulation reflection function (ρ) is induce|induced by constraint gradient inversion across a stabilized modulation boundary.
---


The ***modulation reflection function*** (`ρ`) is [induce|induced](../../../../triage/induce|induced) by [constraint gradient inversion](constraint gradient inversion) across a stabilized [modulation boundary](modulation boundary).

When a [modulation vector](modulation vector) encounters a [boundary shape](boundary shape) where the [constraint gradient](constraint gradient) inverts,
reflection occurs — producing a new vector field whose direction is opposed across the boundary.

Let `∇C(x)` be the local constraint gradient  
Let `δ` be a boundary displacement vector

Then:
> ρ(x) := ∇C(x) = –∇C(x + δ)

That is, `ρ` maps modulation vectors across inverted constraint gradients,
producing reflected modulation consistent with boundary-aligned curvature.

The result is a [reflected modulation vector field](reflected modulation vector field) that may:
- reinforce interference patterns  
- enable recursive self-coherence  
- or induce [modulation cancellation](modulation cancellation) depending on phase alignment
