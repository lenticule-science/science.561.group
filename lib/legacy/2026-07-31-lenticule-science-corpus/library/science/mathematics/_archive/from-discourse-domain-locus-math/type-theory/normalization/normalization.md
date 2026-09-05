---
type: concept
class: rewriting-property
status: current
depends-on: [beta-reduction]
---

# Normalization

*Normalization* is the property that [beta-reduction](beta-reduction.md) terminates. A term $M$ is *weakly normalizing* if some reduction sequence starting from $M$ reaches a normal form, and *strongly normalizing* if every reduction sequence does.

A calculus is *normalizing* (resp. *strongly normalizing*) if every well-typed term is weakly (resp. strongly) normalizing. The [untyped-lambda-calculus](../objects/untyped-lambda-calculus.md) is neither: $\Omega = (\lambda x.\,x\;x)\;(\lambda x.\,x\;x)$ reduces only to itself. The [simply-typed-lambda-calculus](../objects/simply-typed-lambda-calculus.md) and the predicative core of [dependent-type-theory](../objects/dependent-type-theory.md) are strongly normalizing — the [strong-normalization-stlc](../theorems/strong-normalization-stlc.md) theorem is the load-bearing result for STLC.

## Position

Normalization is what makes a type theory usable as a *proof system*: a strongly normalizing calculus has decidable [type-checking](../morphisms/type-checking.md) (run reduction to normal form, then compare), and its [consistency-of-mltt](../theorems/consistency-of-mltt.md) follows by an explicit normalization argument rather than by a model-theoretic detour. Loss of normalization is what makes the [y-combinator-untyped](../examples/y-combinator-untyped.md) inadmissible in any normalizing typed calculus. Reference: [Barendregt 1984](references/barendregt1984.md) §3, [Girard, Lafont & Taylor 1989](references/girard-lafont-taylor1989.md) Ch. 6.
