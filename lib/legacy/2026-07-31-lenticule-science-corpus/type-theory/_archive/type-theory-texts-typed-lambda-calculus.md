---
title: "Typed Lambda Calculus"
aliases:
  - "Typed Lambda Calculus"
  - "typed-lambda-calculus"
  - "simply typed lambda calculus"
id: type-theory-lesson-1
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - TypeTheory
  - Logic
requires:
  - /mathematics/disciplines/type-theory/curricula/untyped-lambda-calculus.md
  - /mathematics/disciplines/logic/curricula/propositional-logic.md
teaches:
  - "Typed Lambda Calculus"
cites:
  - "Lectures on the Curry-Howard Isomorphism"
  - "The Lambda Calculus: Its Syntax and Semantics"
  - "Types and Programming Languages"
---

## Entry conditions

Use typed lambda calculus when you need:

- A formal language for defining functions, applying them to arguments, and composing them.
- A type system that prevents ill-formed combinations (applying a number to a number, for instance).
- A bridge between logic and computation, where types correspond to propositions and terms correspond to proofs.

## The untyped lambda calculus

The [untyped lambda calculus](./untyped-lambda-calculus.md) begins with three operations [@barendregt_LambdaCalculus_1984]:

1. **Variables**: $x$, $y$, $z$, ... — names that stand for values.
2. **Abstraction**: $\lambda x.\, M$ — a function that takes $x$ and returns $M$. Read "the function of $x$ that gives $M$."
3. **Application**: $M\; N$ — apply function $M$ to argument $N$.

Everything is built from these three forms. The central computation rule is **beta-reduction**:

$$
(\lambda x.\, M)\; N \;\longrightarrow_\beta\; M[N/x]
$$

Replace every occurrence of $x$ in $M$ with $N$. This is function evaluation.

The untyped lambda calculus is expressive enough to encode arithmetic, recursion, and data structures. It is also expressive enough to produce nonsense: $(\lambda x.\, x\; x)\;(\lambda x.\, x\; x)$ reduces to itself forever.

## Adding types

The **simply typed lambda calculus** (STLC) assigns a type to every term, ruling out self-application and non-termination [@pierce_TypesProgrammingLanguages_2002]. Types are built from:

- **Base types**: $P$, $Q$, ... — atomic types representing basic domains (propositions, values, elements of an algebra).
- **Function types**: $A \to B$ — the type of functions that take an $A$ and return a $B$.
- **Product types**: $A \times B$ — the type of pairs $(a, b)$ where $a : A$ and $b : B$.

A **typing context** $\Gamma$ is a list of variable-type assignments: $x_1 : A_1, \; x_2 : A_2, \; \ldots$

A **typing judgment** $\Gamma \vdash t : A$ states: "in context $\Gamma$, term $t$ has type $A$."

## Typing rules

The STLC has a small set of rules that determine when a typing judgment holds:

**Variable rule.** If $x : A$ appears in $\Gamma$, then $\Gamma \vdash x : A$.

**Abstraction rule.** If $\Gamma, x : A \vdash M : B$, then $\Gamma \vdash (\lambda x.\, M) : A \to B$.
To build a function from $A$ to $B$, assume you have an $x$ of type $A$ and show the body $M$ has type $B$.

**Application rule.** If $\Gamma \vdash M : A \to B$ and $\Gamma \vdash N : A$, then $\Gamma \vdash M\; N : B$.
Apply a function to an argument of the right type.

**Pairing rule.** If $\Gamma \vdash M : A$ and $\Gamma \vdash N : B$, then $\Gamma \vdash (M, N) : A \times B$.

**Projection rules.** If $\Gamma \vdash P : A \times B$, then $\Gamma \vdash \pi_1(P) : A$ and $\Gamma \vdash \pi_2(P) : B$.

These rules ensure that every well-typed term reduces to a value and that reduction preserves types (**subject reduction**).

## Structural properties

Well-typed terms satisfy:

- **Weakening**: adding unused variables to $\Gamma$ does not break typing.
- **Exchange**: the order of variables in $\Gamma$ does not matter.
- **Substitution**: if $\Gamma \vdash N : A$ and $\Gamma, x : A \vdash M : B$, then $\Gamma \vdash M[N/x] : B$.
- **Strong normalization**: every sequence of reductions terminates. There are no infinite loops in the simply typed calculus.

## The Curry-Howard correspondence

There is a precise correspondence between the simply typed lambda calculus and [intuitionistic logic](../../logic/curricula/intuitionistic-logic.md) [@sorensen_LecturesCurryHowardIsomorphism_2006]:

| Logic | Type Theory |
|-------|-------------|
| Proposition | Type |
| Proof of $A$ | Term of type $A$ |
| $A \wedge B$ | $A \times B$ (product type) |
| $A \Rightarrow B$ | $A \to B$ (function type) |
| Proof construction | Term construction |
| Proof normalization | Beta-reduction |

A type is inhabited (has a term of that type) exactly when the corresponding proposition is provable in [intuitionistic logic](../../logic/curricula/intuitionistic-logic.md). This is not a metaphor — it is a formal [isomorphism](../../../objects/categories/ordinary-categories/terms/isomorphism.md). Proofs ARE programs; propositions ARE types. This is known as the [Curry-Howard correspondence](../../../concepts/curry-howard-correspondence/index.md).

## Worked example

Define the identity function on type $P$:

$$
\vdash (\lambda x.\, x) : P \to P
$$

By the abstraction rule: assume $x : P$, then $x : P$ by the variable rule, so $\lambda x.\, x$ has type $P \to P$.

Define composition. Given $f : A \to B$ and $g : B \to C$:

$$
f : A \to B, \; g : B \to C \;\vdash\; (\lambda x.\, g\;(f\;x)) : A \to C
$$

Apply $f$ to $x$ to get a $B$; apply $g$ to that $B$ to get a $C$. The result is a function from $A$ to $C$.

## Common mistakes

- Confusing untyped and typed. The untyped lambda calculus allows self-application ($x\;x$); the typed calculus does not, because no type $A$ satisfies $A = A \to B$.
- Forgetting that function types associate to the right. $A \to B \to C$ means $A \to (B \to C)$, a function that takes an $A$ and returns a function from $B$ to $C$.
- Treating the Curry-Howard correspondence as approximate. It is an exact structural correspondence between proof systems and type systems, not an analogy.

## Minimal data

- A set of base types (at minimum, $P$).
- Type constructors: $\to$ (function) and $\times$ (product).
- Term constructors: variables, $\lambda$-abstraction, application, pairing, projection.
- Typing rules: variable, abstraction, application, pairing, projection.
- Computation rule: $\beta$-reduction.

