---
title: "agda"
aliases:
  - "agda"
  - "Agda"
id: agda
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
type: term
keywords:
  - FormalMethods
  - ProgrammingLanguages
---

Agda is a dependently typed functional programming language and proof assistant based on Martin-Löf type theory. Programs and proofs are the same thing: a proof of a proposition is a well-typed program whose type is that proposition. Agda's type checker verifies totality (termination and coverage), ensuring that every proof is valid.

## Key ideas

- **Dependent types**: types can depend on values, enabling precise specifications and theorem statements within the type system.
- **Proofs as programs**: there is no separate tactic language. Proofs are written as function definitions using pattern matching and equational reasoning.
- **Constructive by default**: Agda is natively intuitionistic. Excluded middle is not assumed; classical axioms can be postulated when needed.
- **Totality checking**: all functions must terminate and cover all cases. This prevents inconsistency.

## Uses

- Formalizing mathematical structures and verifying their properties.
- Teaching type theory and constructive logic through executable proofs.
- Prototyping dependently typed programs where correctness is enforced by the type system.

## See also

- Lean (proof assistant with tactic framework and Mathlib library); Coq, Isabelle/HOL (other proof assistants).
