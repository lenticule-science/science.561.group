---
title: pulse-import
description: The morphism sending a whistle's free breath-pulse-sequence to its drum-aligned metric realization under an enclosing drum stream.
---
# pulse-import

The morphism sending a whistle's free breath-pulse-sequence to its drum-aligned metric realization under an enclosing drum stream.

## Definition

Given a whistle producing a breath-pulse-sequence ρ_free and an enclosing drum stream supplying a metric pulse μ (with grid points t_0, t_1, t_2, ... at regular intervals), the **pulse-import** transformer is

π_μ : ρ_free ↦ ρ_aligned

where ρ_aligned's pulse-onsets t'_k satisfy t'_k - t_{k(k)} ≤ δ for a small alignment tolerance δ (typically tens of milliseconds).

## Properties

- **Adopts external meter**: the whistle does not generate the meter; it aligns to the drum's grid.
- **Heterophony**: the alignment is approximate, not exact — the whistle's attack typically follows the drum's by a small δ, producing heterophonic thickening rather than unison.
- **Defined only with an enclosing drum**: in the absence of a drum stream, π_μ is not defined and the whistle's pulse-sequence remains irregular.
- **Composes with aggregation**: when multiple whistles import the same drum's meter, their aggregated cluster carries the drum's metric pulse.

## Source claim

[whistle-drum-heterophony](../prose/learning/claims/whistle-drum-heterophony.md).
