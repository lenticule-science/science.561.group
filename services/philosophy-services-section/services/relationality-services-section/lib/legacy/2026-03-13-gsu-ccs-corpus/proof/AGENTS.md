# AGENTS.md — Lean Proof Agent Instructions

Instructions for AI agents working in `proof/`. Read `../AGENTS.md` for full repository context first.

---

## Your Role

You are the **Language phase** of the repository's fourfold. Your work settles
mathematical claims from `math/` into machine-checked canonical form. You do not
determine what is true — `math/` does that. You verify that it *can be* true by
producing a Lean proof term.

---

## Tools Available

**MCP server** (`lean-lsp`, configured in `.mcp.json` at repo root):
```
lean_goal                  -- goal state at any position
lean_run_code              -- run a Lean snippet, get elaboration result
lean_multi_attempt         -- try multiple proof terms in one call (fast via REPL)
lean_diagnostic_messages   -- all errors/warnings in a file (ground truth)
lean_hover_info            -- type of any expression
lean_declaration_file      -- where a declaration is defined
lean_loogle                -- type-signature search over Mathlib
lean_search                -- natural-language search over Mathlib
```

If the MCP server is not connected, fall back to `lake build` for diagnostics.

**Skills** (in `proof/skills/`):
- `improve-proofs` — entry point for all proof work; call this first
- `orient` — identify the next actionable sorry
- `read-math` — read a math unit before writing any Lean
- `close-sorry` — write and verify a proof term for a specific sorry
- `check-term` — test a proof term without editing the file
- `build` — verify the current state compiles
- `fix-error` — diagnose and fix a Lean error
- `lookup` — look up a rule, constructor, or theorem by name
- `search-mathlib` — find Mathlib lemmas (with hard gate: project-specific math is NOT in Mathlib)

---

## Source of Truth — `math/` Is Authoritative

`math/` is the source of truth. You read it; you never write it.

| What `math/` provides | What you use it for |
|-----------------------|---------------------|
| `proof_sketch:` field | The specification for the Lean proof strategy |
| `proof_method:` field | Which proof technique to use |
| `axioms_used:` field | Which axioms the proof may invoke |
| `depends:` field | The dependency order — prove dependencies first |
| `status:` field | Current proof state (`sketched` → your target is `verified`) |

**Never edit any file in `math/`, `spec/`, `src/`, or root `.md` files.**

---

## One file per unit — the 1:1:1 rule

Every concept exists in exactly three places, once each:

```
math/{unit-id}.md          ← the mathematics (source of truth)
proof/.../PascalCaseId.lean ← the machine-checked proof
spec/{unit-id}.md           ← the spec (when written)
```

One math unit → one Lean file → one spec entry. Never split a unit's proof across
two files; never put two units' proofs in one file.

Each Lean file declares which unit it covers on its first non-blank line:

```lean
-- Establishes: {math-unit-id}
```

To find the Lean file for a unit:

```sh
grep -rl "Establishes: your-unit-id" proof/RelationalHyperverse/RelationalHyperverse/
```

If nothing is found, no Lean file exists yet — create one. File names are **PascalCase**
(`FiberAlgebras.lean`, `NormalizationStrong.lean`), derived from the math unit id by
capitalizing each hyphen-separated segment and removing hyphens.

Each new Lean file must begin with:
```lean
-- Establishes: {math-unit-id}
import RelationalHyperverse.{Dependency}
...
```

If the grep returns **more than one file** for the same unit id, or a file's
`-- Establishes:` line lists more than one unit, that is a 1:1 violation — record
it in PLANS.md and split the file before adding more proof content.

Always read the math unit and its full `depends:` chain before writing any Lean.

---

## FiberNuclearLanguage Reference

**Language family** — three distinct nuclear languages; only `FiberNuclearLanguage` (level 0) is in Lean:

| Language | Level | Status |
|----------|-------|--------|
| `FiberNuclearLanguage` | 0 (level-zero nuclear) | Formalized in `Fml0.lean` |
| Level-n nuclear language | n (iterated nuclear) | Not yet in Lean |
| `HyperversalNuclearLanguage` | ℋ (colimit / hyperverse) | Not in Lean; SN fails |

Do not conflate these. `math/fiber-nuclear-language.md` defines `FiberNuclearLanguage`. `math/hyperversal-nuclear-language.md` defines `HyperversalNuclearLanguage`.

**Notation layers:**

| Layer | Notation | Meaning |
|-------|----------|---------|
| Formal math names | Saturate, Transfer | The two KZ modal operators of `FiberNuclearLanguage` |
| Semantic | σ_t, Δ_t | Nucleus pair on H_t |
| Lean constructors | `Saturate`, `Transfer` | Inductive constructors in `Proposition V` |
| Modal-logic aliases | □_t, ◇_t | Reserved for modal-logic section only |

```lean
inductive Proposition (V : Type u) : Type u where
  | var      : V → Proposition V
  | top      : Proposition V
  | bot      : Proposition V
  | conj     : Proposition V → Proposition V → Proposition V
  | disj     : Proposition V → Proposition V → Proposition V
  | impl     : Proposition V → Proposition V → Proposition V
  | Saturate : Proposition V → Proposition V   -- Sat / σ_t
  | Transfer : Proposition V → Proposition V   -- Trans / Δ_t
```

Reduction rules R1–R23 are in `math/reduction-system.md`:
- R1–R2: idempotency; R3–R4: meet-preservation; R5–R6: top-preservation
- R7: commutativity `Saturate(Transfer M) → Transfer(Saturate M)`
- R8–R13: disjunction absorption
- R14–R19': meet-absorption (close R3/R4 × R8–R11 critical pairs)
- R20–R23: R7-interaction rules

**`bn.commute x` has type `σ(Δ(x)) = Δ(σ(x))` — σ on left, Δ on right.**
Do NOT use `.symm` when the goal already has `σ(Δ(x)) = Δ(σ(x))`.

SN measure: `(fmlW, entanglement)` lex order. R20–R23 strictly decrease `fmlW`.

Congruence lifting lemmas: `saturating_steps`, `transferring_steps`, `steps_conj_left`, `steps_conj_right`, `steps_disj_left`, `steps_disj_right`.

---

## Key Mathlib Dependencies

- `Order.Heyting` — `HeytingAlgebra` typeclass
- `Order.BoundedOrder` — `⊤`, `⊥`
- `Relation.ReflTransGen` — `Steps` is `Relation.ReflTransGen Step`
- `WellFounded.fix` — used in `nf` and `confluence`

Do not add new lakefile dependencies without asking.

---

## Coordination with the Math Agent

**Status pipeline:**
```
imagined → claimed → sketched → established → verified
                                ↑ math agent   ↑ you (Lean agent)
```

`established` = proof written in `math/` (human-readable).
`verified` = sorry-free Lean proof, `lake build` passes.

When you complete a proof:
1. Remove all `sorry`s from the module
2. Confirm `lake build` passes with zero errors
3. The math agent reads the `-- Establishes:` header and updates `status: verified` in frontmatter — you do not touch `math/`

Coordination is asynchronous.

---

## Hard Rules

- **Never edit `math/`** — not even to fix a typo
- **`sorry`s need comments** — always explain what mathematical content is missing
- **Bottom-up dependency order** — never try to prove X before its `depends:` are established
- **`lake build` must pass** before you consider a module done
- **`math/` is not Lean-aware** — no references to Lean, Mathlib, or tooling belong there

---

## If You Learn Something — Update These Instructions

If you find a useful Mathlib lemma, a workaround for an API gap, or a better proof
strategy than what `proof_sketch:` suggests, update this file or add a skill under
`proof/skills/`. Future agents need it.
