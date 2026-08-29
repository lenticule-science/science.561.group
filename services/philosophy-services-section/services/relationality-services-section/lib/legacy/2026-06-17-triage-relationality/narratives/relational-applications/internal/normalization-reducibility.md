---
title: Normalization and Reducibility
aliases:
  - Normalization and Reducibility
  - normalization and reducibility
tags:
  - normalization
  - reducibility
  - confluence
depends-on:
  - normalization
  - step-trace
  - normalize-strongly
  - ensure-confluence
  - build-reducible-environment
  - substitute-reducibility
  - establish-fundamental-reducibility
  - seed-evaluation-context
  - build-evaluation-context
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Normalization and Reducibility)

Strong normalization, confluence, and logical-relations arguments already exist
as acts in the calculus.  This text packages them as ready-to-cite theorems for
runtime reasoning or future semantics.

## 1. Normalization guarantees

**Theorem 1 (Strong normalization).**  
Normalization witnessing
Step Trace yields
Normalizing Strongly, proving that no infinite
reduction traces survive once normalization holds.

*Proof sketch.* `(Normalization StepTrace)` collapses any infinite tail; the act
`NormalizeStrongly` records that collapse explicitly, so every well-founded
reduction terminates. ∎

**Theorem 2 (Confluence).**  
Ensuring Confluence uses
Complete Trace to observe
Step Observation, witnessing that divergent
reductions rejoin.

*Proof sketch.* The complete trace enumerates both branches, and `Step
Observation` reports their re-entry.  Their composition states that any two
steps have a common successor. ∎

## 2. Reducibility and logical relations

**Theorem 3 (Reducible environments).**  
Build Reducible Environment,
Select Reducibility Candidate, and
Substitute Reducibility collectively show
that substituting reducible terms into reducible environments preserves
reducibility.

*Proof sketch.* `BuildReducibleEnvironment` seeds the logical relation.  The
selection act chooses the candidate relation for each term, and
`SubstituteReducibility = (BuildReducibleEnvironment JudgeTyping)` certifies that
typed substitutions stay reducible. ∎

**Theorem 4 (Fundamental theorem of reducibility).**  
Establish Fundamental Reducibility
states that every well-typed term is reducible in every reducible environment.

*Proof sketch.* `SelectReducibilityCandidate` witnessing `SubstituteReducibility`
is exactly the standard logical-relations argument, and the act records the
result. ∎

## 3. Interaction with evaluation contexts

**Theorem 5 (Evaluation compatibility).**  
Seed Evaluation Context and
Build Evaluation Context ensure that
reducibility proofs respect the operational notion of context, while
Flow Judgement transports those contexts through
judgement traces.  Consequently normalization and reducibility results apply to
the actual evaluation order used by the runtime.

*Proof sketch.* The evaluation-context acts record the inductive shape of
contexts, and `FlowJudgement` shows how they ride the trace.  Since the
reducibility proofs are phrased in terms of these contexts, they carry over to
operational semantics automatically. ∎

## Summary

| Property | Witnessing acts |
| -------- | ---------------- |
| Strong normalization | `NormalizeStrongly` |
| Confluence | `EnsureConfluence` |
| Reducible substitution | `BuildReducibleEnvironment`, `SubstituteReducibility` |
| Fundamental theorem | `EstablishFundamentalReducibility` |
| Evaluation compatibility | `SeedEvaluationContext`, `BuildEvaluationContext`, `FlowJudgement` |

These theorems are the backbone of the calculus’ metatheory: when we claim that
a program terminates, confluent reductions exist, or logical relations hold, we
are citing the acts summarized here.
