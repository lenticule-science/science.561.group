---
title: "Dependent Types"
aliases:
  - "Dependent Types"
  - "dependent-types"
id: type-theory-lesson-2
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - TypeTheory
  - Logic
requires:
  - /mathematics/disciplines/type-theory/curricula/typed-lambda-calculus.md
  - /mathematics/disciplines/logic/curricula/intuitionistic-logic.md
teaches:
  - "Dependent Types"
cites:
  - "Constructive Mathematics and Computer Programming"
  - "Homotopy Type Theory: Univalent Foundations of Mathematics"
  - "Types and Programming Languages"
---

## Entry conditions

Use dependent types when you need:

- Types that vary according to a value — a vector whose type includes its length, a
  matrix whose type includes its dimensions, a proof whose type is the proposition proved.
- A single framework where programs, specifications, and proofs coexist — where writing
  code and proving theorems are the same activity.
- A formal language strong enough to state and verify mathematical theorems, not just
  check that functions return the right kind of output.

## From simple types to dependent types

The [simply typed lambda calculus](./typed-lambda-calculus.md) assigns every term a type, and
function types have the form $A \to B$: the input has type $A$, the output has type $B$.
The output type does not depend on the input value — a function of type $\mathbb{N} \to
\mathbb{N}$ returns a natural number regardless of which natural number it receives.

Dependent types remove this restriction [@martinlof_ConstructiveMathematicsComputerProgramming_1982]. A dependent function type allows the output type
to mention the input value:

$$
\Pi(x : A).\; B(x)
$$

Read: "for any $x$ of type $A$, a value of type $B(x)$." The type $B$ is a family indexed
by elements of $A$ — different inputs can produce outputs of different types.

## Pi-types (dependent function types)

A **Pi-type** $\Pi(x : A).\; B(x)$ generalizes the simple function type $A \to B$. When
$B$ does not depend on $x$, the Pi-type reduces to the ordinary function type. When $B$
does depend on $x$, the Pi-type expresses a universal statement: "for every $x : A$,
there is a $B(x)$."

Under the [Curry-Howard correspondence](../../../concepts/curry-howard-correspondence/index.md), a Pi-type corresponds to a **universal
quantification** $\forall x : A.\; P(x)$. A term of type $\Pi(x : A).\; P(x)$ is a
function that, given any $x : A$, produces a proof of $P(x)$. Having such a function
means having a uniform proof that $P$ holds for every element of $A$.

**Example.** The type of the identity function on every type:

$$
\Pi(A : \mathsf{Type}).\; A \to A
$$

This says: "for any type $A$, a function from $A$ to $A$." The identity function
$\lambda A.\; \lambda x.\; x$ inhabits this type.

**Example.** The type of a proof that addition is commutative:

$$
\Pi(m : \mathbb{N}).\; \Pi(n : \mathbb{N}).\; m + n = n + m
$$

A term of this type is a function that takes two natural numbers and returns a proof that
their sum is the same in either order.

## Sigma-types (dependent pair types)

A **Sigma-type** $\Sigma(x : A).\; B(x)$ generalizes the product type $A \times B$. Its
elements are pairs $(a, b)$ where $a : A$ and $b : B(a)$ — the type of the second
component depends on the value of the first.

Under Curry-Howard, a Sigma-type corresponds to an **existential quantification**
$\exists x : A.\; P(x)$. A term of type $\Sigma(x : A).\; P(x)$ is a pair: a witness
$a : A$ together with a proof that $P(a)$ holds.

**Example.** The type of "a natural number that is even":

$$
\Sigma(n : \mathbb{N}).\; \exists k.\; n = 2k
$$

An element is a pair: a specific number $n$ and a proof that $n$ is even.

**Example.** The type of "a group": a carrier set $G$, an operation, an identity element,
and proofs of the group axioms — all bundled in nested Sigma-types.

## The extended Curry-Howard correspondence

With dependent types, the correspondence between logic and type theory becomes complete:

| Logic | Type Theory |
|-------|-------------|
| $\forall x : A.\; P(x)$ | $\Pi(x : A).\; P(x)$ |
| $\exists x : A.\; P(x)$ | $\Sigma(x : A).\; P(x)$ |
| $P \wedge Q$ | $P \times Q$ (product type) |
| $P \vee Q$ | $P + Q$ (sum type / coproduct) |
| $P \Rightarrow Q$ | $P \to Q$ (function type) |
| $\neg P$ | $P \to \bot$ (function to empty type) |
| $\top$ (truth) | Unit type (one element) |
| $\bot$ (absurdity) | Empty type (no elements) |
| Proof of $P$ | Term of type $P$ |
| $P$ is provable | Type $P$ is inhabited |

