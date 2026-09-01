---
title: "The Twelve Strata"
kind: text
---
The act-derivation can be organized differently than [the five movements](../terms/five-movements.md): into twelve **strata**, each a layer of acts in the [generative closure](../terms/generative-closure.md) that consumes from earlier strata and exports into later ones. The strata view tracks *what each layer of the derivation is doing structurally*, in contrast to the movements view, which tracks *what kind of coherence each layer earns*.

The two views describe the same content from different angles. Strata is the *engineering* view (act counts, export structure, dead ends); movements is the *philosophical* view (incitement, achieved coherence).

## The strata, in derivation order

| # | Stratum | Acts | Export count | Role |
|---|---|---|---|---|
| 1 | **Foundation** | 15 | (seeds for everything) | Bootstrap distinction, witnessing, naming from the void |
| 2 | **Trace** | 13 | feeds Geometry, Stability | Compose Foundation acts into oriented mechanics ([trace calculus](trace-calculus.md)) |
| 3 | **Judgement** | 14 | feeds Geometry, Semantics | Type-level recognition and judging |
| 4 | **Observation** | 8 | feeds Geometry, Stability | Observation kernels and equivalences |
| 5 | **Term** | 11 | feeds Stability, Semantics | Lambda terms, binding, substitution |
| 6 | **Context** | 14 | feeds Stability, Profile | Recognized contexts |
| 7 | **Stability** | 9 | StabilizeTrace, StabilizeContext (2 exports) | Freeze the four fundamental structures into invariants for Geometry |
| 8 | **Geometry** | 34 | Close, Flow, EnsureFixedPoint, FixFlowNucleus, FlowIndexImplication, FixFlow, CommuteFlowAndNucleus (7 exports) | Couple flow and closure; fixed-point theory; commutation laws |
| 9 | **Semantics** | 125 | StructureSemantics, Together, Either, Implies, Negate, Include, etc. (13 exports) | The relational logic — entailment, combining, choosing, conditional relating, denial, morphisms; *and the metatheory* (soundness, completeness, normalization) |
| 10 | **Profile** | 34 | ProfileRecognitions, FlowProfile, NucleateProfile, etc. (10 exports) | Discipline / Filter / Profile architecture; nested relational universes |
| 11 | **Dynamics** | 7 | (none — terminal) | Phase space, mixing, ergodicity from flow-measure interaction |
| 12 | **Physics** | 47 | StabilizeInvariant (1 export, back into Profile) | States, evolution, measurement, invariants, reachability, conservation, spectral theory |

Total: ~331 documented acts; the full closure has ~387 named acts.

## What the strata view shows that the movements view doesn't

### Convergence points

Two acts in Geometry are convergence points where parallel channels from earlier strata merge:

- **Flow** = `(FlowObservation, FlowJudgement)` — observational flow witnessing judgemental flow.
- **Close** = `(NormalizeObservationEquivalence, NormalizedJudgementEquivalence)` — observational normalization witnessing judgemental normalization.

Both are composed symmetrically from one Observation export witnessing one Judgement export. The system treats observation and judgement as twin inputs to a single geometric operation, then separates the result into motion (Flow) and settlement (Close).

### The Semantics anomaly

Semantics has 125 acts — by far the largest stratum — with a 43% dead-end ratio. The dead ends are *purposeful*: they are the standard metatheoretic theorems (soundness, completeness, preservation, progress, confluence, normalization). They validate the syntactic theory but do not feed further construction. This is qualitatively different from other strata where dead ends tend to be exploratory.

### Two terminal strata

Dynamics (7 acts) and Physics (47 acts) are terminal: 0 and 1 exports respectively. The dynamical and physical concepts — phase space, mixing, ergodicity, evolution, measurement, reachability — are *endpoints* of the derivation. The framework can describe them, but does not build further structure from them. This makes Movement V (the philosophical name for the work happening in Dynamics + Physics) a genuine terminus — not because nothing else *could* be derived, but because what is derived after that point loops back to feed Profile (StabilizeInvariant) rather than producing new strata.

### Heavy exports

The most-cited exports across the whole derivation:

- **StructureSemantics** (Semantics): 7 external uses — feeds Geometry, Profile, Composite. The full logical structure carried forward.
- **ProfileRecognitions** (Profile): 7 external uses — the material of profiles.
- **FlowProfile** (Profile): 7 external uses — how profiles evolve.
- **Close**, **Flow** (Geometry): 6 and 5 external uses — the unified operations.
- **EnsureFixedPoint** (Geometry): 5 external uses — feeds spectral and dynamical analysis.
- **FixFlowNucleus** (Geometry): 5 external uses — feeds Profile and regimes.

## Mapping strata to movements

| Movements | Strata |
|---|---|
| I (Logical Origination) | Foundation, Trace, parts of Judgement / Observation / Term |
| II (Structural Stabilization) | Stability, Context (mostly) |
| III (Directed Dynamics) | Geometry (the Flow side) |
| IV (Geometric Cohesion) | Semantics, Profile (the cohesive chain is in Profile's filter machinery) |
| V (Emergent Containment) | Dynamics, Physics |

The mapping is not 1:1 because the movements organize by *coherence achieved* and the strata organize by *what's being built mechanically*. A movement spans multiple strata; a stratum can contribute to multiple movements.

## Four cross-cutting laws

Four laws govern interactions between strata:

1. **Flow preserves the modal core** — `Must(Flow(a)) = Must(a)`; flow commutes with the modal operators. (Already a property of [Flow](../terms/flow.md).)
2. **Every symmetry yields an invariant** — Categorical Noether; reflexive symmetries of the comonad generate invariants. (Already in [Conserving](../terms/conserving.md).)
3. **Assembly and analysis commute under coherence** — for constructible diagrams, $\text{hcolim} \simeq \text{hlim}$. (The Ambidexterity Theorem; in [Stratifying](../terms/stratifying.md) and [Existence-Observation Duality](../terms/existence-observation-duality.md).)
4. **Dual motions do not interfere** — the twin adjoint motions of the cohesive chain operate independently when their objects don't overlap. (Implicit in the [Cohesive Chain](../terms/cohesive-chain.md) adjunctions.)
