---
name: "Biextensional collapse"
description: "The quotient of a Chu space that identifies points with equal rows and tests with equal columns: two things become one exactly when no available measurement tells them apart. The same construction is object/attribute clarification of a formal context and the separated-extensional quotient of a Barwise–Seligman classification."
aliases:
  - "biextensional collapse"
  - "biextensional quotient"
  - "extensional collapse"
  - "clarification"
  - "separable"
  - "extensional"
  - "biextensional"
date-created: 2026-09-27
term-kind: construction
specialization: quotient
references:
  - Pratt 1995, "The Stone gamut: a coordinatization of mathematics", LICS 1995, 444-454
  - Pratt 1999, "Chu spaces", course notes, School on Category Theory and Applications, Coimbra
  - Barwise & Seligman 1997, Information Flow: The Logic of Distributed Systems, Cambridge University Press
  - Ganter & Wille 1999, Formal Concept Analysis: Mathematical Foundations, Springer
---

The **biextensional collapse** of a [Chu space](chu-space.md) $(A, r, X)$ over a value set $L$ is the quotient that identifies every pair of points with the same row and every pair of tests with the same column:

$$a \approx a' \iff \forall x \in X,\; r(a,x) = r(a',x), \qquad x \approx x' \iff \forall a \in A,\; r(a,x) = r(a,x').$$

The matrix descends to the quotient, because equal rows and equal columns carry equal entries by definition. The result is **separable** (distinct points have distinct rows) and **extensional** (distinct tests have distinct columns), hence **biextensional** (Pratt 1995; 1999). Every Chu transform between biextensional spaces is determined by either of its two components, and every Chu space maps onto its collapse by a Chu transform.

## One construction, three literatures

- **Chu spaces.** The collapse is the reflection of Chu spaces into biextensional Chu spaces (Pratt 1999). The math section's [Chu spaces explanation](../../documents/articles/teaching-articles/explanations/chu-spaces.md), §2.2, sets out separability, extensionality and the collapse.
- **Formal concept analysis.** A binary [formal context](formal-context.md) $(G, M, I)$ is a Chu space over $\{0,1\}$. Merging objects with the same intent and attributes with the same extent is *clarification* (Ganter & Wille 1999). Clarification changes no concept lattice, so FCA treats it as the canonical reduced form of a context.
- **Information flow.** A Barwise–Seligman *classification* is a set of tokens, a set of types and an incidence relation between them (Barwise & Seligman 1997). A classification is *separated* when tokens with the same types are equal and *extensional* when types with the same tokens are equal. The collapse produces the separated, extensional classification that the original one presents.

## Identity by indistinguishability

The collapse is the precise form of the metrological idea that a quantity is what its measurements report. Before the collapse, two points may differ as presentations yet agree under every test. After it, identity *is* agreement under every test. Nothing is identified that some available test distinguishes, and nothing indistinguishable is left apart.

This is why the collapse is a **stipulated** identification in the sense of the 2026-08-17 note on the axiom discipline. The relation is declared by the construction, is local to one space, and is carried by the quotient type. In Lean it costs `Quot.sound` and nothing else, provided the lift out of the quotient lands in data (`Bool`, a finite reading) rather than in `Prop`, where the lift's obligation would be `propext`. For a finite matrix over a finite value set, row and column equality are decidable, so the Bool route is always available.

## In Obsmetrologia

A [mark](mark.md)'s surface string "is not identity; identity is role, downstream" (`Primitive/Mark.lean`). An [utterance](utterance.md) places marks on two hands, token and claim, and a trace of articulatings measures a reading for each cell ([evidence](evidence.md)). Read that measurement as a Chu space: token-side marks as points, claim-side marks as tests, and the measured reading as the matrix entry. Its biextensional collapse is then the identification "a mark's identity is its role" made exact. Two tokens are one token when every claim reads them alike, and two claims are one claim when every token reads them alike.

The 2026-09-03 note on the one identification asks which relation the library's single root `Quot.sound` should identify along. This construction answers it. The one identification is the biextensional collapse of the measured utterance space. It is seated at the root, and every later identification factors through it. The Lean library does not yet define it.

## Related

- [Chu space](chu-space.md)
- [Formal context](formal-context.md)
- [Quotient](quotient.md)
- [Mark](mark.md), [Utterance](utterance.md), [Evidence](evidence.md)
