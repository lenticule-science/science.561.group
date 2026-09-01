---
type: concept
depends-on: [knowledge, settling-monotonicity]
see-also: [knowledge-order, settling-bound, closure-drivenness, adjudication, evidence]
---

# Temporal accumulation

The role borne by *the way information arrives over time* — one of the three pressures on [adjudication](adjudication.md) — independent of which way it points and independent of where it comes from.
Temporal accumulation is the structural requirement that the framework's state at each moment depends only on the *set* of information received so far, growing as more arrives and never shrinking.

A framework realizes temporal accumulation when it has (i) an indexing on which "moments" are arranged, (ii) a state at each moment carrying the cumulative effect of evidence received up to and including that moment, and (iii) a guarantee that as the index advances the state moves only in the [knowledge](knowledge.md)-increasing direction.
Three pressures distinguish the role:

- **Order-of-arrival irrelevance.** The state at a moment must depend on the *set* of evidence received so far, not on the order in which it arrived nor on duplications along the way.
  Concretely: the operation that incorporates new evidence is associative, commutative, and idempotent — a join-semilattice operation in $\leq_k$.
- **Monotonicity along the index.** As the index advances, the state moves upward in $\leq_k$ and never downward.
  Concretely: a state at a later index dominates the state at an earlier index in the cellwise [knowledge order](knowledge-order.md).
- **Reachability without coordination.** A second observer accumulating the *same* evidence in a *different* order must reach an equivalent state at the corresponding moment.
  Temporal accumulation is the role that makes "what has been settled by now" a well-defined notion across observers, not a witness-dependent one.

A framework that realizes temporal accumulation without [knowledge](knowledge.md) collapses to a stateless re-evaluation; one that realizes knowledge without temporal accumulation has nowhere for new evidence to be incorporated.
The role is therefore the *dynamic extension* of knowledge: knowledge says how informativeness is measured, temporal accumulation says how it grows.

## The settling realization

In the predication-categories program, temporal accumulation is realized by a [predication settling](../objects/predication-settling.md) — a family $(v_\tau)_{\tau < \lambda}$ of [predication valuations](../objects/predication-valuation.md) indexed by a [settling bound](../objects/settling-bound.md) $\lambda$, satisfying the cellwise inequality $v_\sigma \leq_k v_\tau$ for $\sigma \leq \tau$.
The settling bound supplies the indexing, the family supplies the moment-indexed states, and [settling monotonicity](settling-monotonicity.md) supplies the upward-movement constraint.
The set-of-evidence-not-sequence pressure is realized in two stages: at each step, evidence enters as an element of the [increment sequence](../objects/increment-sequence.md) and is joined into the prior state via $\vee_k$ before the closure fires; the join's algebra (associative, commutative, idempotent) makes within-step order irrelevant, and [closure-drivenness](closure-drivenness.md) makes the across-step trajectory determined by the *cumulative* set of increments rather than their interleaving.

## Realizations of the three sub-pressures

The three pressures of the role are realized as separate properties of the settling — each verifiable independently, each expressible as a constraint on the trajectory:

- **Order-irrelevance** is realized by the [settling merge semilattice](../theorems/settling-merge-semilattice.md): the cellwise $\vee_k$ operation on settlings is associative, commutative, and idempotent, so duplicate or reordered evidence produces the same merged state.
- **Monotonicity along the index** is realized by [settling monotonicity](settling-monotonicity.md) directly.
- **Cross-observer reachability** is realized by [CRDT convergence](../theorems/crdt-convergence.md): independently-evolving replicas of a settling, when merged via $\vee_k$, converge to a common limit state without coordination — the same role made operational across a *spatial* index of observers in addition to the *temporal* index of moments.

The decomposition is the structural payoff of treating temporal accumulation as a role: each of the three sub-pressures lives in a distinct theorem, and each theorem can be checked or extended without entangling the others.

## Under quiescence and continuity

When the settling reaches a fixed point — the [settling quiescence](settling-quiescence.md) condition — temporal accumulation has *exhausted* the available evidence: further moments of the index produce no further movement in $\leq_k$.
When the settling is [continuous](settling-continuity.md), the state at a limit ordinal is the $\leq_k$-supremum of the states preceding it, so accumulation across transfinite stretches of the index behaves the same way as accumulation across finite stretches.
Together, these two refinements partition realizations of the role into the four [regimes](../theorems/four-regime-dichotomy.md) — strict, Scott-continuous, transfinite-bounded, aperiodic — and the regime determines what kind of cohomological invariant the temporal accumulation generates.

## Distinguished from real time

The role does *not* require the index to be a real or physical time.
It can be wall-clock time in a distributed system, a derivation depth in an inference engine, a stage in an iterative algorithm, an ordinal in a transfinite construction, or the position of an observer in a Kripke frame.
What temporal accumulation requires is *an order on moments and a way to incorporate new evidence at each moment*; the metaphysics of the order is left open.
This is what allows the same role to be realized by ordinary settlings (where the index is an ordinal), distributed settlings (where the index is a network position), and agential settling paths (where the index is the agent's own internal time) — three structurally distinct realizations all carrying the same accumulation role.
