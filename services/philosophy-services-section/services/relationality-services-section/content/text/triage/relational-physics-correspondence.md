---
title: Relational Physics and external correspondence
aliases:
  - Relational Physics and external correspondence
  - relational physics and external correspondence
date-created: "2026-03-04T00:00:00"
keywords:
  - physics
  - correspondence
  - external
depends_on:
  - theorem/internal/physics-soundness-invariants
  - theorem/external/relational-markov-dynamics
  - theorem/external/quasicrystalline-relational-hypertensors
operations:
  - name: fixed physics profile
  - name: evolve state
  - name: measure state
  - name: stabilize invariants
---

# Theorem (Relational Physics and External Correspondence)

The fixed physics profile earned by the internal theorem on physics soundness,
combined with the external Markov and hypertensor correspondences, is rich
enough to host simulators that correspond to familiar physical theories
(Newtonian-style point dynamics, diffusive fields, etc.).  This note explains
how to expose that structure as a “physics calculator” while keeping a clear
correspondence story to external laws.

## 1. Internal relational physics

We work in the setting of the internal theorem *Physics Soundness and
Invariants*.  In particular we assume:

- a fixed profile of recognitions with semantics `FixedProfileSemantics`,
- a compatible flow and nucleus packaged as `FixedGeometryProfile`,
- a fixed physics profile `FixedPhysicsProfile = (FlowObservation FixedFlowProfile)`,
- a space of physics states recognised by `PhysicsState`,
- and an invariant picker `FixedInvariant = (StabilizeInvariant FixedProfileRecognitions)`
  that selects fixed invariant states.

Soundness guarantees:

1. `SoundFixedPhysicsSemantics` — every judgement realised by
   `FixedPhysicsProfile` is valid in `FixedProfileSemantics`,
2. `SoundFixedPhysicsGeometry` — fixed-physical evolutions respect the
   geometry, and
3. `FixedInvariant` — invariant states live in the intersection of the
   fixed profile and the flow-fixed points.

We also assume the external correspondences:

- *Relational Markov Dynamics* — giving Markov-style evolution and stationary
  laws over recognitions, and
- *Quasicrystalline Relational Hypertensors* — giving structured state
  spaces as stabilized hypertensors indexed by lattices.

Together these supply a relational physics stack: states live in hypertensor
profiles; evolution is governed by flow/Markov dynamics; observables are
measured along the fixed profile; and invariants are stabilised by
`StabilizeInvariant`.

## 2. External theories and parameterisations

Let `T_ext` be a familiar external physical theory in a regime where it is
well-approximated by ordinary differential or difference equations: for
example:

- Newtonian point particles subject to forces on `R^n`,
- diffusive or wave-like fields on a lattice,
- simple circuit dynamics for linear RLC networks.

Each such theory provides:

- an external state space `S_ext` (positions, momenta, fields, voltages, etc.),
- a family of parameterised laws `Φ_ext` (forces, diffusion constants,
  resistances, etc.), and
- a notion of invariant quantity (energy, charge, etc.) together with an error
  model for approximate numerics.

An **external physics correspondence data** for `T_ext` consists of:

1. an injection `ι_state : S_ext → PhysicsState` into relational physics
   states (or, more generally, an interpretation functor landing in
   hypertensor-indexed states),
2. a family of evolution schemes `Φ_rel` definable using acts
   `FixedPhysicsProfile` and `Evolve` such that
   `Evolve_rel ∘ ι_state` approximates `Φ_ext` up to controlled error, and
3. a family of invariant recognitions `Inv_rel` in the image of
   `FixedInvariant` that witness the same conserved quantities as T_ext in the
   chosen regime.

We call such a triple `(ι_state, Φ_rel, Inv_rel)` a *relational realisation*
of `T_ext`.

## 3. Existence of relational realisations (informal)

Within the present note we do not prove that *all* external theories admit
relational realisations; instead we sketch the shape of the argument for a
large class of numerically tractable theories:

1. **Discretisation via hypertensors.**  
   The quasicrystalline hypertensor correspondence provides structured
   lattices `Z^d` with stabilized recognitions at each site.  For theories on
   continuous spaces (e.g. fields, Newtonian space), choose a discretisation
   scheme (finite difference, finite volume, particle mesh) and interpret
   discrete state tuples as hypertensors.  This gives an `ι_state` into
   `PhysicsState`.

2. **Markov/flow evolution.**  
   The relational Markov dynamics correspondence provides acts implementing
   transition kernels and flow updates over recognitions.  Standard numerical
   integrators (Euler, Runge–Kutta, symplectic schemes) can be expressed as
   compositions of these acts, yielding `Φ_rel`.  Physics soundness ensures
   these evolved states remain within `FixedProfileSemantics` and respect the
   fixed geometry.

3. **Invariant lifting.**  
   External conserved quantities (energy, momentum, charge) become observables
   over the lattice or particle states.  Using `FixedInvariant` and related
   acts, we can pick out relational recognitions that behave as fixed
   invariants under `Φ_rel` up to controlled numerical drift.  These form
   `Inv_rel`.

Under the usual assumptions on discretisation and integrator stability, the
composed relational dynamics track the external dynamics with errors that can
be bounded using the measurement fabric.

## 4. Physics calculator as an external correspondence

A **physics calculator** in this setting is a family of runbooks that:

1. start from external-style data (masses, positions, parameters, time
   horizons, etc.),
2. construct a `ScenarioRecognition` whose state, dynamics, and integrator
   are given by a relational realisation of some `T_ext`, and
3. execute evolution and measurement acts to produce `SimulationRunRecognition`s
   tagged with both relational and external interpretations.

For each canonical external model (projectile motion, mass–spring–damper,
two-body gravitation, simple circuits, diffusion, waves) we can therefore
record:

- which relational acts realise its state space and dynamics,
- which invariant recognitions correspond to familiar conserved quantities,
- and how error and approximation are monitored by the measurement fabric.

The external correspondence is “earned” in exactly the same way as for other
external theorems: by fixing a regime, identifying a relational realisation,
and checking that physics soundness and invariants continue to hold inside
that regime.

## 5. Summary

The internal physics stack (fixed profile, flow, nucleus, invariants) and
external Markov/hypertensor correspondences give a general relational notion
of physical evolution.  External theories such as Newtonian mechanics, simple
field equations, and circuit laws can be realised as special cases via
discretisation into hypertensors and composition of the earned acts
`FixedPhysicsProfile`, `Evolve`, `Measure`, and `StabilizeInvariant`.

This establishes the **Theorem (Relational Physics and External
Correspondence)**: within earned regimes and under controlled discretisation
and numerical assumptions, the relational physics stack can host physics
simulators that correspond to familiar physical laws, with all approximations
made explicit and measurable.
