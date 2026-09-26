---
title: "Untyped Lambda Calculus"
type: "lesson"
date-created: 2026-03-05
description: Use this lesson when you want to understand computation at its most fundamental level — before types, before programming languages, before machines.
keywords:
  - type-theory
  - lambda-calculus
  - logic
requires: []
teaches:
  - Untyped Lambda Calculus
  - Beta Reduction
  - Church Encodings
cites:
  - "The Lambda Calculus: Its Syntax and Semantics"
  - An Introduction to Functional Programming Through Lambda Calculus
  - "Lambda-Calculus and Combinators: An Introduction"
---

Learning objectives

- Untyped Lambda Calculus
- Beta Reduction
- Church Encodings

Table of contents

- [Entry conditions](#entry-conditions)

- [The three building blocks](#the-three-building-blocks)

- [Concrete intuition](#concrete-intuition)

- [Beta-reduction: how computation happens](#beta-reduction-how-computation-happens)

- [Free and bound variables](#free-and-bound-variables)

- [Non-termination](#non-termination)

- [Church encodings: data from functions](#church-encodings-data-from-functions)

- [The Y combinator: recursion without names](#the-y-combinator-recursion-without-names)

- [Normal forms and reduction strategies](#normal-forms-and-reduction-strategies)

- [Common mistakes](#common-mistakes)

- [What comes next](#what-comes-next)

- [Minimal data](#minimal-data)

## Entry conditions

Use this lesson when you want to understand computation at its most fundamental level — before types, before programming languages, before machines. The lambda calculus is a formal system where every computation is expressed using only three constructs: variables, function definitions, and function application.

No prior knowledge of logic, type theory, or programming is assumed. If you have written functions in any programming language, the intuitions will be familiar.

## The three building blocks

The lambda calculus has exactly three kinds of expression [@barendregt_LambdaCalculus_1984]:

- **Variable**: $x$ — a name that stands for a value.

- **Abstraction**: λx. M\lambda x.\, M — a function. Read: &ldquo;the function that takes $x$ and returns $M$.&rdquo; The $\lambda$ marks the beginning of a function definition, $x$ names the input, and $M$ is the body.

- **Application**: M  NM\; N — apply function $M$ to argument $N$.

That is everything. There are no numbers, no strings, no `if` statements, no loops. All of these can be *encoded* using only the three constructs above — but first, we need to understand how computation happens.

## Concrete intuition

Think of λx. M\lambda x.\, M as a machine with one input slot labeled $x$ and an output determined by $M$. When you feed a value into the slot, every $x$ inside the machine is replaced by that value, and the machine produces its output.

**Example.** The identity function:

λx. x
\lambda x.\, x

Takes an input and returns it unchanged. Feed it anything — it gives back the same thing.

**Example.** A function that applies its argument to itself:

λf. f  f
\lambda f.\, f\; f

Takes a function $f$ and applies $f$ to $f$. (Whether this makes sense depends on what $f$ is — the untyped calculus does not check.)

**Example.** A function that takes two arguments (by nesting):

λx. λy. x
\lambda x.\, \lambda y.\, x

Takes $x$, returns a function that takes $y$ and ignores it, returning $x$. This is how multi-argument functions work in the lambda calculus — every function takes exactly one argument, and multi-argument functions are chains of single-argument functions. This technique is called [currying](../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/currying.md).

## Beta-reduction: how computation happens

The one computation rule is **beta-reduction**:

(λx. M)  N  ⟶β  M[N/x]
(\lambda x.\, M)\; N \;\longrightarrow_\beta\; M[N/x]

When a function λx. M\lambda x.\, M is applied to an argument $N$, substitute $N$ for every occurrence of $x$ in $M$. The notation M[N/x]M[N/x] means &ldquo;the expression $M$ with every free occurrence of $x$ replaced by $N$.&rdquo;

**Worked example.** Apply the identity function to the value $y$:

(λx. x)  y  ⟶β  y
(\lambda x.\, x)\; y \;\longrightarrow_\beta\; y

Replace $x$ with $y$ in the body $x$. Result: $y$.

**Worked example.** Apply a &ldquo;make-pair&rdquo; function:

(λx. λy. x)  a  ⟶β  λy. a
(\lambda x.\, \lambda y.\, x)\; a \;\longrightarrow_\beta\; \lambda y.\, a

Replace $x$ with $a$ in the body λy. x\lambda y.\, x. The inner $\lambda y$ is unaffected — only $x$ is replaced. Result: a function that takes $y$ and returns $a$.

**Worked example.** Multiple reductions:

(λx. λy. x)  a  b  ⟶β  (λy. a)  b  ⟶β  a
(\lambda x.\, \lambda y.\, x)\; a\; b \;\longrightarrow_\beta\; (\lambda y.\, a)\; b \;\longrightarrow_\beta\; a

First application substitutes $a$ for $x$. Second application substitutes $b$ for $y$ — but $y$ does not appear in the body $a$, so $b$ is discarded.

## Free and bound variables

A variable $x$ is **bound** in an expression if it appears inside a λx. …\lambda x.\, \ldots that introduces it. Otherwise it is **free**.

In λx. x  y\lambda x.\, x\; y: $x$ is bound (introduced by $\lambda x$), $y$ is free (not introduced anywhere).

Beta-reduction only replaces **free** occurrences of the variable. This prevents accidental capture — substituting an expression into a scope where its variables would be accidentally bound by a different $\lambda$.

**Alpha-equivalence.** The names of bound variables do not matter. λx. x\lambda x.\, x and λy. y\lambda y.\, y are the same function — they differ only in the name chosen for the input slot. This renaming is called **alpha-conversion**.

## Non-termination

The untyped lambda calculus permits expressions that reduce forever. The classic example is **Omega**:

Ω=(λx. x  x)  (λx. x  x)
\Omega = (\lambda x.\, x\; x)\;(\lambda x.\, x\; x)

Apply λx. x  x\lambda x.\, x\; x to itself: replace $x$ with (λx. x  x)(\lambda x.\, x\; x) in the body x  xx\; x, yielding (λx. x  x)  (λx. x  x)(\lambda x.\, x\; x)\;(\lambda x.\, x\; x) — which is $\Omega$ again. Reduction loops forever.

This is not a bug — it is a feature. The ability to express non-termination is what makes the untyped lambda calculus **Turing-complete**: it can compute anything a Turing machine can compute. The [simply typed lambda calculus](../explanations/typed-lambda-calculus.md) eliminates non-termination by adding types, but at the cost of reducing expressiveness.

## Church encodings: data from functions

Since the lambda calculus has no built-in data, data must be encoded as functions. These encodings are named after Alonzo Church, who invented the lambda calculus in the 1930s [@hindley_LambdaCalculusCombinators_2008].

**Booleans.**

TRUE=λt. λf. t
\text{TRUE} = \lambda t.\, \lambda f.\, t

FALSE=λt. λf. f
\text{FALSE} = \lambda t.\, \lambda f.\, f

A boolean is a function that takes two arguments and selects one. TRUE selects the first; FALSE selects the second. This is an `if-then-else` in disguise: TRUE  a  b⟶βa\text{TRUE}\; a\; b \longrightarrow_\beta a and FALSE  a  b⟶βb\text{FALSE}\; a\; b \longrightarrow_\beta b.

**Natural numbers (Church numerals).**

0=λf. λx. x
\mathbf{0} = \lambda f.\, \lambda x.\, x

1=λf. λx. f  x
\mathbf{1} = \lambda f.\, \lambda x.\, f\; x

2=λf. λx. f  (f  x)
\mathbf{2} = \lambda f.\, \lambda x.\, f\;(f\; x)

n=λf. λx. fn  x
\mathbf{n} = \lambda f.\, \lambda x.\, f^n\; x

A Church numeral $\mathbf{n}$ is a function that takes a function $f$ and a starting value $x$, and applies $f$ to $x$ exactly $n$ times. The number is the iteration count.

**Successor** adds one more application of $f$:

SUCC=λn. λf. λx. f  (n  f  x)
\text{SUCC} = \lambda n.\, \lambda f.\, \lambda x.\, f\;(n\; f\; x)

**Addition** composes the iteration counts:

ADD=λm. λn. λf. λx. m  f  (n  f  x)
\text{ADD} = \lambda m.\, \lambda n.\, \lambda f.\, \lambda x.\, m\; f\;(n\; f\; x)

Apply $f$ $n$ times starting from $x$, then apply $f$ $m$ more times. The result applies $f$ a total of m+nm + n times.

## The Y combinator: recursion without names

The lambda calculus has no built-in recursion — a function cannot refer to itself by name, because there are no names (only variables bound by $\lambda$). The **Y combinator** solves this:

Y=λf. (λx. f  (x  x))  (λx. f  (x  x))
Y = \lambda f.\, (\lambda x.\, f\;(x\; x))\;(\lambda x.\, f\;(x\; x))

For any function $g$, Y  gY\; g reduces to g  (Y  g)g\;(Y\; g). The Y combinator feeds a function its own fixed point, enabling recursion without self-reference. This is the mechanism behind [recursion](/technology/disciplines/computing/software/programming/functional/terms/recursion.md) in functional programming.

## Normal forms and reduction strategies

An expression is in **normal form** if no more beta-reductions can be applied — there are no remaining applications of a $\lambda$-abstraction to an argument.

Not every expression has a normal form ($\Omega$ does not). When an expression does have a normal form, different reduction strategies may or may not find it:

- **Normal-order reduction**: always reduce the leftmost, outermost application first. This strategy is guaranteed to find the normal form if one exists (by the Church-Rosser theorem).

- **Applicative-order reduction**: evaluate arguments before applying functions (like most programming languages). This is more efficient when arguments are used multiple times, but it can fail to terminate even when a normal form exists.

The **Church-Rosser theorem** guarantees that if two different sequences of reductions both reach a normal form, they reach the *same* normal form. The lambda calculus is confluent — the order of reduction does not affect the final result, only whether you reach it.

## Common mistakes

- **Forgetting that application is left-associative.** M  N  PM\; N\; P means (M  N)  P(M\; N)\; P, not M  (N  P)M\;(N\; P). Apply $M$ to $N$ first, then apply the result to $P$.

- **Forgetting that $\lambda$ extends as far right as possible.** λx. M  N\lambda x.\, M\; N means λx. (M  N)\lambda x.\, (M\; N), not (λx. M)  N(\lambda x.\, M)\; N. The body of the $\lambda$ includes everything to its right.

- **Substituting into bound variables.** When reducing (λx. λx. x)  N(\lambda x.\, \lambda x.\, x)\; N, the inner $\lambda x$ shadows the outer one. The inner $x$ is bound by the inner $\lambda$ and is not replaced.

- **Conflating the untyped calculus with programming.** The lambda calculus is a mathematical formalism, not a programming language. It has no runtime, no memory, no I/O. Programming languages *implement* (fragments of) the lambda calculus, but they are not identical to it.

## What comes next

The untyped lambda calculus is maximally expressive but allows nonsense — self-application, non-termination, and expressions with no clear meaning. The [simply typed lambda calculus](../explanations/typed-lambda-calculus.md) adds a type system that rules out ill-formed expressions at the cost of some expressiveness. That lesson is the next step.

## Minimal data

- Three expression forms: variable, abstraction (λx. M\lambda x.\, M), application (M  NM\; N).

- One computation rule: beta-reduction ((λx. M)  N⟶βM[N/x](\lambda x.\, M)\; N \longrightarrow_\beta M[N/x]).

- Alpha-equivalence: bound variable names are interchangeable.

- Church-Rosser theorem: reduction order does not affect the result (when a result exists).

1. **Variable**: $x$ — a name that stands for a value.
2. **Abstraction**: $\lambda x.\, M$ — a function. Read: "the function that takes $x$ and returns $M$." The $\lambda$ marks the beginning of a function definition, $x$ names the input, and $M$ is the body.
3. **Application**: $M\; N$ — apply function $M$ to argument $N$.

When a function $\lambda x.\, M$ is applied to an argument $N$, substitute $N$ for every occurrence of $x$ in $M$. The notation $M[N/x]$ means "the expression $M$ with every free occurrence of $x$ replaced by $N$."

**Worked example.** Apply a "make-pair" function:

A variable $x$ is **bound** in an expression if it appears inside a $\lambda x.\, \ldots$ that introduces it. Otherwise it is **free**.

**Alpha-equivalence.** The names of bound variables do not matter. $\lambda x.\, x$ and $\lambda y.\, y$ are the same function — they differ only in the name chosen for the input slot. This renaming is called **alpha-conversion**.

Apply $\lambda x.\, x\; x$ to itself: replace $x$ with $(\lambda x.\, x\; x)$ in the body $x\; x$, yielding $(\lambda x.\, x\; x)\;(\lambda x.\, x\; x)$ — which is $\Omega$ again. Reduction loops forever.

$$
\text{TRUE} = \lambda t.\, \lambda f.\, t
$$
$$
\text{FALSE} = \lambda t.\, \lambda f.\, f
$$

A boolean is a function that takes two arguments and selects one. TRUE selects the first; FALSE selects the second. This is an `if-then-else` in disguise: $\text{TRUE}\; a\; b \longrightarrow_\beta a$ and $\text{FALSE}\; a\; b \longrightarrow_\beta b$.

$$
\mathbf{0} = \lambda f.\, \lambda x.\, x
$$
$$
\mathbf{1} = \lambda f.\, \lambda x.\, f\; x
$$
$$
\mathbf{2} = \lambda f.\, \lambda x.\, f\;(f\; x)
$$
$$
\mathbf{n} = \lambda f.\, \lambda x.\, f^n\; x
$$

- Three expression forms: variable, abstraction ($\lambda x.\, M$), application ($M\; N$).
- One computation rule: beta-reduction ($(\lambda x.\, M)\; N \longrightarrow_\beta M[N/x]$).
- Alpha-equivalence: bound variable names are interchangeable.
- Church-Rosser theorem: reduction order does not affect the result (when a result exists).
