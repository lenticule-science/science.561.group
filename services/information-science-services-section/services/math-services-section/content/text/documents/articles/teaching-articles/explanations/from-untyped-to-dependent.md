---
type: explanation
article-kind: narrative
status: current
depends-on: [untyped-lambda-calculus, simply-typed-lambda-calculus, dependent-type-theory]
title: From the untyped lambda calculus to dependent types
description: This narrative orders the directory's calculi in the historical and conceptual sequence Church → Curry → Howard → Martin-Löf, in three movements.
---

# From the untyped lambda calculus to dependent types

This narrative orders the directory's calculi in the historical and conceptual sequence Church → Curry → Howard → Martin-Löf, in three movements.

## 1. The untyped calculus (Church, 1932)

[Church 1940](../../bibliographies/church1940.md) introduced the [untyped-lambda-calculus](../../../../glossary/terms/untyped-lambda-calculus.md) as a foundation for logic (an alternative to set theory). The calculus is maximally expressive: every Turing-computable function is representable, every recursive scheme is encodable via the [y-combinator-untyped](../examples/y-combinator-untyped.md), every concrete data structure is encodable as a function ([church-numerals-untyped](../examples/church-numerals-untyped.md)). The cost is *non-termination*: $(\lambda x.\,x\;x)\;(\lambda x.\,x\;x)$ has no [normal form](../../../../glossary/terms/normalization.md), and the original logical foundation was inconsistent for related reasons.

The key results — [church-rosser](../../research-articles/church-rosser.md) confluence, the absence of normalization — establish what the untyped calculus is and what it cannot be.

## 2. Adding types (Church 1940, Curry 1958)

Church's response to the inconsistency was to *add types*: every term has a type, and the type system rules out self-application before reduction begins. The [simply-typed-lambda-calculus](../../../../glossary/terms/simply-typed-lambda-calculus.md) is the result. The trade is severe — STLC is not Turing-complete, the [y-combinator-untyped](../examples/y-combinator-untyped.md) has no STLC type — but the gain is decisive: [strong normalization](../../research-articles/strong-normalization-stlc.md), [decidable type-checking](../../../../glossary/terms/type-checking.md), [principal types](../../research-articles/principal-typing-stlc.md), [subject reduction](../../research-articles/subject-reduction.md), and [progress](../../research-articles/progress.md).

Curry observed (in the 1950s) that the typing rules of STLC look exactly like the inference rules of intuitionistic propositional natural deduction. Howard made this precise in 1969: it *is* the same system. The [curry-howard-correspondence](../../research-articles/curry-howard-correspondence.md) is the load-bearing semantic claim of the entire field.

## 3. Dependent types (Martin-Löf, 1970s–1984)

The Curry-Howard correspondence on STLC bottoms out at *propositional* logic. To handle quantifiers — $\forall x.\,P(x)$ and $\exists x.\,P(x)$ — types must be allowed to *depend on values*. [Martin-Löf 1984](../../bibliographies/martin-lof1984.md) introduced [dependent-type-theory](../../../../glossary/terms/dependent-type-theory.md), with the [pi-type](../../../../glossary/terms/pi-type.md) for $\forall$ and the [sigma-type](../../../../glossary/terms/sigma-type.md) for $\exists$. The [identity-type](../../../../glossary/terms/identity-type.md) handles equality; the [universe](../../../../glossary/terms/universe.md) hierarchy handles types-as-data.

This is the foundation every modern proof assistant — Lean, Agda, Coq, Idris — implements. The 2010s extension to homotopy type theory ([Univalent Foundations Program 2013](../../bibliographies/univalent-foundations2013.md), [univalence-axiom](../../../../glossary/terms/univalence-axiom.md)) is the most recent major movement.

The arc is unidirectional: each calculus *contains* the previous one as a fragment, and each adds expressive power at the cost of structural complexity. The directory's examples walk the arc concretely, and the narrative [types-as-the-grammar-of-meaning](./types-as-the-grammar-of-meaning.md) extracts the philosophical point.
