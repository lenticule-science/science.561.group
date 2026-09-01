---
title: "Dynamics"
date-created: 2026-03-04T00:00:00
type: text
keywords:
  - Relationality
description: "The tenth stratum: 7 acts that earn dynamical systems — phase spaces, mixing, and ergodicity from the flow-measure interaction."
---

The Dynamics stratum studies how the flow-measure interaction produces genuine dynamical systems: phase spaces, mixing, and ergodicity. Through 7 acts, it earns the concepts needed to describe how relational states evolve, interact, and (under sufficient conditions) lose memory of their initial conditions. This is a terminal stratum — none of its acts are referenced by later strata.

## What Dynamics exports

Of the 7 acts, 0 are **exports**, 5 are **intermediates**, and 2 are **dead ends**.

Dynamics is one of three terminal strata (along with [Physics](./physics.md) in its listed acts). Its acts consume exports from [Profile](./profile.md) and [Geometry](./geometry.md) but produce nothing that later strata need. The dynamical concepts — phase space, mixing, ergodicity — are endpoints of the derivation: things the relational calculus can *describe* but that do not feed further construction.

## The seven acts

### Profile-level dynamics (3 acts)

**ProfilePhaseSpace** `(ProfileInvariant, RecognizeContext)` — A profile invariant applied to a recognized context defines the phase space: the set of states that the system can occupy within a given context. Intermediate.

**ProfileDynamics** `(FlowProfile, ProfilePhaseSpace)` — Profile flow acting on the phase space defines the dynamics: how states evolve. Intermediate.

**ProfileMixing** `(ProfileDynamics, ProfileEntropy)` — Dynamics witnessed by entropy defines mixing: whether evolution spreads states through the phase space. Intermediate.

### Fixed-level dynamics (2 acts)

**FixedPhaseSpace** `(ProfilePhaseSpace, FixedInvariant)` — The phase space restricted to the fixed profile. Intermediate.

**FixedDynamics** `(ProfileDynamics, FixedPhaseSpace)` — Dynamics restricted to the fixed profile. **Dead end**: the specific dynamics of the fixed profile is an endpoint.

### Convergence (2 acts)

**Mixing** `(ProfileMixing, Entropy)` — Profile mixing witnessed by the full entropy measure. Intermediate.

**Ergodicity** `(FixedKernel, Mixing)` — The fixed kernel witnessing mixing. When the observation kernel at the fixed level is trivial (only full-measure sets are observed), the system is ergodic — time averages equal space averages. **Dead end**: this is the ultimate dynamical property, and nothing further is built from it.

## What the Dynamics stratum earns

The progression from phase space to mixing to ergodicity is the standard development of dynamical systems theory, but earned constructively from relational primitives. Phase spaces arise from profile invariants and contexts. Dynamics arise from flow. Mixing arises from the interaction of dynamics with entropy. Ergodicity arises when observation cannot distinguish time-evolved states from spatially averaged states.

The two dead ends — FixedDynamics and Ergodicity — are the natural endpoints: specific dynamics (what actually happens) and the strongest mixing condition (information about initial conditions is eventually lost). These are conclusions, not ingredients.

## Connection to the derivation

The Dynamics stratum is part of [Movement V](../movements/emergent-containment.md) — where the relational structures earned through the earlier movements are read as describing physical reality. Dynamical systems, mixing, and ergodicity emerge as features of the relational architecture, not as externally imposed physical theories. The derivation shows that a system with the right relational structure *must* admit these dynamical concepts — they are implicit in the algebra and geometry already earned.
