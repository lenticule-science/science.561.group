---
title: "Propositions as Types: Why a Proof Is a Program"
description: "An explanation of the Curry–Howard correspondence — that a proposition and a type are the same thing, a proof and a program are the same thing, and proving and computing are the same activity — and why this corpus reads a filepath as a proof term on exactly that basis."
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["curry-howard", "propositions-as-types", "type-theory", "proof-theory", "lambda-calculus", "intuitionistic-logic", "natural-deduction", "constructive-mathematics"]
type: explanation

---


This is an explanation.
It does not tell you how to prove a particular theorem or write a particular program; it tries to dissolve a separation you were probably taught to keep — between *proving that something is true* and *building something that works* — by showing that the two activities are not analogous, not similar, but **identical**.
This identity is the Curry–Howard correspondence, and once you have it, a large amount of what this corpus does stops looking like metaphor and starts looking like bookkeeping.

## The separation you were taught

Most people meet logic and programming in different rooms.

In the logic room, a *proposition* is a claim that is true or false — "if it is raining then the ground is wet" — and a *proof* is an argument, a sequence of justified steps ending at the claim. The proof is scaffolding: once the theorem is known true, you are encouraged to throw the proof away and keep the fact.

In the programming room, a *type* is a constraint on data — `Int`, `String`, `Int → Bool` — and a *program* is a construction, an expression that, if it type-checks, can be run. The program is the point; the type is a guard rail you pass on the way to it.

These look like two unrelated disciplines that happen to both like Greek letters. The claim of this explanation is that the wall between the rooms is painted on. The proposition *is* the type. The proof *is* the program. Throwing away a proof and keeping the fact is throwing away a program and keeping the assertion that one exists.

## The dictionary

Line the two columns up and the correspondence is a literal translation table, not a loose analogy:

| Logic | Type theory |
|---|---|
| proposition `A` | type `A` |
| `A` is provable | type `A` is *inhabited* (has a closed term) |
| a proof of `A` | a term `t : A` |
| implication `A ⊃ B` | function type `A → B` |
| conjunction `A ∧ B` | product type `A × B` |
| disjunction `A ∨ B` | sum type `A + B` |
| truth `⊤` | unit type (one inhabitant) |
| falsity `⊥` | empty type (no inhabitants) |
| `¬A`, i.e. `A ⊃ ⊥` | `A → ∅` |
| universal `∀x. P(x)` | dependent product `Πx. P(x)` |
| existential `∃x. P(x)` | dependent sum `Σx. P(x)` |
| simplifying a proof (cut elimination) | running a program (β-reduction) |

Read one entry slowly, because it carries the rest. A proof of the implication `A ⊃ B` is, concretely, a *method*: give it any proof of `A` and it hands you back a proof of `B`. That is exactly a function of type `A → B`: give it any value of type `A` and it returns a value of type `B`. The proof *is* the function. There is nothing left over in the proof that the function fails to capture, and nothing in the function that is not doing proof-work.

Falsity seals the table. `⊥` is the proposition with no proof; the empty type is the type with no inhabitant. Negation `¬A` is "`A` implies the absurd," the function type `A → ∅` — a procedure that, fed a proof of `A`, would manufacture an inhabitant of a type that has none. To prove `¬A` is to write a total function into the empty type, which can only exist if its input type is itself uninhabited. The logic and the typing are not two facts that agree; they are one fact written twice.

## Why the directions match: a proof is read like a program is run

Curry–Howard is not only a dictionary between static objects. It matches their *dynamics*, and this is where it becomes load-bearing for how this corpus is organized.

In proof theory, a proof built by chaining lemmas can be *simplified*: where you proved a lemma and then immediately used it, you can inline the construction and remove the detour. This is **cut elimination** (or normalization), and a normalized proof is one with no detours left. In type theory, the same move is **β-reduction**: `(λx. t) u` reduces to `t` with `u` substituted for `x` — you stop describing a computation and actually perform it. The correspondence makes these the *same operation*. Normalizing a proof is running the program it is. A fully simplified proof is a fully evaluated program: a value.

So the arrow has a direction, and the direction is the same on both sides. Reading a proof from premises to conclusion is running a program from inputs to output. This is the **Curry–Howard directionality** the corpus names: an arrow `A → B` is at once a proof of `A ⊢ B`, a program from `A` to `B`, a categorical morphism `A → B`, and — in its Hoare face — the triple `{A} C {B}`, precondition to postcondition. Domain is premise is precondition; codomain is conclusion is postcondition; composition is "and then." One arrow, four readings.

## What the correspondence costs you, and what it buys

It costs you classical logic for free. The proofs-are-programs reading is *constructive*: a proof of `A ∨ B` is a program that actually produces either a proof of `A` or a proof of `B`, tagged with which one. So the law of the excluded middle, `A ∨ ¬A`, is not free — it would be a program that, for *any* proposition, decides it or refutes it, and no such program exists in general. This is not a defect; it is the correspondence being honest. The logic that matches computation exactly is intuitionistic logic, which is why this corpus's truth values live in a Heyting algebra and not a Boolean one, and why contradiction is carried as a value on a bilattice rather than detonating into triviality. (Classical logic is recovered, when wanted, through control operators — `A ∨ ¬A` corresponds to call/cc — but that is a deliberate extension, not the ground state.)

What it buys is enormous, and the corpus spends it everywhere:

- **Inhabitation is provability**, so a type system *is* a proof checker. Lean, Agda, and Coq are not "logic-flavoured programming languages"; they are proof assistants because type-checking a term and verifying a proof are the same procedure. The corpus's `status: proved` is literally the assertion that a type is inhabited.
- **A type bounds what its terms may assert.** The empty type's emptiness, the unit type's triviality, the function type's input demand — each is a constraint the proposition places on any proof of it. This is the same discipline that makes the codec leaf `eavt` carry evidence only and no polarity: the type you have arrived at fixes what you are allowed to say there.
- **A path can be a proof.** If descending a typing context to a conclusion is proving, and a POSIX path's segments are restriction morphisms that conjoin (`recognize_child = recognize_parent ∧ local`), then a canonical filepath is a proof term: each segment one entailment edge, the leaf the conclusion it earns. `science/mathematics/type-theory` is the term `1 → S → M → T`, a proof that the document at its end carries that type. The directory tree is not a set of shelves; it is, read correctly, a book of proofs.

## The thing to carry away

There are not two activities, proving and building, that happen to rhyme. There is one activity, seen from two angles. A proposition is a specification of what would count as evidence for it; a type is a specification of what would count as a value of it; these specifications are the same specification. A proof supplies the evidence; a program supplies the value; these are the same supply. Simplifying the proof and running the program are the same motion. Once the wall between the two rooms is gone, the corpus's central move — reading a filepath as a Curry–Howard proof coordinate, an object as the bundle of arrows that prove their way into it — is not a clever metaphor imported from mathematics. It is just what was always true, finally written down once instead of twice.
