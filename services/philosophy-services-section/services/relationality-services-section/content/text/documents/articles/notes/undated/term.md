---
title: Term Stratum
description: Term-level acts introduce variables, binders, fixpoint constructors, and the evaluation contexts that carry syntax forward.
aliases:
  - Term
  - term
type: text
keywords:
  - relationality
---
# Term Stratum

Term-level acts introduce variables, binders, fixpoint constructors, and the
evaluation contexts that carry syntax forward.  This stratum is where the trace
machinery hardens into the objects manipulated by the judgement layer.

Acts classified under **term** grouped by phase.

## Free Phase

| Index | Act | Title |
| --- | --- | --- |
| 0046 | `EquateEventually` | [Equating Eventually](0046-equate-eventually.md) |
| 0047 | `RecognizeEquateEventually` | [Recognizing Eventual Equivalence](0047-recognize-equate-eventually.md) |
| 0048 | `EnforceEquateEventuallyLaw` | [Enforcing Eventual Equivalence Law](0048-enforce-equate-eventually-law.md) |
| 0049 | `SeedTerm` | [Seeding Terms](0049-seed-term.md) |
| 0050 | `BindTerm` | [Binding Terms](0050-bind-term.md) |
| 0051 | `PresentVariableTerm` | [Presenting Variable Term](0051-present-variable-term.md) |
| 0052 | `FormTermBody` | [Forming Term Body](0052-form-term-body.md) |
| 0053 | `FormFunctionTerm` | [Forming Function Term](0053-form-function-term.md) |
| 0054 | `PairApplication` | [Pairing Application](0054-pair-application.md) |
| 0055 | `FormApplicationTerm` | [Forming Application Term](0055-form-application-term.md) |
| 0056 | `PairLeastFix` | [Pairing Least Fix](0056-pair-least-fix.md) |
| 0057 | `FormLeastFixTerm` | [Forming Least Fix Term](0057-form-least-fix-term.md) |
| 0058 | `PairGreatestFix` | [Pairing Greatest Fix](0058-pair-greatest-fix.md) |
| 0059 | `FormGreatestFixTerm` | [Forming Greatest Fix Term](0059-form-greatest-fix-term.md) |
| 0060 | `TypeSeed` | [Seeding Types](../0060-type-seed.md) |
| 0061 | `TypeVariable` | [Typing Variables](../0061-type-variable.md) |
| 0062 | `TypeApplication` | [Typing Applications](../0062-type-application.md) |
| 0063 | `WeakeningSeed` | [Seeding Weakening](../0063-weakening-seed.md) |
| 0064 | `GreatestFixpointTypeSeed` | [Seeding Greatest Fixpoint Typing](../0064-greatest-fixpoint-type-seed.md) |
| 0065 | `GreatestFixpointTypingStep` | [Stepping Greatest Fixpoint Typing](../0065-greatest-fixpoint-typing-step.md) |
| 0066 | `BinderSeed` | [Seeding Binder](../0066-binder-seed.md) |
| 0067 | `BinderTransport` | [Transporting Binder](../0067-binder-transport.md) |
| 0068 | `BinderApplication` | [Applying Binder](../0068-binder-application.md) |
| 0069 | `SubstitutionTerm` | [Forming Substitution Term](../0069-substitution-term.md) |
| 0070 | `Reduce` | [Reducing](../0070-reduce.md) |
| 0071 | `StepTrace` | [Tracing Steps](../0071-step-trace.md) |
| 0072 | `Normalization` | [Normalizing](../0072-normalization.md) |
| 0073 | `EquateContexts` | [Equating Contexts](../0073-equate-contexts.md) |
| 0074 | `SeedEvaluationContext` | [Seeding Evaluation Context](../0074-seed-evaluation-context.md) |
| 0075 | `BuildEvaluationContext` | [Building Evaluation Context](../0075-build-evaluation-context.md) |
| 0076 | `SeedValue` | [Seeding Values](0076-seed-value.md) |
| 0077 | `RecognizeValue` | [Recognizing Values](0077-recognize-value.md) |


---

<!-- source: archive/triage/relationality-2/domains/ai-generated-relationality/domains/relationality-slop-2026-03-02/strata/term.md -->

