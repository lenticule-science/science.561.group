---
title: "Observation cell"
type: concept
class: observation
component-of: predicated-astronomy
depends-on: [predication-cell, observer-instrument]
aliases:
  - observation-cell
kind: cell
of: settlement
---

An **observation cell** is the predication-categorical unit of an astronomical observation: a triple $(b, p, o)$ where $b$ is a celestial body, $p$ is a predicate (apparent magnitude in a specified filter, radial velocity at a specified epoch, transit depth, polarization angle, etc.), and $o$ is the [observer-instrument](observer-instrument.md) that produced the measurement, together with the bilattice value $v(b, p, o) \in \mathbf{L}$ recording the evidence the observation provides.

This generalizes the standard astronomical concept of a *measurement* in three respects.

First, the value is bilattice-valued, not real-valued: a saturated detection, a non-detection, a confused-source ambiguity, and a clear unambiguous detection are different bilattice elements, not different points on the real line. Standard astronomy compresses this structure into "value $\pm$ uncertainty," which is adequate for routine analyses but loses information at the boundaries (upper limits, confused sources, blended detections, instrumental artefacts).

Second, the observation cell is indexed by the observer-instrument, not just by the (body, predicate) pair. This makes the question "what does the observed universe look like *to this instrument*?" a structurally precise question — it is the [restriction of the astronomical settling to that instrument's admissible-value sub-bilattice](selection-effect-as-fiber-restriction.md).

Third, observation cells across different observer-instruments combine via the bilattice meet $\wedge_k$ when the instruments are calibrated against each other (the meet is the joint evidence) and the bilattice join $\vee_k$ when they are merely accumulated (the join is the union of evidence, with possibly higher uncertainty).

See also [calibration link](calibration-link.md), [astronomical settling](../../documents/articles/notes/astronomical-settling.md).

An **observation cell** is a triple $(b, p, o)$ — a celestial body $b$, a predicate $p$, and an [observer-instrument](../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/settlement/library/observer-instrument/observer-instrument.md) $o$ — together with the bilattice value $v(b, p, o) \in \mathbf{L}$ recording the evidence the observation provides.

**Indexed by the observer-instrument.** This makes the question "what does the observed universe look like *to this instrument*?" a structurally precise question — it is the restriction of the astronomical settlement to that instrument's admissible-value sub-bilattice (a fiber-restriction sub-settlement).
