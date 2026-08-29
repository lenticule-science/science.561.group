---
name: check-term

description: "Verifies that a candidate Lean term type-checks against a GoalType. Use before accepting a proof candidate and replacing a sorry in a Lean file."
skill-closure-kind: process
---

domain:
- `imports` — module imports needed for the snippet
- `context` — variable declarations and hypotheses
- `term_to_check` — the ProofTerm candidate to verify

Typecheck a Lean term or tactic proof. Use `lean_run_code` (MCP) when available;
fall back to `lake env lean --stdin`.

---

## Step 1 — Run the check

**MCP (preferred):** use `lean_run_code` with a complete snippet:
```lean
import RelationalHyperverse.{Module}
open Proposition
variable {V : Type u} (...)
example (...hypotheses...) : (goal type) :=
  (your term)
```

**Fallback:**
```sh
cd proof/RelationalHyperverse && cat << 'EOF' | lake env lean --stdin 2>&1
import RelationalHyperverse.{Module}
open Proposition
(context)
example : (goal) := (term)
EOF
```

---

## Step 2 — Classify output

```
No output / no diagnostics   →  TYPECHECKS
"error: ..."                 →  FAILS — read the error
"warning: ..."               →  TYPECHECKS with warning — note it
```

---

## Step 3 — If FAILS

```
"type mismatch: argument has type A but expected B"
  →  your term produces A, goal expects B
  →  check direction: is the path N→Q or Q→N?

"unknown identifier 'X'"
  →  X is not in scope; run lookup to find the right name

"alternative 'X' is not needed"
  →  you have a cases arm for a constructor that can't appear; remove it

"cases tactic failed / alternative '...' missing"
  →  missing a case; add it or use | _ => ...

"application type mismatch: ... has type Proposition.Step A B but expected ... Step B A"
  →  you flipped the direction of a step
```

Fix and re-run. Do not write to a file until output is clean.

---

## Step 4 — Inspecting goal state at a sorry

**MCP:** `lean_goal(file_path=<file>, line=<sorry line>, character=2)`

**Fallback:** wrap the proof up to the sorry in an `example`, end with `sorry`:
```lean
import RelationalHyperverse.NormalizationCompleteness
open Proposition
example {V : Type u} (M N P : Proposition V) (hN : Step M N) (hP : Step M P) :
    ∃ Q, Steps N Q ∧ Steps P Q := by
  -- paste proof arms up to the sorry
  sorry
```
Lean reports the goal type at `sorry`.

codomain: TYPECHECKS | FAILS with Lean error message | TYPECHECKS with warning
