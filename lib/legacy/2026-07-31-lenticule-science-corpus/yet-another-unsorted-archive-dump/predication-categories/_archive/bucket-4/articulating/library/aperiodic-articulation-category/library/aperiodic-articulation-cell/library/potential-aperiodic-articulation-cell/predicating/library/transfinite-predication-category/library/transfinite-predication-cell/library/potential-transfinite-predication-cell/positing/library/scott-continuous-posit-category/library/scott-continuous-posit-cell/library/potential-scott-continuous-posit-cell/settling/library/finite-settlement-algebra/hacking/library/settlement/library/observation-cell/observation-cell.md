---
name: observation-cell
kind: cell
description: "A triple (b, p, o) — celestial body, predicate, observer-instrument — together with a bilattice value v(b, p, o) ∈ L recording the evidence the observation provides. The cell within a settlement that records what an instrument measured about a body."
of: settlement
---

An **observation cell** is a triple $(b, p, o)$ — a celestial body $b$, a predicate $p$, and an [observer-instrument](../observer-instrument/observer-instrument.md) $o$ — together with the bilattice value $v(b, p, o) \in \mathbf{L}$ recording the evidence the observation provides.

## What it generalizes from standard astronomical measurement

**Bilattice-valued, not real-valued.** A saturated detection, a non-detection, a confused-source ambiguity, and a clear unambiguous detection are different bilattice elements, not different points on the real line. Standard astronomy compresses this structure into "value $\pm$ uncertainty," which is adequate for routine analyses but loses information at the boundaries (upper limits, confused sources, blended detections, instrumental artefacts).

**Indexed by the observer-instrument.** This makes the question "what does the observed universe look like *to this instrument*?" a structurally precise question — it is the restriction of the astronomical settlement to that instrument's admissible-value sub-bilattice (a fiber-restriction sub-settlement).

**Combinable across instruments via the bilattice operations.** Observation cells across different observer-instruments combine via the bilattice meet $\wedge_k$ when the instruments are calibrated against each other (the meet is the joint evidence) and the bilattice join $\vee_k$ when they are merely accumulated (the join is the union of evidence, with possibly higher uncertainty).
