---
title: "Photon-arrival reindexing"
type: morphism
class: time-reindexing
component-of: predicated-astronomy
depends-on: [astronomical-settling, observation-cell, cosmic-time-flow]
see-also: [cosmic-time-flow]
---

**Photon-arrival reindexing** is the morphism on the [astronomical settling](../objects/astronomical-settling.md) that converts a body's intrinsic-time properties into the observer's arrival-time properties. A photon emitted by a body at the body's proper time $\tau$ arrives at the observer at observer time $t$, with $t - \tau$ depending on the body's distance, the cosmological expansion between emission and arrival, and any gravitational-potential redshift along the line of sight. Predicates of the body are observed in their photon-arrival-time projection.

Three structural properties:

- **Functoriality.** Reindexing respects the bilattice operations: the meet of evidence about a body, projected via photon arrival, equals the meet of the projections; similarly for joins and residuations. This is what makes "the same body observed at the same intrinsic epoch by two instruments" structurally well-defined.
- **Distance-dependent stretch.** The interval between successive observations at the observer compresses or stretches the corresponding interval at the source by $(1 + z)$ for cosmological sources (the time-dilation half of the redshift relation), and by general-relativistic factors for compact-object sources. This stretch is part of the morphism's data, not a correction applied after the fact.
- **Causal restriction.** Photon-arrival reindexing is causally one-way: a body's state at intrinsic time $\tau$ becomes accessible to the observer only at $t = \tau + \Delta(\tau)$, where $\Delta$ is the light travel time. The morphism's image at observer time $t$ is the body's state on the observer's past light cone, not the body's state simultaneous with $t$.

This morphism is the astronomical-instrument refinement of the cosmological [cosmic-time-flow](../../../../cosmology/theories/predicated-cosmology/morphisms/cosmic-time-flow.md): the cosmological version concerns the universe-as-a-whole's evolution under cosmic-time reindexing; this version concerns individual bodies' projections through the photon-arrival relation onto the observer's instrument fiber. The two are coherent — applying photon-arrival reindexing to all bodies simultaneously, in a homogeneous-isotropic limit, recovers cosmic-time flow.

## Status

Sketch. The morphism is structurally well-defined. Open: explicit construction on a worked example (a single Cepheid variable observed across multiple epochs by Gaia, HST, and JWST), and verification that the bilattice-meet of the multi-epoch observations recovers the standard period-luminosity-relation fit.
