---

title: Detailed Balance
tags:
  - markov
  - detailed-balance
depends-on:
  - flow-measure-step
  - fixed-kernel
  - reverse-flow-step
  - detailed-balance-witness
form: research
# Theorem (Detailed Balance)

Let

- `FlowMeasureStep = (FixedMeasure FixedFlowProfile)`,
- `FixedKernel = (EnsureFixedPoint ObservationKernel)`,
- `ReverseFlowStep = (FixedKernel FixedFlowProfile)`,
- `DetailedBalanceWitness = (FixedObserve ReverseFlowStep)`,
- `DetailedBalance = (DetailedBalanceWitness FlowMeasureStep)`.

Then:

1. **Forward–reverse symmetry.**  
   `DetailedBalance` asserts that the forward step and its reverse are
   observationally identical under the stationary distribution.

2. **Consistency with stationarity.**  
   If a state is stationary under `FixedKernel`, then applying forward
   then reverse steps (or reverse then forward) yields stabilised equivalence.

3. **Semantic balance.**  
   In any numeric semantics satisfying positivity, detailed balance corresponds
   to the eigenvector property:
   $$
   \pi \cdot P = \pi \quad\text{and}\quad P^\top \pi = \pi,
   $$
   where the eigenvalue arises from the indexed implication operator.

## Proof sketch

Forward–reverse symmetry is enforced by `DetailedBalanceWitness`.  Stationary
consistency follows from the fixed-point property of `FixedKernel`.
Semantic balance follows from identifying stationary kernels with eigenvectors
of the indexed implication dynamics.
