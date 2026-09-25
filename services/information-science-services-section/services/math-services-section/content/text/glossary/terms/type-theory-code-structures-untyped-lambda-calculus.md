---
type: definition
class: calculus
status: current
depends-on: [lambda-term, beta-reduction, alpha-equivalence]
realizes: [beta-reduction, normalization, confluence]
symbol: \Lambda
title: Untyped lambda calculus
description: "The untyped lambda calculus $\\Lambda$ is the formal system whose terms are lambda-terms modulo alpha-equivalence, with one computation rule, beta-reduction:"
---

# Untyped lambda calculus

The **untyped lambda calculus** $\Lambda$ is the formal system whose terms are [lambda-terms](lambda-term.md) modulo [alpha-equivalence](alpha-equivalence.md), with one computation rule, [beta-reduction](beta-reduction.md):

$$
(\lambda x.\,M)\;N \;\longrightarrow_\beta\; M[N/x].
$$

Introduced by Church in the 1930s as a formal language for computation.

## Structure

- **Terms**: variables, abstractions, applications.
- **Rewrite relation**: $\to_\beta$, with the obvious congruence closure under abstractions and applications.
- **Equivalence**: $=_\beta$, the reflexive-transitive-symmetric closure of $\to_\beta$.

The calculus is *Turing-complete*: every computable function is representable as a closed lambda term, and every recursive scheme is encodable via the [y-combinator-untyped](../../documents/articles/teaching-articles/examples/y-combinator-untyped.md). Concrete data — booleans, naturals, pairs, lists — are encoded as functions ([church-numerals-untyped](../../documents/articles/teaching-articles/examples/church-numerals-untyped.md)).

## What this is not

The untyped λ-calculus is *not* a programming language — it has no I/O, no runtime, no concrete data types built in. It is also *not* normalizing: $\Omega = (\lambda x.\,x\;x)\;(\lambda x.\,x\;x)$ reduces only to itself.

## Position

The untyped calculus is confluent ([church-rosser](../../documents/articles/research-articles/church-rosser.md)) but not normalizing — the price of full Turing-completeness. The [simply-typed-lambda-calculus](../../documents/articles/research/2026/07/31/lenticule-import/_archive/simply-typed-lambda-calculus.md) is obtained by adding types and rejecting any term without a typing derivation; this trades expressivity for [strong normalization](../../documents/articles/research-articles/strong-normalization-stlc.md). Reference: [Church 1940](../../documents/articles/bibliographies/church1940.md), [Barendregt 1984](../../documents/articles/research/2026/07/31/lenticule-import/_archive/references/barendregt1984.md), [Hindley 2008](../../documents/articles/bibliographies/hindley2008.md).
