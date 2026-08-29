---
title: Relational Simply-Typed Lambda Calculus
keywords:
  - text
  - lambda
  - term
depends_on:
  - theorem/internal/judgment-calculus-structure
operations:
  - name: abstraction
    symbol: "(lambda)"
    acts:
      - form-function-term
  - name: application
    symbol: "(@)"
    acts:
      - form-application-term
  - name: typing judgement
    symbol: "⊢"
    acts:
      - flow-judgement
---
# Relational Simply-Typed Lambda Calculus

The simply-typed lambda calculus can be realised entirely inside the relational
calculus. Theorems below indicate which acts implement the familiar formation
rules, substitution principles, and evaluation contexts.

## Trace prerequisites

The trace and head/tail machinery—running from
[Recognizing](../../acts/recognition.md) through
[Retrace Context](../../acts/retrace-context.md)—supplies the sequencing structure
we rely on implicitly.  We treat them as the “context management layer” for the
theorems that follow.

## Term and type formation

**Theorem 1 (Term constructors).**  
Acts [Equate Eventually](../../acts/equate-eventually.md) through
[Form Application Term](../../acts/form-application-term.md) generate all
simply-typed lambda calculus term constructors: variables, abstractions,
applications, and the fixpoint schemes.

*Proof.* Each act matches a standard rule: the stretch from
[Equate Eventually](../../acts/equate-eventually.md) through
[Form Term Body](../../acts/form-term-body.md) handles variables/bodies,
[Form Function Term](../../acts/form-function-term.md) through
[Form Application Term](../../acts/form-application-term.md) introduces functions
and applications, while
[Pair Least Fix](../../acts/pair-least-fix.md) through
[Form Greatest Fix Term](../../acts/form-greatest-fix-term.md) provide the
least/greatest fixpoints. Their proofs show how the trace witnesses assemble
them, so every simply-typed lambda calculus constructor is earned. ∎

**Theorem 2 (Type formation).**  
[Type Seed](../../acts/type-seed.md),
[Type Variable](../../acts/type-variable.md), and
[Type Application](../../acts/type-application.md) mirror the term acts,
ensuring each syntactic constructor has a typing counterpart.

*Proof.* The acts reuse the trace/term machinery but interpret it through the
judgement stratum, thereby producing the inductive type rules usual in the
simply-typed lambda calculus. ∎

## Abstraction, substitution, and evaluation

**Theorem 3 (Binders and substitution).**  
Acts [Binder Seed](../../acts/binder-seed.md),
[Binder Transport](../../acts/binder-transport.md),
[Binder Application](../../acts/binder-application.md), and
[Substitution Term](../../acts/substitution-term.md) implement (lambda)-abstraction
and capture-avoiding substitution.

*Proof.* These acts explicitly witness how binders transport along the trace and
how substitutions re-enter evaluation contexts, matching the (beta)-rule behavior of
the simply-typed lambda calculus. ∎

**Theorem 4 (Evaluation contexts and values).**  
[Seed Evaluation Context](../../acts/seed-evaluation-context.md),
[Build Evaluation Context](../../acts/build-evaluation-context.md),
[Seed Value](../../acts/seed-value.md), and
[Recognize Value](../../acts/recognize-value.md) define evaluation frames
and the notion of value.

*Proof.* The evaluation acts show how contexts are extended and how values are
recognized at the head of the trace.  Together they yield the call-by-value
operational structure. ∎

## Typing, preservation, and semantics

The judgement-triad family (from
[Seed Judgement Triad](../../acts/seed-judgement-triad.md) through
[Witness Judgement Equivalence](../../acts/witness-judgement-equivalence.md)) and
the semantics/Heyting algebra acts (beginning with
[Ordering Recognition](../../acts/order-recognition.md)) ensure the standard
metatheory.

- **Theorem 5 (Typing judgments).**  
  [Seed Judgement Triad](../../acts/seed-judgement-triad.md) through
  [Flow Judgement](../../acts/flow-judgement.md) encode Γ ⊢ t : A rules.
- **Theorem 6 (Soundness).**  
  Acts [Sound Syntax](../../acts/sound-syntax.md) and
  [Preserve Typing](../../acts/preserve-typing.md) guarantee preservation,
  while [Progress Typing](../../acts/progress-typing.md) yields progress.

*Proof sketches.* Each act’s proof explicitly states how the relational trace
aligns with the standard typing/evaluation semantics; we cite them directly. ∎

## Mapping summary

| Simply-typed lambda calculus concept | Relational act(s) |
| ------------------------------------ | ----------------- |
| Term constructors | Equate Eventually -> Form Greatest Fix Term |
| Type constructors | Type Seed -> Type Application |
| (lambda)-abstraction / substitution | Binder Seed -> Substitution Term |
| Evaluation contexts & values | Seed Evaluation Context -> Recognize Value |
| Typing rules | Seed Judgement Triad -> Flow Judgement |
| Preservation & progress | Sound Syntax, Preserve Typing, Progress Typing |

This reinterpretation means future texts can refer to “Theorems 1–6” when
invoking simply-typed lambda calculus behavior inside the relational calculus
rather than re-deriving the witness structure each time.


---

