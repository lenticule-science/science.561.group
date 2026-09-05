---

title: Relational Quantum Mechanics Correspondence
tags:
  - quantum
  - correspondence
  - external
depends-on:
  - theorem/internal/observable-algebra
  - theorem/internal/physics-soundness-invariants
  - theorem/external/spectral-theorem
  - theorem/external/relational-markov-dynamics
  - theorem/external/relational-modal-logic
operations:
  - name: state profile
    acts:
      - profile-recognitions
      - physics-state
  - name: observable
    acts:
      - observable-algebra
      - spectrum
  - name: unitary evolution
    acts:
      - evolve
      - mixing
  - name: measurement
    acts:
      - measure
      - observation-kernel
form: research
# Theorem (Relational Quantum Mechanics Correspondence)

Relational recognitions equipped with the observable algebra, physics profile,
spectral theorem, and Markov dynamics support a fragment of finite-dimensional
quantum mechanics: density-like states, self-adjoint observables, unitary-like
evolution, and measurement with Born-like probabilities.  This note explains
how to read the earned acts as a quantum correspondence.

## 1. Internal ingredients

From the internal and external theorems we assume:

- an **observable algebra** of recognitions with
  `ObservableAlgebra = (StructureSemantics ProfileRecognitions)`,
- a **physics state space** `PhysicsState` inside a fixed physics profile
  obeying *Physics Soundness and Invariants*,
- a **spectral decomposition** via the *Spectral Theorem*:
  harmonic modes and spectral projections over observables,
- **Markov dynamics** describing reversible stochastic evolution and
  stationary distributions,
- a **modal structure** (from relational modal logic) allowing necessity and
  possibility predicates over recognitions.

These supply:

- state carriers (`PhysicsState`),
- observable elements with spectra (`Spectrum`),
- evolution operators (`Evolve` composed with mixing acts),
- and observation kernels (`ObservationKernel`, `Measure`) relating states to
  outcome recognitions.

## 2. Finite-dimensional quantum fragment

Fix a finite subset of recognitions forming a profile with:

- a finite observable algebra closed under sums, products, and
  *-involution (interpreted as adjoint),
- a family of harmonic modes from the spectral theorem acting as eigenstates,
- a stationary Markov kernel compatible with the observable algebra.

In this setting we read:

- **States** as normalised positive linear functionals on the observable
  algebra, represented by suitable `PhysicsState` recognitions and their
  measurement channels (density-like objects).
- **Observables** as self-adjoint elements of the observable algebra, with
  spectra and spectral projections given by the spectral theorem acts.
- **Evolution** as families of reversible kernels acting by conjugation on
  states, realised by the evolution acts that preserve physics soundness and
  invariants (unitary-like).
- **Measurements** as observation kernels whose spectral projections pick out
  outcome recognitions; probabilities arise from the state’s evaluation on
  these projections (Born-like rule).

The internal proofs ensure that:

- evolution preserves normalisation and positivity (states stay states),
- spectra decompose observables into orthogonal modes up to nucleus,
- and measurement outcomes can be treated as events in the Markov dynamics
  with probabilities consistent with the state.

## 3. Correspondence statement (informal)

Let `H` be a finite-dimensional Hilbert space, `ρ` a density operator,
`A` a self-adjoint operator with spectral projections `(P_i)`, and `U_t`
a unitary evolution.  A **relational quantum correspondence data** for this
triple consists of:

1. an embedding of the eigenstructure of `A` into the harmonic modes and
   spectral projections of the observable algebra,
2. a family of evolution acts realising a reversible Markov/kernel evolution
   whose action on states matches `ρ ↦ U_t ρ U_t†` in numeric semantics, and
3. measurement acts whose outcome recognitions correspond to the projections
   `P_i` and whose probabilities, as computed via the measurement fabric, agree
   with `Tr(ρ P_i)` up to controlled approximation error.

Within the earned regime where these embeddings exist and the numeric semantics
are sound, the relational calculus realises the same operational predictions as
finite-dimensional quantum mechanics for the chosen observables and evolutions.

## 4. Use as a correspondence theorem

In practice this note is used as follows:

- To **design quantum-like simulations**, one fixes a finite observable
  algebra slice, chooses spectral decompositions via the spectral acts, and
  specifies evolution and measurement acts respecting the correspondence data.
- To **interpret external quantum models**, one records how a given Hilbert
  space model is embedded into the relational stack (which recognitions play
  the roles of `ρ`, `A`, `U_t`, and `P_i`).

This establishes the **Relational Quantum Mechanics Correspondence**: in
finite-dimensional regimes with appropriate embeddings, the relational
observable/physics/measurement stack supports quantum-like states, observables,
evolution, and measurement, and matches standard quantum mechanical
predictions for those regimes.

