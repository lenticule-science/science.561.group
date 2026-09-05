---
title: "Judgement"
type: text
keywords:
  - Relationality
description: "The fifth stratum: 16 acts that earn triadic judgements — the unified recognition of context, term, and observation."
---

The Judgement stratum formalizes the triadic structure of relational judgement: context, term, and observation held together as a single recognition. Where the [Observation](observation.md) stratum earned the ability to *see* relational processes, Judgement earns the ability to *judge* them — to say "this term, in this context, produces this observation." Through 16 constructive steps, it closes the gap between raw observations and the semantic orderings that follow.

## What Judgement exports

Of the 16 acts, 4 are **exports**, 11 are **intermediate construction**, and 1 is a **dead end**.

| Export | External uses | What it provides |
|--------|--------------|------------------|
| **RecognizeJudgementTriad** | 2 | A traced triad recognized as a judgement — feeds Profile and Stability |
| **CloseJudgementTrace** | 1 | Judgement traces closed under reentry — feeds Stability |
| **FlowJudgement** | 1 | Judgements flowing through evaluation contexts — feeds Flow |
| **NormalizedJudgementEquivalence** | 1 | Normalized judgements indistinguishable across contexts — feeds Close |

The export structure reveals Judgement's role as a connector. RecognizeJudgementTriad feeds into JudgeProfile and StabilizeJudgement — the Profile and Stability strata need to know what counts as a judgement. NormalizedJudgementEquivalence feeds into Close alongside NormalizeObservationEquivalence from [Observation](observation.md) — the two strata converge on the same target. FlowJudgement feeds into Flow alongside FlowObservation — another convergence point.

This pairing is architecturally significant. Observation and Judgement are not independent channels but parallel feeds into the same downstream operations (Flow, Nucleate, Stability). The system treats them as two aspects of a single measuring apparatus.

## How the exports are earned

### Triadic formation (6 acts → 1 export)

**SeedJudgementTriad** `(TypeSeed, ContextualizeNormalizeObservationEquivalence)` — The seed of a triadic judgement. TypeSeed (from [Term](term.md)) provides the context-term pair; ContextualizeNormalizeObservationEquivalence (from [Observation](observation.md)) provides the observational guarantee that normalization holds across contexts. The composition unifies these into a single seed: a judgement that a term in a context produces a particular observational behavior. This is the most structurally dense act in the stratum — it draws on both Term and Observation exports simultaneously.

**StepJudgementTriad** `(StepTrace, SeedJudgementTriad)` — Propagating the triad along a reduction step. The judgement must hold not just at one point but through computation. Intermediate.

**TraceJudgementTriad** `(CompleteTrace, StepJudgementTriad)` — Recording the propagation along the entire trace. Intermediate — needed to build RecognizeJudgementTriad.

**RecognizeJudgementTriad** `(TypeApplication, TraceJudgementTriad)` — The triad recognized as a judgement. TypeApplication (from Term) provides the typing structure; the traced triad provides the behavioral guarantee. The composition says: this application has been typed, traced, and behaviorally verified. Export (2 external: JudgeProfile, StabilizeJudgement).

**WitnessJudgementTriad** `(RecognizeObservation, RecognizeJudgementTriad)` — The observation recognizer witnessing the recognized triad. This reports the judgement's observational content back to the observation layer. Intermediate — it feeds into EquateJudgementObservation.

**EquateJudgementObservation** `(ContextualizeNormalizeObservationEquivalence, WitnessJudgementTriad)` — Ensuring that what the judgement reports agrees with the observation equivalence that seeded it. This is a coherence check: the observational guarantee in the seed must match the observational content of the completed judgement. Intermediate — it feeds into CloseJudgementTrace.

### Closure and flow (3 acts → 2 exports)

**CloseJudgementTrace** `(TraceReentryClosure, EquateJudgementObservation)` — Closing the entire judgement trace under the Observation stratum's reentry closure. Export (1 external: StabilizeJudgement). A closed judgement trace is one where every reentrant observation is accounted for and every observational report is coherent.

**FlowJudgement** `(BuildEvaluationContext, CloseJudgementTrace)` — Closed judgement traces flowing through evaluation contexts. Export (1 external: Flow). This parallels FlowObservation — both feed into the same Flow convergence point. The system does not distinguish between observation flow and judgement flow at the Flow level; they are the same kind of propagation.

**EvaluateJudgement** `(RecognizeValue, FlowJudgement)` — Evaluating flowing judgements through value recognition. Intermediate.

### Normalization and equivalence (6 acts → 1 export, 1 dead end)

**NormalizedJudgement** `(Normalization, EvaluateJudgement)` — Evaluated judgements normalized. Intermediate.

**NormalizedJudgementEquivalence** `(EquateContexts, NormalizedJudgement)` — Normalized judgements that are indistinguishable across contexts. Export (1 external: Close). This parallels NormalizeObservationEquivalence — both feed into Close. The closure operation needs both observation equivalence and judgement equivalence to function.

**TraceJudgementEquivalence** through **ContextualJudgementEquivalence** (3 intermediate acts) — The trace/tail/head/context pattern applied to judgement equivalences, mirroring the same pattern in [Observation](observation.md). Each step decomposes, isolates, and contextualizes the equivalence.

**WitnessJudgementEquivalence** `(RecognizeJudgementTriad, ContextualJudgementEquivalence)` — Citing stabilized equivalence back into the triadic recognition. **Dead end**: nothing references this. Like WitnessValue in Observation, this closes a conceptual loop (the judgement recognizer sees its own equivalence) but the system does not need the result as a component. The dead-end witness pattern appears in both Observation and Judgement, suggesting it is a systematic feature rather than an accident: the act of a recognizer witnessing its own equivalence is always structurally inert.

## What the Judgement stratum earns

**The triadic structure.** The fundamental contribution is the judgement triad — context, term, observation unified into a single recognition. This is the form of relational judgement: not "this term computes" or "this observation holds" but "this term, in this context, produces this observation." The triad is the atomic unit of semantic content.

**Convergence with Observation.** Judgement's four exports feed into exactly the same downstream targets as Observation's exports: Flow gets FlowJudgement and FlowObservation; Close gets NormalizedJudgementEquivalence and NormalizeObservationEquivalence; Stability gets RecognizeJudgementTriad and CloseJudgementTrace. The two strata are not sequential but *parallel* — they run side by side and converge on the same operations.

**The dead-end witness pattern.** Both Observation and Judgement produce exactly one dead end each: WitnessValue and WitnessJudgementEquivalence. Both are acts where a recognizer witnesses something about itself. This pattern — self-witnessing producing structural inertness — is a real finding about the derivation: reflexive observation generates no new constructive material.

## Connection to the derivation

Judgement closes the derivation's transition from computation to meaning. The [Foundation](foundation.md) earned distinction. [Trace](trace.md) earned process. [Term](term.md) earned expression. [Observation](observation.md) earned witnessing. Judgement earns *assessment* — the unified recognition that a particular expression, in a particular environment, produces a particular behavior.

The next stratum, [Semantics](semantics.md), takes these judged triads and organizes them into the relational logic — introducing [entailment](../terms/entails.md), [combining](../terms/together.md), [choosing](../terms/either.md), morphisms, and the full logical structure. Judgement provides the raw material; Semantics provides the organization.