This correspondence is the foundation of [proof assistants](../../../concepts/proof-assistant/index.md) like [Lean](../../../../technology/disciplines/computing/software/lean/index.md) and [Agda](../../../../technology/disciplines/computing/software/agda/index.md): to prove a
theorem, write a program of the corresponding type [@pierce_TypesProgrammingLanguages_2002]. The type checker verifies the proof by
checking that the program is well-typed.

Because the type system is based on [intuitionistic logic](../../logic/curricula/intuitionistic-logic.md), [excluded middle](../../../../philosophy/terms/law-of-excluded-middle.md) ($P \vee \neg P$) is not available by default. A proof of $P \vee Q$ must supply a proof of $P$ or a proof of $Q$ — you cannot argue by contradiction unless you explicitly add classical axioms.

## Indexed families and universes

Dependent types require a notion of **universe** — a type whose elements are themselves
types. The [symbol](../../../../linguistics/topics/semiotics/terms/symbol.md) $\mathsf{Type}$ (or $\mathsf{Set}$ in some systems) is a universe. To
avoid paradoxes (Russell's paradox in type-theoretic form), universes are stratified:

$$
\mathsf{Type}_0 : \mathsf{Type}_1 : \mathsf{Type}_2 : \cdots
$$

Each $\mathsf{Type}_i$ contains all types at level $i$ and below. This hierarchy is
analogous to the cumulative hierarchy of sets in [set theory](../../../concepts/set-theory/index.md), but built into the type
system itself [@univalentfoundationsprogram_HomotopyTypeTheory_2013].

An **indexed family** is a function from some index type into a universe: $B : A \to
\mathsf{Type}$. This is a type-valued function — it assigns a type to each element of
$A$. Indexed families are what make Pi-types and Sigma-types meaningful: $B(x)$ is a type
for each $x : A$.

## Dependent pattern matching

In languages with dependent types, pattern matching is more powerful than in simple typed
languages. When you match on a constructor, the type checker refines the types of other
variables in scope to reflect what the match tells you.

**Example.** Given a vector type `Vec A n` (a list of `n` elements of type `A`), matching
on the constructor reveals the length:

- Matching `[]` (empty vector) tells the checker that `n = 0`.
- Matching `x :: xs` tells the checker that `n = suc m` for some `m`, and `xs : Vec A m`.

This refinement happens automatically: the type system tracks the information gained by
each pattern match and uses it to check subsequent code. This is what makes dependent
types powerful for proofs — case analysis in a proof corresponds to pattern matching in
code, and the type checker ensures you handle every case.

## Applications

Dependent types are the foundation of modern proof assistants — [Lean](../../../../technology/disciplines/computing/software/lean/index.md), [Agda](../../../../technology/disciplines/computing/software/agda/index.md), Coq, and others. They are used to:

- **Formalize mathematics**: encode algebraic structures (groups, rings, [lattices](../../../objects/posets/terms/lattice.md)) as types that bundle operations with proofs of their axioms. A [Heyting algebra](../../../objects/posets/curricula/heyting-algebras.md), for instance, becomes a type carrying a carrier, operations, and proofs of the [Heyting](../../../../general/people/arend-heyting.md) axioms.
- **Verify software**: specify program behavior in the type, then type-check to verify that the implementation meets the specification. Dependent types enable specifications that simple types cannot express (e.g., "this sorting function returns a permutation of its input").
- **Construct certified proofs**: state a theorem as a type and construct a proof as a term. The type checker verifies correctness mechanically.

## Common mistakes

- Confusing types and terms. In dependent type theory, the boundary between types and
  terms is fluid — types can contain terms — but each expression still occupies a definite
  level (term, type, universe). Mixing levels produces type errors.
- Forgetting universe levels. A type of all types ($\mathsf{Type} : \mathsf{Type}$) leads
  to paradox. Proof assistants enforce universe stratification, which sometimes requires
  explicit level annotations.
- Expecting classical reasoning by default. Dependent type theory is intuitionistic.
  Proofs by contradiction require importing a classical axiom (e.g. `Classical.em` in
  Lean), which is available but not automatic.

## Minimal data

- A type universe $\mathsf{Type}$ (stratified into levels).
- Pi-types $\Pi(x : A).\; B(x)$ for dependent functions.
- Sigma-types $\Sigma(x : A).\; B(x)$ for dependent pairs.
- Inductive type definitions (natural numbers, vectors, equality, etc.).
- A type checker that verifies terms against their types.

