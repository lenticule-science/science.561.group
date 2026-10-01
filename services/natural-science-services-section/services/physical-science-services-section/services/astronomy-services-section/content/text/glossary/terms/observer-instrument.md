---
name: "Observer-instrument"
type: concept
class: observer
component-of: predicated-astronomy
depends-on: [predication-settling, observer]
---

In predicated astronomy, an **observer-instrument** is the unit that produces evidence: a (telescope, focal-plane instrument, observing program, calibration pipeline) tuple that, at a given epoch, can evaluate a definite set of predicates on celestial bodies and produce bilattice values for the resulting (body, predicate, observation) cells.

This is a refinement of the [observer](observer.md) concept of predicated cosmology. A cosmological observer is an abstract evidence-accumulator located somewhere in spacetime; an astronomical observer-instrument is a concrete piece of operating hardware with a definite instrumental signature: a filter set, a wavelength range, an angular resolution, a sensitivity floor, a saturation ceiling, a pointing strategy, a duty cycle.

Two observer-instruments looking at the same body produce evidence that, in general, lives in different sub-bilattices of the same total predication structure. Reconciling them — combining a Hubble image with a JWST spectrum, or a TESS lightcurve with an ESPRESSO radial-velocity series — requires explicit calibration morphisms (this concept's principal companion: see [calibration link](calibration-link.md)). The discipline of *cross-calibration* in standard astronomy is exactly the discipline of constructing those morphisms.

The observer-instrument concept is the right unit for analyzing selection effects: every selection effect is, structurally, a property of the observer-instrument's admissible-value sub-bilattice — what the instrument can and cannot witness — rather than a property of the underlying astronomical population.
