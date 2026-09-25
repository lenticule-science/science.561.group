---
name: stochastic-settlement
description: "A continuous-valued settlement where V is the stochastic semiring — values are probabilities, tensor is multiplication-and-convex-combination, meet is the probability-distribution meet. Canonical instance: Markov-chain transition settlement, with cells holding transition probabilities and settling reaching the stationary distribution."
kind: presheaf
symbol: "v_stoch"
valued-in: "stochastic semiring (values in [0, 1] with probability ops)"
canonical-instance: Markov-chain transition settlement
fixed-point: stationary distribution
specializes: continuous-valued-settlement
depends-on: [continuous-valued-settlement, settlement, closure-2-monad]
derives-from: docs/dev/scraps/stochastic-settling.md
---

# Stochastic settlement

A **stochastic settlement** is a continuous-valued settlement where the value category `V` is the **stochastic semiring** — values are probabilities or stochastic-matrix entries, tensor is multiplication-and-convex-combination, meet is the standard probability-distribution meet (often pointwise-max or convex-hull-meet depending on convention).

## Canonical instance: Markov-chain transition settlement

Cells `(s, o)` hold **transition probabilities**; the closure step is one Markov-chain advance; the settlement is the **stationary distribution**.

## Definition

Fix a finite or countable state space `S` and a transition kernel `P: S × S → [0, 1]` with `∑_o P(s, o) = 1` for each `s`.

The **stochastic settlement on `(S, P)`** is the `[0, 1]`-valued presheaf where:

- Cells `(s, o)` hold transition probabilities `v(p)(s, o) ∈ [0, 1]`.
- Initial state: `v_0(p)(s, o) = δ_{s = o}` (identity distribution — each state stays at itself with probability 1 at step 0).
- Closure step: `v_{τ+1}(p)(s, o) = ∑_{r ∈ S} v_τ(p)(s, r) · P(r, o)` — apply one Markov transition.
- Settling: the orbit converges (under typical ergodicity conditions) to the stationary distribution `π(o)` independent of starting state `s`.

## Why "settling" matches the substrate's structure

The Markov-chain orbit is genuinely a settling orbit in the substrate sense:

- **Monotonicity-analog**: probabilities don't strictly grow, but the orbit's information about the long-term distribution accumulates monotonically in a suitable enriched-order on `[0, 1]`-valued cells.
- **Quiescence**: the orbit reaches a stationary distribution — a fixed point of the transition operator. This is the settlement.
- **Closure-driven**: the closure operator is the one-step Markov transition; the increment-sequence carries new evidence about transitions.

The substrate's machinery for settling applies wholesale to stochastic settlements — same closure-2-monad apparatus, same regime stratification, same moduli theory.

## Regime placement

For finite Markov chains, the stationary distribution is reached at countable ordinal (typically `ω` for ergodic chains, with non-trivial limit-step behavior). So stochastic settlements typically live in the **Scott-continuous regime** (`κ = ω`) — the same regime as classical posit-settlements.

For non-ergodic chains (multiple absorbing states), the orbit may not reach a single stationary distribution; the closure-ordinal may extend or be undefined.

## Comparison with bilattice case

| Aspect | Bilattice settlement | Stochastic settlement |
|---|---|---|
| Value algebra | `FOUR` (or `L^⋈`) | stochastic semiring `[0, 1]` |
| Cell content | evidence pairs `⟨a_+, a_-⟩` | transition probabilities |
| Closure | derivable consequences | Markov transitions |
| Settlement | quiesced cell values | stationary distribution |
| Application | epistemic predication | probabilistic dynamics |

Both are substrate-internal settlements; both use the same closure-2-monad apparatus; differ only in the value category.

## Position

`finite-settlement-algebra/hacking/library/stochastic-settlement/`. Settling tier — specialization of continuous-valued-settlement to stochastic-semiring values.

## Derivation source

Adapted from `predication-categories/objects/stochastic-settling.md`, preserved at `docs/dev/scraps/`. Renamed per the four-object grammar.
