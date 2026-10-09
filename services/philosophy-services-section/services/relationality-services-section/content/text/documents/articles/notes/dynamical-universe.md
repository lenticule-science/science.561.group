---
title: "Dynamical Universe Specification"
aliases:
  - "Dynamical Universe Specification"
date-created: 2026-03-04T00:00:00
type: doc
authors:
  - emsenn
keywords:
  - mathematical-universe
  - relationality
questions:
  - "What is the minimal mathematical structure needed to faithfully represent empirical processes?"
  - "How do we validate a mathematical universe against time-series and dynamical data?"
description: "This document specifies the Dynamical Universe: a mathematical universe whose primitive data and axioms are drawn from empirical processual phenomena."
---

## Preface

This document specifies the Dynamical Universe: a mathematical universe whose primitive data and axioms are drawn from empirical processual phenomena. Unlike the [Semiotic Universe](../semiotic-universe/index.md) and [QCHTTopos](../../topoi/quasicrystalline-hypertensor-topos/index.md), which validate against established mathematical theorem, the Dynamical Universe validates against empirical laws and experimental evidence. Its subject matter is process: how things move, evolve, and transform over time.

The specification is derived whole-cloth from empirical observation. The starting point is not an abstract mathematical structure but observable dynamical phenomena: thermodynamic processes, cosmological expansion, ecological succession, fluid dynamics, population dynamics, chemical kinetics. The question guiding the construction is: what is the minimal mathematical structure that faithfully represents these phenomena and can be validated against experimental time-series data?

This document is an initial specification. It establishes the empirical ground, identifies the primitive concepts, and states the core questions that the Dynamical Universe must answer. Full axiomatization is ongoing work.

## Empirical ground

The Dynamical Universe starts from phenomena that share a common character: they are processes that unfold in time, whose behavior can be recorded as time-series and validated against empirical measurement.

### Thermodynamics

The laws of thermodynamics describe how energy moves through systems. The second law — that entropy in an isolated system does not decrease — is an empirical fact, not a mathematical theorem. Thermodynamic processes are irreversible: a glass shatters but does not reassemble. This irreversibility is the empirical signature of directedness. A mathematical universe that formalizes process must represent directedness as a primitive feature, not as an emergent property of reversible dynamics.

### Cosmological dynamics

The expansion of the universe, described by the Friedmann equations, is an empirical process governed by the distribution of matter and energy. Cosmological observations — redshift measurements, cosmic microwave background anisotropies, baryon acoustic oscillations — provide time-series data against which any dynamical formalism must validate. The Hubble tension (the discrepancy between early-universe and late-universe measurements of the expansion rate) is an active empirical problem whose resolution may require new dynamical structure.

### Ecological and biological dynamics

Population dynamics (Lotka-Volterra equations, logistic growth), ecological succession, evolutionary dynamics (selection, drift, mutation, migration) — these are empirical processes whose mathematical representations must validate against field data. They share the character of irreversibility and path-dependence: the history of a system matters, not just its current state.

### Fluid dynamics

The Navier-Stokes equations describe the motion of viscous fluids and are grounded in empirical observation. Turbulence remains an open empirical and mathematical problem. The transition from laminar to turbulent flow is a dynamical phenomenon that any processual mathematical universe must be able to represent.

## Primitive concepts

From the empirical ground, several concepts emerge as primitive — they appear across all the domains listed above and cannot be reduced to each other within a processual framework.

### State

An empirical configuration that can be recorded at an instant. In thermodynamics, the macroscopic variables (temperature, pressure, volume, entropy). In cosmology, the scale factor and matter distribution. In ecology, the population sizes and spatial distribution of species.

### Evolution

How a state changes over time. Evolution is directed: the state at time $t_1$ depends on the state at time $t_0$ when $t_0 < t_1$, but not conversely. Evolution may be deterministic (a differential equation) or stochastic (a master equation, a Langevin equation), but it is always directed.

### Observable

A quantity that can be measured from a state. Temperature, redshift, population count, velocity field — these are observables. An observable is not the state itself; it is a particular way of witnessing the state from a measurement context.

### Irreversibility

The empirical fact that certain processes cannot be undone. Irreversibility distinguishes dynamical processes from purely mathematical transformations (which are typically invertible). A formalism that treats all transformations as reversible cannot faithfully represent thermodynamics, ecological succession, or cosmological expansion.

### Path-dependence

The empirical fact that the history of a process matters. Two systems with identical current states may have arrived there by different paths, and those paths may affect future behavior (hysteresis, evolutionary contingency, cosmological initial conditions).

## Core questions

The Dynamical Universe must answer:

1. **What is the right notion of directed transformation?** Semigroups? Directed categories? Something that captures irreversibility as a structural feature rather than a statistical one?

2. **How do observables relate to states?** The relationship must be extractive (you get an observable from a state) but not necessarily injective (different states may produce the same observable). Is this a sheaf condition, a projection, or something else?

3. **What is the right notion of time?** Not all empirical processes share a single global clock. Cosmological time, thermodynamic time, ecological time, and biological time may differ. The formalism must accommodate multiple time structures without privileging one.

4. **How does irreversibility enter the axioms?** As a direction on morphisms? As a non-invertibility condition? As an entropy-like functional?

5. **What validates the formalism?** Concretely: given a specific empirical domain (say, thermodynamic processes in an ideal gas), can the Dynamical Universe's axioms be instantiated so that the resulting predictions match experimental time-series data?

## The Schrodinger picture

The Dynamical Universe adopts the Schrodinger picture: states evolve, observables are fixed reference frames for measurement. This is a natural choice for a processual universe because process is what states do — they change, they evolve, they unfold. Observables provide the fixed landmarks against which evolution is recorded.

This contrasts with the [Spectral Universe](../spectral-universe/index.md), which adopts the Heisenberg picture: observables carry the algebraic structure and evolve, while states are fixed reference points. The two pictures are related through [residuation](../../../../../../../content/text/glossary/concepts/residuation.md) — establishing that relationship formally is cross-discipline work.

## Anticipated correspondences

The Dynamical Universe is not derived from the [derivation](../../../../relationality/index.md)'s flow operator or from the Semiotic Universe's processual character. However, certain structural parallels are anticipated:

- The derivation's [flow](./flow.md) (step 14) and [evolution](../../../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-03/terms/index.md) (step 17) concern the same domain — how things move through contexts over time.
- The Semiotic Universe's interaction calculus models processual dynamics in the domain of signs and agents.
- If the Dynamical Universe's axioms turn out to be structurally isomorphic to some fragment of the derivation or the Semiotic Universe, that is a result to be proved, not assumed.

Establishing these correspondences is part of the long-term program of showing that all five mathematical systems cohere — that they are independent formalizations of a single relational reality, each approached from different empirical or mathematical ground.
