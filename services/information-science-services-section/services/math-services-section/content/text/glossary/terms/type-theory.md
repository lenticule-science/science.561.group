---
title: Type theory
type: term
term-kind: topic
aliases:
- Type Theory
- typed terms
---

# Type theory

Type theory studies formal systems in which expressions are typed before they
are evaluated, computation is reduction on terms, and propositions-as-types
makes proofs and programs the same kind of object. It is both a foundation for
constructive mathematics and the operational substrate of proof assistants.

## Position in mathematics

Type theory sits alongside logic, set theory, and category theory. Its typing
rules are derivation rules, its terms carry computational content, and the
Curry–Howard correspondence identifies proofs with programs. The active
lessons in this service introduce the untyped lambda calculus, simply typed
lambda calculus, and dependent types; the canonical structural vocabulary is
split between [concepts](../concepts/) and [terms](../terms/).

## Canonical vocabulary

- **Syntax and binding:** [variable](../terms/variable.md),
  [binder](../terms/binder.md), [lambda term](../terms/lambda-term.md),
  [alpha-equivalence](../terms/alpha-equivalence.md), and
  [substitution](../terms/substitution.md).
- **Computation:** [beta reduction](../terms/beta-reduction.md),
  [eta-equivalence](../terms/eta-equivalence.md),
  [normalization](./normalization.md), and
  [confluence](../terms/confluence.md).
- **Typing:** [typing context](../terms/typing-context.md),
  [typing judgment](../terms/typing-judgment.md),
  [function type](../terms/function-type.md),
  [dependent type theory](../terms/dependent-type-theory.md),
  [Pi type](../terms/pi-type.md), [Sigma type](../terms/sigma-type.md),
  [identity type](../terms/identity-type.md), and [universe](../terms/universe.md).
- **Program/proof boundary:** [inhabitation](../terms/inhabitation.md),
  [Curry–Howard translation](../terms/curry-howard-translation.md), and
  [type checking](../terms/type-checking.md).

The three longer lessons remain the canonical expository documents. Generated
reduction-trace fragments are consolidated in the [lambda-calculus trace
note](../../documents/articles/teaching-articles/examples/reduction-trace.md); theorem claims,
examples, questions, narratives, and references retain their distinct roles
under the service's text triage and references directories rather than being
misrepresented as glossary terms.

## Research boundaries

The service currently names, but does not pretend to complete, cubical type
theory, linear and other substructural type theories, effect and graded modal
systems, refinement and liquid types, realizability and categorical semantics,
and a Lean formalization of the object-language calculi. These remain scoped
questions in triage. The distinction matters: a named research direction is a
useful boundary marker, not an invitation to manufacture a hollow glossary
page.
