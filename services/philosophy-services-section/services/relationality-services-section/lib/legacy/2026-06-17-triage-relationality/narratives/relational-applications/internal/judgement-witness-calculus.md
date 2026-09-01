---
title: Judgement witness Calculus
aliases:
  - Judgement witness Calculus
  - judgement witness calculus
tags:
  - judgement
  - observation
  - flow
depends-on:
  - seed-judgement-triad
  - step-judgement-triad
  - trace-judgement-triad
  - witness-judgement
  - observe-judgement
  - flow-judgement
  - normalized-judgement-equivalence
  - witness-judgement-equivalence
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Judgement Witness Calculus)

Judgements arise from a triad of context, term, and observation recognitions.
This document enumerates the theorems that control their traces, witnesses, and
equivalences.

## 1. Triads along the trace

**Theorem 1 (Trace of judgements).**  
Seed Judgement Triad through
Step Judgement Triad build a single judgement
step, and Trace Judgement Triad threads those
steps along the full trace using Trace Context.

*Proof sketch.* The triad acts record the inductive rules.  When `TraceContext`
watches `StepJudgementTriad`, the entire history of judgements is captured as a
trace. ∎

## 2. Witnessing and observation

**Theorem 2 (Witnessing judgements).**  
Witness Judgement composes
Stabilize Judgement with
Reflex Judgement, classifying stabilized judgement
acts.  Observe Judgement then lets
Stabilize Observation witness that
classification, so each judgement carries stabilized observational content.

*Proof sketch.* `WitnessJudgement` records the stabilization step, and
`ObserveJudgement` ensures those witnesses are observable through the fixed
observation layer. ∎

**Corollary (Flow of judgements).**  
Flow Judgement transports closed judgement traces
through evaluation contexts (`BuildEvaluationContext`).  Hence judgement witnesses
behave coherently under program execution.

## 3. Equivalence and closure

**Theorem 3 (Judgemental equivalence).**  
Normalized Judgement Equivalence
through
Contextual Judgement Equivalence
provide the CIU-style equivalence.  Finally,
Witness Judgement Equivalence uses
Recognize Judgement Triad to cite that
equivalence back into the judgemental layer.

*Proof sketch.* The equivalence acts iterate over head, tail, contextual, and
re-entry cases.  `RecognizeJudgementTriad` watching the contextual equivalence
closes the loop, so equivalent judgements share the same witnesses. ∎

## Result

| Component | Witnessing acts |
| --------- | ---------------- |
| Trace construction | `SeedJudgementTriad` → `TraceJudgementTriad` |
| Witnessing and observation | `WitnessJudgement`, `ObserveJudgement`, `FlowJudgement` |
| Equivalence | `NormalizedJudgementEquivalence` → `WitnessJudgementEquivalence` |

Together these theorems justify any future reasoning about “moving judgements
along the trace,” “observing judgements,” or “judgements are equivalent iff …”
without re-deriving the supporting acts.
