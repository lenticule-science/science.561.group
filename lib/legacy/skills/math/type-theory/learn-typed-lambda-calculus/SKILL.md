---
name: learn-typed-lambda-calculus
description: Learn the simply typed lambda calculus — typing rules, beta-reduction, the Curry–Howard correspondence between types and propositions.
---

# Learn Typed Lambda Calculus

A formal system of typed expressions where every well-formed term has a type, computation proceeds by beta-reduction, and types correspond to propositions under the Curry–Howard isomorphism. Termination is guaranteed in the simply-typed setting; self-application is excluded.

## What you will be able to do

- Given a lambda expression, identify its parts (variables, abstractions, applications) and perform beta-reduction step by step.
- Given a typing context and a lambda term, derive the term's type using the typing rules (variable, abstraction, application, pairing, projection) — or explain why the term is ill-typed.
- Explain why the simply typed lambda calculus prevents self-application (e.g., $\lambda x.\, x\,x$ has no type) and guarantees termination.
- State the Curry–Howard correspondence: types are propositions, terms are proofs, beta-reduction is proof normalization. Given a type, identify the corresponding logical proposition; given a proposition, write a term that inhabits the corresponding type.

## Prerequisites

None strict. Comfort with formal notation (inference rules, Greek letters, subscripts) helps. Readers who have programmed in any language with first-class functions will find the intuitions familiar.

## Reference

- `library/theories/humanities/theories/math/theories/type-theory/` — the type-theory domain.

## Verification

1. Write the type of the composition function: given $f : A \to B$ and $g : B \to C$, what is the type of $\lambda x.\, g\,(f\,x)$? Derive it step by step using the typing rules.
2. Explain why $\lambda x.\, x\,x$ cannot be typed in the simply typed lambda calculus. What equation would its type have to satisfy?
3. State the logical proposition corresponding to the type $A \to (B \to A)$ and write a term inhabiting it.

## Scope

This covers the simply typed lambda calculus (STLC) with base types, function types, and product types. It does not cover:

- Polymorphism (System F, dependent types) — significant extensions where types abstract over types.
- Recursive types or general recursion — STLC has no fixed-point combinator and guarantees termination.
- Category-theoretic semantics (cartesian closed categories) — STLC is the internal language of a cartesian closed category, but the connection isn't developed here.
- Implementation of type checkers or evaluators.
