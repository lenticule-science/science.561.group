---
type: question
class: internal
status: open
explores: [continuous-valued-settling, continuous-state-regime-classification, value-agnostic-void-cone, aperiodic-regime-cohomology-via-direct-limit, q-enriched-cohomology]
---

# Continuous-valued cohomology in the TB / aperiodic regime

The corpus has cohomology theory for two separate slices:
- **Bilattice values, all regimes.** Including the [aperiodic-regime cohomology theorem](../theorems/aperiodic-regime-cohomology-via-direct-limit.md) and [void-cone cohomology theorem](../theorems/void-cone-cohomology.md).
- **Continuous values, strict and asymptotic-c regimes.** The [Lawvere-quantale benchmark](../examples/benchmark-lawvere-quantale-settling.md) and [probabilistic belief-propagation benchmark](../examples/benchmark-probabilistic-belief-propagation.md).

Open: the cohomologically-rich case — **continuous values in TB or aperiodic regime**. The [Q-enriched cohomology object](../objects/q-enriched-cohomology.md) provides infrastructure (cohomology with quantale coefficients), but explicit benchmarks haven't been computed.

## What's missing concretely

A continuous-valued settling whose closure ordinal $\kappa \in [\omega_1, \infty)$ — placing it firmly in aperiodic-V — and whose cohomology has been explicitly computed. The corpus's existing aperiodic examples are *bilattice-valued substitution settlings* (Fibonacci, Tribonacci, Padovan, etc.) where $\kappa = \omega_1$. To get continuous-valued aperiodic, lift one of these to continuum-valued letter weights.

Concrete construction:

- Take Fibonacci substitution $\sigma : a \mapsto ab, b \mapsto a$.
- Lift to $\mathcal{V} = [0, \infty]$ (Lawvere quantale) by assigning real-valued letter weights $w(a), w(b) \in (0, \infty)$.
- Closure: each substitution stage produces a longer sequence with weighted letters; the cell space accumulates real-valued content.
- Settling at $\omega_1$: continuum-valued aperiodic settling.

This is well-defined per the [continuous-valued settling object](../objects/continuous-valued-settling.md) and [continuous-state regime classification](../theorems/continuous-state-regime-classification.md). What's missing is *computing the cohomology*.

## Concrete sub-questions

1. **Q-enriched apex cohomology.** Per the [Q-enriched cohomology infrastructure](../objects/q-enriched-cohomology.md), the cohomology should be computable as a $Q$-module ($Q = $ Lawvere quantale). Conjecture: $H^1$ of the Fibonacci $[0,\infty]$-valued settling has rank 2 (matching Fibonacci's bilattice-case $H^1 = \mathbb{Z}^2$) but with $[0, \infty]$-valued generators encoding the *weight* acquired at each NSC firing.

2. **Q-enriched void cohomology.** Per [value-agnostic void-cone theorem](../theorems/value-agnostic-void-cone.md), the void cone is the cells at $\mathbf{0}_\mathcal{V} = \infty$. For Fibonacci's continuum-valued lift, $V_\infty = \emptyset$ (the substitution eventually places content at every position) — same as the bilattice case. So the cohomologically-non-trivial side is the apex.

3. **What the continuous-valued $H^1$ classifies.** Bilattice $H^1 = \mathbb{Z}^2$ classifies "which of the two letter types each NSC firing acquired." Continuous-valued $H^1$ should classify *which weight value each firing acquired*. This is a continuum-valued refinement: settlings with the same firing skeleton but different per-firing weights have different cohomology.

4. **The growth-rate / Pisot connection.** The [Pisot accumulation $=$ image-length theorem](../theorems/pisot-accumulation-image-length-connection.md) ties Fibonacci's Perron eigenvalue to its bilattice cohomology. Does the continuous-valued lift have a corresponding *weighted Perron* connection? Conjecture: the per-letter weights modify the eigenvalue computation in a clean way.

## Why it matters for predication categories

The corpus's signature theorems sit in the aperiodic regime — that's where cohomological structure is non-trivial. Continuous-valued aperiodic settles whether the framework's *full* aperiodic-cohomological apparatus extends to continuous values, or whether the bilattice case is special.

If the framework extends cleanly: **continuous-valued aperiodic settlings inherit all the aperiodic-regime structural theorems** (cohomology, Klein-four orbits, MLD-classification, no-tunneling), with $\mathcal{V}$-coefficient refinements throughout. Major win for the framework's reach.

If the extension fails at some specific point: **identifies what's bilattice-specific** in the aperiodic theorems, sharpening the framework's structural commitments.

## What a benchmark would establish

Computing $H^1$ of $[0,\infty]$-Fibonacci is concrete:
- Define cell space, weights, closure.
- Iterate to ordinal stage.
- Compute cohomology directly via the direct-limit formula.

If the result matches the conjecture (rank 2 with $[0, \infty]$-coefficients), the corresponding theorem can be stated and proved. This would close one of the most natural Phase-2-extension questions.

## Connection to existing structure

- [Continuous-valued settling object](../objects/continuous-valued-settling.md): defines the $\mathcal{V}$-enriched setting.
- [Continuous-state regime classification](../theorems/continuous-state-regime-classification.md): places continuum-Fibonacci in aperiodic-V regime.
- [Q-enriched cohomology object](../objects/q-enriched-cohomology.md): provides the cohomology framework.
- [Aperiodic-regime cohomology via direct limit](../theorems/aperiodic-regime-cohomology-via-direct-limit.md): the bilattice-aperiodic theorem this would generalize.
- [Pisot-accumulation = image-length theorem](../theorems/pisot-accumulation-image-length-connection.md): the Perron-Frobenius parallel.

The construction is straightforward; what's missing is the computation and the resulting theorem statement.
