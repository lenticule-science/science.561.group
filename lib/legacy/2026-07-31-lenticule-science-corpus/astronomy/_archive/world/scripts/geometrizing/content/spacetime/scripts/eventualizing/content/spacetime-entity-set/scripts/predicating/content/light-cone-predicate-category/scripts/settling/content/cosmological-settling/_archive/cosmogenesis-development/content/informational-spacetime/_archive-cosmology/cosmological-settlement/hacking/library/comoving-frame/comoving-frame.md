---
type: definition
class: frame
realizes: [observer]
depends-on: [observer, spacetime-entity-set, cosmological-principle]
---

# Comoving frame

A choice of [observer](teaching/explanations/observer.md) trajectories that respects the symmetry of the [cosmological principle](../../../terms/cosmological-principle.md): a foliation of the [spacetime entity set](spacetime-entity-set.md) into spacelike hypersurfaces of constant [cosmic time](../../theories/evolution/terms/cosmic-time.md), together with a worldline through each spatial point that remains at fixed comoving coordinates as the universe expands.

A comoving observer is one whose worldline is a leaf of this foliation.
Two comoving observers at different positions agree on the value of cosmic time at any moment — their clocks tick in synchrony — and their frames differ only by a spatial isometry, not by a Lorentz boost.

## Why the frame is privileged

Any spacetime admits a continuum of frames.
In a generic spacetime, no frame is privileged; observers in relative motion have equally valid frames.
In an FLRW spacetime — one in which the [cosmological-settling](cosmological-settling.md) is invariant under the spatial isometry group of the [cosmological principle](../../../terms/cosmological-principle.md) — there *is* a privileged frame: the frame in which the cosmological settling looks symmetric.
That frame is the comoving frame.

A non-comoving observer (one moving with respect to the cosmic matter distribution) sees the cosmological settling in a tilted frame: the [cosmic microwave background](../../theories/structure/terms/cosmic-microwave-background.md) acquires a dipole anisotropy, the spatial slices acquire tilt, and the universe loses its manifest isotropy.
The Solar System has such a tilt — about 370 km/s — and the dipole-corrected CMB is the working definition of the comoving frame at our cosmic location.

## As a section of the cosmic-time bundle

The comoving frame is a section of the projection $t : E_{\mathrm{cos}} \to \mathbb{R}_{\geq 0}$ from spacetime to cosmic time.
Each spatial point on the comoving slice is mapped into the spacetime by a worldline, and the section's image is the observer's trajectory.

In categorical terms, the comoving frame is what makes [cosmic-time-reindexing](../morphisms/cosmic-time-reindexing.md) a well-defined functor on the [light-cone predicate category](light-cone-predicate-category.md): without a privileged section, "the cell at this comoving location, this much later" has no canonical referent.

## Frame change

A morphism between comoving frames is a [frame change](../morphisms/frame-change.md).
Among comoving frames, every frame change is an element of the spatial isometry group; among general frames, frame changes include Lorentz boosts and acquire the standard relativistic transformations.
The comoving subgroup is a strict subgroup, and the [cosmological-principle-as-symmetric-settling](../theorems/cosmological-principle-as-symmetric-settling.md) theorem is the statement that the cosmological settling is invariant exactly under the comoving subgroup, not the full Poincaré group.
