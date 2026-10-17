---
title: "Proving in Agda"
aliases:
  - "Proving in Agda"
id: agda-lesson-3
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - agda
requires:
  - /technology/disciplines/computing/software/agda/curricula/dependent-types-in-agda.md
  - /mathematics/disciplines/logic/curricula/intuitionistic-logic.md
  - /mathematics/objects/posets/curricula/heyting-algebras.md
teaches:
  - "Proving in Agda"
description: In Agda, there is no separate Prop sort — propositions are ordinary types in Set.
---

## Propositions as types

In Agda, there is no separate `Prop` sort — propositions are ordinary types in `Set`.
A proof of proposition `P` is a term of type `P`. The logical connectives are defined as
data types:

```agda
-- Conjunction
record _×_ (A B : Set) : Set where
  constructor _,_
  field fst : A ; snd : B

-- Disjunction
data _⊎_ (A B : Set) : Set where
  inj₁ : A → A ⊎ B
  inj₂ : B → A ⊎ B

-- Negation
¬_ : Set → Set
¬ A = A → ⊥    -- where ⊥ is the empty type

-- Existential
-- Σ type (see previous lesson)

-- Universal: dependent function type (x : A) → P x
```

Because Agda is [intuitionistic](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/teaching-articles/explanations/intuitionistic-logic.md), [excluded middle](../../../../../../../../../../../../philosophy-services-section/services/western-services-section/services/analytic-philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md) is not available by default. A proof of `A ⊎ B` must supply a proof of `A` or a proof of `B` — you cannot argue "suppose neither, derive a contradiction."

## Equational reasoning

Agda's standard library provides a module for writing proofs as chains of equalities,
mirroring the style of mathematical proofs on paper:

```agda
open import Relation.Binary.PropositionalEquality
open ≡-Reasoning

+-comm : (m n : Nat) → m + n ≡ n + m
+-comm zero    n = sym (+-zero n)
+-comm (suc m) n =
  begin
    suc m + n
  ≡⟨⟩              -- by definition of +
    suc (m + n)
  ≡⟨ cong suc (+-comm m n) ⟩
    suc (n + m)
  ≡⟨ sym (+-suc n m) ⟩
    n + suc m
  ∎
```

The `begin ... ∎` block chains steps. Each `≡⟨ proof ⟩` provides a justification for the
equality between the line above and the line below. `≡⟨⟩` (no proof) means the equality
holds by computation (definitional equality).

This style makes proofs self-documenting: each step records what changed and why.

## Congruence and substitution

Two fundamental proof tools:

**Congruence** (`cong`): if `a ≡ b`, then `f a ≡ f b` for any function `f`:

```agda
cong : {A B : Set} (f : A → B) {x y : A} → x ≡ y → f x ≡ f y
cong f refl = refl
```

**Substitution** (`subst`): if `a ≡ b` and `P a`, then `P b`:

```agda
subst : {A : Set} (P : A → Set) {x y : A} → x ≡ y → P x → P y
subst P refl px = px
```

Both follow from `refl` by pattern matching — when the equality proof is `refl`, the two
sides are definitionally equal and the result is immediate.

## Encoding algebraic structures

Mathematical structures in Agda are record types bundling data and proofs:

```agda
record IsPartialOrder {A : Set} (_≤_ : A → A → Set) : Set where
  field
    refl  : ∀ {a} → a ≤ a
    trans : ∀ {a b c} → a ≤ b → b ≤ c → a ≤ c
    antisym : ∀ {a b} → a ≤ b → b ≤ a → a ≡ b
```

A [lattice](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/lattice.md) adds meet and join with their axioms. A [Heyting algebra](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/documents/articles/notes/heyting-algebras.md) adds implication with the defining [adjunction](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/topology-services-section/content/text/glossary/terms/adjunction.md):

```agda
record IsHeytingAlgebra {A : Set} (_≤_ : A → A → Set)
       (_∧_ _∨_ : A → A → A) (_⇒_ : A → A → A)
       (⊤ ⊥ : A) : Set where
  field
    isLattice : IsLattice _≤_ _∧_ _∨_ ⊤ ⊥
    himp-adjoint : ∀ {a b c} → c ≤ (a ⇒ b) ↔ (c ∧ a) ≤ b
```

Constructing an instance of `IsHeytingAlgebra` for a specific algebra requires supplying
proofs of every field — the type checker verifies them all.

## Proving properties of [closure operators](../../../../../../mathematics/concepts/closure-operator/index.md)

The [closure operators](../../../../../../mathematics/objects/posets/curricula/closure-operators.md) that build the Semiotic Universe can be formalized as record types:

```agda
record IsClosureOp {A : Set} (_≤_ : A → A → Set)
       (cl : A → A) : Set where
  field
    extensive  : ∀ {a} → a ≤ cl a
    monotone   : ∀ {a b} → a ≤ b → cl a ≤ cl b
    idempotent : ∀ {a} → cl (cl a) ≡ cl a
```

Proving that a specific function is a [closure operator](../../../../../../mathematics/concepts/closure-operator/index.md) means constructing a term of type
`IsClosureOp _≤_ f` — providing proofs of extensiveness, monotonicity, and idempotence.

The Knaster-Tarski fixed-point theorem can also be stated and proved in Agda, though the
proof requires careful handling of complete [lattice](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/lattice.md) structure and well-founded recursion.

## Practical advice

- **Work with holes.** Write `?` for any part you are unsure of. Load the file (C-c C-l)
  and inspect the hole's type. Let the type guide the next step.
- **Use case splitting.** Place the cursor in a hole, type a variable name, and press
  C-c C-c. Agda generates one clause per constructor.
- **Read the goal type.** The goal type tells you what you need to construct. If the goal
  is `a ≡ b`, you need an equality proof. If the goal is `A × B`, you need a pair.
- **Name things.** Agda allows unicode identifiers — use `≤`, `∧`, `⊎`, `≡` for
  readability. Mathematical notation in code makes proofs easier to cross-reference with
  their informal counterparts.
- **Start small.** Prove simple properties first (reflexivity, symmetry) before attempting
  complex theorems. Each proved lemma becomes a building block for the next proof.
