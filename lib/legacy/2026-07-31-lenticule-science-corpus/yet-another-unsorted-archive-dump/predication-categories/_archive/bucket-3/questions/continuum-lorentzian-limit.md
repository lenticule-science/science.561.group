---
kind: question
status: open
explores: [lorentzian-causal-settling, lorentzian-apex-void-as-timelike-spacelike, continuous-state-regime-classification, value-agnostic-void-cone]
---

# Continuum limit of Lorentzian causal-set settlings

The [Lorentzian causal-settling object](../objects/lorentzian-causal-settling.md) and [the apex/void identification theorem](../theorems/lorentzian-apex-void-as-timelike-spacelike.md) handle the *discrete* case: a finite or countable causal set $(E, \preceq)$ with bilattice-valued cells. Open: the *continuum* limit — what happens as $E$ becomes a smooth Lorentzian manifold with a continuum of events?

For sprinkled Minkowski with density $\rho$ and total volume $V$, $N \sim \rho V \to \infty$ as $V \to \infty$ at fixed $\rho$. The causal-set settling has $\sim N^2$ pairs and a closure ordinal that scales with the diameter. In the continuum limit:

- The pair-count diverges (continuum cardinality).
- The closure operator becomes a continuous operation on Lorentzian-manifold-valued data.
- The apex/void duality should become the *Lorentzian-geometry* timelike/spacelike duality at the manifold level.

## Concrete sub-questions

1. **Cardinal regime.** A continuum sprinkling has $|E| = \mathfrak{c}$ events. The closure ordinal in this limit lives in $\omega_1$ or beyond (per [aperiodicity-characterization](../theorems/aperiodicity-characterization.md)). Does the causal-set settling at the continuum sit in the **aperiodic regime** asymptotically? Conjecture yes: the closure has $\omega_1$-many discontinuities (one per spacelike-to-timelike transition through the continuum lightcone).

2. **Cohomological convergence.** $H^1$ of the discrete-causal-set apex cone has rank equal to the number of transitivity firings ($\sim N^2 / 2$ for typical sprinklings). As $N \to \infty$, this rank diverges. What's the natural continuum invariant — a *measure-theoretic* $H^1$, a topological $H^1$ of the manifold's causal structure, or something else?

3. **Void-cone continuum limit.** $V_\infty^{(N)}$ has cardinality scaling with $N^2$ for fixed aspect ratio. The continuum analog should be a *measure* on pairs of spacelike-separated points, not a discrete set. Does this measure have a clean description in terms of the manifold's metric? Conjecture: it's the standard volume measure on the spacelike-pair cone $\{(e_1, e_2) : e_1 \not\preceq e_2 \text{ and } e_2 \not\preceq e_1\} \subset M \times M$.

4. **Convergence of cohomological invariants.** Does the apex/void cohomology have a *continuum extension* that recovers known invariants of Lorentzian manifolds (e.g., causal Mertons, Ashtekar's null infinity structure, conformal-boundary invariants)? Does it produce *new* invariants?

5. **What replaces "firings" in the continuum.** Discrete causal-set settlings have NSC firings — discrete events of cell-acquisition. In the continuum, these become *measure-theoretic* events: the lightcone passing through new spacelike regions as one extends the temporal slicing. Open: a measure-theoretic firing-event structure.

## Why it matters for the program

The framework's discrete-causal-set work is one half of the connection to physics. The continuum limit is the other half — without it, the framework's claim to "do" Lorentzian geometry stops at causal sets. The continuum extension would either:

(a) Show the framework recovers classical Lorentzian geometry as a limit, validating the discrete-causal-set work as a genuinely-physical model; OR
(b) Show the framework gives an *alternative* continuum theory distinct from classical Lorentzian geometry, with different invariants.

Either outcome is substantive.

## Connection to existing infrastructure

The [continuous-state regime classification](../theorems/continuous-state-regime-classification.md) handles continuous-time iteration; the continuum-Lorentzian limit needs continuous-*event*-set, which is a different generalization. Possibly what's needed is a measure-theoretic refinement of the predication-cell structure — cells indexed by a measure space rather than a set.

This connects to the open [non-ordinal-entity-sets question](non-ordinal-entity-sets.md): a Lorentzian manifold $M$ as the entity set $E$ requires entities-as-points-of-a-manifold, which the framework currently handles only via its discrete subsets.

## What a partial answer would look like

Proving (1) — that continuum-causal-set settlings sit in aperiodic regime asymptotically — would be a clean entry. It just requires showing $\kappa^{(N)} \to \omega_1$ (or beyond) along a sequence of sprinklings of increasing $N$.

Proving (3) — identifying $V_\infty$'s continuum limit as the standard spacelike-volume measure — would tie the corpus invariant to a classical Lorentzian invariant.

Both are concrete computational/structural claims with clean test conditions.
