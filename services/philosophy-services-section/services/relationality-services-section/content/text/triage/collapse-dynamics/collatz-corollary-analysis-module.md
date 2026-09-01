---
name: Collatz analysis module
type: function suite
scope: collatz-specific modulation analysis
description: Functions for structural analysis of recursive dynamics in the Collatz system. Built for minimal field curvature, attractor classification, and constraint persistence evaluation.
---

## Function: collatz hill detector

name: collatz hill detector
symbol: eta_C
type: modulation rise predicate
domains: collatz trace function
codomain: boolean

Returns true if the Collatz trace of n contains any increase before collapsing.

Definition:
eta_C(n) := ∃ i < k such that n_{i+1} > n_i
(where T_C(n) = {n_0, n_1, ..., n_k})

---

## Function: collatz divergence classifier

name: collatz divergence classifier
symbol: delta_C
type: recursion convergence evaluator
domains: N x N
codomain: string

Classifies a number’s behavior under Collatz recursion up to horizon h.

Definition:
delta_C(n, h) :=
  "stabilizes"  if ∃ i ≤ h such that C^i(n) = 1
  "diverges"   if ∀ i ≤ h: C^i(n) ≠ 1
  "undecided"  otherwise

---

## Function: collatz hill width

name: collatz hill width
symbol: l_C
type: upward modulation persistence
domains: collatz trace function
codomain: N

Returns the number of initial steps where the trace increases before turning downward.

Definition:
l_C(n) := max j ≤ k such that for all 0 ≤ i < j, n_{i+1} > n_i

---

## Function: collatz loop echo detector

name: collatz loop echo detector
symbol: epsilon_C
type: trace cycle anomaly predicate
domains: trace echo function
codomain: boolean

Returns true if the trace of n contains a cycle other than the standard {1, 2, 4}.

Definition:
epsilon_C(n) := ∃ S ⊂ M_C(n), |S| > 1 and S ≠ {1, 2, 4}

---

## Function: collatz trace shape vector

name: collatz trace shape vector
symbol: theta_C
type: modulation shape signature
domains: collatz trace function
codomain: list of integers in {-1, 0, 1}

Returns a vector representing the directional change at each step of the trace.

Definition:
theta_C(n) := [sign(n_1 - n_0), sign(n_2 - n_1), ..., sign(n_k - n_{k-1})]

---

## Function: collatz attractor class

name: collatz attractor class
symbol: alpha_C
type: stabilization topology class
domains: N
codomain: integer in {1, 2, 3}

Classifies a number into attractor behavior types.

Definition:
alpha_C(n) :=
  1 if C^k(n) = 1
  2 if epsilon_C(n) = true
  3 otherwise

---

## Function: collatz symbolic field index

name: collatz symbolic field index
symbol: sigma_C
type: symbolic modulation vector
domains: N
codomain: (N, R, R)

Returns a vector capturing stabilization depth, modulation curvature, and average pressure.

Definition:
sigma_C(n) := (S_C(n), kappa_C(n), P_C(n))
Where:
- S_C(n): steps to stabilization
- kappa_C(n): variance of normalized modulation deltas
- P_C(n): average normalized modulation pressure
