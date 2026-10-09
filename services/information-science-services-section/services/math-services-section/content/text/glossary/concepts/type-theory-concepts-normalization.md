---
type: concept
class: rewriting-property
status: current
depends-on: [beta-reduction]
title: Normalization
description: Normalization is the property that beta-reduction terminates.
---

# Normalization

*Normalization* is the property that [beta-reduction](../terms/beta-reduction.md) terminates. A term $M$ is *weakly normalizing* if some reduction sequence starting from $M$ reaches a normal form, and *strongly normalizing* if every reduction sequence does.

A calculus is *normalizing* (resp. *strongly normalizing*) if every well-typed term is weakly (resp. strongly) normalizing. The [untyped-lambda-calculus](../../documents/articles/research/2026/07/31/lenticule-import/objects/untyped-lambda-calculus.md) is neither: $\Omega = (\lambda x.\,x\;x)\;(\lambda x.\,x\;x)$ reduces only to itself. The [simply-typed-lambda-calculus](../../documents/articles/research/2026/07/31/lenticule-import/objects/simply-typed-lambda-calculus.md) and the predicative core of [dependent-type-theory](../terms/dependent-type-theory.md) are strongly normalizing — the [strong-normalization-stlc](../../documents/articles/research-articles/strong-normalization-stlc.md) theorem is the load-bearing result for STLC.

## Position

Normalization is what makes a type theory usable as a *proof system*: a strongly normalizing calculus has decidable [type-checking](../terms/type-checking.md) (run reduction to normal form, then compare), and its [consistency-of-mltt](../../documents/articles/research-articles/consistency-of-mltt.md) follows by an explicit normalization argument rather than by a model-theoretic detour. Loss of normalization is what makes the [y-combinator-untyped](../../documents/articles/teaching-articles/examples/y-combinator-untyped.md) inadmissible in any normalizing typed calculus. Reference: [Barendregt 1984](../../documents/articles/research/2026/07/31/lenticule-import/_archive/references/barendregt1984.md) §3, [Girard, Lafont & Taylor 1989](../../documents/articles/bibliographies/girard-lafont-taylor1989.md) Ch. 6.
