---
type: question
class: bridge
status: open
explores: [continuous-valued-settling, stochastic-settling, closure-2-monad, value-agnostic-void-cone]
---

# Amplitude-valued (quantum) settlings

[Continuous-valued settling](../../continuous-valued-settling/continuous-valued-settling.md) covers Lawvere quantale, fuzzy, real-valued, and stochastic value categories — all *ordered* with a closure-monotonic structure. **Quantum amplitudes are different**: they're complex numbers with no natural total order, and the analog of "closure" is a *quantum channel* (completely-positive trace-preserving map), which doesn't sit cleanly in the closure-2-monad framework.

Open: build the framework for quantum-mechanical settings, or determine that genuinely-new infrastructure is required.

## The structural mismatch

The corpus's framework relies on:
- A closure-monotonic order $\leq_T$ on the value category.
- A closure operator $T_\mathcal{V}$ that's $\leq_T$-monotone-and-inflationary.
- The closure 2-monad's lax-idempotence built on this order.

Quantum amplitudes:
- $\mathbb{C}$-valued or operator-valued; no natural total order on amplitudes.
- Quantum channels are CP-maps; the natural order is the *PSD partial order on density matrices*, not a total order on individual amplitudes.
- "Closure" in quantum terms is *iterating a channel toward its fixed-point density matrix* — analogous to Markov-chain closure, but the convergence behavior is genuinely different (quantum interference, decoherence, recurrence).

## Three possible relationships to the framework

**Possibility A (subsumption).** The PSD order on density matrices makes quantum settling a special case of the corpus framework, with $\mathcal{V} = $ density-matrix-space and $\leq_T = $ PSD partial order. Closure operator = channel application. Settling = stationary state of the channel. *This requires the closure to be PSD-monotone, which is true for many channels but not all.*

**Possibility B (parallel theory).** Quantum amplitudes don't fit; a parallel quantum-flavored framework is needed, with its own analog of closure, regimes, cohomology. The two frameworks share structural shape but require independent development.

**Possibility C (limit case).** Classical and quantum frameworks share a more general "non-commutative settling" abstraction, with classical (real-valued, ordered) and quantum (operator-valued, PSD-ordered) as instances. This requires identifying the abstraction.

## Concrete sub-questions

1. **Does the closure 2-monad survive on density-matrix-valued settlings?** The PSD order is a partial order, not a total order. The lax-idempotence axioms need re-checking with partial orders. Conjecture: closure 2-monads survive on PSD-ordered value categories with appropriate adjustments.

2. **Quantum stationary states as settlings.** A unital CP-map has a fixed-point density matrix (the maximally-mixed state, in many cases). Is this the *settling* of the corresponding closure? If so, the [stochastic-stationary-as-settling theorem](../../continuous-valued-settling/content/stochastic-settling/references/stochastic-stationary-as-settling.md) generalizes.

3. **Decoherence as cohomological invariant.** Classical channels (decoherence-free) reach a unique stationary state geometrically; quantum channels with decoherence reach a *mixed* stationary state with rate determined by the dissipator's spectral gap. Does predication categories' spectral-gap question (see [spectral-gap-asymptotic-c-refinement](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/spectral-gap-asymptotic-c-refinement.md)) extend to quantum decoherence rates?

4. **Quantum void cone.** Per [value-agnostic void-cone theorem](../theorems/value-agnostic-void-cone.md), the void cone is the descending family of cells at the closure-trivial element. For quantum settlings: the closure-trivial state would be the *zero density matrix* (no probability, "empty state"). Quantum void cone = states where the channel can never deposit probability. Open whether this reproduces a known quantum-information invariant (kernel of the channel? quantum dynamical semigroup's null space?).

## Why it matters for predication categories

Quantum-mechanical applications are a natural test of the framework's reach. Concretely:
- **Quantum agents**: Bayesian-quantum agents whose belief states are density matrices.
- **Quantum gravity**: causal-set sprinklings with amplitude-valued connections (quantum causal sets).
- **Quantum computing**: settling formalism applied to quantum-circuit-flavored computation.

If the framework subsumes quantum (Possibility A), each of these applications becomes immediate. If parallel (Possibility B), quantum work is a separate program. The path forward depends on which.

## What a partial answer looks like

The smallest concrete entry: take a finite quantum channel on a 2- or 3-dimensional Hilbert space (e.g., qubit dephasing), apply predication categories' settling formalism with PSD-valued cells, see what closure produces. If the stationary density matrix shows up as a settling fixed point, Possibility A is supported. If structural anomalies appear (lax-idempotence fails, closure ordinal undefined, etc.), Possibility B becomes plausible.

## Connection to existing structure

- [Continuous-valued settling](../../continuous-valued-settling/continuous-valued-settling.md): the existing framework for non-bilattice values. Quantum would be the next generalization beyond ordered value categories.
- [Stochastic settling](../../continuous-valued-settling/content/stochastic-settling/stochastic-settling.md): classical analog; quantum is the non-commutative version.
- [Value-agnostic void-cone theorem](../theorems/value-agnostic-void-cone.md): provides the closure-trivial-element framework that needs extension to PSD or operator-valued cases.

This is structurally past-the-horizon: predication categories' existing theorems gesture at it but don't reach it. Concrete work would need either Hilbert-space-valued sheaf theory or PSD-ordered closure-2-monad infrastructure.
