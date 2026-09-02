---
title: Simply-Typed Lambda Simulation
tags:
  - simulation
  - lambda
  - typing
depends_on:
  - theorem/external/relational-simply-typed-lambda-calculus
---
# Specification (Simply-Typed Lambda Simulation)

This specification realises **Theorem (Relational Simply-Typed Lambda Calculus)**
inside an executable evaluator.  It details the syntax, typing, substitution,
and evaluation rules that must be supported.

## State representation

- **Term ASTs.**  
  Grammar mirroring the earned constructs:
  ```
  t ::= x | λx:A. t | t u | fixleast x:A. t | fixgreatest x:A. t
  ```
  Additional constructors can be added as needed, provided they are backed by the
  corresponding acts.

- **Type ASTs.**  
  Types include base atoms, function types `A -> B`, and any fixpoint/type-former
  recorded in the theorem (greatest/least fixpoints).

- **Contexts.**  
  Finite sequences of `(variable, type)` pairs.  Context extension/restriction is
  implemented via stack operations respecting `SeedEvaluationContext` and
  `BuildEvaluationContext`.

## Inputs

1. Source terms annotated with type hints (optional).
2. Typing environment specifying the available base types/constants.
3. Evaluation strategy parameters (call-by-value or call-by-name, as chosen).

## Procedures

### Typing

Implement a syntax-directed typing judgement `Γ ⊢ t : A` matching the theorems:

- Variable rule from context lookup.
- Abstraction/application rules reflecting `BinderSeed`, `BinderTransport`, and
  `BinderApplication`.
- Fixpoint typing rules for least/greatest fixpoints.
- Structural rules (weakening, substitution) as captured by
  `SubstitutionTerm` and `SubstituteReducibility`.

Typing must be decidable; report precise errors when judgements fail.

### Evaluation

Chosen reduction strategy must respect the relational acts:

1. **Beta reduction.**  
   `(λx:A. t) v  ->  t[x := v]`.
2. **Fixpoint unfolding.**  
   Respect the semantics of least/greatest fixpoints by unfolding according to
   the earned acts.
3. **Context propagation.**  
   Evaluation contexts are built using `BuildEvaluationContext`; implement
   frames accordingly.

Ensure the interpreter halts exactly when the `NormalizeStrongly` theorem
predicts (i.e., when terms are strongly normalising).

### Substitution

Implement capture-avoiding substitution following `SubstitutionTerm`.  Maintain
de Bruijn indices or alpha-renaming to avoid variable capture.

## Invariants

- Subject reduction: if `Γ ⊢ t : A` and `t -> t'`, then `Γ ⊢ t' : A`.
- Progress: every well-typed closed term is a value or reduces.
- Normalisation: strongly normalising terms must eventually reduce to values.
- Context consistency: evaluation contexts should mirror the declarative
  counterparts; log violations.

## Outputs

- Evaluation traces (sequence of reductions).
- Typed ASTs with inferred types.
- Diagnostics for invariant failures (e.g., subject reduction counterexamples).
