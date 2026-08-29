---
type: concept
class: entity
symbol: e
depends-on: [spacetime-entity-set]
see-also: [observer, causal-evidence, cosmic-time, predication-cell]
---

# Cosmic event

The role borne by a *location at which something happens in the universe*: a point of [spacetime](../../../terms/spacetime.md) considered as the carrier of physical predications.
A cosmic event is the predicated-cosmology realization of the [entity](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/entity.md) role: an element of the [spacetime entity set](../objects/spacetime-entity-set.md) over which physical observables are predicated.

A cosmic event is identified, in a given coordinate system, by four numbers — three spatial coordinates and one time.
But the role's content is not coordinate-dependent.
Two coordinate descriptions of the same event are the same event, and a cosmic event's identity is determined by the equivalence class of all such descriptions.
The role is what lets us speak of "the supernova SN 1987A" or "the moment of recombination at this comoving location" as a single thing rather than as a label-dependent tuple.

## What predications a cosmic event carries

A cosmic event $e$ occupies the [subject](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/subject.md) or [object](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/object.md) position of [predication cells](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) of the form $(e, p, e')$ where $p$ is a physical observable.
Three families of predicate are characteristic:

- **Local-state predicates.** $(e, p, e)$ — predications about $e$ in relation to itself: temperature here, mass-energy density here, metric components here.
  The diagonal cells of [spacetime](../../../terms/spacetime.md).
- **Causal predicates.** $(e, p, e')$ where $p$ is a causal-relation predicate: $e$ is in the past of $e'$, $e$ emitted a photon detected at $e'$, $e$ is timelike-separated from $e'$.
  These are constrained by the [light cone](../../theories/observation/terms/light-cone.md) structure.
- **Field predicates.** $(e, p, e')$ where $p$ is a two-point function: the correlator $\langle \phi(e) \phi(e') \rangle$ of a quantum field, the amplitude for a particle propagating from $e$ to $e'$, the density correlation $\xi(e, e')$.

A cosmic event is therefore the granularity at which physical content lives.
Predicated cosmology takes this granularity seriously: the universe's state is the assignment of bilattice values to all such cells, not a single global field configuration.

## Under settling

Across the [cosmological settling](../objects/cosmological-settling.md), the cells $(e, p, e')$ accumulate evidence as cosmic time advances and as causal influences propagate.
The cosmic event is the static carrier of this evolving evidence; the [observer](observer.md) is the dynamic locus from which the evidence is read off.
The two roles are distinct: every cosmic event in the past light cone of an observer carries values the observer can in principle access; the observer chooses which cells to actually read.
