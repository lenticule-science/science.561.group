---
type: definition
class: calculus
status: current
depends-on: [lambda-term, function-type, typing-judgment, typing-context, beta-reduction]
realizes: [typing-judgment, normalization, confluence, inhabitation]
symbol: \lambda^{\to}
---

# Simply typed lambda calculus

The **simply typed lambda calculus** ($\lambda^{\to}$, STLC) extends the [untyped-lambda-calculus](untyped-lambda-calculus.md) by assigning a type to every well-formed term. Types are built from a set of *base types* $P, Q, \ldots$ by the [function-type](function-type.md) constructor $A \to B$.

## Structure

A [typing-judgment](teaching/explanations/typing-judgment.md) $\Gamma \vdash t : A$ is derived using:

- **Variable.** $\Gamma, x : A \vdash x : A$.
- **Abstraction.** From $\Gamma, x : A \vdash M : B$ conclude $\Gamma \vdash \lambda x.\,M : A \to B$.
- **Application.** From $\Gamma \vdash M : A \to B$ and $\Gamma \vdash N : A$ conclude $\Gamma \vdash M\;N : B$.

A *well-typed* term is one for which some judgment $\Gamma \vdash M : A$ is derivable. Reduction is unchanged: $(\lambda x.\,M)\;N \to_\beta M[N/x]$, plus the congruence closures.

The basic structural properties — weakening, exchange, substitution — hold (see [typing-context](teaching/explanations/typing-context.md)). The basic operational properties — [subject-reduction](../theorems/subject-reduction.md), [progress](../theorems/progress.md), [strong normalization](../theorems/strong-normalization-stlc.md), [principal-typing](../theorems/principal-typing-stlc.md) — all hold.

## What this is not

STLC is *not* Turing-complete: every well-typed STLC term has a normal form, so non-terminating computations cannot be expressed. STLC is *not* dependent: function output types do not vary with the input value. STLC is *not* polymorphic in the System F sense — adding type variables and second-order quantification produces System F, the next stop on the lambda cube.

## Position

STLC is the sweet spot between expressivity and tractability: enough structure to support the [curry-howard-correspondence](../theorems/curry-howard-correspondence.md) with intuitionistic propositional logic, yet simple enough that [type-checking](../morphisms/type-checking.md) is decidable in linear time. Extensions producing the lambda cube ([dependent-type-theory](dependent-type-theory.md), polymorphism, type-dependent types) all build from STLC by allowing additional binder kinds. Reference: [Pierce 2002](references/pierce2002.md) Chs. 9–11, [Sørensen & Urzyczyn 2006](references/sorensen-urzyczyn2006.md) Ch. 3.