## Imported source: archive/triage/relationality-2/domains/ai-generated-relationality/domains/relationality-slop-2026-03-02/strata/term.md

---
title: Term
aliases:
  - "Term"
  - "term"
date-created: 2026-02-28T00:00:00
---
# Term Stratum

Term-level acts introduce variables, binders, fixpoint constructors, and the
evaluation contexts that carry syntax forward.  This stratum is where the trace
machinery hardens into the objects manipulated by the judgement layer.

Acts classified under **term** grouped by phase.

## Free Phase

| Act | Title |
| --- | --- |
| `EquateEventually` | [Equating Eventually](../../../../triage/404.md) |
| `RecognizeEquateEventually` | [Recognizing Eventual Equivalence](../../../../triage/404.md) |
| `EnforceEquateEventuallyLaw` | [Enforcing Eventual Equivalence Law](../../../../triage/404.md) |
| `SeedTerm` | [Seeding Terms](../../../../triage/404.md) |
| `BindTerm` | [Binding Terms](../../../../triage/404.md) |
| `PresentVariableTerm` | [Presenting Variable Term](../../../../triage/404.md) |
| `FormTermBody` | [Forming Term Body](../../../../triage/404.md) |
| `FormFunctionTerm` | [Forming Function Term](../../../../triage/404.md) |
| `PairApplication` | [Pairing Application](../../../../triage/404.md) |
| `FormApplicationTerm` | [Forming Application Term](../../../../triage/404.md) |
| `PairLeastFix` | [Pairing Least Fix](../../../../triage/404.md) |
| `FormLeastFixTerm` | [Forming Least Fix Term](../../../../triage/404.md) |
| `PairGreatestFix` | [Pairing Greatest Fix](../../../../triage/404.md) |
| `FormGreatestFixTerm` | [Forming Greatest Fix Term](../../../../triage/404.md) |
| `TypeSeed` | [Seeding Types](../../../../triage/404.md) |
| `TypeVariable` | [Typing Variables](../../../../triage/404.md) |
| `TypeApplication` | [Typing Applications](../../../../triage/404.md) |
| `WeakeningSeed` | [Seeding Weakening](../../../../triage/404.md) |
| `GreatestFixpointTypeSeed` | [Seeding Greatest Fixpoint Typing](../../../../triage/404.md) |
| `GreatestFixpointTypingStep` | [Stepping Greatest Fixpoint Typing](../../../../triage/404.md) |
| `BinderSeed` | [Seeding Binder](../../../../triage/404.md) |
| `BinderTransport` | [Transporting Binder](../../../../triage/404.md) |
| `BinderApplication` | [Applying Binder](../../../../triage/404.md) |
| `SubstitutionTerm` | [Forming Substitution Term](../../../../triage/404.md) |
| `Reduce` | [Reducing](../../../../triage/404.md) |
| `StepTrace` | [Tracing Steps](../../../../triage/404.md) |
| `Normalization` | [Normalizing](../../../../triage/404.md) |
| `EquateContexts` | [Equating Contexts](../../../../triage/404.md) |
| `SeedEvaluationContext` | [Seeding Evaluation Context](../../../../triage/404.md) |
| `BuildEvaluationContext` | [Building Evaluation Context](../../../../triage/404.md) |
| `SeedValue` | [Seeding Values](../../../../triage/404.md) |
| `RecognizeValue` | [Recognizing Values](../../../../triage/404.md) |


---

<!-- source: archive/triage/relationality-2/domains/ai-generated-relationality/domains/relationality-slop-2026-03-04/domains/strata/term.md -->

## Imported source: archive/triage/relationality-2/domains/ai-generated-relationality/domains/relationality-slop-2026-03-04/domains/strata/term.md

---
title: "Term"
date-created: 2026-03-04T00:00:00
type: text
tags:
  - Relationality
description: "The third stratum: 32 acts that earn syntax — variables, functions, fixpoints, reduction, normalization, evaluation contexts, and values — from trace mechanics."
---

