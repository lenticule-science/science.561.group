---
title: Markov Dynamics Simulation
tags:
  - simulation
  - markov
  - kernel
depends-on:
  - theorem/external/relational-markov-dynamics
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Implements transition kernel, entropy, and mixing behaviour on explicit or symbolic state spaces."# Markov Dynamics Simulation

Implement the transition kernel, entropy, and mixing behaviour from
**Theorem (Relational Markov Dynamics)** on an explicit state space (finite or
symbolically represented).

## State representation

- **Kernel operator `K`.**  
  Doubly stochastic matrix (or symbolic operator) approximating
  `ObservationKernel`.  Rows/columns index fixed invariant states.
- **Stationary vector `π`.**  
  Estimate of `FixedKernel`, updated via power iteration.
- **Entropy tracker.**  
  Scalar sequence `{H_t}` computed from `π K^t` to observe monotonicity.

These carriers describe the local simulation state of a Markov dynamics
experiment. They do not replace or extend the global `RelationalState :=
Section` used by the kernel; instead, they are views derived from the
observation‑kernel and invariant lattice theorems.

## Inputs

1. Initial distribution `π_0` and kernel `K` (obtained from flow measurements).
2. Desired tolerance `(epsilon)` for convergence of `π`.
3. Maximum iterations `T`.

## Update procedure

1. **Stationary iteration.**  
   Repeatedly set `π_{t+1} = π_t K`.  Stop when `||π_{t+1} - π_t||_1 < (epsilon)` or the
   symbolic recurrence stabilizes.
2. **Entropy measurement.**  
   For each `t`, compute `H_t = -∑ π_t(i) log π_t(i)` and verify non-decrease.
3. **Mixing test.**  
   Evaluate total variation distance between distributions obtained from
   different starting states to ensure decay toward zero.
4. **Detailed balance check.**  
   Confirm `π_i K_{ij} ≈ π_j K_{ji}` for all `(i,j)` to match the act witness.

## Invariants

- Rows/columns of `K` must sum to 1; deviations indicate inconsistent flows.
- Entropy sequence should stabilise; decreasing entropy flags numerical issues.
- Detailed-balance residual must stay below a user-configured threshold.

## Outputs

- Approximated stationary distribution `π`.
- Logs for entropy trajectory, mixing rates, and balance residuals.
