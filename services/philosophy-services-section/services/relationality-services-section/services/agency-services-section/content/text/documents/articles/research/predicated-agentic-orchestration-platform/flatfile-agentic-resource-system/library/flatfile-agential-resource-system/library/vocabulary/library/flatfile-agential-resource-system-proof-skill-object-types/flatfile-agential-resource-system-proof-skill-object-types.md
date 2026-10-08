---
id: flatfile-agential-resource-system-proof-skill-object-types
description: "FlatfileAgentialResourceSystemProofSkillObjectTypes defines the typed objects that proof/ skills pass between each other as domain and codomain values. It names each type, gives its structure, and states which skills produce and consume it."
component-of: FlatfileAgentialResourceSystemLocale
date-modified: 2026-03-19
params:
  skill-pipeline: relational-universe
output: relational-universe
ast:
  typed-skill-handoff:
    - skill-pipeline:
        - sorry-type
        - goal-type
        - proof-term-type
        - math-content-type
        - build-result-type
title: Flatfile Agential Resource System Proof Skill Object Types
---

# Flatfile Agential Resource System Proof Skill Object Types

*Spec-domain object*

## What it is

The proof/ skills form a pipeline: `orient` identifies the target, `read-math` loads the math content, `close-sorry` writes the proof, `check-term` verifies it, and `build` confirms the file compiles.
Each hand-off is an object of a specific type.
This spec names those types so that skill `domain:` and `codomain:` declarations can be precise.

These are spec-domain types — they have no `math/` counterparts.
Their structure is defined by what the proof tools (Lean 4, MCP) produce and consume.

---

## Sorry

A `Sorry` identifies one open proof obligation in a Lean file.

```
Sorry = {
  file:     path to the Lean file relative to the repo root
  line:     integer line number of the sorry keyword
  category: A | B | C | D | uncharted
  witness:  optional string — the standard witness pattern for this category
  comment:  optional string — the sorry's inline comment, if any
}
```

**Category semantics:** - **A** — confluence pair: goal is `∃ Q, Steps N Q ∧ Steps P Q` - **B** — impossible branch: hypotheses are structurally contradictory - **C** — path: goal is `Steps A B` - **D** — other: uses a proof sketch from the corresponding math entity - **uncharted** — not yet categorized; treat as actionable

`Sorry` is produced by: `orient` (as `target_sorry`).
`Sorry` is consumed by: `close-sorry` (as `target_sorry`).
A skill that produces a `Sorry` MUST populate at least `file`, `line`, and `category` — `witness` and `comment` MAY be null.
A skill that consumes a `Sorry` MUST handle `category: uncharted` by running `lean_goal` to determine the goal type before attempting a proof.

---

## GoalType

A `GoalType` is the Lean type at a sorry site — the obligation that must be proved to close the sorry.

```
GoalType = string   -- the Lean 4 type expression as returned by lean_goal
```

`GoalType` is produced by: `close-sorry` step 1 (via `lean_goal` MCP call or `check-term` fallback).
`GoalType` is consumed by: `close-sorry` step 2 (classification) and the proof branch steps.

---

## ProofTerm

A `ProofTerm` is a Lean 4 expression that type-checks against a given `GoalType` at a sorry site, closing the obligation.

```
ProofTerm = string   -- a Lean 4 term or tactic block that compiles without sorry
```

A `ProofTerm` MUST type-check cleanly — no sorry, no axiom beyond the repo's declared axiom set.
A string that compiles only because `sorry` closes a sub-goal is not a `ProofTerm`; it is another `Sorry`.
A `ProofTerm` MUST NOT be accepted as closed until `check-term` or `lean_multi_attempt` confirms it type-checks.
Accepting a string that has not been verified is a spec violation.

`ProofTerm` is produced by: the proof branches in `close-sorry`.
`ProofTerm` is consumed by: `check-term` (verification) and the file-write step in `close-sorry`.

---

## MathContent

`MathContent` is the structured content of a `math/` entity as loaded for use in proof work.

```
MathContent = {
  id:           kebab-case id of the math entity
  statement:    the main mathematical claim (theorem, lemma, or axiom statement)
  proof_sketch: optional string — informal proof strategy from the entity file
  depends_on:   list of entity ids that must be proved first
}
```

`MathContent` is produced by: `read-math` (as `math_content`).
`MathContent` is consumed by: `close-sorry` (Branch: OTHER uses `proof_sketch`).

---

## BuildResult

A `BuildResult` is the output of running `lake build` on the proof directory.

```
BuildResult = {
  status:  ok | error
  message: string — Lean compiler output; empty if status is ok
}
```

`BuildResult` is produced by: `build`.
`BuildResult` is consumed by: `improve-proofs` loop (determines whether to continue or surface a compiler error).

---

## Open questions

- `Sorry` category semantics are derived from the current sorry inventory in `proof/PLANS.md`.
  If new sorry patterns emerge that do not fit A–D, the category set must be extended here.
- `MathContent.proof_sketch` is informally structured.
  A formal grammar for proof sketches would allow `close-sorry` to parse them mechanically.