The Term stratum builds the syntax of relational computation from the oriented mechanics earned in [Trace](trace.md). Through 32 constructive steps, it earns variables, function terms, application, fixpoint constructors, reduction, normalization, evaluation contexts, and value recognition. This is where the derivation transitions from process mechanics (traces, heads, tails) to the language of computation (terms, types, substitution, evaluation).

## What Term exports

Of the 32 acts, 12 serve as **exports** — acts that later strata directly depend on. 17 are **intermediate construction**, and 3 are **dead ends** that nothing else in the system references.

The exports, ranked by downstream usage:

| Export | External uses | What it provides |
|--------|--------------|------------------|
| **Normalization** | 7 | Whether a term stabilizes under reduction |
| **EquateContexts** | 7 | Whether two contexts agree after normalization |
| **SeedTerm** | 5 | The raw unit of term formation — a trace head addressing a context |
| **RecognizeValue** | 5 | Whether a term is a value — irreducible, settled |
| **BuildEvaluationContext** | 4 | The frame in which reduction happens |
| **FormFunctionTerm** | 3 | A term body returned to its context — the function |
| **StepTrace** | 3 | A single reduction step propagated along a complete trace |
| **FormApplicationTerm** | 2 | A function paired with an argument and its remainder |
| **TypeSeed** | 2 | A bound term situated in a recognized context — the seed of typing |
| **TypeApplication** | 2 | An application term typed within its trace context |
| **Reduce** | 2 | The rewrite of an application to its substitution |
| **FormLeastFixTerm** | 1 | The least stabilizing self-application — least fixpoint |

The heaviest exports are Normalization and EquateContexts (7 uses each). Later strata — Observation, Judgement, Semantics, Stability — access the Term stratum primarily through these two acts. The system cares most about whether terms settle and whether contexts can tell settled terms apart.

## How the exports are earned

### Eventual equivalence (3 acts — dead-end chain)

**EquateEventually** `(ReflexStepIterate, ContextualizeTrace)` — Iterated reflexive stepping across a recorded context detects eventual equivalence: two recognitions that may differ at first but converge under iteration. This is a valid construction, composing Trace exports.

**RecognizeEquateEventually** `(CompleteTrace, EquateEventually)` and **EnforceEquateEventuallyLaw** `(CompleteTrace, RecognizeEquateEventually)` — These promote eventual equivalence to a recognition and then enforce its laws (reflexivity, symmetry, transitivity) along the trace.

The entire chain is a **dead end**: no later act references EnforceEquateEventuallyLaw, and neither of the earlier two acts are used outside this chain. The concept is sound — eventual equivalence is a real phenomenon — but the derivation does not need it as a component. This is similar to FirstRecognize and IterateReflex in [Foundation](foundation.md): a structural assertion rather than a constructive step.

### Term formation (8 acts → 3 exports)

This is the core syntactic construction — building the simply-typed lambda calculus from trace mechanics.

**SeedTerm** `(HeadTrace, TraceContext)` — A trace head addressing a recognized context produces the seed of a term. This is the most fundamental Term export by concept: it establishes that *terms are heads in contexts*. Heavily used downstream (5 external children: Observe, FixedObserve, ProfileObserve, StabilizeTerm, TermProfile).

**BindTerm** `(FirstName, SeedTerm)` — A name bound to a seed. Intermediate, but essential — without naming, terms cannot be distinguished.

**PresentVariableTerm** `(BindTerm, HeadTrace)` — A bound name exposing its corresponding head. The variable. Intermediate — used only to construct TypeVariable.

**FormTermBody** `(BindTerm, TailTrace)` — A bound name capturing the remainder after extracting the head. The body. Intermediate, but forks into two chains: functions and binders.

**FormFunctionTerm** `(FormTermBody, TraceContext)` — A body returned to the recorded context becomes a function. Export (3 external children: ConstructTerms, Implies, ProfileExponential). The connection to [Implies](../../../../terms/implies.md) is significant: conditional relating in the relational logic corresponds to the function type.

**PairApplication** `(FormFunctionTerm, HeadTrace)` — A function paired with an argument. The name "PairApplication" describes the mechanical step (putting two things together) without conveying what is being earned. A name like "ApplyFunction" or "DirectApplication" would better describe the relational content: a function meeting its argument.

