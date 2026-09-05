---
title: Relational Simply-Typed Lambda calculus
aliases:
  - Relational simply-typed Lambda calculus
tags:
  - text
  - lambda
  - term
depends-on:
  - theorem/internal/simply-typed-lambda-structure
operations:
  - name: abstraction
  - name: application
  - name: typing judgement
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Relational Simply-Typed Lambda Calculus)

The simply-typed λ-calculus (STLC) can be realised entirely inside the relational
calculus.  Theorems below indicate which acts implement the familiar formation
rules, substitution principles, and evaluation contexts.

## Trace prerequisites

The trace and head/tail machinery—running from
Recognizing through
Retrace Context—supplies the sequencing structure
we rely on implicitly.  We treat them as the “context management layer” for the
theorems that follow.

## Term and type formation

**Theorem 1 (Term constructors).**  
Acts Equate Eventually through
Form Application Term generate all
STLC term constructors: variables, abstractions, applications, and the fixpoint
schemes.

*Proof.* Each act matches a standard rule: the stretch from
Equate Eventually through
Form Term Body handles variables/bodies,
Form Function Term through
Form Application Term introduces functions
and applications, while
Pair Least Fix through
Form Greatest Fix Term provide the
least/greatest fixpoints.  Their proofs show how the trace witnesses assemble
them, so every STLC constructor is earned. ∎

**Theorem 2 (Type formation).**  
Type Seed,
Type Variable, and
Type Application mirror the term acts,
ensuring each syntactic constructor has a typing counterpart.

*Proof.* The acts reuse the trace/term machinery but interpret it through the
judgement stratum, thereby producing the inductive type rules usual in STLC. ∎

## Abstraction, substitution, and evaluation

**Theorem 3 (Binders and substitution).**  
Acts Binder Seed,
Binder Transport,
Binder Application, and
Substitution Term implement λ-abstraction
and capture-avoiding substitution.

*Proof.* These acts explicitly witness how binders transport along the trace and
how substitutions re-enter evaluation contexts, matching the β-rule behavior of
STLC. ∎

**Theorem 4 (Evaluation contexts and values).**  
Seed Evaluation Context,
Build Evaluation Context,
Seed Value, and
Recognize Value define evaluation frames
and the notion of value.

*Proof.* The evaluation acts show how contexts are extended and how values are
recognized at the head of the trace.  Together they yield the call-by-value
operational structure. ∎

## Typing, preservation, and semantics

The judgement-triad family (from
Seed Judgement Triad through
Witness Judgement Equivalence) and
the semantics/Heyting algebra acts (beginning with
Ordering Recognition) ensure the standard
metatheory.

- **Theorem 5 (Typing judgments).**  
  Seed Judgement Triad through
  Flow Judgement encode Γ ⊢ t : A rules.
- **Theorem 6 (Soundness).**  
  Acts Sound Syntax and
  Preserve Typing guarantee preservation,
  while Progress Typing yields progress.

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
