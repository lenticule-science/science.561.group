---
type: morphism
class: frame-change
depends-on: [observer, comoving-frame]
---

# Frame change

For two [observers](../../../../../../content/text/glossary/terms/observer.md) $O, O'$ at the same [cosmic event](../../../../../../content/text/glossary/terms/cosmic-event.md), the **frame change** $\phi_{O \to O'}$ is the morphism in the [cosmological settling](../objects/cosmological-settling.md) that maps $O$'s predication valuation at the event to $O'$'s.

The frame change is local: it acts at a single event only. Frame changes at distinct events are independent morphisms; composing a frame change with a [light-cone restriction](light-cone-restriction.md) gives the general "boost-then-propagate" or "propagate-then-boost" operations that cosmology calls reference-frame transformations.

## What changes under a frame change

- **Components of vector- and tensor-valued predicates.** Four-momentum, electromagnetic field, stress-energy tensor — all transform as the corresponding Lorentz representation under a frame change between Lorentz-related observers, and as the corresponding spatial-isometry representation between [comoving observers](../../../../../../content/text/glossary/terms/comoving-frame.md).
- **Numerical values of frame-dependent observables.** A photon's measured frequency, an event's measured time, the spatial distance between two events.

## What does not change

- **Bilattice values of frame-invariant predicates.** "Two events are timelike-separated" has the same bilattice value for every observer. "An event is in the future of another" has the same value for every observer (in time-orientable spacetimes).
- **Cells whose support is invariant under the frame change.** A cell $(e, p, e)$ for a Lorentz-scalar predicate $p$ at a single event $e$ has a frame-independent value.

## Group structure

Frame changes between comoving observers form the spatial isometry group of the [cosmological principle](cosmological-principle.md) — for FLRW, the rotation group $\mathrm{SO}(3)$ at each comoving point and translations of the comoving spatial coordinates. Frame changes between general observers form the local Lorentz group $\mathrm{SO}(3,1)$ at each event.

The [cosmological-principle-as-symmetric-settling](../../documents/articles/notes/cosmological-principle-as-symmetric-settling.md) theorem is the statement that the cosmological settling is invariant under the comoving subgroup at each comoving slice — frame changes within this subgroup leave $v_t$ invariant, and frame changes outside it do not.