**FormApplicationTerm** `(PairApplication, TailTrace)` — The application paired with the remainder. Export (2 external: ConstructTerms). Together with FormFunctionTerm, this provides the two constructors needed for term algebra.

### Fixpoint construction (4 acts → 1 export)

**PairLeastFix** `(FormApplicationTerm, HeadTrace)` — An application term re-encountering a head. Self-application: the application applies to itself. The name "PairLeastFix" is weak — "pairing" does not describe the self-referential act. "SelfApply" or "IterateApplication" would be more descriptive.

**FormLeastFixTerm** `(PairLeastFix, TailTrace)` — The least stabilizing self-application, captured as a term. Export (1 external: RecognizeFixedPoint). The least fixpoint: the smallest structure that is unchanged by its own operation.

**PairGreatestFix** `(FormLeastFixTerm, HeadTrace)` and **FormGreatestFixTerm** `(PairGreatestFix, TailTrace)` — The same pattern iterated once more to capture the *greatest* stabilizing structure. FormGreatestFixTerm is intermediate — it feeds only into GreatestFixpointTypeSeed.

### Typing (4 acts → 2 exports, 1 dead end)

**TypeSeed** `(RecognizeContext, BindTerm)` — A bound term situated inside a recognized context. This is the seed of a typing judgement: "this term has this type in this context." Export (2 external: JudgeTyping, SeedJudgementTriad).

**TypeVariable** `(PresentVariableTerm, TypeSeed)` — A variable presented against the typing seed. Intermediate — used only to build WeakeningSeed.

**TypeApplication** `(FormApplicationTerm, TraceContext)` — An application judged within its trace context. Export (2 external: JudgeTyping, RecognizeJudgementTriad). The two typing exports (TypeSeed and TypeApplication) provide the two main routes into the Judgement stratum.

**WeakeningSeed** `(ExtendContext, TypeVariable)` — Extending a context preserves variable typing. This seeds the weakening principle (adding unused variables does not disturb typing). **Dead end**: nothing else references it. Weakening is seeded but never consumed. This parallels the classical situation where weakening is admissible (derivable from the system) rather than necessary as a primitive — but its presence as an unused act raises the question of whether it belongs in the 397.

### Greatest fixpoint typing (2 acts — mutual recursion)

**GreatestFixpointTypeSeed** `(FormGreatestFixTerm, GreatestFixpointTypingStep)` and **GreatestFixpointTypingStep** `(TraceContext, GreatestFixpointTypeSeed)` — These two acts reference each other: the seed depends on the step, and the step depends on the seed. This is the only mutual dependency in the entire system of 397 acts. It captures the coinductive character of greatest fixpoint typing: the typing guarantee and the typing step require each other simultaneously. Both are intermediate — they feed into each other and nowhere else.

### Binders (3 acts — dead-end chain)

**BinderSeed** `(ContextualizeTrace, Nothing)` — A contextualized trace witnessing Nothing produces the abstract binder — a naming mechanism sourced from the ground. Intermediate.

**BinderTransport** `(RecognizeContext, BinderSeed)` — Transporting the binder through recognized contexts. Intermediate.

**BinderApplication** `(FormTermBody, BinderTransport)` — Applying the transported binder to a term body. **Dead end**: nothing references this. The binder chain develops naming-through-contexts but terminates without export. The concept is valid (binders that transport through contexts and apply to bodies) but the derivation does not need it as a component for later construction.

### Reduction and normalization (4 acts → 4 exports)

This group earns the computational behavior of the calculus.

**SubstitutionTerm** `(SeedTerm, SubstituteReducibility)` — A term seed witnessing the reducibility substitution lemma. Note the cross-stratum dependency: SubstituteReducibility belongs to the [Semantics](../2026/02/28/2026-02-28-triage-semantics.md) stratum, but SubstitutionTerm is classified under Term. This challenges the strict layering claim — the strata are conceptual groupings, not dependency barriers. In practice, SubstituteReducibility depends on acts from Semantics that are defined before SubstitutionTerm in the act sequence.

**Reduce** `(FormApplicationTerm, SubstitutionTerm)` — An application rewriting to its substitution. The beta-reduction rule, earned constructively. Export (2 external: StepRecognition, SummarizeReduction).

