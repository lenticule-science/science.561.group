---
name: learn-typed-lambda-calculus
id: learn-typed-lambda-calculus
description: >-
  Given a lambda term and a typing context, determine its type or show it is
  ill-typed; perform beta-reduction on well-typed terms; state the
  Curry-Howard correspondence between types and propositions.
date-created: 2026-03-04
type: skill
keywords:
  - TypeTheory
  - LambdaCalculus
part-of: mathematics/disciplines/type-theory
region:
  reads: ["content/mathematics/disciplines/type-theory/"]
  writes: ["content/mathematics/disciplines/type-theory/"]
---

# Learn Typed Lambda Calculus

## What you will be able to do

- Given a lambda expression, identify its parts (variables, abstractions, applications) and perform beta-reduction step by step.
- Given a typing context and a lambda term, derive the term's type using the typing rules (variable, abstraction, application, pairing, projection) or explain why the term is ill-typed.
- Explain why the simply [typed lambda calculus](../../curricula/typed-lambda-calculus.md) prevents self-application and guarantees termination, and why these properties matter for the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe's syntactic layer.
- State the Curry-Howard correspondence: types are propositions, terms are proofs, beta-reduction is proof normalization. Given a type, identify the corresponding logical proposition, and vice versa.

## Prerequisites

None. This skill is a starting point in the curriculum dependency graph.

The [typed lambda calculus](../../curricula/typed-lambda-calculus.md) lesson uses formal notation (inference rules, Greek letters, subscripts). A reader comfortable with the idea that symbols can be defined and manipulated according to rules will be fine. No prior knowledge of logic, type theory, or programming is assumed — though readers who have programmed in a language with first-class functions (Scheme, JavaScript, Python) will find the intuitions familiar.

## Lessons

1. [Untyped Lambda Calculus](../../curricula/untyped-lambda-calculus.md) — concrete-first introduction: the three building blocks (variable, abstraction, application), beta-reduction with worked examples, free and bound variables, Church encodings of booleans and numbers, the Y combinator, normal forms and reduction strategies.

2. [Typed Lambda Calculus](../../curricula/typed-lambda-calculus.md) — the core lesson: adding types to the untyped calculus (base types, function types, product types), typing rules, structural properties, the Curry-Howard correspondence, worked examples.

After completing this skill, the [relational lambda calculus](../../../../relationality/terms/index.md) concept note shows how the same formal system arises from the relationality derivation rather than being stipulated. This is optional but connects the mathematics to emsenn's philosophical project.

## Scope

This skill covers the simply [typed lambda calculus](../../curricula/typed-lambda-calculus.md) (STLC) with base types, function types, and product types. It does not cover:

- **Polymorphism** (System F, dependent types) — a significant extension where types themselves can be abstracted over. Important for Lean and Agda but not required for the [semiotic universe](../../../../objects/universes/semiotic-universe/semiotic-universe.md) specification.
- **Recursive types or general recursion** — the simply typed calculus has no fixed-point combinator and guarantees termination. The relational lambda calculus adds a `fix` operator; that extension is covered in the relationality derivation, not here.
- **Category-theoretic semantics** (cartesian closed categories) — the typed lambda calculus is the internal language of a cartesian closed category, but this skill does not develop that connection.
- **Implementation** — how to build a type checker or evaluator. The anatomy-of-things babble touches on implementation in Scheme, but this skill focuses on the formal system, not on writing code.
- **The [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe's use of typed lambda calculus** — that is covered by `learn-semiotic-universe`, which lists this skill as a prerequisite. This skill provides the lambda calculus; that skill uses it.

## Verification

After completing the typed lambda calculus lesson:

1. Write the type of the composition function: given $f : A \to B$ and $g : B \to C$, what is the type of $\lambda x.\, g\;(f\;x)$? Derive it step by step using the typing rules.
2. Explain why $\lambda x.\, x\;x$ cannot be typed in the simply typed lambda calculus. What equation would its type have to satisfy?
3. State what logical proposition corresponds to the type $A \to (B \to A)$, and write a term that inhabits it.
