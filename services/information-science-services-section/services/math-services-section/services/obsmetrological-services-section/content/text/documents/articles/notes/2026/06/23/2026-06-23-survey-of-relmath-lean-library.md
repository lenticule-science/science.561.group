---
title: Survey of the RelMath Lean Library
date-created: 2026-06-23
description: This is a self-orientation note for future work on sites/relmath.bare-cedar-fog.emsenn.net/RelMath.
date: 2026-06-23
audience: future Codex/self
keywords:
  - structure
  - cohomology
  - closure
  - settling
  - predication
  - charge
  - FOUR
  - organizing
---
--- title: "Survey of the RelMath Lean Library" date: 2026-06-23 status: "working note" audience: "future Codex/self" ---

# Survey of the RelMath Lean Library

This is a self-orientation note for future work on `sites/relmath.bare-cedar-fog.emsenn.net/RelMath`.
It is based on reading the active Lean package, its root module, and its local documentation on 2026-06-23.

## Package Contract

`sites/relmath.bare-cedar-fog.emsenn.net/` is a standalone Lean package named `RelMath`, pinned to `leanprover/lean4:v4.31.0`.
Its `lakefile.toml` has no `[[require]]` stanzas: the mathematics is intentionally Lean-core only, with `autoImplicit = false` and `relaxedAutoImplicit = false`.

