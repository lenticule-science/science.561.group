---
title: "Astronomical settling"
type: object
class: substrate
component-of: predicated-astronomy
depends-on: [predication-settling, observer-instrument, observation-cell]
realizes: [predication-settling]
description: The astronomical settling $\mathcal{A}$ is the predication settling whose entity set is the union of catalogued and uncatalogued celestial bodies, whose predicates are astronomical observable properties (apparent magnitudes in named…
---

The **astronomical settling** $\mathcal{A}$ is the [predication settling](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) whose entity set is the union of catalogued and uncatalogued celestial bodies, whose predicates are astronomical observable properties (apparent magnitudes in named filters, spectral types, parallaxes, proper motions, radial velocities, transit depths, polarization angles, X-ray fluxes, redshifts, …), whose value bilattice $\mathbf{L}$ records evidence accumulated by [observer-instruments](teaching/explanations/observer-instrument.md), and whose closure rules are the [calibration links](teaching/explanations/calibration-link.md) between instruments plus the physical models linking distinct observables (the colour–temperature relation, the period–luminosity relation, Kepler's laws, the relativistic Doppler relation, …).

Concretely, the state of $\mathcal{A}$ at any moment is the totality of [observation cells](teaching/explanations/observation-cell.md) on file: every photometric measurement of every object in every catalogue, every spectrum, every astrometric position, every transient detection, every non-detection upper limit.
This is a vast object — modern survey catalogues run to billions of stars and hundreds of millions of galaxies, with thousands of recorded predicates each — but it is structurally finite at any moment, because no instrument that has not yet operated has produced any cells.

The astronomical settling evolves in two regimes:

- **Within an epoch.** Calibration links, cross-matching, and physical-model closures are applied to the existing cells, accumulating derived evidence (e.g., a parallax measurement plus an apparent magnitude yields an absolute magnitude; a stellar SED fit yields an effective temperature).
  This is the standard "data reduction" loop of survey astronomy, recast as iterated [closure-rule](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) firings on the settling.
- **Across epochs.** New observations add new cells; old cells may be revised (re-reduced data, recalibrated zero-points, retracted detections); old objects may be re-classified (a star turns out to be a quasar; two blended sources resolve into one).
  This is the standard "catalogue evolution" of long-running surveys, recast as a [morphism](../morphisms/_index.md) between epochs of the settling.

The astronomical settling is sub-settling-related to the [cosmological settling](../../../../cosmology/theories/predicated-cosmology/objects/cosmological-settling.md): the cosmological settling's predicates (matter density, expansion rate, CMB temperature) are constrained by sub-settlings of the astronomical settling (galaxy surveys, supernova surveys, distance-ladder anchors).
Predicated cosmology consumes outputs of predicated astronomy.

## Status

Sketch.
The astronomical settling is a natural definition by analogy to the cosmological settling.
Open: an explicit construction that fits the structure of a major existing astronomical archive (e.g., the Gaia DR3 catalogue) into the formal predication-settling shape, including the bilattice values for catalogue flags and the closure-rule pipeline for derived columns.
