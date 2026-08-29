---
type: term
term-kind: concept
class: semantic-property
status: current
depends-on: [typing-judgment, typing-context]
---

# Inhabitation

*A type $A$ is inhabited* if there is a closed term $t$ with $\vdash t : A$. The inhabitants of $A$ are the closed terms of type $A$ — for the [function-type](./function-type.md) $A \to A$, the identity function $\lambda x.\,x$ is an inhabitant; for the [empty-type](./empty-type.md), there are none.

Under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md), inhabitation *is* provability: a type $A$ is inhabited iff the corresponding proposition is provable in the appropriate (intuitionistic or classical) logic. The closed inhabitants of $A$ are the proof-terms recording how to prove it.

## Position

Inhabitation is the semantic side of the propositions-as-types view. It is decidable for the [simply-typed-lambda-calculus](./simply-typed-lambda-calculus.md) (PSPACE-complete; this is the *type inhabitation* problem) and undecidable for the full [dependent-type-theory](./dependent-type-theory.md) (the corresponding logical question is undecidable). The corpus's `status: proved` and `status: open` fields are precisely an inhabitation marker: a proved theorem has a known inhabitant of its type; an open one does not. Reference: [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §3, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §9.4.
