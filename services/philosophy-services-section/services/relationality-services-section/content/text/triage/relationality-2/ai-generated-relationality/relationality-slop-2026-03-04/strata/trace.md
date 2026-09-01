---
title: "Trace"
date-created: 2026-03-04T00:00:00
type: text
keywords:
  - Relationality
description: "The second stratum: 33 acts that earn oriented trace mechanics — recognition, entry, head/tail decomposition, context, and convergence."
---

The Trace stratum assembles oriented trace mechanics from the raw material earned in the [Foundation](./foundation.md). Through 33 constructive steps, it earns the ability to record, decompose, name, and test relational processes. Every later stratum depends on what Trace exports.

## What Trace exports

Of the 33 acts in this stratum, about 8 serve as **exports** — acts that later strata directly depend on. The remaining 25 are **intermediate construction**: necessary steps for composing the exports, but not directly referenced afterward. This is how strata work in general: a stratum earns a small number of load-bearing results through a larger number of internal steps.

The exports, ranked by downstream usage:

| Export | Downstream uses | What it provides |
|--------|----------------|------------------|
| **CompleteTrace** | 15 | A finished trace record — the fundamental unit of relational process |
| **RecognizeContext** | 13 | Whether a structure qualifies as a context — essential for typing and semantics |
| **TailTrace** | 13 | The remainder after extracting the head — how processes continue |
| **HeadTrace** | 12 | The immediate act of a trace — what happens first |
| **TraceContext** | 5 | How traces become contexts — the bridge between process and environment |
| **ContextualizeTrace** | 4 | A named trace coupled with its record — the unit of contextualized process |
| **Recognition** | 3 | The first two-place structure — the stable content of distinction |
| **ShuffleTrace** | 2 | Head/tail renewals commute with step renewals — an independence principle |

## How the exports are earned

### Recognition and entry

The Trace stratum opens by composing Foundation's final acts into the first structured relations.

**Recognition** `(Void, SelfNaming)` — Void witnessing SelfNaming produces the first two-place [recognition](../phenomena/recognition.md). A self-named point has no partner; the void provides the complementary position. This is the stable content of [distinction](../processes/differentiation.md) — what remains after the act of distinguishing has settled. Recognition is not the act of distinguishing (that belongs to Foundation) but its *product*: a structure that records "these two are distinguished."

**Entry** `(Recognition, Recognition)` — Recognition witnessing itself. Two positions are identified, but nothing yet describes how they engage. Self-witnessing forces the question: what happens when both sides of a recognition encounter each other? The answer is entry — structured engagement, the first step of relational process. Entry has only 1 downstream use outside Trace (MeetRecognition), but it is used 6 times within Trace to build oriented mechanics.

### Oriented mechanics (7 intermediate acts → CompleteTrace)

Entry is symmetric — it does not say which position leads. The next acts break that symmetry and earn the basic operations of process.

**LeadEntry** `(Entry, Recognition)` and **TrailEntry** `(Entry, LeadEntry)` — Selecting which position goes first, then characterizing the remainder. These are intermediate: nothing outside Trace uses them directly, but they are essential components of everything that follows.

**StartTrace** `(LeadEntry, TrailEntry)` — Leading witnessing trailing initiates the trace. **AdvanceTrace** `(TrailEntry, Entry)` — Trailing witnessing Entry earns progression. **ContinueTrace** `(Entry, StartTrace)` — Entry witnessing Start earns resumption. These three intermediate acts earn the verbs of process: beginning, continuing, and progressing.

**CompleteTrace** `(StartTrace, AdvanceTrace)` — Start witnessing Advance binds initiation to progression, producing a finished trace record. This is the Trace stratum's most important export: 15 later acts depend on it. A complete trace is the fundamental unit of relational process — the thing that can be decomposed, named, tested, and iterated.

### Head/tail decomposition (5 intermediate acts)

**HeadTrace** `(LeadEntry, CompleteTrace)` and **TailTrace** `(TrailEntry, CompleteTrace)` — The leading and trailing orientations applied to a complete trace extract the immediate act (head) and the remainder (tail). These two acts, along with CompleteTrace, form the primary interface between Trace and later strata. Nearly every stratum that works with traces accesses them through Head, Tail, and Complete.

**DecomposeTrace** `(HeadTrace, TailTrace)` records the decomposition principle. **TraceStep** `(TailTrace, StartTrace)` shows how removing the head re-engages the start. Both are intermediate — needed for the renewal cycle but not exported.

