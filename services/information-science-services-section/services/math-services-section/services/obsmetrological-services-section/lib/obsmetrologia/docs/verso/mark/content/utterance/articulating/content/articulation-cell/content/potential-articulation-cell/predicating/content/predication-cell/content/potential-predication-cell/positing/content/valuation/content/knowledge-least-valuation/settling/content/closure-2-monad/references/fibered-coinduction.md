---
kind: theorem
status: proved
depends-on: [predication-fibration]
---

# Fibered coinduction

**Theorem ([@hermida-jacobs1998].** For a fibration $p : \mathcal{E} \to \mathcal{B}$ and an endofunctor $T$ on $\mathcal{B}$, the *coinduction principle* for terminal $T$-coalgebras is admissible whenever $p$ admits *quotient types*.
Dually, the *induction principle* for initial $T$-algebras is admissible whenever $p$ admits *comprehension*.

## Proof

[@hermida-jacobs1998], *Structural induction and coinduction in a fibrational setting*, main theorems. $\square$

## Form

Coinduction-via-fibration takes the standard categorical-coinduction recipe — terminal coalgebras characterized by universal property, bisimulation-up-to as a coinduction proof technique — and lifts it to a fibration of *predicates* over a fibration of *carriers*.
A property $P$ on a coalgebra $X$ is closed under the coalgebra structure iff a certain reindexing-and-quotient diagram commutes; when this commutes, $P$ holds of every state of the terminal coalgebra reachable from the initial state.

## Why it appears here

The [aperiodic-regime classification](four-regime-dichotomy.md) — distinguishing [aperiodic settlings](../concepts/aperiodic-settling.md) up to MLD-equivalence — uses fibered coinduction in its proof: settlings are coalgebras for the [settling endofunctor](../morphisms/settling-endofunctor.md), MLD-equivalence is the coinductive equivalence, and the cohomological classifying invariant is the witness produced by the coinduction.
The Bonchi–Petrişan–[@bonchi-et-al2014] *coinduction-up-to* refinement handles the closure-modulo aspect of the settling structure cleanly.
