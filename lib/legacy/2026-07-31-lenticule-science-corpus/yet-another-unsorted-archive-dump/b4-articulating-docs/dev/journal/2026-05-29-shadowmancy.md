# 2026-05-29 — Shadowmancy: one settling harness, four traditional-math shadows

Turned the settling tier into a runnable, pluggable mini-package and used it to derive
traditional math as finite-regime shadows. The cream of the theory, extracted into one machine;
the legacy Collatz simulators dissolved into it.

## The machine

The prose morphisms became code, scoped by a `settling/package.json` (`#alias` imports,
spotcomp-style):

- `#settling-endofunctor` — generic `settle(increment,{bound,mod})`. State = the `≤_k`-monotone
  set of reached entity keys; the increment is a plugged-in endo-map; κ = stage of last new cell;
  regime from `#closure-ordinal`. **Value-agnostic** (BigInt integers, ℕ, Z/m).
- `#increment-sequence` — the plug-in interface (`fromEndoMap`, `parityBranched`).
- `#settlement-spiral` / `#substitution` — the Pisot inflation factor by power-iterating a
  substitution's incidence matrix.

A *family* is just an increment-generator. So **affines are literally a part of the harness**, and
Collatz is the affine point `(3,1,2)` (`#collatz` re-exports `#affine`).

## The four shadows (all plug-ins; tests named for the claim)

- **Successor → ℕ / Peano.** `successor(0)` settles to the number line: stages = ordinals,
  `v_τ = {0..τ}`, never closes (κ=ω, Scott-continuous). Arithmetic is the orbit; ℕ the shadow.
- **2-adic valuation = saturating depth.** `v₂(3n+1)` = run-length of consecutive saturating-shadow
  steps after an expansion. Verified on seeds 7/27/97. The number-theory function is the depth of a
  nucleus shadow.
- **Modular Z/m = finite residue-settlement.** A finite carrier forces closure at κ≤m (strict-finite);
  congruence classes = settled fiber. mod-6 Collatz is one instance.
- **Cross-regime Pisot tower.** The substitution inflation factors compute to ρ=1.3247 (Padovan/finite)
  < φ=1.6180 (Fibonacci/scott) < τ=1.8393 (Tribonacci/transfinite); and Collatz's empirical depth-shape
  growth tracks ρ, not φ. `residuation-forces-a-spiral`, executable.

## What this confirms

The four-regime grammar is not just a filing system — it *predicts numbers*. Plug a dynamics into the
one harness and the regime tells you: whether it halts (κ<ω vs ω), what its growth constant is (which
Pisot number), and where its arithmetic invariants come from (which nucleus shadow). The same machine
that halts Collatz at κ=111 grows ℕ forever at κ=ω and spirals the finite regime by the plastic number.

21 claim-tests green (`node --test test/*.test.mjs`). Legacy `ritm.mjs`/`collatz-stabilizer.mjs`/
`collatz-predictions.mjs`/`affine-commutation.mjs` retired; their cream lives in the harness,
`#shape-statistics`, and `#residue-commutation`.

## Open threads for the next puppeteer

- **Continued fractions** as the Scott-continuous renormalization orbit (`r↦1+1/r → φ`) — the natural
  next plug-in; would tie the golden row of the tower to a second, independent route.
- A clean estimator for the Collatz depth-growth rate (transfer-matrix eigenvalue of the realized
  shape automaton) to pin it to ρ with error bars.
- Goodstein / Ackermann as aperiodic-regime shadows (termination living at the colimit, not any finite
  level) — the hard, beautiful end of the menu.
