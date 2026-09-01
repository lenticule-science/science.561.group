---
title: "Tactics in Lean"
aliases:
  - "Tactics in Lean"
id: lean-lesson-3
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - Lean
requires:
  - /technology/disciplines/computing/software/lean/curricula/types-and-propositions-in-lean.md
teaches:
  - "Tactics in Lean"
---

## What tactics do

A [tactic](../terms/tactic.md) transforms a proof goal into simpler subgoals. The proof
state consists of:

- **Context**: named hypotheses and local definitions.
- **Goal**: the type (proposition) that remains to be proved.

Each tactic inspects the goal and context, then either closes the goal (producing a proof
term) or splits it into subgoals. When all goals are closed, the proof is complete and
Lean's kernel checks the assembled proof term.

## Core tactics

### Introducing hypotheses

`intro` moves a universally quantified variable or implication antecedent from the goal
into the context:

```lean
-- Goal: ∀ n : Nat, n = n
-- After: intro n
-- Context: n : Nat
-- Goal: n = n
```

`intro h` names the introduced hypothesis `h`. Multiple introductions: `intro a b h`.

### Applying lemmas

`apply` works backward from the goal. If the goal is `Q` and you have a lemma
`lem : P → Q`, then `apply lem` changes the goal to `P`:

```lean
-- Goal: b ≤ c
-- After: apply le_trans (b := middle)
-- Goal 1: b ≤ middle
-- Goal 2: middle ≤ c
```

### Supplying exact terms

`exact` closes a goal by providing the proof term directly:

```lean
-- Context: h : P
-- Goal: P
-- After: exact h
-- (goal closed)
```

### Rewriting

`rw` replaces occurrences of one side of an equation with the other:

```lean
-- Context: h : a = b
-- Goal: f a = f b
-- After: rw [h]
-- Goal: f b = f b
```

`rw [← h]` rewrites right-to-left. Multiple rewrites: `rw [h₁, h₂, h₃]`.

### Case analysis

`cases` splits an inductive value into its constructors:

```lean
-- Context: h : P ∨ Q
-- Goal: R
-- After: cases h with
-- | inl hp => -- Context: hp : P, Goal: R
-- | inr hq => -- Context: hq : Q, Goal: R
```

For natural numbers, `cases n` splits into `zero` and `succ m`.

### Induction

`induction` is `cases` with an induction hypothesis:

```lean
-- Goal: ∀ n, 0 + n = n
-- After: intro n; induction n with
-- | zero => -- Goal: 0 + 0 = 0
-- | succ m ih => -- Context: ih : 0 + m = m, Goal: 0 + succ m = succ m
```

### Simplification

`simp` applies a set of rewriting lemmas (marked with `@[simp]`) repeatedly until no
more apply. It handles routine algebraic simplification, arithmetic, and definitional
unfolding:

```lean
-- Goal: 0 + n = n
-- After: simp
-- (goal closed)
```

`simp [custom_lemma]` adds a lemma to the simp set for this call.

### Constructor

`constructor` applies the constructor of an inductive type when the goal matches:

```lean
-- Goal: P ∧ Q
-- After: constructor
-- Goal 1: P
-- Goal 2: Q
```

## Mathlib tactics

[Mathlib](../terms/Mathlib.md) extends Lean's tactic set with specialized automation:

- `ring` — closes goals that follow from ring axioms (commutativity, associativity,
  distributivity).
- `linarith` — closes goals that follow from linear arithmetic over ordered fields.
- `omega` — decides linear arithmetic over integers and natural numbers.
- `norm_num` — evaluates numerical expressions and decides numerical propositions.
- `aesop` — an extensible "auto" tactic that combines multiple strategies (apply, simp,
  cases, etc.) to close goals.
- `gcongr` — proves goals by congruence (monotonicity of operations).
- `positivity` — proves positivity/nonnegativity goals.

These tactics automate routine proof steps, letting the human focus on the key ideas while
the machine handles bookkeeping.

## Combining tactics

Tactics compose sequentially (separated by newlines or `;`) and branch with `<;>` (apply
a tactic to all remaining goals) or structured syntax:

```lean
theorem example_proof (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  constructor
  · exact hp
  · exact hq
```

The `·` focuses on a specific subgoal. This structured style keeps proofs readable.

## A worked example

Prove that meet is commutative in a [lattice](../../../../../../mathematics/objects/posets/terms/lattice.md):

```lean
theorem inf_comm {α : Type} [Lattice α] (a b : α) : a ⊓ b = b ⊓ a := by
  apply le_antisymm
  · apply le_inf
    · exact inf_le_right
    · exact inf_le_left
  · apply le_inf
    · exact inf_le_right
    · exact inf_le_left
```

Step by step:
1. `le_antisymm` reduces equality to two `≤` goals.
2. Each `≤` goal is solved by `le_inf` (to prove something is below a meet, prove it is
   below both components) combined with the [lattice](../../../../../../mathematics/objects/posets/terms/lattice.md) axioms `inf_le_left` and
   `inf_le_right`.

In Mathlib, this theorem already exists as `inf_comm`, and `simp` or `exact inf_comm`
would close the goal directly. The explicit proof shows the tactic structure.

## Practical advice

- **Read the goal.** Before choosing a tactic, read the proof state. The goal's shape
  determines which tactic applies.
- **Use `exact?` and `apply?`** to search for lemmas that close or simplify the current
  goal. These tactics query the library and report matching results.
- **Start with `simp` or `aesop`** for goals that look routine. If they do not close the
  goal, inspect what remains and proceed manually.
- **Name hypotheses clearly.** `intro h₁ h₂` is harder to read than `intro hle hlt`.
  Names document the proof's logic.
- **Build incrementally.** Write one tactic, inspect [the state](../../../../../../sociology/terms/the-state.md), write the next. Do not
  try to write a complete tactic block from memory.
