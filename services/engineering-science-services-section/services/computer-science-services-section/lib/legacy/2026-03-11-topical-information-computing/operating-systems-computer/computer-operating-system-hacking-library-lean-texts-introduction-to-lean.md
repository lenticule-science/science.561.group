---

title: "Introduction to Lean"
aliases:
  - "Introduction to Lean"
date-created: 2026-03-01T00:00:00
keywords:
  - lean
requires:
  - /mathematics/disciplines/type-theory/curricula/dependent-types.md
teaches:
  - "Introduction to Lean"
---

## What Lean is

Lean 4 is a dependently typed functional programming language and interactive theorem prover.
It serves two purposes at once: you can write executable programs in it, and you can state and prove mathematical theorems in it.
These are the same activity — a proof is a program whose type is the proposition it proves.

Lean's architecture has two layers:

- The **kernel**: a small, trusted type checker that verifies proof terms.
  The kernel implements the Calculus of Inductive Constructions.
  If the kernel accepts a term, the proof is correct — there is no appeal to external authority.
- The **elaborator**: a front-end that translates human-readable Lean code into the kernel's internal language.
  Tactics, implicit arguments, type inference, and metaprogramming all live in the elaborator.
  They make proofs easier to write without enlarging the trusted base.

## Installation

Lean 4 is installed through `elan`, a toolchain manager (analogous to `rustup` for Rust):

```bash
curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh
```

On Windows, download the installer from the Lean 4 releases page.
After installation, `lean --version` confirms the setup.
Projects are created with `lake init` (Lake is Lean's build system).

Editor support: VS Code with the `lean4` extension provides interactive proof development — goals, types, and errors display inline as you write.

## First definitions

A definition in Lean introduces a named value with a type:

```lean
def double (n : Nat) : Nat := n + n
```

This defines `double` as a function from `Nat` to `Nat`.
Lean checks that the body (`n + n`) has the declared return type.

Inductive types define new data:

```lean
inductive MyBool where
  | true
  | false
```

Pattern matching deconstructs inductive values:

```lean
def negate : MyBool → MyBool
  | .true  => .false
  | .false => .true
```

## First proofs

A theorem is a definition whose type is a proposition:

```lean
theorem add_zero (n : Nat) : n + 0 = n := by
  simp
```

The type `n + 0 = n` is a proposition (an element of `Prop`).
The `by` keyword enters tactic mode.
The tactic `simp` simplifies the goal using known lemmas and closes it.

A proof can also be given as a term directly:

```lean
theorem add_zero' (n : Nat) : n + 0 = n :=
  Nat.add_zero n
```

Here `Nat.add_zero` is a lemma from Lean's standard library whose type is `∀ (n : Nat), n + 0 = n`.
Applying it to `n` produces a proof of `n + 0 = n`.

## The proof state

In tactic mode, Lean displays the current **proof state**: a list of hypotheses (what you know) and goals (what you need to prove).
Each tactic transforms [the state](../../../../../../../../../../humanities/domains/sociology/domains/critical-theory/domains/anarchism/terms/the-state.md) — it may close a goal, split it into subgoals, or introduce new hypotheses.

Example proof state after `intro h`:

```
h : P
⊢ Q
```

This reads: "assuming `h : P`, prove `Q`."
The tactic `exact proof_of_Q` would close this goal if `proof_of_Q` has type `Q` under hypothesis `h`.

Interactive development means writing one tactic at a time, inspecting the proof state after each step, and adjusting.
The VS Code extension shows [the state](../../../../../../../../../../humanities/domains/sociology/domains/critical-theory/domains/anarchism/terms/the-state.md) live as you type.

## What comes next

- Types and Propositions in Lean — how Lean's type system encodes mathematical structures and logical statements
- Tactics in Lean — the tactic language for building proofs interactively
