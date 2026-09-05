---
title: Relational Simply-Typed Lambda calculus
aliases:
  - Relational simply-typed Lambda calculus
date-created: "2026-03-04T00:00:00"
keywords:
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
[Recognizing](../../../relationality-2/ai-generated-relationality/relationality-slop-2026-03-04/phenomena/recognition.md) through
[Retrace Context](../../../../documents/articles/notes/retrace-context.md)—supplies the sequencing structure
we rely on implicitly.  We treat them as the “context management layer” for the
theorems that follow.

## Term and type formation

**Theorem 1 (Term constructors).**
Acts [Equate Eventually](../../../../documents/articles/notes/equate-eventually.md) through
[Form Application Term](../../../../documents/articles/notes/form-application-term.md) generate all
STLC term constructors: variables, abstractions, applications, and the fixpoint
schemes.

*Proof.* Each act matches a standard rule: the stretch from
[Equate Eventually](../../../../documents/articles/notes/equate-eventually.md) through
[Form Term Body](../../../../documents/articles/notes/form-term-body.md) handles variables/bodies,
[Form Function Term](../../../../documents/articles/notes/form-function-term.md) through
[Form Application Term](../../../../documents/articles/notes/form-application-term.md) introduces functions
and applications, while
[Pair Least Fix](../../../../documents/articles/notes/pair-least-fix.md) through
[Form Greatest Fix Term](../../../../documents/articles/notes/form-greatest-fix-term.md) provide the
least/greatest fixpoints.  Their proofs show how the trace witnesses assemble
them, so every STLC constructor is earned. ∎

**Theorem 2 (Type formation).**
[Type Seed](../../../../documents/articles/notes/type-seed.md),
[Type Variable](../../../../documents/articles/notes/type-variable.md), and
[Type Application](../../../../documents/articles/notes/type-application.md) mirror the term acts,
ensuring each syntactic constructor has a typing counterpart.

*Proof.* The acts reuse the trace/term machinery but interpret it through the
judgement stratum, thereby producing the inductive type rules usual in STLC. ∎

## Abstraction, substitution, and evaluation

**Theorem 3 (Binders and substitution).**
Acts [Binder Seed](../../../../documents/articles/notes/binder-seed.md),
[Binder Transport](../../../../documents/articles/notes/binder-transport.md),
[Binder Application](../../../../documents/articles/notes/binder-application.md), and
[Substitution Term](../../../../documents/articles/notes/substitution-term.md) implement λ-abstraction
and capture-avoiding substitution.

*Proof.* These acts explicitly witness how binders transport along the trace and
how substitutions re-enter evaluation contexts, matching the β-rule behavior of
STLC. ∎

**Theorem 4 (Evaluation contexts and values).**
[Seed Evaluation Context](../../../../documents/articles/notes/seed-evaluation-context.md),
[Build Evaluation Context](../../../../documents/articles/notes/build-evaluation-context.md),
[Seed Value](../../../../documents/articles/notes/seed-value.md), and
[Recognize Value](../../../../documents/articles/notes/recognize-value.md) define evaluation frames
and the notion of value.

*Proof.* The evaluation acts show how contexts are extended and how values are
recognized at the head of the trace.  Together they yield the call-by-value
operational structure. ∎

## Typing, preservation, and semantics

The judgement-triad family (from
[Seed Judgement Triad](../../../../documents/articles/notes/seed-judgement-triad.md) through
[Witness Judgement Equivalence](../../../../documents/articles/notes/witness-judgement-equivalence.md)) and
the semantics/Heyting algebra acts (beginning with
[Ordering Recognition](../../../../documents/articles/notes/order-recognition.md)) ensure the standard
metatheory.

- **Theorem 5 (Typing judgments).**
  [Seed Judgement Triad](../../../../documents/articles/notes/seed-judgement-triad.md) through
  [Flow Judgement](../../../../documents/articles/notes/flow-judgement.md) encode Γ ⊢ t : A rules.
- **Theorem 6 (Soundness).**
  Acts [Sound Syntax](../../../../documents/articles/notes/sound-syntax.md) and
  [Preserve Typing](../../../../documents/articles/notes/preserve-typing.md) guarantee preservation,
  while [Progress Typing](../../../../documents/articles/notes/progress-typing.md) yields progress.

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
