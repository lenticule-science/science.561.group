---
title: Simply-Typed Lambda Calculus Correspondence
keywords:
  - simulation
  - lambda
  - typing
layer: spec
status: plan
depends_on:
  - specifications/judgment-calculus
  - theorem/internal/evaluation-context-structure
  - theorem/internal/evaluation-engine
  - theorem/internal/normalization-reducibility
  - theorem/external/relational-simply-typed-lambda-calculus
---
# Simply-Typed Lambda Calculus Correspondence

This specification treats the internal judgment calculus as the executable
core (via **Specification (Judgment Calculus Simulation)**) and realises
**Theorem (Relational Simply-Typed Lambda Calculus)** as an external
correspondence. It fixes how simply-typed lambda calculus terms and types are
encoded into the judgment calculus carriers and how their typing and
evaluation correspond to external simply-typed lambda calculus behaviour; it
does not introduce an independent computation model.

## 1. Types (syntax and contexts)

- **Term ASTs.**  
  A concrete carrier implementing **Theorem (Judgment Calculus Term Structure)**. The
  grammar must match the earned term constructors:
  ```
  t ::= x | (lambda)x:A. t | t u | fixleast x:A. t | fixgreatest x:A. t
  ```
  Additional constructors can be added as needed, provided they are backed by the
  corresponding acts.

- **Type ASTs.**  
  A concrete carrier implementing **Theorem (Judgment Calculus Type Structure)**. Types
  include base atoms, function types `A -> B`, and any fixpoint/type-former
  recorded in the theorem (least/greatest fixpoints).

- **Contexts.**  
  A concrete carrier for the context components used in **Theorem (Judgment Calculus Typing
  Judgements)** and **Theorem (Judgment Calculus Evaluation Structure)**: finite sequences of
  `(variable, type)` pairs. Context extension/restriction is implemented via
  stack operations that respect the earned evaluation-context structure.

## 2. Types (evaluation contexts and states)

- **Evaluation frames (`Frame`).**  
  A concrete type implementing the `Frame` component of
  **Theorem (Evaluation Context Structure)** and its operators:
  - represents a single-hole context with surrounding trace/recognition state,
  - supports a `plug(frame, term) -> term` operation whose behaviour matches
    the theorem’s `plug`.

- **Evaluation state (`EvalState`).**  
  This correspondence does **not** introduce a new evaluation state; it reuses
  the carrier from **Specification (Judgment Calculus Simulation)** and
  **Theorem (Evaluation Engine Structure)**:

  ```text
  EvalState ⊆ Frame × Term
  ```

  In the simply-typed lambda calculus correspondence we restrict attention to
  the subset of `EvalState` whose `Term` component lies in the
  simply-typed lambda fragment embedded into the judgment calculus. Whole
  programs are reconstructed from `(Frame, Term)` via `plug` as in the
  evaluation-context structure.

## 3. Inputs

1. Source terms annotated with type hints (optional).
2. Typing environment specifying the available base types/constants.
3. Evaluation strategy parameters (call-by-value or call-by-name, as chosen).

## 4. Procedures

### Typing

Implement a syntax-directed typing judgement `Γ ⊢ t : A` realising **Theorem
(Judgment Calculus Typing Judgements)** over the concrete carriers:

- Variable rule from context lookup.
- Abstraction/application rules reflecting `BinderSeed`, `BinderTransport`, and
  `BinderApplication`.
- Fixpoint typing rules for least/greatest fixpoints.
- Structural rules (weakening, substitution) as captured by
  `SubstitutionTerm` and `SubstituteReducibility`.

Typing must be decidable; report precise errors when judgements fail.

### Evaluation

Chosen reduction strategy must realise **Theorem (Judgment Calculus Evaluation Structure)**,
**Theorem (Evaluation Context Structure)**, and **Theorem (Evaluation Engine Structure)**
over the concrete carriers and respect the earned relational acts:

1. **Step function.**  
   Implement a function

   ```text
   step : EvalState ⇀ EvalState
   ```

   such that, whenever `step` is defined:
   - the primitive reduction step is applied to the focused term,
   - substitution is used to obtain the new term,
   - the surrounding frame is preserved or transformed according to the
     evaluation-context structure.

2. **Normalisation map.**  
   Implement a partial function

   ```text
   norm : EvalState ⇀ EvalState
   ```

   that iterates `step` and selects a normal state when the normalization
   theorems guarantee termination, agreeing with the abstract `norm` operator
   from the evaluation-engine theorem.

3. **Context propagation.**  
   Evaluation contexts are built using the earned acts (`SeedEvaluationContext`,
   `BuildEvaluationContext`); frame operations in code must reflect the
   theorem’s `plug`, `empty`, and `compose`.

Ensure the interpreter halts exactly when the strong-normalization component of
**Theorem (Normalization and Reducibility)** predicts (i.e., precisely for those
terms earned as strongly normalising via `NormalizeStrongly`).

### Substitution

Implement capture-avoiding substitution following `SubstitutionTerm`, realising
**Theorem (Judgment Calculus Binders and Substitution)**. Maintain de Bruijn indices or
alpha-renaming to avoid variable capture.

## 5. Invariants

- Subject reduction, as earned by **Theorem (Judgment Calculus Soundness)**: if
  `Γ ⊢ t : A` and `t -> t'`, then `Γ ⊢ t' : A`.
- Progress, as earned by **Theorem (Judgment Calculus Soundness)**: every well-typed closed
  term is a value or reduces.
- Normalisation, as earned by **Theorem (Normalization and Reducibility)**:
  strongly normalising terms must eventually reduce to values.
- Context consistency: evaluation contexts should mirror the declarative
  counterparts; log violations.

## 6. Outputs

- Evaluation traces (sequence of reductions).
- Typed ASTs with inferred types.
- Diagnostics for invariant failures (e.g., subject reduction counterexamples).
