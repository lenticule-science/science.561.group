---
title: Hypertensor Stochastic Evolution
id: hypertensor-stochastic-evolution
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/stochastic-dynamics
description: The Hypertensor Stochastic Evolution assembles Stochastic-type dynamics on finite windows of the hypertensor sheaf, consistent with tower/modal structure.
---



The **Hypertensor Stochastic Evolution** assembles Stochastic-type dynamics on finite
windows of the hypertensor sheaf, consistent with tower/modal structure.

## Definition
- For each finite window, a Stochastic kernel on the finite-dimensional state space
  of sections over that window.
- Induced dynamics on towers/slices agree with compositions of hypertensor
  endomorphisms.

## Invariants
- Stationary distributions and detailed balance correspond to fixed points of
  composed endomorphisms.
- Evolutions respect tower/modal structure on each window.

## Proof
Derived from `acts/stochastic-dynamics` over the hypertensor sheaf and tower
structures, aligning Stochastic kernels with sheaf endomorphism compositions.