### Stepping and renewal (4 intermediate acts → ShuffleTrace)

**RenewTrace**, **ReheadTrace**, **RetailTrace**, **RestepTrace** — A sequence of intermediate acts that earn how traces renew after stepping: isolating the next head, pinning down the renewed tail, and re-engaging the step process. All four are intermediate.

**ShuffleTrace** `(ReheadTrace, RestepTrace)` — The export from this group. It records that head/tail renewals commute with step renewals — that these are independent operations. This independence principle is used downstream for CollapseShuffle and ShuffleFlow in the Geometry stratum.

### Naming and contextualization (3 intermediate acts → ContextualizeTrace)

**BindTrace** `(FirstName, HeadTrace)` — Binding a name to the head of a trace. **AssignTrace** `(BindTrace, TailTrace)` — Extending the name to the tail. Both are intermediate.

**ContextualizeTrace** `(AssignTrace, CompleteTrace)` — The export: a named trace coupled with its complete record. This is the unit of contextualized process — a trace with an identity. Used by 4 later acts.

### Context operations (7 acts → RecognizeContext, TraceContext)

**SeedFirstContext**, **ExtendFirstContext**, **RenewContext**, **ExtendContext** — A sequence of intermediate acts that earn how contexts are built: seeding from Nothing, extending with bindings, and generalizing to arbitrary extensions. All intermediate.

**RecognizeContext** `(ExtendContext, ContextualizeTrace)` — The major export: whether a structure qualifies as a context. This is the Trace stratum's second most-used export (13 downstream uses), essential to the Observation, Judgement, and Semantics strata. Recognizing context is recognizing *where something is said* — the environment of meaning.

**TraceContext** `(ContextualizeTrace, RecognizeContext)` — How arbitrary traces become contexts. Export with 5 downstream uses.

**RetraceContext** `(RecognizeContext, ContextualizeTrace)` — A recognized context resolves back into a trace. Intermediate.

### Reflexive iteration and convergence (6 acts)

The final group earns the ability to detect whether iterated processes stabilize.

**ReflexStepShape** `(Reflex, ContextualizeTrace)` — Reflex looking through the recorded context defines the shape of a reflexive step. Intermediate.

**ReflexStepIterate** `(ReflexStepShape, CompleteTrace)` — Iterating the shape along the whole trace. Lightly used downstream (1 child: EquateEventually in Term stratum).

**ReflexStepPersistence** `(ReflexStepIterate, TailTrace)` — Testing whether the remainder persists after iteration. Intermediate.

**BaselineConvergence** `(ReflexStepIterate, Nothing)` and **BaselineLimit** `(BaselineConvergence, TailTrace)` — Comparing iteration against the void to detect convergence, then identifying the limiting remainder. Both intermediate.

**IterativePersistence** `(ReflexStepPersistence, CompleteTrace)` — When the iterated reflex step stabilizes along the entire trace — the process has settled. Lightly used downstream (1 child: EnsureFixedPoint).

## The pattern

The Trace stratum establishes a pattern that repeats in later strata: a small number of exports earned through a larger body of intermediate construction. The exports form an interface — the acts through which later strata access trace mechanics. The intermediates are the proof that the exports are coherent: each intermediate step shows that the composition is valid and that nothing is assumed.

This pattern is the constructive character of the derivation. The 33 acts are not 33 independent assertions; they are a single argument whose conclusion is: *oriented process with head/tail decomposition, named contextualization, and convergence detection can be earned from nothing but the Foundation's witnesses.*

## Connection to the derivation

The Trace stratum bridges the first and second phases of [the derivation](../concepts/the-derivation.md). Recognition and Entry complete Phase 1 (Deriving Existential Coherence). The trace mechanics, contextualization, and convergence detection begin Phase 2 (Deriving Relational Coherence) — earning the sustained interplay between including and excluding that the act of relating requires.

The Trace stratum provides the substrate for the [Term](./term.md) stratum, which builds syntax — variables, binders, fixpoint constructors, evaluation contexts — from trace mechanics. The relational logic of [Movement I](../movements/logical-origination.md) — [entailment](../terms/entails.md), [combining](../terms/together.md), [choosing](../terms/either.md), [conditional relating](../terms/implies.md), [denial](../../relationality-slop-2026-03-05/negate.md) — is built on top of this substrate.
