---
name: fix-error

description: "Resolves a Lean compiler error given a BuildResult with status error. Use when build returns an error after a proof attempt; do not re-run build here, return to improve-proofs Step 4."
skill-closure-kind: process
---

domain:
- `error_file` — path to the Lean file containing the error
- `error_line` — line number
- `error_message` — compiler output
- `error_class` — one of: `unknown_identifier`, `type_mismatch`, `application_type_mismatch`, `cases_tactic_failed`

Given a build error, find and fix the cause.

---

## error_class = unknown_identifier

1. Run `lookup` on the unknown name.
2. If found in proof/: add the correct import at the top of `error_file`.
   Format: `import RelationalHyperverse.{ModuleName}`
3. If found in math/ but no Lean file: BLOCKED (math exists, Lean doesn't).
4. If not found: check spelling. Common misspellings:
   - `saturate_step` not `saturateStep`
   - `transfer_step` not `transferStep`
   - `disj_left` not `disjLeft`
   - `Relation.ReflTransGen.single` not `.single` (needs full path in some contexts)

---

## error_class = type_mismatch

1. Find "expected type" and "but got" in the error message.
2. Common causes:

```
Expected: Steps A B         Got: Step A B              →  wrap in Relation.ReflTransGen.single
Expected: Steps A B         Got: Steps B A             →  direction is backwards
Expected: σ(Δ(x))=Δ(σ(x))  Got: Δ(σ(x))=σ(Δ(x))     →  used .symm on bn.commute; remove it
Expected: Proposition V     Got: Proposition ?u.1      →  universe issue; add {V : Type u}
```

3. Read `proof/AGENTS.md` §FiberNuclearLanguage Reference for constructor names and
   the `bn.commute` direction.

---

## error_class = application_type_mismatch

1. Count arguments provided vs. expected. Run `lookup` on the function name.
2. Common cause: Step constructors take explicit variables.
   `Step.R12 M N` (needs two args), `Step.R14 M N P` (needs three).

---

## error_class = cases_tactic_failed

1. Read the error for the missing constructor name.
2. Add a case arm. If genuinely impossible:
   `| impossible_constructor _ => exact absurd h (by intro; contradiction)`

---

## After fixing

Do NOT re-run build here. Return to `improve-proofs` Step 4 to re-run build.

codomain: corrected Lean file (written) — or BLOCKED with reason
