---
name: write-agda-proof
id: write-agda-proof
description: Translate a mathematical statement into Agda and produce a verified proof term. Always check the write-formal-proof skill first for the anti-slop protocol.
type: operational
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
date-updated: 2026-03-07
keywords:
  - agda
  - formal-verification
runtime:
  invocation: inference
  tool: llm
region:
  reads: ["content/technology/disciplines/computing/software/agda/", "content/mathematics/"]
  writes: ["content/mathematics/objects/universes/semiotic-universe/formalization/agda/"]
dependencies:
  - /technology/disciplines/computing/software/agda/curricula/index.md
  - /mathematics/disciplines/type-theory/curricula/dependent-types.md
  - /mathematics/concepts/proof/skills/write-formal-proof/SKILL.md
inputs:
  - A mathematical statement in natural language or informal notation
  - The relevant spec section (e.g., §1.2 of semiotic-universe.md)
outputs:
  - An Agda module containing the type signature and proof term
part-of: technology/disciplines/computing/software/agda
aliases:
  - Write Agda Proof
produces:
  - An Agda module containing the type signature and proof term
title: write-agda-proof
---

# Write Agda Proof

## Prerequisites

Read the [write-formal-proof](/mathematics/concepts/proof/skills/write-formal-proof/SKILL.md) skill first. It contains the anti-slop checklist that must pass before any proof is considered complete.

## Agda-specific workflow

1. **State the proposition** as an Agda type signature with explicit
   universe levels and parameters.

2. **Identify standard library imports.** Common ones:
   - `Relation.Binary.PropositionalEquality` — `_≡_`, `refl`, `cong`,
     `sym`, `trans`, `subst`
   - `Data.Nat`, `Data.List` — basic data types
   - `Data.Product` — `_×_`, `_,_`, `proj₁`, `proj₂`
   - `Data.Sum` — `_⊎_`, `inj₁`, `inj₂`
   - `Level` — universe level management
   - `Function` — `id`, `_∘_`, `case_of_`

3. **Write the proof as a function definition.** Agda has no tactic
   mode — proofs are terms. Use:
   - Pattern matching for case analysis
   - `where` clauses for helper lemmas
   - Equational reasoning chains for multi-step equalities
   - `trans` chains: `trans step1 (trans step2 step3)`
   - `cong f eq` to lift equality through a function

4. **Use holes (`{!!}`) during development** to inspect goal types.
   Replace all holes before considering the proof complete.
   Auto-case split with `C-c C-c` in an Agda-mode editor.

5. **Verify type-checking:**
   ```sh
   LC_ALL=C.UTF-8 agda SemioticUniverse/Everything.agda
   ```

## Common Agda patterns

**Dealing with name ambiguity:**
When importing both `Level` and `Data.Nat`, `suc` becomes ambiguous.
Fix: `open import Level renaming (suc to lsuc)`.

**Records vs modules:**
- `record` for bundled structures (data + laws together)
- Parameterized `module` for shared context (operations, axioms)
- `open record-value` to bring fields into scope

**Parameterized modules (our pattern):**
```agda
module Fragments {ℓ : Level} (H : Set ℓ) (_⊓_ : H → H → H) ... where
```
This factors common parameters across all definitions in the module.
Consumers open with `open Fragments H _⊓_ ...`.

**Equational reasoning chains:**
```agda
open import Relation.Binary.PropositionalEquality using (begin_; _≡⟨_⟩_; _∎)
proof = begin
  lhs       ≡⟨ step1 ⟩
  middle     ≡⟨ step2 ⟩
  rhs       ∎
```

**Constructive idioms:**
- `Dec A` instead of booleans for decidable propositions
- Absurd patterns `()` for impossible cases
- No LEM by default — Agda is intuitionistic
- Setoids for quotients (no quotient types in vanilla Agda)

## Universe level conventions

- Every definition carries explicit universe levels
- Use `Level` and `_⊔_` from `Level` module
- Records parameterized by `(ℓ : Level)` for polymorphism
- The category R lives at `(ℓ ℓ′ : Level)`
- When a record field's type is `Set (lsuc ℓ)`, the record
  itself must live at `Set (lsuc (lsuc ℓ))` or higher

## Semiotic universe conventions

- One file per construction layer
- Modules parameterized over the semantic domain for reuse
- The synthetic approach: construct, don't axiomatize
- `postulate` only with explicit justification comments
- `record` fields that are postulated must explain what
  construction would discharge them (e.g., "requires
  exponential objects in the topos")

## External libraries

- **agda-stdlib** (v1.7.3 via apt, or v2.x via cabal): provides
  algebraic structures, relations, data types
- **agda-categories** (v0.3.0): categories, functors, adjunctions,
  limits, Yoneda, cartesian closed categories, elementary topos
  with subobject classifier. Does NOT cover Lawvere-Tierney
  topologies — that's our novel contribution.
- **1Lab** (cubical Agda): extensive category theory with
  computational univalence. Reference for category-theoretic
  concepts but uses cubical foundations.

## Anti-slop (Agda-specific)

- No `{!!}` holes in committed code.
- Every `postulate` must have a comment explaining:
  (a) what it asserts, (b) why it is true, (c) what would be
  needed to prove it.
- Verify imports actually resolve — don't import modules that
  don't exist in your stdlib version.
- If you redefine something from stdlib (like list membership),
  document why (e.g., "redefined to avoid universe level issues").
- Run `agda --check` before committing. If you cannot run it,
  say "UNVERIFIED" explicitly.
- Watch for `Level.suc` vs `Data.Nat.suc` ambiguity — use
  `renaming (suc to lsuc)` on the Level import.
