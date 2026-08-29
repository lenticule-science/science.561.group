---
type: term
term-kind: definition
class: forgetful-operator
status: current
depends-on: [simply-typed-lambda-calculus, untyped-lambda-calculus, lambda-term]
---

# Type erasure

**Type erasure** is the operator that strips type annotations from a term of a typed calculus, producing a term of the [untyped-lambda-calculus](./untyped-lambda-calculus.md). It is the forgetful map from typed to untyped syntax.

## Definition

For [simply-typed-lambda-calculus](./simply-typed-lambda-calculus.md), type erasure $|-|$ acts by:

- $|x| = x$.
- $|M\;N| = |M|\;|N|$.
- $|\lambda x : A.\,M| = \lambda x.\,|M|$ — annotations on the binder are discarded.

For a typed term $M$, $|M|$ is a well-formed untyped term; the typing of $M$ disappears.

## Properties

- *Reduction respects erasure*: if $M \to_\beta N$ in STLC, then $|M| \to_\beta |N|$ in $\Lambda$.
- *Reflection fails*: a single untyped term may erase from many distinct typed terms (different annotations on the same syntactic shape) or from none (an untypeable term).
- Erasure of a [strongly normalizing](./normalization.md) STLC term is a strongly normalizing untyped term — but the converse fails, since the untyped calculus admits non-normalizing terms with no STLC pre-image.

## Position

Type erasure is the comparison map between the typed and untyped worlds. Combined with the [type-checking](./type-checking.md) operator (deciding which untyped terms have STLC pre-images), it sets up the *typability* problem. Type erasure also underlies practical compilation: erasing types after type-checking produces an executable that needs no runtime type information. Reference: [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §14, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §22.
