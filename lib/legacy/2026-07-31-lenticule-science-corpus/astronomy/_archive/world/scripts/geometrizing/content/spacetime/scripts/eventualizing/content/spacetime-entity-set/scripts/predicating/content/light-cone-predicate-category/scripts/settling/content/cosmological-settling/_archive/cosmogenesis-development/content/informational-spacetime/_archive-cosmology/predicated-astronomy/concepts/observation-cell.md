---
title: "Observation cell"
type: concept
class: observation
component-of: predicated-astronomy
depends-on: [predication-cell, observer-instrument]
---

An **observation cell** is the predication-categorical unit of an astronomical observation: a triple $(b, p, o)$ where $b$ is a celestial body, $p$ is a predicate (apparent magnitude in a specified filter, radial velocity at a specified epoch, transit depth, polarization angle, etc.), and $o$ is the [observer-instrument](observer-instrument.md) that produced the measurement, together with the bilattice value $v(b, p, o) \in \mathbf{L}$ recording the evidence the observation provides.

This generalizes the standard astronomical concept of a *measurement* in three respects.

First, the value is bilattice-valued, not real-valued: a saturated detection, a non-detection, a confused-source ambiguity, and a clear unambiguous detection are different bilattice elements, not different points on the real line.
Standard astronomy compresses this structure into "value $\pm$ uncertainty," which is adequate for routine analyses but loses information at the boundaries (upper limits, confused sources, blended detections, instrumental artefacts).

Second, the observation cell is indexed by the observer-instrument, not just by the (body, predicate) pair.
This makes the question "what does the observed universe look like *to this instrument*?" a structurally precise question — it is the [restriction of the astronomical settling to that instrument's admissible-value sub-bilattice](../theorems/selection-effect-as-fiber-restriction.md).

Third, observation cells across different observer-instruments combine via the bilattice meet $\wedge_k$ when the instruments are calibrated against each other (the meet is the joint evidence) and the bilattice join $\vee_k$ when they are merely accumulated (the join is the union of evidence, with possibly higher uncertainty).

See also [calibration link](calibration-link.md), [astronomical settling](../objects/astronomical-settling.md).
