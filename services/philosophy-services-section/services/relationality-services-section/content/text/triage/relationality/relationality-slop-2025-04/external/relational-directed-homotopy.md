---
title: Relational directed homotopy
aliases:
  - Relational directed homotopy
  - relational directed homotopy
date-created: "2026-03-04T00:00:00"
keywords:
  - text
  - homotopy
  - geometry
depends_on:
  - theorem/internal/flow-nucleus-compatibility
  - theorem/internal/profile-flow
  - theorem/internal/baseline-renewal
operations:
  - name: flow
  - name: nucleus
  - name: shuffle trace
---

# Theorem (Relational Directed Homotopy)

Directed homotopy tracks oriented paths and higher cells.  In the relational
calculus, we witness the same structure through geometry, profiles, towers, and
physics acts.  Theorems below summarize the correspondence.

## Geometry layer

**Theorem 1 (Directed geometric data).**
Acts [Flow](../../acts/flow.md) through
[Dualize Interior](../../../../documents/articles/notes/dualize-interior.md) present a directed
geometric structure with flow composition, nuclei, and residuation laws.

*Proof.* Flow/Fix Flow encode directed paths and their fixed points.
Nucleation/fix-nucleus acts define closure operators, while Form Geometry and
Legislate Dynamic Residuation show how flows and nuclei interact cohesively.
These proofs collectively give the axioms of a directed space. ∎

## Profiles and towers

**Theorem 2 (Profiles as directed subspaces).**
[Discipline](../../../../documents/articles/notes/discipline.md),
[Filter](../../../../documents/articles/notes/filter.md), and
[Profile Recognitions](../../../../documents/articles/notes/profile-recognitions.md) carve out
subuniverses stable under the directed geometry.

*Proof.* These acts explicitly require compatibility with flow/nucleus behavior,
so each profile inherits the directed structure.  Trace/Profile and
Geometry/Profile acts propagate the witnesses down the tower. ∎

**Theorem 3 (Tower coherence).**
[Build Profile Tower](../../../../documents/articles/notes/build-profile-tower.md),
[Nest Profile](../../../../documents/articles/notes/nest-profile.md), and
[Build Composite Profile Tower](../../../../documents/articles/notes/build-composite-profile-tower.md)
show that profiles can be stacked while preserving the directed geometry, yielding
the higher-cell structure expected in directed homotopy.

*Proof.* The tower acts compose filters and disciplines and then rebuild the
trace/geometry structure at each level, guaranteeing coherence between layers. ∎

## Observables and reachability

**Theorem 4 (Directed observables).**
Acts [Observe](../../../../documents/articles/notes/observe.md) through
[Interpret Physics](../../../../documents/articles/notes/interpret-physics.md) attach observables
and evaluation semantics to the directed flows.

**Theorem 5 (Reachable states).**
[Stabilize Invariant](../../../../documents/articles/notes/stabilize-invariant.md) and
[Reach](../../../../documents/articles/notes/reach.md) demonstrate that directed paths determine
reachable components and invariants, matching the notion of directed homotopy
classes.

*Proof sketches.* Each act defines how observables follow flows and how invariants
persist under directed evolution, which is precisely the structure used to define
directed homotopy in other settings (e.g., d-spaces or precubical sets). ∎

## Summary table

| Directed homotopy concept | Relational witness |
| ------------------------- | ------------------ |
| Paths and composition | Flow/geometry cluster ([Flow](../../acts/flow.md) -> [Legislate Dynamic Residuation](../../../../documents/articles/notes/legislate-dynamic-residuation.md)) |
| Directed subspaces | Profile/filter cluster ([Discipline](../../../../documents/articles/notes/discipline.md) -> [Contextualize Profile](../../../../documents/articles/notes/contextualize-profile.md)) |
| Higher cells / towers | Tower builders ([Build Profile Tower](../../../../documents/articles/notes/build-profile-tower.md) -> [Build Composite Profile Tower](../../../../documents/articles/notes/build-composite-profile-tower.md)) |
| Observables | Measurement acts ([Observe](../../../../documents/articles/notes/observe.md), [Systematize Physics](../../../../documents/articles/notes/systematize-physics.md), [Interpret Physics](../../../../documents/articles/notes/interpret-physics.md)) |
| Reachable components | Invariants ([Stabilize Invariant](../../../../documents/articles/notes/stabilize-invariant.md), [Reach](../../../../documents/articles/notes/reach.md)) |

With these theorems in place, future work can introduce explicit path objects or
homotopy equivalences by referencing the acts above rather than rebuilding the
structure from scratch.
