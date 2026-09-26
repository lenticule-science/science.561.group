---
title: "Specification: cedar-flute-fingering-chart"
description: Normative specification of a correct realization of cedar-flute-fingering-chart.
---
# Specification: cedar-flute-fingering-chart

Normative specification of a correct realization of [cedar-flute-fingering-chart](../../../../code/structures/cedar-flute-fingering-chart.md).

## Invariants (MUST)

1. **Six-finger-hole domain.** The fingering chart MUST be defined on a six-element finger-hole state space {0,1}⁶.
2. **All-holes-covered produces the fundamental.** The fingering 111111 (all six holes covered) MUST produce scale-degree 1 (the [fundamental](../../../../prose/teaching/explanations/fundamental.md)).
3. **Sequential-uncovering produces pentatonic-minor degrees.** Uncovering finger-holes sequentially from the foot — fingerings 111110, 111100, 111000, 110000, 100000 — MUST produce, respectively, scale-degrees b3, 4, 5, b7, 8 of the [pentatonic-minor-scale](../../../code/structures/pentatonic-minor-scale.md).
4. **Octave at fingering 100000.** Uncovering five holes (leaving only hole 6 covered) MUST produce the octave (scale-degree 8) of the fundamental.
  This is the second harmonic of the fundamental for an open-open cylindrical bore.

## Conditions (SHOULD)

1. A fingering chart SHOULD support a second-octave register accessed by [overblowing](../../../../../b4/overblowing/overblowing.md), with each first-octave fingering's pitch being doubled to its octave in the second-octave register.
2. A fingering chart SHOULD admit cross-fingerings (non-sequential coverings) as partial extensions to the standard chart, with cross-fingered scale-degrees recognized as instrument-specific alternative pitches.
3. Hole 6 SHOULD be available for cross-fingering and for overblowing-related fingerings, even when not used in the standard sequential pattern for scale-degree access.

## Forbidden (MUST NOT)

1. The fingering chart MUST NOT produce the major-third scale-degree (4 semitones above fundamental) in any of the standard sequential fingerings — this would indicate a major-pentatonic instrument, which is not the Lakotaean cedar flute.
2. The fingering chart MUST NOT contradict the [cedar-flute-cents-table](../../../../code/structures/cedar-flute-cents-table.md) at any scale-degree: the scale-degree produced by a given fingering must have a frequency consistent with the cents-table's range for that scale-degree.
3. The fingering chart MUST NOT require more than six holes; instruments with more than six holes are not standard cedar flutes and are not in scope for this fingering chart.
