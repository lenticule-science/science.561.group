---
title: "Dependent Types in Agda"
aliases:
  - "Dependent Types in Agda"
id: agda-lesson-2
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - agda
requires:
  - /technology/disciplines/computing/software/agda/curricula/introduction-to-agda.md
  - /mathematics/disciplines/type-theory/curricula/dependent-types.md
teaches:
  - "Dependent Types in Agda"
description: In Agda, every function type can be dependent.
---

## Dependent function types (Pi-types)

In Agda, every function type can be dependent. The syntax:

```agda
f : (x : A) → B x
```

declares a function where the return type `B x` depends on the input value `x`. When the
return type does not depend on the input, this reduces to the ordinary function type
`A → B`.

**Example.** A function that returns a type based on a boolean:

```agda
T : Bool → Set
T true  = Nat
T false = String
```

A function using this:

```agda
choose : (b : Bool) → T b
choose true  = 42
choose false = "hello"
```

The return type changes depending on the input. The type checker verifies that each clause
returns a value of the correct type.

## Indexed families

An indexed family is a type parameterized by values, not just other types. The classic
example is length-indexed vectors:

```agda
data Vec (A : Set) : Nat → Set where
  []  : Vec A zero
  _∷_ : {n : Nat} → A → Vec A n → Vec A (suc n)
```

The type `Vec A n` encodes its length `n` in the type. The empty vector has type
`Vec A zero`; consing an element to a vector of length `n` produces a vector of length
`suc n`.

This lets you write functions whose types guarantee properties:

```agda
head : {A : Set} {n : Nat} → Vec A (suc n) → A
head (x ∷ _) = x
```

The type `Vec A (suc n)` guarantees the vector is non-empty. The `[]` case is impossible
— the type checker knows this and does not require it.

## Sigma-types (dependent pairs)

Agda represents dependent pairs with record types or the `Σ` type:

```agda
record Σ (A : Set) (B : A → Set) : Set where
  constructor _,_
  field
    fst : A
    snd : B fst
```

An element of `Σ A B` is a pair `(a , b)` where `a : A` and `b : B a`. Under
Curry-Howard, this encodes existential quantification: "there exists an `a : A` such that
`B a` holds."

**Example.** The type of even numbers:

```agda
Even : Nat → Set
Even n = Σ Nat (λ k → n ≡ k + k)

six-is-even : Even 6
six-is-even = 3 , refl
```

The witness is `3`, and the proof is `refl` because `6 ≡ 3 + 3` holds by computation.

## Implicit arguments

Agda uses curly braces for implicit arguments — arguments that the type checker infers:

```agda
id : {A : Set} → A → A
id x = x
```

When calling `id`, you do not supply `A` — Agda infers it from the argument:

```agda
example : Nat
example = id 42  -- A is inferred as Nat
```

You can supply implicit arguments explicitly with braces: `id {Nat} 42`.

Implicit arguments reduce syntactic noise in dependently typed code, where many parameters
are determined by other arguments.

## Instance arguments

Agda also supports instance arguments (in double braces `{{...}}`), which are resolved by
instance search — similar to Lean's type class inference. This is used for algebraic
structures:

```agda
record Monoid (A : Set) : Set where
  field
    ε   : A
    _·_ : A → A → A
    -- ... axioms

fold : {A : Set} → {{Monoid A}} → List A → A
```

The `Monoid` instance is found automatically when one is in scope.

## The with-abstraction

The `with` keyword lets you pattern-match on an intermediate computation:

```agda
filter : {A : Set} → (A → Bool) → List A → List A
filter p []       = []
filter p (x ∷ xs) with p x
... | true  = x ∷ filter p xs
... | false = filter p xs
```

In proof contexts, `with` is used to inspect a decision procedure's result:

```agda
decide-eq : (m n : Nat) → Dec (m ≡ n)
```

Matching on the result with `with decide-eq m n` gives you either a proof of `m ≡ n` or
a proof of `¬ (m ≡ n)`.

## What comes next

- Proving in Agda — equational reasoning chains, congruence, and
  structuring mathematical proofs
