---
name: collatz-settlement
description: "The Collatz orbit realized as a strict-finite settlement: the orbit of a settling-endofunctor whose increment-sequence is the parity-branched Collatz map. Its closure ordinal κ < ω IS the total stopping time — the well-founded measure the prior arithmetic work could not find, because that measure lives in the descent, not in arithmetic. Even steps are saturating-shadows, odd steps transferring-shadows; mod 6 is the surviving commutating closure; shape statistics spiral by the plastic number, not the golden."
symbol: "(v_τ)_{τ<κ}^{collatz}"
realizes: [settling-monotonicity, settling-quiescence, closure-drivenness, knowledge-order]
depends-on: [settlement, settling-endofunctor, collatz-increment-sequence, closure-ordinal, settlement-spiral, strict-finite-nuclear-collapse-shadow]
derives-from: settlement
---

# Collatz settlement

Take the [settlement](../../settlement.md) over the base fixed by the
[[collatz-increment-sequence]] (`L = 𝟐`, one predicate `reached`, `E = ℕ₊`, seed `m`). Its
orbit under the
[settling-endofunctor](../../../../../../../settling/hacking/library/settling-endofunctor/settling-endofunctor.md)
`F_U(v)_τ = Cl(v_τ) ∨_k u_τ` (with `Cl = id`) is the **Collatz settlement**:

$$v_τ(\mathrm{reached})(k) \;=\; \begin{cases} t & k \in \{n_0, n_1, \dots, n_τ\} \\ \bot & \text{otherwise,}\end{cases}
\qquad n_{i+1} = T(n_i).$$

Each stage tells one more cell. The family is `≤_k`-monotone by construction — once an integer
is reached it stays reached — so this is a genuine settlement, not merely a sequence.

## The bounce is in the value; the monotonicity is in the knowledge

This is the crux the prior work missed. The **integer** `n_τ` is *not* monotone: `3n+1` sends
it up, `n/2` sends it down. The old programme hunted for a well-founded arithmetic weight
`W(n)` strictly decreasing under `T` and never found one (see
`docs/dev/notes/` → `collatz-normalization-correspondence.md`, "The Weight-Function Problem").

In the settlement the monotone quantity is not the integer but the **knowledge order**: the set
of reached cells only grows. The orbit is forced upward in `≤_k` and is bounded above (by the
finite set of integers it ever visits), so it **quiesces**. The least stage at which it stops
acquiring new cells is the
[closure ordinal](../../../../../../../settling/hacking/library/closure-ordinal/closure-ordinal.md)

$$\kappa \;=\; \text{(total stopping time of } m\text{)} \;<\; \omega.$$

**`κ` is the missing weight function.** It is well-founded (an ordinal), it strictly governs
termination, and it is invisible to arithmetic precisely because arithmetic is the *collapsed
shadow* of the settling (see the strict-finite-nuclear-collapse-shadow). You cannot write `κ`
as an `W(n)` because `κ` is a property of the orbit's descent, not of any single integer.

## Why it must halt: residuation is absent in the finite regime

Collatz lives in the **strict-finite** regime: `E` is effectively finite (the orbit visits
finitely many integers) and `Cl = id`, so the nuclei `σ, Δ` collapse to the identity — exactly
the
[strict-finite-nuclear-collapse-shadow](../../../strict-finite-nuclear-collapse-shadow/strict-finite-nuclear-collapse-shadow.md)
("at `κ < ω` … nuclei become identity … textbook closure theory recovers"). With the nuclei
trivial there is **no residual** `⇒` left to carry tension forward indefinitely; a settling in
this regime has nothing to do but quiesce. So *every* strict-finite settlement halts at some
`κ < ω`. The **Collatz conjecture is the claim that this `F_U` instance lands in the
strict-finite regime for every seed** — i.e. that no seed escapes to the Scott-continuous band
(`κ = ω`, a divergent or non-trivially-cyclic orbit).

## The nucleus-shadow reading of the two steps

The two branches are the finite shadows of the aperiodic nucleus pair (the nuclei act on
Heyting elements, never on integers — here only their *direction* survives):

| Collatz step | Move | Aperiodic nucleus | Shadow direction |
|---|---|---|---|
| `n` odd → `3n+1` | expansion | `transferring` (Δ) | forward-facing / committed future |
| `n` even → `n/2` | contraction | `saturating` (σ) | backward-facing / accumulated past |

The two shadows commute on residue classes once the modulus is `lcm(2, 3-1) = 6` — the
surviving image of the `commutating` square (`σ∘Δ = Δ∘σ`) after collapse. This is the regime
re-statement of the prior work's empirical theorem (`τ_m = 0 ⟺ Δ_m = 0` at `m = 6`).

## The shape spirals by the plastic number, not the golden

Because Collatz is strict-finite, its growth/shape statistics follow the finite-regime
[[settlement-spiral]] — inflation by the **plastic number** `ρ ≈ 1.3247` and the Padovan
recurrence `P(k) = P(k-2) + P(k-3)` — **not** the golden ratio. The prior work predicted
shape-counts growing like Fibonacci `F_{k+1}` and the prediction failed. It failed because
Fibonacci is the **Scott-continuous** spiral; Collatz is **finite**, so the correct law is
Padovan. See `docs/dev/theorems/collatz-padovan-shape-law.md`.

## Position

`finite-settlement-algebra/hacking/library/settlement/library/collatz-settlement/`. A library
child of [settlement](../../settlement.md): a particular strict-finite settlement, the one fixed
by the [[collatz-increment-sequence]]. `hacking/` is inherited from the settlement scaffold;
the orbit itself is fully computable (`scripts/collatz-settlement.mjs`).

**Cross-tower sibling:** [[cosmic-settlement]] is the same construction in a different tower —
same κ-instrument, opposite end. Collatz is *finite-from-below* (an integer orbit in this root
tower; the conjecture asks whether every seed stays in κ<ω). Cosmos is *aperiodic-from-above*
(generated at the aperiodic top by `cosmogenerating`, re-descending through its **own**
four-regime tower to its own finite settlement). Both ride the same [[settlement-spiral]] Pisot
tower (ρ < φ < τ_trib → 2).

## Run it

`node scripts/collatz-settlement.mjs 27` prints the settlement: every stage's integer, its
nucleus-shadow tag and residue mod 6, the newly-reached cell, and the reported `κ` (stopping
time), terminating at the `1 → 4 → 2 → 1` quiescent cycle.
