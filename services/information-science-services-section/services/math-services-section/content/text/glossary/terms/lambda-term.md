---
type: term
term-kind: definition
class: syntactic-object
status: current
depends-on: [variable, binder]
realizes: [variable, binder]
symbol: M
---

# Lambda term

A **lambda term** is an expression in the grammar

$$
M, N \;::=\; x \;\mid\; \lambda x.\,M \;\mid\; M\;N
$$

— a [variable](./variable.md), a λ-abstraction binding a variable in a body, or an application of one term to another. Lambda terms are the syntactic objects shared by the [untyped-lambda-calculus](./untyped-lambda-calculus.md), the [simply-typed-lambda-calculus](./simply-typed-lambda-calculus.md), and (in extended forms) the [dependent-type-theory](./dependent-type-theory.md).

## Structure

- **Variables** $x, y, z, \ldots$ — drawn from a countably infinite supply.
- **Abstractions** $\lambda x.\,M$ — the [binder](./binder.md) introduces $x$ in the body $M$.
- **Applications** $M\;N$ — left-associative: $M\;N\;P$ means $(M\;N)\;P$.

Terms are taken modulo [alpha-equivalence](./alpha-equivalence.md). The set of free variables is computed structurally; [substitution](./substitution.md) is capture-avoiding.

## What this is not

A lambda term is *not* a value in any particular semantics — its meaning depends on the calculus and reduction strategy chosen. A lambda term is *not* an inhabitant of a type until a [typing-judgment](./typing-judgment.md) is produced for it; the same untyped term may be typeable in many ways, in one way, or not at all.

## Position

Lambda terms are the common syntactic substrate. The various calculi differ in which terms they admit as well-formed: the [untyped-lambda-calculus](./untyped-lambda-calculus.md) admits all of them; the [simply-typed-lambda-calculus](./simply-typed-lambda-calculus.md) admits only those with a typing derivation in its rule system. Reference: [Church 1940](../../documents/articles/bibliographies/church1940.md), [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §1.
