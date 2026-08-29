---

title: Statespace Geometry
tags:
  - geometry
  - lattice
  - invariant
depends-on:
  - fixed-invariant
  - fixed-invariant-order
  - fixed-invariant-meet
  - fixed-invariant-join
  - structure-semantics
  - fixed-invariant-geometry
form: research
# Theorem (Statespace Geometry)

With acts

- `FixedInvariant = (StabilizeInvariant FixedProfileRecognitions)`,
- `FixedInvariantOrder = (OrderRecognition FixedInvariant)`,
- `FixedInvariantMeet = (MeetRecognition FixedInvariant)`,
- `FixedInvariantJoin = (JoinRecognition FixedInvariant)`,
- `FixedInvariantLattice = (StructureSemantics FixedInvariantOrder)`,
- `FixedInvariantGeometry = (FixedGeometryProfile FixedInvariantLattice)`,

we have:

1. **Lattice of fixed invariants.**  
   Under `FixedInvariantOrder`, the fixed invariant states form a lattice whose
   meet and join are given by `FixedInvariantMeet` and `FixedInvariantJoin`.

2. **Monotone dynamics.**  
   The fixed flow and nucleus are monotone with respect to
   `FixedInvariantOrder`, and preserve meets and joins up to stabilization.

3. **Geometric compatibility.**  
   `FixedInvariantGeometry` witnesses that the lattice structure of fixed
   invariants is compatible with the fixed geometry: the order, closure, and
   flow of the profile restrict consistently to the invariant states.

## Proof sketch

1. `FixedInvariantOrder` is obtained by restricting `OrderRecognition` to
   `FixedInvariant`.  `FixedInvariantMeet` and `FixedInvariantJoin` are
   defined by composing the global meet/join with `FixedInvariant`.  Since the
   global recognition structure is a lattice, restriction to a closed subset
   yields a lattice, forming `FixedInvariantLattice`.

2. `FixedGeometryProfile` packages `FixedFlowProfile` and
   `FixedNucleateProfile`.  Both inherit monotonicity from the global flow and
   nucleus, which preserve lattice operations up to stabilization; restricting
   to `FixedInvariant` preserves this behaviour.

3. `FixedInvariantGeometry = (FixedGeometryProfile FixedInvariantLattice)`
   states that the fixed geometry acts on the fixed invariant lattice, so the
   flow–nucleus pair respects the order and lattice structure of invariants,
   giving an internal statespace geometry for the profile.