<!-- source: archive/triage/relationality/domains/relationality-slop-2025-04/domains/external/relational-simply-typed-lambda-calculus.md -->

## Imported source: archive/triage/relationality/domains/relationality-slop-2025-04/domains/external/relational-simply-typed-lambda-calculus.md

---
title: Relational Simply-Typed Lambda calculus
aliases:
  - Relational simply-typed Lambda calculus
date-created: "2026-03-04T00:00:00"
tags:
  - text
  - lambda
  - term
depends_on:
  - theorem/internal/simply-typed-lambda-structure
operations:
  - name: abstraction
  - name: application
  - name: typing judgement
---

# Theorem (Relational Simply-Typed Lambda Calculus)

The simply-typed λ-calculus (STLC) can be realised entirely inside the relational
calculus.  Theorems below indicate which acts implement the familiar formation
rules, substitution principles, and evaluation contexts.

## Trace prerequisites

The trace and head/tail machinery—running from
[Recognizing](../../acts/recognition.md) through
[Retrace Context](../../acts/retrace-context.md)—supplies the sequencing structure
we rely on implicitly.  We treat them as the “context management layer” for the
theorems that follow.

## Term and type formation

**Theorem 1 (Term constructors).**  
Acts [Equate Eventually](../../acts/equate-eventually.md) through
[Form Application Term](../../acts/form-application-term.md) generate all
STLC term constructors: variables, abstractions, applications, and the fixpoint
schemes.

*Proof.* Each act matches a standard rule: the stretch from
[Equate Eventually](../../acts/equate-eventually.md) through
[Form Term Body](../../acts/form-term-body.md) handles variables/bodies,
[Form Function Term](../../acts/form-function-term.md) through
[Form Application Term](../../acts/form-application-term.md) introduces functions
and applications, while
[Pair Least Fix](../../acts/pair-least-fix.md) through
[Form Greatest Fix Term](../../acts/form-greatest-fix-term.md) provide the
least/greatest fixpoints.  Their proofs show how the trace witnesses assemble
them, so every STLC constructor is earned. ∎

**Theorem 2 (Type formation).**  
[Type Seed](../../acts/type-seed.md),
[Type Variable](../../acts/type-variable.md), and
[Type Application](../../acts/type-application.md) mirror the term acts,
ensuring each syntactic constructor has a typing counterpart.

*Proof.* The acts reuse the trace/term machinery but interpret it through the
judgement stratum, thereby producing the inductive type rules usual in STLC. ∎

## Abstraction, substitution, and evaluation

**Theorem 3 (Binders and substitution).**  
Acts [Binder Seed](../../acts/binder-seed.md),
[Binder Transport](../../acts/binder-transport.md),
[Binder Application](../../acts/binder-application.md), and
[Substitution Term](../../acts/substitution-term.md) implement λ-abstraction
and capture-avoiding substitution.

*Proof.* These acts explicitly witness how binders transport along the trace and
how substitutions re-enter evaluation contexts, matching the β-rule behavior of
STLC. ∎

**Theorem 4 (Evaluation contexts and values).**  
[Seed Evaluation Context](../../acts/seed-evaluation-context.md),
[Build Evaluation Context](../../acts/build-evaluation-context.md),
[Seed Value](../../acts/seed-value.md), and
[Recognize Value](../../acts/recognize-value.md) define evaluation frames
and the notion of value.

*Proof.* The evaluation acts show how contexts are extended and how values are
recognized at the head of the trace.  Together they yield the call-by-value
operational structure. ∎

## Typing, preservation, and semantics

The judgement-triad family (from
[Seed Judgement Triad](../../acts/seed-judgement-triad.md) through
[Witness Judgement Equivalence](../../acts/witness-judgement-equivalence.md)) and
the semantics/Heyting algebra acts (beginning with
[Ordering Recognition](../../acts/order-recognition.md)) ensure the standard
metatheory.

- **Theorem 5 (Typing judgments).**  
  [Seed Judgement Triad](../../acts/seed-judgement-triad.md) through
  [Flow Judgement](../../acts/flow-judgement.md) encode Γ ⊢ t : A rules.
- **Theorem 6 (Soundness).**  
  Acts [Sound Syntax](../../acts/sound-syntax.md) and
  [Preserve Typing](../../acts/preserve-typing.md) guarantee preservation,
  while [Progress Typing](../../acts/progress-typing.md) yields progress.

*Proof sketches.* Each act’s proof explicitly states how the relational trace
aligns with the standard typing/evaluation semantics; we cite them directly. ∎

## Mapping summary

| STLC concept | Relational act(s) |
| ------------ | ----------------- |
| Term constructors | Equate Eventually -> Form Greatest Fix Term |
| Type constructors | Type Seed -> Type Application |
| λ-abstraction / substitution | Binder Seed -> Substitution Term |
| Evaluation contexts & values | Seed Evaluation Context -> Recognize Value |
| Typing rules | Seed Judgement Triad -> Flow Judgement |
| Preservation & progress | Sound Syntax, Preserve Typing, Progress Typing |

This reinterpretation means future texts can refer to “Theorems 1–6” when
invoking STLC behavior inside the relational calculus rather than re-deriving
the witness structure each time.
