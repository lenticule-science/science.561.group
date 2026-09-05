---

title: "Introduction to Agda"
aliases:
  - "Introduction to Agda"
date-created: 2026-03-01T00:00:00
keywords:
  - agda
requires:
  - /mathematics/disciplines/type-theory/curricula/dependent-types.md
  - /mathematics/disciplines/logic/curricula/intuitionistic-logic.md
teaches:
  - "Introduction to Agda"
---

## What Agda is

Agda is a dependently typed functional programming language based on Martin-Löf type
theory. It is simultaneously a programming language and a proof assistant: every
well-typed program is a proof, and every proof is a program.

Unlike [Lean](../../lean/index.md), which provides a tactic language for constructing
proofs interactively, Agda proofs are written as ordinary function definitions using
[pattern matching](../terms/pattern-matching.md). There is no tactic layer — the proof
IS the code. This design choice makes proofs explicit and readable at the cost of less
automation.

Agda's type theory is natively [intuitionistic](../../../../../../../../../humanities/theories/math/theories/logic/texts/intuitionistic-logic.md). Excluded middle is not assumed. Every proof constructs its witness. Classical axioms can be postulated if needed, but the default is constructive.

## Installation

Agda is installed through the Haskell package manager:

```bash
cabal install Agda
```

Or via a package manager (`apt install agda`, `brew install agda`, etc.). After
installation, `agda --version` confirms the setup.

The standard library is installed separately:

```bash
git clone https://github.com/agda/agda-stdlib
```

Then add its path to `~/.agda/libraries` and `~/.agda/defaults`.

Editor support: Emacs with `agda2-mode` is the traditional environment, providing
interactive type checking, goal display, and case splitting. VS Code with the `agda-mode`
extension offers similar features.

## Interactive editing

Agda's development workflow is interactive. You write definitions with **holes** (marked
`?` or `{! !}`) and ask the type checker to fill or refine them:

- **C-c C-l** (load): type-check the file and display any errors or unsolved holes.
- **C-c C-c** (case split): in a hole, split on a variable — Agda generates one clause
  per constructor.
- **C-c C-r** (refine): if there is an obvious next step, fill the hole with it.
- **C-c C-a** (auto): attempt to fill the hole automatically.
- **C-c C-,** (goal type): display the type of the current hole and the available context.

This interactive loop — write a hole, inspect its type, refine or split — is how Agda
proofs are developed in practice.

## First definitions

Agda modules begin with a module declaration:

```agda
module Example where
```

Data types are defined with the `data` keyword:

```agda
data Nat : Set where
  zero : Nat
  suc  : Nat → Nat
```

This defines natural numbers as an inductive type with two constructors. `Set` is the
[universe](../terms/universe-level.md) of types.

Functions are defined by pattern matching:

```agda
_+_ : Nat → Nat → Nat
zero  + n = n
suc m + n = suc (m + n)
```

Agda checks that the patterns are exhaustive (every constructor is covered) and that the
function terminates (recursive calls are on structurally smaller arguments).

## First proofs

Equality in Agda is a type. The standard definition:

```agda
data _≡_ {A : Set} : A → A → Set where
  refl : {x : A} → x ≡ x
```

`refl` is the only constructor: it proves that any value equals itself. To prove `a ≡ b`,
you must show that `a` and `b` compute to the same value — then `refl` applies.

A first proof:

```agda
+-zero : (n : Nat) → n + zero ≡ n
+-zero zero    = refl
+-zero (suc m) = cong suc (+-zero m)
```

Step by step:
- Base case: `zero + zero` computes to `zero`, so `refl` applies.
- Inductive case: `suc m + zero` computes to `suc (m + zero)`. The goal is
  `suc (m + zero) ≡ suc m`. By the induction hypothesis `+-zero m : m + zero ≡ m`,
  and `cong suc` applies `suc` to both sides of that equality.

The proof is a recursive function. The induction hypothesis is the recursive call. Pattern
matching on the input is case analysis. This is proofs-as-programs in its purest form.

## Totality checking

Agda enforces two discipline constraints:

1. **Termination**: all recursive functions must terminate. Agda checks that recursive
   calls are on structurally smaller arguments (a conservative approximation of
   termination).
2. **Coverage**: pattern matches must be exhaustive — every constructor of the matched
   type must appear.

These constraints ensure that every Agda function defines a total function and every proof
is valid. A non-terminating function could prove anything (by infinite regress), so
totality is essential for logical consistency.

## What comes next

- Dependent Types in Agda — Pi-types, Sigma-types, indexed
  families, and implicit arguments
- Proving in Agda — equational reasoning, congruence, and
  structuring proofs
