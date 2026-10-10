---
title: "Chord"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Chord"
  - "chord"
  - "chord length"
  - "mean aerodynamic chord"
  - "MAC"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
description: "The distance from a wing's leading edge to its trailing edge, the fundamental length dimension of an airfoil."
---

Chord is the straight-line distance from the leading edge to the trailing edge of an [airfoil](./airfoil.md).
On a rectangular wing, the chord is constant across the [span](./span.md).
On tapered or delta wings, the chord varies — longer at the root, shorter at the tip.

The **mean aerodynamic chord** (MAC) is the chord-weighted average across the span, used as the reference length for aerodynamic calculations (pitching moment, [Reynolds number](./reynolds-number.md), center of gravity position).
For a rectangular wing, MAC equals the chord.
For a tapered wing, MAC lies inboard of the geometric midpoint.
For a delta wing, MAC is approximately two-thirds of the root chord.

### Why chord matters for UAV design

Chord interacts with airspeed to determine the local Reynolds number (Re = V × c / ν), which in turn determines [boundary layer](./boundary-layer.md) behavior and [airfoil](./airfoil.md) performance.
Small UAVs with short chords (50–150 mm) operate in the [low-Reynolds-number regime](../concepts/low-reynolds-number-aerodynamics.md) (Re < 200,000) where airfoil selection is critical and surface finish matters more than at larger scales.

Chord also determines the internal volume available for structure — a longer chord provides more depth for a [spar](./spar.md) at a given airfoil thickness ratio, and more room for [infill](./infill-density.md) in [3D-printed](../concepts/additive-manufacturing-in-uav-airframes.md) wings.
This is one reason delta [planforms](../concepts/wing-planform-selection-for-uavs.md) with their deep root chords can use simpler internal structure than high-[aspect-ratio](./aspect-ratio.md) wings with narrow chords.

The [center of gravity](./center-of-gravity.md) is conventionally expressed as a percentage of MAC measured from the leading edge — typically 25–30% MAC for stable flight.
Moving the CG aft of this range reduces [stability](../../terms/stability.md); moving it forward increases stability but requires more [elevator](./elevator.md) deflection for [trim](./trim.md), adding trim drag.

## Related terms

- [Span](./span.md) — the perpendicular wing dimension; together with chord, defines wing area
- [Aspect Ratio](./aspect-ratio.md) — span divided by mean chord
- [Reynolds Number](./reynolds-number.md) — the flow parameter that chord length partially determines
- [Center of Gravity](./center-of-gravity.md) — conventionally expressed as a percentage of MAC
