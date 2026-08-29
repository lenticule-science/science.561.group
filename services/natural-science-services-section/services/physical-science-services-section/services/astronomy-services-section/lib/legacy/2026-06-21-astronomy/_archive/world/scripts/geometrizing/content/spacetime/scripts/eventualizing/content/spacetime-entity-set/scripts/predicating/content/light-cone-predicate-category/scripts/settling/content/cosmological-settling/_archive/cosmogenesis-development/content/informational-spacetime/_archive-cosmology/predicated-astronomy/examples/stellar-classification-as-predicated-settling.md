---
title: "Stellar classification as a predicated settling"
type: example
status: draft
component-of: predicated-astronomy
depends-on: [astronomical-settling, instrument-fiber, observer-instrument]
see-also: [stellar-evolution-as-predicated-settling]
---

# Stellar classification as a predicated settling

[Stellar classification](../../stellar/terms/stellar-classification.md) — the assignment of stars to MK spectral types and luminosity classes from their spectra — is a worked example of a [predicated astronomical settling](../objects/astronomical-settling.md) reducing to a coarse predicate fiber under instrument restriction.

## The classification fiber

For each classifying instrument $o$ (a low-resolution spectrograph plus a classification pipeline), the relevant [instrument fiber](../objects/instrument-fiber.md) supports a single discrete predicate: $\text{type}(b) \in \{O0, O1, \ldots, M9\} \times \{Ia, Ib, II, III, IV, V, VI, VII\}$.
The admissible-value bilattice on this predicate is the discrete one over the MK class lattice — a value is either a determinate class, a class range with a flag (e.g., "G2-G5 V"), an uncertain classification (e.g., "K?"), or unclassified ($\bot$).

The classification pipeline is structurally a [closure rule](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md): given an input spectrum (an observation cell on a high-dimensional flux-vs-wavelength predicate) it computes an MK class (an observation cell on the discrete classification predicate).
The closure rule is parameterized by the pipeline's training set and method (template matching, neural network, stellar-parameter fitting); the predicated framing makes the parameterization a structural feature, not a hidden assumption.

## The HR-diagram projection

Stars whose spectral types and absolute magnitudes are both known constitute the HR-diagram sub-settling.
In the predicated framing, the [HR diagram](../../stellar/terms/hr-diagram.md) is the projection of the astronomical settling onto a two-dimensional fiber: $(\text{type}, M_V)$, where $M_V$ is absolute magnitude in some filter.
The diagram's empirical structure — the main sequence, giant branch, white dwarf cooling sequence — is the visible shape of the bilattice values' distribution across the projection.

When [photon-arrival reindexing](../morphisms/photon-arrival-reindexing.md) is composed with HR-diagram projection across observers at different epochs, what is recovered is *isochrones*: the locus in the HR diagram of stars of common age but varying mass.
Cluster ages are derived by fitting the projection of a cluster's HR-diagram sub-settling onto a one-parameter family of isochrones — predicatedly, a residuation problem against the isochrone closure rule.

## Connection to the cosmology counterpart

The [stellar-evolution example](../../../../cosmology/theories/predicated-cosmology/examples/stellar-evolution-as-predicated-settling.md) under predicated cosmology gives the *physical* settling of a single star — the pair of closure operators $\sigma_t, \Delta_t$ acting on stellar states with four shadow classes corresponding to HR-diagram populations.
This example gives the *observational* settling — what survey instruments see when they project the population of stars onto a classification fiber.
The two are dual:

- The cosmology example asks "what kind of object is this star?" and answers structurally with which closure operators fix its current state.
- This example asks "what does the population of stars look like to a classification survey?" and answers structurally with how the parent astronomical settling projects onto the instrument fiber.

Together they constitute a full predicated reading of the HR-diagram apparatus.

## Status

Draft.
The framing is internally consistent and matches the standard interpretation of the HR diagram as a projection of stellar parameter space.
Open: explicit construction on a real survey (e.g., Gaia DR3's classified sub-sample) including the bilattice values for classification confidence flags and the closure-rule trace for the classification pipeline.
Also open: a structural account of how multi-instrument classifications (e.g., Gaia BP/RP + GALAH spectra + APOGEE spectra) combine as a bilattice meet across the relevant instrument fibers.
