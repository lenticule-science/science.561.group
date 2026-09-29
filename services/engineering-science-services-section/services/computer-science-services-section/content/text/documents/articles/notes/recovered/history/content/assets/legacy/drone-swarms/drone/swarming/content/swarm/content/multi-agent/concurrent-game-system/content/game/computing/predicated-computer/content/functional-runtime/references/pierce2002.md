---
type: reference
class: academic
status: cited
authors: [Pierce, Benjamin C.]
year: 2002
title: "Types and Programming Languages"
venue: "MIT Press"
---

## Source

B. C. Pierce. *Types and Programming Languages*. MIT Press, 2002. (Companion volume: *Advanced Topics in Types and Programming Languages*, 2005.)

## Form

Textbook. The standard graduate-level reference for type systems in programming languages, widely known as TAPL. Covers type-system design, type-checking algorithms, type-system soundness proofs, and the relationship between type systems and program logic.

## Content summary

Develops the type-systems field from the untyped lambda calculus through System F-omega and dependent types. Part I introduces the untyped lambda calculus with substitution semantics and reduction strategies. Part II introduces simple types: the simply-typed lambda calculus with progress and preservation as the canonical soundness theorem (chapter 8). Subsequent parts develop subtyping (chapters 15–18), recursive types (chapters 20–21), polymorphism (System F, chapters 22–25, including parametricity), bounded quantification, type operators (System F-omega, chapter 30), higher-order subtyping, and a brief introduction to dependent types (chapter 30, with a longer treatment in the companion volume). Each chapter develops the type system formally, gives a typing-rule presentation, gives a type-checking algorithm where decidable, and proves soundness via progress + preservation.

The progress + preservation proof structure introduced in chapter 8 is the canonical template for type-soundness proofs across the field: *progress* shows that well-typed non-value terms can take an evaluation step; *preservation* shows that evaluation steps preserve well-typedness. Together they prove the soundness theorem: well-typed programs do not get stuck. The same proof structure scales through every subsequent type system in the book; the substrate's [type-soundness](../theorems/type-soundness.md) theorem inherits the structure directly.

Chapter 22 (Type Reconstruction) presents the Hindley-Milner inference algorithm with let-polymorphism, the basis for most ML-family type checkers (Haskell, OCaml, Standard ML, F#, Roc). Chapter 23 (Universal Types) presents System F. Chapter 24 (Existential Types) presents the existential-type encoding of abstract data types — relevant to capability-style design where capabilities are existential witnesses.
