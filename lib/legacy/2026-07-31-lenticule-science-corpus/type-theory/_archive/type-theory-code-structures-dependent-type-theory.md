---
type: definition
class: calculus
status: current
depends-on: [simply-typed-lambda-calculus, pi-type, sigma-type, identity-type, universe, inductive-type]
realizes: [typing-judgment, inhabitation, universe-level]
symbol: MLTT
---

# Dependent type theory

A **dependent type theory** is a type theory in which types may *depend on values* — the type of the second component of a pair may mention the first component, the output type of a function may mention the input. The two binders that distinguish a dependent type theory are the [pi-type](pi-type.md) $\Pi(x : A).\,B(x)$ and the [sigma-type](sigma-type.md) $\Sigma(x : A).\,B(x)$.

The canonical reference theory is *Martin-Löf type theory* (MLTT): the type formers are Π, Σ, the [inductive-types](inductive-type.md), the [identity-type](identity-type.md), the [unit-type](unit-type.md), the [empty-type](empty-type.md), and the [universe](universe.md) hierarchy. Variants differ in which axioms (function extensionality, propositional extensionality, [univalence](../theorems/univalence-axiom.md), choice) are admitted and in how the [identity-type](identity-type.md) is treated.

## Structure

The judgmental apparatus is the four standard judgments of [typing-judgment](teaching/explanations/typing-judgment.md). The novel feature is that *type formation* is itself a judgment: $\Gamma \vdash A : \mathrm{Type}_i$. Contexts are *telescopes* — each $A_i$ may depend on the variables introduced before it.

The [curry-howard-correspondence](../theorems/curry-howard-correspondence.md) extends fully: Π is universal quantification, Σ is existential quantification, [identity-types](identity-type.md) are equality, [empty-type](empty-type.md) is falsehood, and proof-construction is term-construction. This is the propositions-as-types view in its strongest form.

## What this is not

MLTT is *not* the same as set theory: types are not extensional in the way sets are (without an explicit extensionality axiom), and equality is not a primitive but a type former. MLTT is *not* automatically classical: [excluded-middle](questions/classical-vs-intuitionistic.md) is admissible but must be added as an axiom. MLTT is *not* impredicative by default — predicativity is what the [universe-level](teaching/explanations/universe-level.md) stratification enforces.

## Position

Dependent type theory is the foundation of every modern proof assistant — Lean, Agda, Coq, Idris all rest on MLTT-style cores. The corpus's [predication-categories](../../categories/theories/predication-categories/_index.md) are the categorical semantics of dependent type theory: a fibration of contexts and substitutions. Reference: [Martin-Löf 1984](references/martin-lof1984.md), [Nordström, Petersson & Smith 1990](references/nordstrom-petersson-smith1990.md), [Univalent Foundations Program 2013](references/univalent-foundations2013.md).
