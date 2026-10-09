---
name: astronomical-settlement
kind: settlement
description: "A settlement whose entity-set is the union of catalogued and uncatalogued celestial bodies, whose predicates are astronomical observable properties, whose value bilattice records evidence accumulated by observer-instruments, and whose closure-rules are calibration-links between instruments plus physical models linking observables."
of: settlement-category
entity-set: "catalogued + uncatalogued celestial bodies"
predicates: "apparent magnitudes, spectral types, parallaxes, proper motions, radial velocities, transit depths, polarization angles, X-ray fluxes, redshifts, ..."
closure-rules: "calibration-links + physical models (colour-temperature, period-luminosity, Kepler's laws, relativistic Doppler, ...)"
---

The **astronomical settlement** $\mathcal{A}$ is a settlement whose entity-set is the union of catalogued and uncatalogued celestial bodies, whose predicates are astronomical observable properties, whose value bilattice $\mathbf{L}$ records evidence accumulated by [observer-instruments](../../../settlement/library/observer-instrument/observer-instrument.md), and whose closure-rules are the [calibration-links](../../../settlement/library/calibration-link/calibration-link.md) between instruments plus the physical models linking distinct observables (the colour–temperature relation, the period–luminosity relation, Kepler's laws, the relativistic Doppler relation, …).

## State

The state of $\mathcal{A}$ at any moment is the totality of [observation-cells](../../../settlement/library/observation-cell/observation-cell.md) on file: every photometric measurement of every object in every catalogue, every spectrum, every astrometric position, every transient detection, every non-detection upper limit. Vast — modern survey catalogues run to billions of stars and hundreds of millions of galaxies — but structurally finite at any moment.

## Evolution in two regimes

**Within an epoch.** Calibration-links, cross-matching, and physical-model closures are applied to the existing cells, accumulating derived evidence (a parallax measurement plus an apparent magnitude yields an absolute magnitude; a stellar SED fit yields an effective temperature). This is the standard data-reduction loop of survey astronomy, recast as iterated closure-rule firings on the settlement.

**Across epochs.** New observations add new cells; old cells may be revised (re-reduced data, recalibrated zero-points, retracted detections); old objects may be re-classified (a star turns out to be a quasar; two blended sources resolve into one). This is the standard catalogue evolution of long-running surveys, recast as a settlement-morphism between epochs of the settlement.

## Relation to cosmological-settlement

The astronomical settlement is sub-settlement-related to the cosmological-settlement: the cosmological settlement's predicates (matter density, expansion rate, CMB temperature) are constrained by sub-settlements of the astronomical settlement (galaxy surveys, supernova surveys, distance-ladder anchors). Predicated cosmology consumes outputs of predicated astronomy.
