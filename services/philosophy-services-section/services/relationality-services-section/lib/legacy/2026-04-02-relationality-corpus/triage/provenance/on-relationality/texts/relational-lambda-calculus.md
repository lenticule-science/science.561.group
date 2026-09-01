---

name: relational-lambda-calculus
keywords:
  - text
  - lambda
  - term
strata:
  - trace
  - term
  - judgement
---

The simply-typed λ-calculus (STLC) can be realised entirely inside the relational
calculus.  Theorems below indicate which acts implement the familiar formation
rules, substitution principles, and evaluation contexts.

## Trace prerequisites

The trace and head/tail machinery—running from
[Recognizing](../acts/recognition.md) through
[Retrace Context](../acts/retrace-context.md)—supplies the sequencing structure
we rely on implicitly.  We treat them as the “context management layer” for the
theorems that follow.

## Term and type formation

**Theorem 1 (Term constructors).**  
Acts [Equate Eventually](../acts/equate-eventually.md) through
[Form Application Term](../acts/form-application-term.md) generate all
STLC term constructors: variables, abstractions, applications, and the fixpoint
schemes.

*Proof.* Each act matches a standard rule: the stretch from
[Equate Eventually](../acts/equate-eventually.md) through
[Form Term Body](../acts/form-term-body.md) handles variables/bodies,
[Form Function Term](../acts/form-function-term.md) through
[Form Application Term](../acts/form-application-term.md) introduces functions
and applications, while
[Pair Least Fix](../acts/pair-least-fix.md) through
[Form Greatest Fix Term](../acts/form-greatest-fix-term.md) provide the
least/greatest fixpoints.  Their proofs show how the trace witnesses assemble
them, so every STLC constructor is earned. ∎

**Theorem 2 (Type formation).**  
[Type Seed](../acts/type-seed.md),
[Type Variable](../acts/type-variable.md), and
[Type Application](../acts/type-application.md) mirror the term acts,
ensuring each syntactic constructor has a typing counterpart.

*Proof.* The acts reuse the trace/term machinery but interpret it through the
judgement stratum, thereby producing the inductive type rules usual in STLC. ∎

## Abstraction, substitution, and evaluation

**Theorem 3 (Binders and substitution).**  
Acts [Binder Seed](../acts/binder-seed.md),
[Binder Transport](../acts/binder-transport.md),
[Binder Application](../acts/binder-application.md), and
[Substitution Term](../acts/substitution-term.md) implement λ-abstraction
and capture-avoiding substitution.

*Proof.* These acts explicitly witness how binders transport along the trace and
how substitutions re-enter evaluation contexts, matching the β-rule behavior of
STLC. ∎

**Theorem 4 (Evaluation contexts and values).**  
[Seed Evaluation Context](../acts/seed-evaluation-context.md),
[Build Evaluation Context](../acts/build-evaluation-context.md),
[Seed Value](../acts/seed-value.md), and
[Recognize Value](../acts/recognize-value.md) define evaluation frames
and the notion of value.

*Proof.* The evaluation acts show how contexts are extended and how values are
recognized at the head of the trace.  Together they yield the call-by-value
operational structure. ∎

## Typing, preservation, and semantics

The judgement-triad family (from
[Seed Judgement Triad](../acts/seed-judgement-triad.md) through
[Witness Judgement Equivalence](../acts/witness-judgement-equivalence.md)) and
the semantics/Heyting algebra acts (beginning with
[Ordering Recognition](../acts/order-recognition.md)) ensure the standard
metatheory.

- **Theorem 5 (Typing judgments).**  
  [Seed Judgement Triad](../acts/seed-judgement-triad.md) through
  [Flow Judgement](../acts/flow-judgement.md) encode Γ ⊢ t : A rules.
- **Theorem 6 (Soundness).**  
  Acts [Sound Syntax](../acts/sound-syntax.md) and
  [Preserve Typing](../acts/preserve-typing.md) guarantee preservation,
  while [Progress Typing](../acts/progress-typing.md) yields progress.

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
