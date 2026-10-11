# Koios five-blade aperture mark v1

Status: canonical deterministic mark construction.

## Intent

The mark should read first as a five-sided mechanical / optical aperture in rotation. At a glance it may suggest observation, but it must not resolve into a literal eye.

The construction is designed for software generation, not hand-drawn drift.

## Geometry

Use a regular outer pentagon and a smaller regular inner pentagon sharing one center.

- outer vertex count: 5
- inner vertex count: 5
- outer radius: 1.0 normalized
- inner radius: 0.36 normalized
- inner pentagon rotation relative to outer: +36°
- canonical outer rotation: choose the representative whose selected signal blade has the southeast-most centroid
- each blade is the quadrilateral joining one outer edge to the corresponding rotated inner edge
- the inner pentagon remains negative space

For blade index `i`, with outer vertices `Oᵢ` and inner vertices `Iᵢ`, construct:

`Bᵢ = [Oᵢ, Oᵢ₊₁, Iᵢ₊₁, Iᵢ]`

with indices modulo 5.

Choose the canonical signal blade after orientation by centroid: among the five blade polygons, the signal blade is the blade whose centroid lies furthest into the southeast quadrant (maximize normalized `x + y`, requiring `x > 0` and `y > 0` when such a blade exists).

## Color

- four complete blades: #171a21
- one complete southeast / bottom-right blade: #000088
- central aperture: transparent / substrate color
- no gradients in the core mark
- no partial blue shard
- no blue outline on the black blades

## Motion

The inner pentagon rotation creates one direction of whirling. Keep that handedness fixed in the canonical mark. Mirroring is not a harmless variant because it reverses the apparent rotation.

Static mark first. Animation, if ever used, should rotate only as a bounded interaction flourish and must return to the canonical orientation.

## Prohibitions

Do not add:

- pupil;
- circular iris;
- almond eye enclosure;
- eyelashes/lids;
- surveillance iconography;
- faux grain;
- bevels;
- photorealistic lens effects.

## Mathematical provenance

The fivefold structure resonates with Obsmetrologia's `D₅/C₅` Dervish recurrence program, KCBS pentagon, golden field, first non-crystallographic `d=5` gap, five-site disclination link, and the five readings of the recurring four-corner object.

This provenance motivates the structure but does not turn the mark into a statement of any open theorem.
