---

title: "Types and Propositions in Lean"
aliases:
  - "Types and Propositions in Lean"
date-created: 2026-03-01T00:00:00
keywords:
  - lean
requires:
  - /technology/disciplines/computing/software/lean/curricula/introduction-to-lean.md
  - /mathematics/disciplines/type-theory/curricula/dependent-types.md
teaches:
  - "Types and Propositions in Lean"
---

## Prop and Type

Lean distinguishes two sorts:

- `Type` (actually `Type u` for universe level `u`) — the sort of computational types.
  `Nat : Type`, `String : Type`, `List Nat : Type`.
- `Prop` — the sort of propositions. `2 + 2 = 4 : Prop`, `∀ n, n + 0 = n : Prop`.

The distinction matters for erasure: values of type `Prop` are erased at runtime because
they carry no computational content — a proof that `2 + 2 = 4` does not affect program
execution. This separation lets Lean be both a programming language and a proof assistant
without proofs slowing down compiled code.

Both `Prop` and `Type` support [dependent types](../../../../../../../../../humanities/theories/math/theories/type-theory/texts/dependent-types.md). Dependent function types (`∀` / `Π`) and dependent pair types (`Σ` / `⟨_, _⟩`) work in both sorts.

## Encoding mathematical structures

Mathematical structures in Lean are defined as `structure` or `class` declarations —
bundled records of data and properties.

**Example: [partial order](../../../../../../../../../humanities/theories/math/theories/order/terms/partial-order.md).**

```lean
class PartialOrder (α : Type) extends LE α where
  le_refl  : ∀ a, a ≤ a
  le_trans : ∀ a b c, a ≤ b → b ≤ c → a ≤ c
  le_antisymm : ∀ a b, a ≤ b → b ≤ a → a = b
```

This says: a [partial order](../../../../../../../../../humanities/theories/math/theories/order/terms/partial-order.md) on a type `α` is a `≤` relation together with proofs of
reflexivity, transitivity, and antisymmetry. The `class` keyword enables Lean's type class
inference to find instances automatically.

**Example: [lattice](../../../../../../../../../humanities/theories/math/theories/order/terms/lattice.md).**

```lean
class Lattice (α : Type) extends PartialOrder α where
  inf : α → α → α
  sup : α → α → α
  inf_le_left  : ∀ a b, inf a b ≤ a
  inf_le_right : ∀ a b, inf a b ≤ b
  le_inf       : ∀ a b c, c ≤ a → c ≤ b → c ≤ inf a b
  le_sup_left  : ∀ a b, a ≤ sup a b
  le_sup_right : ∀ a b, b ≤ sup a b
  sup_le       : ∀ a b c, a ≤ c → b ≤ c → sup a b ≤ c
```

Each field is either data (`inf`, `sup`) or a proof obligation (the axioms). Constructing
an instance of `Lattice α` requires supplying all of them.

## Encoding [Heyting algebras](../../../../../../mathematics/concepts/heyting-algebra/index.md)

Mathlib provides `HeytingAlgebra` and `CompleteHeytingAlgebra` classes. A
[Heyting algebra](../../../../../../../../../humanities/theories/math/theories/order/texts/heyting-algebras.md)
extends a bounded [lattice](../../../../../../../../../humanities/theories/math/theories/order/terms/lattice.md) with an implication operation:

```lean
class HeytingAlgebra (α : Type) extends Lattice α, Top α, Bot α where
  himp : α → α → α
  le_himp_iff : ∀ a b c, a ≤ himp b c ↔ a ⊓ b ≤ c
```

The field `le_himp_iff` encodes the defining [adjunction](../../../../../../../../../humanities/theories/math/theories/topology/terms/adjunction.md): $c \leq (a \Rightarrow b)$ iff
$c \wedge a \leq b$. This is the [Heyting implication](../../../../../../../../../humanities/theories/math/theories/logic/terms/heyting-implication.md) expressed as a type class.

Mathlib's `CompleteHeytingAlgebra` adds arbitrary meets and joins, matching the complete
[Heyting algebra](../../../../../../mathematics/concepts/heyting-algebra/index.md) that the Semiotic Universe requires as its ambient semantic domain.

## Propositions as types in practice

In Lean, logical connectives are defined as inductive types in `Prop`:

- `And P Q` (notation `P ∧ Q`) — a structure with fields `.left : P` and `.right : Q`.
  A proof of `P ∧ Q` is a pair of proofs.
- `Or P Q` (notation `P ∨ Q`) — an inductive with constructors `.inl : P → P ∨ Q` and
  `.inr : Q → P ∨ Q`. A proof of `P ∨ Q` is a proof of `P` or a proof of `Q`.
- `P → Q` — the function type. A proof of `P → Q` is a function that transforms proofs
  of `P` into proofs of `Q`.
- `¬P` is defined as `P → False`. A proof of `¬P` is a function that derives a
  contradiction from any proof of `P`.
- `∀ x : α, P x` — a dependent function type. A proof is a function that, given any
  `x : α`, produces a proof of `P x`.
- `∃ x : α, P x` — a dependent pair in `Prop`. A proof is a witness `x` together with a
  proof of `P x`.

This is the [Curry-Howard correspondence](../../../../../../../../../humanities/theories/math/theories/type-theory/texts/typed-lambda-calculus.md) in action. Every logical operation is a type operation; every proof step is a program construction step.

## Classical reasoning

Lean's logic is intuitionistic by default — [excluded middle](../../../../../../../../../humanities/theories/philosophy/theories/western/theories/analytic-philosophy/terms/law-of-excluded-middle.md) is not assumed. To use
classical reasoning:

```lean
open Classical in
theorem em_example (P : Prop) : P ∨ ¬P := em P
```

`Classical.em` provides [excluded middle](../../../../../../../../../humanities/theories/philosophy/theories/western/theories/analytic-philosophy/terms/law-of-excluded-middle.md) as an axiom. Lean also provides `Classical.choice`
(a global choice principle). These are available but opt-in: you import them when you need
them, and the proof explicitly records their use.

For formalizing the Semiotic Universe's [intuitionistic logic](../../../../../../../../../humanities/theories/math/theories/logic/texts/intuitionistic-logic.md), working without classical axioms is often preferable — it keeps proofs constructive and aligned with the [Heyting](../../../../../../../../../../../references/people/arend-heyting.md)-algebraic semantics.

## What comes next

- Tactics in Lean — the practical tools for constructing proofs
  step by step
