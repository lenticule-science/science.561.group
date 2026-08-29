---
type: theorem
status: gestured
depends-on: [collatz-settlement, settlement, closure-ordinal, strict-finite-nuclear-collapse-shadow, settling-endofunctor]
---

# Collatz halts because the finite regime has no residual to spend

This records the regime-theoretic content of "Collatz terminates," and pins down what the
prior arithmetic programme was missing.

## The weight-function gap (what the old work hit)

`collatz-normalization-correspondence.md` (now in this $thing's `docs/dev/notes/`) reduced
Collatz to the language reduction `Saturate∘Transfer → Transfer∘Saturate` and identified the
obstruction precisely: the fiber-language normalization has a lexicographic pair `(fmlW, ent)`
that is **well-founded and strictly decreasing**, but *"Collatz has no known arithmetic
analog"* — no `W: ℕ → ℕ` that strictly decreases under `T`. The whole difficulty of the
conjecture is the search for that measure.

## The resolution: the measure is the closure ordinal, not an arithmetic weight

Realize the orbit as the [[collatz-settlement]] `(v_τ)`, where `v_τ` is the set of reached
integers. Then:

1. **The orbit is `≤_k`-monotone.** Reached cells are never un-reached; `v_σ ≤_k v_τ` for
   `σ ≤ τ`. (This is `settling-monotonicity`, inherited from `settlement`.) The *integer*
   `n_τ` is not monotone — but the *settlement value* is.
2. **The orbit is bounded above** by the (finite, for any halting seed) set of integers it
   ever visits.
3. A `≤_k`-monotone, bounded orbit in a finite Boolean fiber **quiesces** at a least stage
   `κ`. That `κ` is the [closure ordinal](../../../../../../../../settling/hacking/library/closure-ordinal/closure-ordinal.md),
   and `κ < ω`.

So a well-founded, strictly-governing measure **does** exist: it is `κ`, the total stopping
time, living as an ordinal on the settling orbit. It is not expressible as an arithmetic
`W(n)` because it is a property of the *descent of the orbit*, not of any single integer —
and arithmetic is the **collapsed shadow** of that descent (see `shadow-as-collapse`). The
prior programme could not find `W` because it was searching the shadow for a structure that
only exists upstairs.

## Why every strict-finite settling must quiesce

The deeper "why" is residuation. In the non-finite regimes the predication fiber carries a
genuine residual `⇒` (fusion `⊙` with its adjoint), and a settling can keep discharging
residual tension forward without ever closing — that is what an unbounded (Scott-continuous or
higher) orbit *is*. But Collatz lands in the **strict-finite** regime, where — per the
[strict-finite-nuclear-collapse-shadow](../../../../strict-finite-nuclear-collapse-shadow/strict-finite-nuclear-collapse-shadow.md)
— the nuclei collapse to the identity and the fiber degenerates to a plain Boolean algebra:
**there is no residual left to spend.** A settling with no residual has nothing to carry
forward indefinitely; it can only accumulate finitely and stop.

Therefore:

> **Claim.** Every settling in the strict-finite regime quiesces at some `κ < ω`.
> The **Collatz conjecture** is the statement that the `collatz-increment-sequence` `F_U`
> instance is strict-finite for *every* seed — i.e. no seed's orbit escapes to the
> Scott-continuous band (`κ = ω`: a divergent orbit, or a non-trivial cycle that keeps
> acquiring cells).

This re-frames the open problem cleanly: Collatz is not "find a decreasing `W`" but "prove no
seed lifts the orbit out of the finite regime." The empirical evidence (every tested seed
halts) is evidence of strict-finiteness; a counterexample would be a seed whose settling is
genuinely Scott-continuous.

## mod 6 = the surviving commutating closure

The even/odd branches are the saturating-/transferring-shadows. Their commutator
`σ∘Δ = Δ∘σ` (the [commutating] square) survives the collapse only as a congruence on residue
classes, and closes at modulus `lcm(2, 3-1) = 6` — recovering the prior work's empirical
theorem `τ_m = 0 ⟺ Δ_m = 0` at `m = 6`. The residue mod 6 carried by each settlement stage is
exactly this shadow.

## Status

`gestured`. The monotone-bounded-quiesces argument is rigorous for the Boolean fiber; the
"strict-finite ⟺ residual absent ⟺ must halt" equivalence is asserted from the
strict-finite-nuclear-collapse-shadow and is the load-bearing open step. Honest `hacking/`
placement: the reduction of the conjecture to a regime-membership statement is a reframing,
not a proof of termination.
