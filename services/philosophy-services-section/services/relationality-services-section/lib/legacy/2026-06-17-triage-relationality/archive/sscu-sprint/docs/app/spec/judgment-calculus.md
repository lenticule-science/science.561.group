---
title: Judgment Calculus Simulation
tags:
  - simulation
  - judgment-calculus
  - lambda
layer: spec
status: plan
depends-on:
  - theorem/internal/judgment-calculus-term-structure
  - theorem/internal/judgment-calculus-type-structure
  - theorem/internal/judgment-calculus-binders-substitution
  - theorem/internal/judgment-calculus-evaluation-structure
  - theorem/internal/judgment-calculus-typing-judgements
  - theorem/internal/judgment-calculus-soundness
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Instantiates the internal judgment calculus theorems with concrete carriers and operators for terms, types, and evaluation."# Judgment Calculus Simulation

This specification instantiates the internal judgment calculus theorems inside
the relational computer. It fixes concrete carriers and operators for terms,
types, contexts, typing judgements, substitution, and evaluation, without
changing their mathematical behaviour.

## 1. Types (syntax and contexts)

- **Term carrier (`Term`).**  
  A concrete carrier for terms realising **Theorem (Judgment Calculus Term
  Structure)**. Its constructors correspond exactly to the earned term
  constructors (variables, abstractions, applications, and any additional
  constructors justified by acts).

- **Type carrier (`Type`).**  
  A concrete carrier for types realising **Theorem (Judgment Calculus Type
  Structure)** (base types, function types, and any recorded type-formers).

- **Context carrier (`Context`).**  
  A concrete carrier for contexts as in **Theorem (Judgment Calculus Typing
  Judgements)**: finite sequences of `(variable, Type)` pairs. It must support
  extension, lookup, and restriction operations compatible with the internal
  theorems.

- **Judgement carrier (`Judgement`).**  
  A concrete representation of typing judgements `Γ ⊢ t : A` and evaluation
  judgements, sufficient to encode the rules from the internal theorems.

## 2. Operators (typing, evaluation, substitution)

Implementations must provide operators corresponding to the internal judgment
calculus theorems.

- **Typing operator.**  
  A function
  ```text
  type_of : Context × Term ⇀ Type
  ```

  that realises **Theorem (Judgment Calculus Typing Judgements)** over the
  concrete carriers:

  - variable rule from context lookup,
  - abstraction and application rules as specified,
  - any additional rules justified by the internal term/type theorems.

- **Evaluation operators.**  
  Operators that realise **Theorem (Judgment Calculus Evaluation Structure)**
  and agree with the evaluation engine:

  - a primitive step relation on terms,
  - a lifted step operator on the canonical evaluation state carrier

    ```text
    EvalState ⊆ Frame × Term
    step      : EvalState ⇀ EvalState
    ```

    as required by **Theorem (Evaluation Engine Structure)**, where `Frame`
    is the evaluation‑context carrier, and
  - a normalisation operator

    ```text
    norm : EvalState ⇀ EvalState
    ```

    that corresponds to the earned normalization
    theorems for the judgment calculus fragment.

- **Substitution operator.**  
  An operator

  ```text
  substitute : Term × Variable × Term → Term
  ```

  realising **Theorem (Judgment Calculus Binders and Substitution)**:
  capture-avoiding, compatible with the typing rules, and aligned with the
  substitution discipline.

## 3. Invariants

The following invariants must hold for the concrete implementation:

- **Subject reduction.**  
  As in **Theorem (Judgment Calculus Soundness)**: if `Γ ⊢ t : A` and `t`
  reduces to `t'` under the earned evaluation relation, then `Γ ⊢ t' : A`.

- **Progress.**  
  Every closed, well-typed term is either a value or reduces.

- **Normalization for the earned fragment.**  
  For terms in the strongly normalizing fragment singled out by the internal
  normalization theorems, iterated evaluation must terminate in a value.

These invariants are the contract that higher-level specifications, such as
the simply-typed lambda calculus correspondence, rely on when they treat the
judgment calculus as an executable core.
