---
title: Collatz research — consolidated notes
description: The lab's prior Collatz work, gathered here (the collatz-settlement $thing is its regime-correct home).
---
# Collatz research — consolidated notes

The lab's prior Collatz work, gathered here (the `collatz-settlement` $thing is its
regime-correct home). All of it predates the four-regime grammar; the live findings are
re-expressed in regime language in `../../collatz-settlement.md` and the `docs/dev/theorems/`.

## Gathered documents (provenance → live finding)

| File here | Origin | Live finding |
|---|---|---|
| `collatz-stabilization-research.md` | **moved** from the transfinite RITM object `…/relational-infinity-topos-modality/library/collatz-stabilization-research/` (pointer stub left) | Comonad `C = □◇` stabilizes; mod-6 is the minimal commuting modulus (`m_min = lcm(2d, a-1)`); `□`↔even↔contraction, `◇`↔odd↔expansion. |
| `collatz-normalization-correspondence.md` | copy — `archive/old-archive/.../from-gsu-ccs-20260313/math/` | **Primary.** Collatz shortcut ≅ `Saturate∘Transfer → Transfer∘Saturate`; states the weight-function gap ("no known arithmetic analog"); v₂(3n+1)↔Transfer-count; **Fibonacci shape-count prediction failed.** |
| `looking-at-collatz-like-affines.md` | copy — `archive/emsenn/hacking/from-bare-cedar-fog/.../emsenn-babbles/` | Empirical theorem `τ_m = 0 ⟺ Δ_m = 0` at `m = 6`; box/diamond ↔ even/odd ↔ dissipation/injection. |
| `proof-of-the-collatz-dynamic.md` | copy — `archive/archive-from-bare-cedar-fog/.../proofs/` | Agda relational-ℕ halting via `relationalNatInductionViaInterpret`. |
| `collatz-corollary-analysis-module.md` | copy — `archive/archive-from-bare-cedar-fog/.../collapse dynamics/` | Trace predicates: hill-detector, divergence-classifier, loop-echo-detector, trace-shape-vector. |
| `collatz-corollary-modulation-function.md` | copy — `archive/archive-from-bare-cedar-fog/.../zeds/collapse dynamics/` | Modulation-function sketch for the corollary analysis. |
| `arithmetic-history-system.md` | copy — `…/from-gsu-ccs-20260313/math/` | Arithmetic as a history-system (fiber-algebra view of the integers). |
| `arithmetic-nuclear-computation.md` | copy — `…/from-gsu-ccs-20260313/math/` | Nuclear (σ/Δ) computation over the arithmetic fiber. |
| `arithmetic-quiescence.md` | copy — `…/from-gsu-ccs-20260313/math/` | Quiescence as the arithmetic settling endpoint — prefigures κ. |
| `local-settledness.md` | copy — `…/from-gsu-ccs-20260313/math/` | "Settle at every prime-power component ⟹ settle globally." |

Archive originals were **copied** (not deleted) — provenance preserved. The RITM document was
**moved** (it was our own hacking content, mis-tiered) with a pointer stub left behind.

## Cited in place (not moved)

The Python simulators — the empirical engine behind the findings above — remain at:

`…/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-active-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/simulating/library/relational-infinity-topos-modality-simulator/library/python-modal-dynamics-program/source/`

(`collatz-stabilizer-0.1.x.py`, `collatz-explorer`, `affine-explorer`, `predictions.py`, …).
The Padovan re-prediction in `../theorems/collatz-padovan-shape-law.md` is to be tested by
re-running `predictions.py`-style shape-count measurements against the plastic number `ρ`.
