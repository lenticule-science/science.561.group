---
title: Imagining the KCBS pentagon in RelMath
date-created: 2026-06-28
description: A dreaming note.
keywords:
  - FOUR
  - charge
  - cohomology
  - structure
  - witness
  - closure
---
# Imagining the KCBS pentagon in RelMath

_A dreaming note. Not a built module — a shape the contextuality spine is already reaching toward._

## What KCBS is

The Klyachko–Can–Binicioğlu–Shumovsky pentagon is the **minimal** quantum contextuality
witness: the smallest scenario where a single quantum state shows contextuality that no
classical value-assignment can match. Where Kochen–Specker and the Mermin–Peres magic square
are _state-independent_ (every assignment fails), and Hardy/PR are two-party _nonlocality_,
KCBS is the irreducible core — **one system, five measurements, a cycle**.

Five yes/no measurements `v₀ … v₄` sit on the vertices of a pentagon. Adjacent measurements
(the five edges `{vᵢ, vᵢ₊₁ mod 5}`) are **exclusive**: they cannot both answer "yes". The five
edges are the measurement contexts. A classical realist assigns each vertex a definite
`0/1` once and for all; exclusivity forbids two adjacent `1`s, so the assignment is an
**independent set** of the 5-cycle `C₅`. The largest independent set of `C₅` has size
`α(C₅) = 2` — so classically `Σᵢ ⟨vᵢ⟩ ≤ 2`. Quantum mechanics reaches `√5 ≈ 2.236` (the Lovász
ϑ-number of `C₅`); the gap `√5 > 2` is the contextuality.

## Why it fits the spine

The whole socket already exists (`Quantum.MeasurementScenario`, `Quantum.MagicSquare`):

- **Scenario** — `M = Fin 5` (the vertices), contexts `= [[0,1],[1,2],[2,3],[3,4],[4,0]]`
  (the five edges of `C₅`). This _is_ an exclusivity graph, and RelMath already speaks graphs
  and independent sets natively (`Order.SetNumberGraphTheory`, `Order.GraphColoring`).
- **The possibilistic skeleton** — a `Model (Fin 5) Bool` whose support per edge forbids
  `(1,1)` (the exclusivity). The classical bound `α(C₅) = 2` is then a finite graph fact: no
  global `0/1` assignment puts three pairwise-non-adjacent `1`s on a 5-cycle. That bound is a
  `decide`-able combinatorial theorem — buildable now, no analysis.
- **The number is where the reals live.** _RelMath has reals_ (`RelMath/Real/` — constructive
  Bishop ℝ, with `√` via `IVT`). So the KCBS **inequality** `Σ⟨vᵢ⟩ ≤ 2`, the quantum value
  `√5`, and the **contextual fraction** (the Abramsky–Barbosa weight of the model that _cannot_
  be explained noncontextually) are not blocked — they are the real-valued refinement layer on
  top of the possibilistic skeleton, exactly as the CHSH/Bell value sits over the PR box.
  `√5` is already inhabitable here.

## The two-layer build, when a campaign picks it up

1. **`Quantum/KCBS` (possibilistic).** The pentagon scenario, the exclusivity support, and the
   classical independence bound `α(C₅) = 2` as a finite theorem. Logical-contextuality form:
   a support whose pattern admits no global independent-set extension of a chosen seed. This is
   the `MagicSquare`-style finite witness, one ring smaller.
2. **`Quantum/KCBSValue` (real).** A weighting in `[0,1] ⊂ ℝ` (`Probability.RealStochasticInterval`)
   realizing `Σ = √5`, the KCBS inequality as a Bishop-real comparison, and the contextual
   fraction as the optimum of a finite linear program over the deterministic vertices — over
   the reals we have, not a deferred analytic layer.

## The conflation worth chasing

`C₅` is the odd cycle; its contextuality is its odd-girth obstruction. RelMath already reads
odd cycles cohomologically (`H¹ ≠ 0` for the non-bipartite, the chromatic/`K4` story in
`Persistence.Aperiodic.ChromaticLorentzian`). The dream: **the KCBS pentagon obstruction is the
same `H¹`-on-an-odd-cycle that the chromatic and aperiodic layers already carry** — contextuality,
graph colouring, and aperiodic seam as one odd-cycle coherence failure. That would make KCBS not
a new import but a _recurrence_ of an obstruction the spine already proves, which is the whole
method.

## Naming discipline

The exclusivity-graph independence number is a graph fact, **not** the Lovász ϑ-number (ϑ needs
the real/semidefinite layer); the possibilistic support is **not** the Born-rule empirical model;
`√5` as a value is real and reachable, but the _optimality_ of `√5` (that it is exactly ϑ(C₅))
is the SDP-duality frontier. The finite/graph tier is honest now; the ϑ-optimality is roadmap.

_Sibling built: `Quantum.MagicSquare` (state-independent), `Quantum.HardyModel` (logical),
`Quantum.MeasurementScenario` (PR / strong). Sibling dreamed: GHZ, Kochen–Specker,
Leggett–Garg (temporal) — see the lean ROADMAP "Weird-QM menu"._
