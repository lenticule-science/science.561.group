---
description: "Closes a specified Sorry by writing a verified ProofTerm to the Lean file. Use when orient has produced a target Sorry and read-math has loaded MathContent for its math unit."
skill-closure-kind: procedure
---
# close-sorry

domain:
- `target_sorry` — Sorry (file + line + category + comment)
- `math_content` — MathContent (from read-math)

Given a specific sorry, write and verify the Lean proof term.
You know what you're producing (a closed sorry); the branch is how.

---

## Step 1 — Determine the goal type

**MCP (preferred):** `lean_goal(file_path=<file>, line=<sorry line>, character=2)`

**Fallback:** run `check-term` — copy the theorem signature and all proof arms up
to the sorry, end with `sorry`; Lean reports the goal type.

Record: `goal_type`

---

## Step 2 — Classify

```
∃ Q, Steps N Q ∧ Steps P Q      →  CONFLUENCE_PAIR
False or contradictory hyps      →  IMPOSSIBLE
single Steps A B                 →  PATH
anything else                    →  OTHER
```

---

## Branch: CONFLUENCE_PAIR

Local confluence: M steps to N and P; find common Q.

**a. Identify hN and hP** — read the enclosing case arms; run `lookup` on each
constructor name to get LHS/RHS.

**b. Check for an existing cp_* lemma:**
```sh
grep -n "cp_" proof/RelationalHyperverse/RelationalHyperverse/NormalizationCompleteness.lean
```
If `cp_{hN}_{hP}` or `cp_{hP}_{hN}` exists: use it. Done.

**c. Determine Q** — standard witnesses in order:
1. Same constructor → `⟨N, .refl, .refl⟩`
2. hN root, hP congruence on free subterm → apply hN's rule to N; `⟨Q, .single (.RuleN ...), .single (.saturate_step hP_step)⟩`
3. hN congruence, hP root → symmetric to (2)
4. Independent branches → `⟨disj/conj _ _, steps_left ..., steps_right ...⟩`
5. IH applies → `let ⟨Q, h1, h2⟩ := ih hP_step; ⟨outer Q, ...⟩`

**d. Test the witness:**

**MCP (preferred):** `lean_multi_attempt(file_path=<file>, line=<sorry line>, tactics=[...])`
Try up to three witnesses in one call.

**Fallback:** run `check-term` with the proposed `⟨Q, path_N, path_P⟩`. Max 3 attempts.

If all fail: this may need a new `cp_*` lemma — stub it before `localConfluence`,
sorry it, record in `PLANS.md`.

**e. Write to file** once the check is clean.

---

## Branch: IMPOSSIBLE

Hypothesis has a structural mismatch (e.g., `h : Saturate A = Transfer B`).

**MCP:** `lean_multi_attempt(tactics=["exact absurd h (by intro; contradiction)", "simp at h", "contradiction", "exact (by cases h)"])`

**Fallback:** test each via `check-term` in order; write whichever works.

---

## Branch: PATH

Goal is `Steps A B`.

Build via `check-term` or `lean_run_code`:
- One step: `Relation.ReflTransGen.single (Step.RuleName args)`
- Two steps: `(Relation.ReflTransGen.single step1).tail step2`
- Lifted: `saturating_steps h` / `transferring_steps h` / `steps_disj_left h` etc.

---

## Branch: OTHER

Read `math_content.proof_sketch`. Follow it literally.
If it names a lemma: run `lookup`.
If it names a technique: use `lean_hover_info` or Lean 4 docs.

If the proof obligation involves HeytingAlgebra, lattice ops, ReflTransGen, or
WellFounded structure (not FiberNuclearLanguage-specific): run `search-mathlib` before attempting
to prove it from scratch. See that skill for the classification rules.

codomain: the Lean file updated with a ProofTerm replacing the Sorry — or BLOCKED with reason