The package's stated discipline is that `RelMath.
Mark` and `RelMath.
Articulating` are the only primitive/free-data roots.
Everything after them is supposed to be derived along the import spine: no Mathlib, no axioms as mathematical shortcuts, and no `sorry` in settled library code.

The local workflow was recorded in top-level command notes:

- `make build` from `sites/relmath.bare-cedar-fog.emsenn.net/`, or `cd sites/relmath.bare-cedar-fog.emsenn.net && lake build`, is the proof checker.
- `make check` is the honesty gate for blueprint declarations and naming.
- `make imports`, `make docs`, `make api`, and `make serve` are sidecar documentation/tooling paths; do not add tooling dependencies to the main `sites/relmath.bare-cedar-fog.emsenn.net/lakefile.toml`.

## Current Shape

The active import root is `sites/relmath.bare-cedar-fog.emsenn.net/RelMath.lean`.
It imports 103 modules from `sites/relmath.bare-cedar-fog.emsenn.net/RelMath/`, roughly 28k lines of Lean.
The current top-level module families are:

| Family | Files | Role |
|---|---:|---|
| `Aperiodic` | 11 | Aperiodic regimes, AP-style witnesses, universality, moduli, step-N recurrence. |
| `Articulating` | 3 | Utterances, articulation cells, four-corner articulation. |
| `Closure` | 15 | Closure operators, ordinals, monads, settling coalgebras, Collatz frontier. |
| `Cohomology` | 15 | Sheaves, H1 projections, CRDT/CALM, bitopological sites, quantale/KZ/inconsistency sheaves. |
| `Flow` | 9 | Closure-flow dynamics, curvature regimes, Lyapunov/free-energy, Laplacian, transfinite flow. |
| `LinearAlgebra` | 2 | Dependency-free vector-space fragments and rank-nullity witness. |
| `Lorentzian` | 2 | Causal-set and Myrheim-Meyer projections. |
| `Order` | 13 | Local order theory, residuation, FCA, Lambek, Chu/linear logic, factorization, combinatorics. |
| `Positing` | 13 | FOUR/bilattice charge, truth and knowledge orders, nuclei, gauges, quartet recurrence. |
| `Predicating` | 8 | Predication cells, hyperdoctrines, quantifiers, equality, fibration/2-category projections. |
| `Probability` | 2 | Stochastic and measure/value-category instances. |
| `Real` | 1 | Constructive internal rationals/reals and real value category. |
| `Value` | 3 | Settling over value categories, optimization, Frobenius/TQFT. |

The root module's own comment describes the intended spine:

1. `Mark`: atomic marks and the two positional kinds.
2. `Utterance`: ordered token/claim pairs.
3. `Articulating`: recursive `[utterance, articulating]`.
4. `ArticulationCell`: four-cell partition.
5. `Predicating`: predication category and object `phi = (s, p, o)`.
6. `Positing`: FOUR bilattice as value.
7. `Settling`: closure to fixed point and generated knowledge order.
8. `Hyperdoctrine` / `Quantifying`: reindexing and quantifier adjoints.
9. `TruthOrder`: the second bilattice order.
10. `ClosureOrdinal`: finite settling iteration and regime classification.
11. `Sheaf`: fixed points as sheaves and H1/CRDT convergence projections.
12. `Four`, `BigradedDiamond`, `Equality`, `ClosureMonad`,
    `BigradedCohomology`: capstone equivalences, nuclear quartet, second
    adjoint/equality system, KZ/lax closure projection, and aperiodic trichotomy.

Later imports widen this into received mathematics and frontier research, but the library still presents itself as a generated descent rather than a Mathlib-shaped taxonomy.

## Core Mathematical Spine

The foundational modules are small and concrete.

- `RelMath.
  Mark` defines `Mark` and `Kind`, with `Kind.token` and `Kind.claim`.
- `RelMath.
  Articulating.
  Utterance` builds the token/claim pair.
- `RelMath.
  Articulating` defines the recursive articulation object, plus `head`, `depth`, and `floor`.
- `RelMath.
  Articulating.
  ArticulationCell` produces the four-corner partition.
- `RelMath.
  Predicating` moves from articulation cells to predication cells and generators such as converse, subject projection, object projection, and specialization.
- `RelMath.
  Positing` defines `Charge`, the FOUR-valued bilattice operations, knowledge/truth orders, negation, conflation, and pointwise `Valuation`.
- `RelMath.
  Settling` derives closure/fixed point behavior over charges and valuations.

Most later work imports from this spine rather than introducing external algebraic infrastructure.
When future changes need order, lattice, logic, category, or value structure, first look for the in-repo formulation under `Order`, `Positing`, `Predicating`, `Closure`, `Cohomology`, or `Value`.

## Derived Infrastructure

`Order` is the local replacement for imported order/algebra libraries.
It includes:

- `OrderInfra`: preorder/partial order/lattice vocabulary.
- `KnasterTarskiStandalone`: fixed points over the local complete lattice interface.
- `ResiduatedLatticeStandalone`, `TwistProductResiduation`, `LinearLogicChu`, `LambekCalculus`: residuation and substructural logic projections.
- `FormalConceptAnalysis`: Boolean FCA as a powerset Galois connection and concept lattice skeleton.
- `SetNumberGraphTheory`, `NumberTheoryCombinatorics`, `Factorization`, `CombinatoricsExtremal`: small received-math fragments, developed dependency-free.

`Closure` is where the settling machinery thickens:

- `ModalPairAdjunction`, `ClosureOperatorFiber`, `SettlingMonotonicityQuiescence`, `Closure2MonadKZ`, and `ClosureMonad` connect modal closure, monotonicity/quiescence, and KZ/lax-idempotent projections.
- `ClosureOrdinal`, `ClosureOrdinalRegime`, and `Ordinal` distinguish finite, Scott-continuous, transfinite, and aperiodic regimes.
- `Collatz/*` is a newer frontier: affine traces, first-passage words, semigroup barriers, and a conditional Collatz reduction.

`Cohomology` and `Flow` are the main higher-level settling fronts:

- `Cohomology.
  Sheaf`, `SettlingAssociatedSheaf`, `SettlingCohomologyH1`, `CRDTCohomologicalCALM`, `InconsistencySheaf`, and `BigradedSettlingCohomology` encode the sheaf/H1/consistency story.
- `Flow.*` reads closure as dynamics: firing blowups, curvature regimes, free-energy Lyapunov descent, Lawvere Laplacian spectral gap, and transfinite closure flow.

`Real.
InternalReals` is a large constructive module deriving rationals and Cauchy reals internally, tying completion to the Scott-continuous settling regime.
It is explicit about constructive scope and avoids claiming classical trichotomy.

## Aperiodicity and Finite Witnesses

The aperiodicity branch is an active research surface rather than only an abstract regime classifier.

`Aperiodic.
Witness.
JeandelRao` defines finite one-vertex Anderson-Putnam cochain complexes and proves two nonzero `H1` projection witnesses:

- a decorated marker-domino witness `phi`;
- the marker-ring quotient class `b3 = q1 + q2 + q5`.

Its module header is careful about scope: these finite witnesses do not prove global Jeandel-Rao aperiodicity or persistence through the full direct system.
They are local candidates for a future direct-limit `cl-inv` result.

There is also a conformance bridge in `sites/relmath.bare-cedar-fog.emsenn.net/conformance/ConformanceVectors.lean`.
It imports RelMath declarations and emits JSONL-style golden vectors for FOUR bilattice operations, CHL term evaluation, and domain-term evaluation.
This is the path used to make TypeScript/package behavior answer to Lean.

## Documentation and Tooling Surface

Important local docs:

- `sites/relmath.bare-cedar-fog.emsenn.net/README.md`: package-level explanation and spine.
- Historical top-level command notes: old command card and workflow model.
- Historical top-level naming notes: old naming and honesty conventions for declarations/docstrings.
- Historical top-level roadmap notes: old high-level status and frontier/backlog narrative; current work should treat Blueprint as the live source.

The docs repeatedly insist that command knowledge should live in the Makefile, not in agent folklore.
For proof work, the expected loop is to use the Lean checker, and when available the Lean LSP MCP, rather than guessing proof state.

## Audit Finding: `sorry` Frontier

The package docs state a no-`sorry` invariant, but a source scan of the active `sites/relmath.bare-cedar-fog.emsenn.net/RelMath` tree found two live `sorry`s:

- `sites/relmath.bare-cedar-fog.emsenn.net/RelMath/Closure/Collatz/SemigroupGap.lean`: `parentBarrierGap_holds`
- `sites/relmath.bare-cedar-fog.emsenn.net/RelMath/Closure/Collatz/Reduction.lean`: `everyNonterminalHasCrossing_holds`

The Collatz files label these as frontier holes.
That makes the state mathematically understandable, but it does contradict the blanket "no sorry" language in the package docs if these modules are imported by `RelMath.lean`.
Future work should either:

- keep them as explicit frontier statements outside the main no-sorry import surface, or
- update the docs to say the no-sorry invariant applies to the settled core, with named frontier exceptions.

Do not silently rely on the no-sorry claim without scanning or building with warning discipline.

## Working Advice for Future Codex

- Treat `sites/relmath.bare-cedar-fog.emsenn.net/RelMath.lean` as the current map of the library.
  It is both import root and narrative spine.
- Before adding a concept, search for the local generated structure first.
  This repo wants reuse of its own upstream ancestry over imported received abstractions.
- Keep generated/descent naming honest.
  Theorem names and docstrings must claim only what statements prove.
- For conformance-sensitive changes, inspect `sites/relmath.bare-cedar-fog.emsenn.net/conformance/*.lean` and downstream JSONL/vector consumers.
- For aperiodicity work, distinguish finite witness theorems, directed-system persistence, and global aperiodicity.
  The current Jeandel-Rao module is intentionally a finite witness layer.
- For proof edits, use `make build` and then `make check` from the package root.
  If local tool commands are hidden from the sandboxed PATH, rerun with escalation per the root agent instructions.

## Quick Orientation Commands

From repo root:

```powershell
Get-Content sites\relmath.bare-cedar-fog.emsenn.net\RelMath.lean -TotalCount 160
Get-ChildItem sites\relmath.bare-cedar-fog.emsenn.net\RelMath -Recurse -File -Filter *.lean | Measure-Object
Select-String -Path sites\relmath.bare-cedar-fog.emsenn.net\RelMath\*.lean,sites\relmath.bare-cedar-fog.emsenn.net\RelMath\*\*.lean,sites\relmath.bare-cedar-fog.emsenn.net\RelMath\*\*\*.lean `
  -Pattern '^\s*(axiom|opaque|constant)\b|\bsorry\b|\badmit\b|\bnative_decide\b'
cd sites/relmath.bare-cedar-fog.emsenn.net
make build
make check
```

The third command is intentionally conservative and may catch doc prose.
Inspect any hits before concluding they are live declarations.
