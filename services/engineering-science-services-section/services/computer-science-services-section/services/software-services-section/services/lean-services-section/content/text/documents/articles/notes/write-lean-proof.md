---
name: write-lean-proof
id: write-lean-proof
description: Translate a mathematical statement into a Lean 4 theorem declaration and produce a verified proof. Always check the write-formal-proof skill first for the anti-slop protocol.
type: operational
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
date-updated: 2026-03-07
keywords:
  - Lean
  - FormalVerification
runtime:
  invocation: inference
  tool: llm
region:
  reads: ["content/technology/disciplines/computing/software/lean/", "content/mathematics/"]
  writes: ["content/mathematics/objects/universes/semiotic-universe/formalization/lean/"]
dependencies:
  - /technology/disciplines/computing/software/lean/curricula/index.md
  - /mathematics/disciplines/type-theory/curricula/dependent-types.md
  - /mathematics/concepts/proof/skills/write-formal-proof/SKILL.md
inputs:
  - A mathematical statement in natural language or informal notation
  - The relevant spec section (e.g., §3.2 of semiotic-universe.md)
outputs:
  - A Lean 4 file containing the theorem declaration and proof
  - Updated Test/Trivial.lean with a concrete test instance
part-of: technology/disciplines/computing/software/lean
---

# Write Lean Proof

## Prerequisites

Read the [write-formal-proof](/mathematics/concepts/proof/skills/write-formal-proof/SKILL.md) skill first. It contains the anti-slop checklist that must pass before any proof is considered complete.

## Lean-specific workflow

1. **State the proposition** as a `theorem` with explicit type signature.
   Use doc comments (`/-- ... -/`) connecting it to the spec section.

2. **Identify Mathlib imports.** Common ones for the semiotic universe:
   - `Mathlib.Order.Heyting.Basic` — `HeytingAlgebra`,
     `GeneralizedHeytingAlgebra`, `himp`, `compl`
   - `Mathlib.Order.Heyting.Regular` — regular elements, double
     complement fixed points
   - `Mathlib.Order.Heyting.Hom` — Heyting algebra homomorphisms
   - `Mathlib.Order.BoundedOrder` — `OrderTop`, `OrderBot`,
     `BoundedOrder`

3. **Choose proof strategy:**
   - Term mode for short proofs (one or two steps)
   - Tactic mode for multi-step proofs
   - `calc` blocks for equational chains
   - `unfold` + `rw` for unfolding definitions and rewriting
   - Case exhaustion (`match a, b with | ...`) for finite types
   - `le_antisymm` to prove equality from two `≤` directions

4. **Write the proof incrementally:**
   - Outline with `have` statements and `sorry` placeholders
   - Fill one `sorry` at a time, compiling after each
   - Build helper lemmas bottom-up, main theorem last
   - If stuck, the issue is usually a wrong proof strategy —
     step back and think about the math

5. **Verify compilation:**
   ```sh
   cd formalization/lean/ && lake build
   ```

6. **Check axiom dependencies** on critical proofs:
   ```lean
   #print axioms my_theorem
   ```
   A fully intuitionistic proof should show no dependence on
   `Classical.choice`, `Classical.em`, or `propDecidable`.

## Key Mathlib patterns for Heyting algebras

The fundamental adjunction: `a ≤ b ⇨ c ↔ a ⊓ b ≤ c`.
Most proofs reduce to manipulating this equivalence.

**Core lemmas:**
- `le_himp_iff` / `himp_le_iff` — the Heyting adjunction
- `inf_le_left`, `inf_le_right`, `le_inf` — meet reasoning
- `le_sup_left`, `le_sup_right`, `sup_le` — join reasoning
- `himp_bot` — `a ⇨ ⊥ = aᶜ` (complement definition)

**Constructing instances:**
- `HeytingAlgebra.ofHImp` — supply lattice + `⇨`
- `HeytingAlgebra.ofCompl` — supply lattice + complement

**Notation:**
- `⇨` for Heyting implication (`HImp`)
- `ᶜ` for complement (`HasCompl`)
- `⊓` for meet, `⊔` for join, `⊤` for top, `⊥` for bot

**Useful search tools:**
- [Loogle](https://loogle.lean-lang.org/) — search Mathlib by
  type signature
- `exact?` / `apply?` — search for applicable lemmas in-proof
- `#check @lemma_name` — verify a lemma exists before using it

## Naming conventions (Mathlib-compatible)

- Typeclasses: `CamelCase` (`ModalClosure`, `TraceComonad`)
- Predicates: `IsCamelCase` (`IsHabitual`, `IsFragment`)
- Theorems: `snake_case` (`isHabitual_top`, `TraceComonad.monotone`)
- Lemma names: conclusion first (`inf_le_left`, `le_himp_iff`)
- Complete lattice ops: `sSup`/`sInf` (set), `iSup`/`iInf` (indexed)

## Semiotic universe conventions

- One file per spec section
- `class` for ambient structure, `structure` for data objects
- Every `class` gets a concrete instance in `Test/Trivial.lean`
  AND a nontrivial instance in `Test/ThreeElement.lean`
- Comments reference spec sections: "Corresponds to §3.2"
- No classical reasoning — see CLAUDE.md philosophical commitments

## Anti-slop (Lean-specific)

- Check `#check @lemma_name` before using any Mathlib lemma
  you are not certain exists.
- Do not use `True` as a placeholder for real conditions.
- If `sorry` appears, document what the sorry represents and
  why you cannot prove it yet.
- Run `lake build` before committing. If you cannot run it,
  say "UNVERIFIED" explicitly.
- Run `#print axioms` on key theorems to verify no classical
  axioms leaked in.