**StepTrace** `(CompleteTrace, Reduce)` — A reduction step propagated along a complete trace. Export (3 external: NormalizeStrongly, PreserveTyping, StepJudgementTriad). The connection to PreserveTyping is essential: it is part of the type-safety argument.

**Normalization** `(TailTrace, StepTrace)` — When the tail of a stepped trace stabilizes — the term has normalized. Export (7 external children across Observation, Semantics, and Judgement). This is the Term stratum's heaviest single export. The system asks "does this term normalize?" more than any other question about terms.

### Context equation, evaluation, and values (4 acts → 3 exports)

**EquateContexts** `(RecognizeContext, Normalization)` — Whether two contexts agree after normalization. Export (7 external: SeedObservation, WitnessObservation, NormalizeObservationEquivalence, and others). This is the bridge between computation and observation: two contexts are the same if normalization cannot tell them apart.

**SeedEvaluationContext** `(HeadTrace, StepTrace)` — The head of a stepped trace frames where reduction happens. Intermediate.

**BuildEvaluationContext** `(TailTrace, SeedEvaluationContext)` — The full evaluation context: the frame plus the remainder. Export (4 external: FlowObservation, FlowObservationEquivalence, FlowJudgement, StepRecognition). Evaluation contexts bridge Term and the flow mechanics in later strata.

**SeedValue** `(HeadTrace, Normalization)` — The head of a normalized trace is a candidate value. Intermediate.

**RecognizeValue** `(TailTrace, SeedValue)` — Recognizing values: terms that are fully reduced, irreducible, settled. Export (5 external: WitnessValue, EvaluateObservation, EvaluateObservationEquivalence, EvaluateJudgement, ProgressTyping). The connection to ProgressTyping matters: well-typed terms that are not values can take a step (progress theorem).

## What the Term stratum earns

Three load-bearing contributions, one structural finding, and three dead-end chains:

**Load-bearing:**
1. **Syntax** — SeedTerm, FormFunctionTerm, FormApplicationTerm, FormLeastFixTerm provide the term algebra: variables, functions, application, fixpoints. These are the nouns of relational computation.
2. **Computational behavior** — Reduce, StepTrace, Normalization, EquateContexts describe how terms compute, when they stop, and how to compare results. These are the verbs.
3. **Evaluation infrastructure** — TypeSeed, TypeApplication, BuildEvaluationContext, RecognizeValue provide the framework for typing, framing reduction, and identifying results. These are the judgement-facing exports.

**Structural finding:**
- The mutual recursion between GreatestFixpointTypeSeed and GreatestFixpointTypingStep is the only cycle in the 397-act system. It captures something real: coinductive typing cannot be unfolded into a finite chain.

**Dead ends:**
- **Eventual equivalence** (3 acts) — valid but unused. The concept is real; the derivation does not need it.
- **WeakeningSeed** (1 act) — weakening is admissible, not needed as a primitive.
- **BinderApplication** (1 act) — binders are developed but their application terminates without export.

These 5 dead-end acts (out of 32) represent a higher proportion than Foundation's 2-out-of-15. The Term stratum contains more exploratory construction — acts that are correct but that the system does not ultimately use.

## Connection to the derivation

The Term stratum enacts the syntactic dimension of [the derivation](../../../../concepts/the-derivation.md)'s second phase — earning the language in which relational [coherence](../../../../phenomena/coherence.md) can be expressed. Where the [Trace](trace.md) stratum earned *process* (how things happen), Term earns *expression* (what can be said about what happens). The 12 exports provide everything the [Observation](observation.md) and [Judgement](judgement.md) strata need to begin recording, judging, and comparing relational activity.

The function type earned here corresponds to [conditional relating](../../../../terms/implies.md) in the relational logic ([Movement I](../../../../glossary/concepts/movements-logical-origination.md)), and the fixpoint constructors correspond to the modal operators ([Must](../../../../terms/must.md) and [May](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/may.md)) that emerge in [Movement II](../../../../glossary/concepts/movements-structural-stabilization.md). Mathematicians recognize this structure as a simply-typed lambda calculus with least and greatest fixpoint constructors — but these are earned from trace mechanics, not postulated.
