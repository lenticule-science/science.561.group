---
title: Internal-real RMN downstream realization scan
date-created: 2026-06-26
description: "@emsenn/relating now has finite, executable models for the green internal-real/logarithm line in sites/relmath.bare-cedar-fog.emsenn.net/:"
date: 2026-06-26
keywords:
  - RMN
  - relating
  - structure
  - computing
  - closure
  - witness
---
--- title: "Internal-real RMN downstream realization scan" date: 2026-06-26 ---

# Internal-real RMN downstream realization scan

## New relating surface

`@emsenn/relating` now has finite, executable models for the green internal-real/logarithm line in `sites/relmath.bare-cedar-fog.emsenn.net/`:

- `analysis.internalReal.natLog`
- `analysis.internalReal.logSeq`
- `analysis.internalReal.invNatP`
- `analysis.internalReal.nsmulRational`
- `analysis.internalReal.scalarCancellation`
- `analysis.internalReal.logStepBound`
- `analysis.internalReal.logMonotone`
- `analysis.internalReal.binaryShiftEntropy`
- `analysis.internalReal.fib`
- `analysis.internalReal.goldenCassini`
- `analysis.internalReal.goldenConvergentLogGap`
- `analysis.internalReal.metallicNum`
- `analysis.internalReal.metallicCassini`
- `analysis.internalReal.metallicConvergentGap`
- `analysis.internalReal.edgeColouringEntropy`
- `analysis.internalReal.triangleColouringEntropy`

The RMN catalog also exposes proof-reading normalizers:

- `internalReal.scalarCancellation`
- `internalReal.logStepBound`
- `internalReal.logMonotone`
- `internalReal.goldenConvergentLogGap`
- `internalReal.metallicConvergentGap`
- `internalReal.edgeColouringEntropy`
- `internalReal.triangleColouringEntropy`

These are not arbitrary Bishop-real computation in Node.
They are exact finite projections of the green Lean proofs in `RelMath.
Real.
InternalReals`, `RelMath.
Real.
Logarithm`, `RelMath.
Real.
LogLipschitz`, `RelMath.
Real.
GoldenLog`, `RelMath.
Aperiodic.
StepN.
MetallicReal`, and `RelMath.
Order.
ColoringEntropy`: rational approximants, monotonicity witnesses, step-bound witnesses, scalar-cancellation witnesses, Fibonacci/metallic Cassini gap witnesses, and colouring-count entropy witnesses that can travel through existing TypeBox/RMN carrier surfaces.

## Downstream realization map

| Package | Current state | Newly realizable work |
| --- | --- | --- |
| `@emsenn/communicating` | `src/communicate/cohesion.mts` already uses exact graph/Laplacian reads, but `channelInformationOf` reports native-number Shannon bits and `discourseSpacetimeOf` uses a native ordering fraction. | Replace or supplement native entropies with exact `logSeq` carrier evidence. Channel information can now carry finite rational log approximants, colouring-count information witnesses, and monotonicity evidence instead of only floating-point readings. |
| `@emsenn/knowing` | `src/cognizing/spectral.mts` already uses exact relating analysis; learning/admission remains mostly bilattice and structural. `src/face.mts` still exposes learning depth as a native number. | Learning growth and concept-depth changes can now be witnessed by `logMonotone` and `logStepBound`. This gives knowledge acquisition a proof-shaped information-gain reading without inventing a probability model. |
| `@emsenn/playing` | The package has quartet/ludic/skill surfaces but little exact quantitative play dynamics of its own; richer flow and deep-play measures currently live downstream in `gaming`. | Playing can import exact threshold, scalar-cancellation, and finite log-gap witnesses for skill/challenge bands, so play balance can be expressed as lawful rational/log evidence rather than delegated entirely to later game readings. |
| `@emsenn/animating` | `src/becoming/doing/working/labor.mts` counts filtration stages as valuations; `skillful-work.mts` is largely closure/bilattice structure. | Working orbits can carry exact growth bounds: `logStepBound` can witness per-step information growth, `logMonotone` can witness that adding cells or valuations does not decrease descriptive capacity, and metallic convergent gaps can witness substitution-family growth. |
| `@emsenn/socializing` | `src/socialize/allocating.mts` uses native-number utilities, `1e-9` tolerances, and native-product Nash welfare. `src/socialize/face.mts` compares coordination and orchestration costs as native counts. | Allocation can become exact-rational: proportionality via scalar cancellation, and Nash-style welfare as sums of log approximants with monotonicity evidence. Coordination-cost claims can become exact log-scale witnesses rather than only O-notation narrative. |
| `@emsenn/computing` | `src/consensus-convergence.mts` is structural CALM/FLP decomposition with booleans and counts; `src/work-closure.mts` is carrier-shaped but not quantitative. | Convergence budgets can be represented as exact log-step witnesses over bounded concern growth or iteration depth. This is less urgent than socializing/communicating, but it gives consensus readings a lawful finite information budget. |
| `@emsenn/gaming` | `src/structuring/concurrent-game/with-symmetry/reading/deep-play.mts` already uses exact rationals for stakes. `reading/flow.mts` uses exact ratios around bands, but still carries native `value`, `gap`, and `mismatch` fields. | Flow can attach scalar-cancellation witnesses to band thresholds and GoldenLog/metallic finite gap witnesses to complexity growth. Deep-play excess can become a log-normalized boundary-utility witness instead of only an exact rational difference. |
| `@emsenn/organizing` | `src/federate-graded.mts` already has strong structural coherence, ledger, H1 rank, CALM, and Raft routing. `src/accounting/topology/market.mts` keeps market topology value-free while leaving quantitative laws to later readings. | Organizing can grade coordination residue and market readings with exact log evidence: log returns, market entropy, volatility bands, colouring/factor-map information, and H1/cell-count cost witnesses can now be modeled without falling back to floats. |

## Priority order

1. `socializing` allocation: remove tolerance-based proportionality and native-product welfare first.
  The new scalar-cancellation and log approximants directly replace the weakest arithmetic.
2. `communicating` channel information: turn Shannon-bit floats into exact finite log and colouring-entropy carriers while preserving the current public reading shape.
3. `socializing` coordination cost: make stigmergic-vs-orchestrated scaling claims proof-shaped.
4. `gaming` flow: keep the existing exact rational band design, but add scalar-cancellation witnesses at the threshold boundary and GoldenLog/metallic gap witnesses for complexity growth.
5. `organizing` market/coherence grading: use exact log returns and entropy-style witnesses over existing provenance quantities.
6. `knowing` and `animating`: add information-growth witnesses to learning depth and working orbits.
7. `computing`: add finite convergence-budget witnesses where consensus readings need quantitative pressure.
8. `playing`: pull the threshold vocabulary upstream once `gaming` flow proves the shape.

## Boundary

Several downstream packages already realized the stronger exact topology line well, especially `knowing` spectral cognition, `organizing` federated coherence, and `gaming` deep play.
The new internal-real RMN models should not replace those.
They should be used where a package currently falls back to native floating point, tolerance checks, or unproved growth/entropy prose.
