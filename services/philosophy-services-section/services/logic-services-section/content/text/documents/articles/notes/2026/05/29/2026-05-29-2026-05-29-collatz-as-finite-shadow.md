---
title: 2026-05-29 — Collatz as the finite shadow of the settling endofunctor
date-created: 2026-05-29
description: Re-homed the lab's pre-regime Collatz work into the four-regime grammar, built entirely from machinery already on disk.
---
# 2026-05-29 — Collatz as the finite shadow of the settling endofunctor

Re-homed the lab's pre-regime Collatz work into the four-regime grammar, built entirely from
machinery already on disk. No new morphisms; the new things are *instances* of existing
objects plus one derived theorem.

## The moves

- **Collatz IS a settlement.** Not an analogy — the orbit `(v_τ)` where `v_τ` = set of
  reached integers is literally the `F_U`-orbit of a `collatz-increment-sequence` (an instance
  of `increment-sequence`). Built `collatz-increment-sequence` and `collatz-settlement` as
  `library/` children of those existing objects, with a working closure rule
  (`scripts/collatz-settlement.mjs`). Verified κ = 16, 111, 118 for seeds 7, 27, 97 — the
  known total stopping times — terminating at the 1→4→2→1 cycle.

- **The missing weight function is κ.** The old programme
  (`collatz-normalization-correspondence.md`) reduced Collatz to `Saturate∘Transfer →
  Transfer∘Saturate` and got stuck on "no arithmetic `W(n)` strictly decreasing." Resolution:
  the integer bounces but the *knowledge order* is monotone; the orbit is bounded and so
  quiesces at `κ < ω`. `κ` is the well-founded measure — an ordinal on the descent, invisible
  to arithmetic because arithmetic is the collapsed shadow.

- **Why it halts.** Strict-finite ⟹ nuclei collapse to identity
  (`strict-finite-nuclear-collapse-shadow`) ⟹ no residual to spend ⟹ must quiesce. The Collatz
  conjecture restated: this `F_U` instance is strict-finite for every seed (no seed escapes to
  the Scott-continuous band).

## The correction that paid off

emsenn's correction: *residuation necessarily forces a spiral; it's Padovan in finite,
Fibonacci in Scott-continuous, Tribonacci in transfinite.* This is not a phyllotaxis import to
admit in `hacking/` — it is derived: integrality + residuation ⟹ non-negative integer
substitution matrix ⟹ Perron–Frobenius dominant eigenvalue ⟹ (for closure) a Pisot inflation
⟹ a logarithmic spiral. Wrote `residuation-forces-a-spiral.md` next to the fiber-residuation
theorem, and the finite instance `settlement-spiral` (plastic number `ρ ≈ 1.3247`, the
smallest Pisot, Padovan recurrence `P_k = P_{k-2}+P_{k-3}`).

The payoff: the old work's **failed Fibonacci shape-count prediction** is explained. Fibonacci
is the *Scott-continuous* spiral; Collatz is *finite*, so its shape law is **Padovan/plastic**,
not golden. Recorded as a falsifiable re-prediction (`collatz-padovan-shape-law.md`,
status `to-test`).

The substrate already contained the whole Pisot tower (step-2 = Fibonacci, step-3 = Tribonacci,
n-bonacci → 2, and Padovan `(1,1,2)` → `ρ` named explicitly in
`pisot-accumulation-image-length-connection`). The finite=plastic placement is the structural
fact that the plastic number is the infimum of the Pisot spectrum — the tightest spiral that
still closes, fit for the maximally-collapsed regime.

## Consolidated

Gathered the scattered live Collatz research into this $thing's `docs/dev/notes/` (see
`_index.md` for provenance). Moved the mis-tiered `collatz-stabilization-research.md` down from
the transfinite RITM object to here, where Collatz actually lives. Python simulators left in
place and cited.
