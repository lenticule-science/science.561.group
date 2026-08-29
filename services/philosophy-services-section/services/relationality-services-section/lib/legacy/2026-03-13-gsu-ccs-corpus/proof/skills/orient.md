---
description: "Identifies the next actionable Sorry from live proof/ state and PLANS.md. Use at the start of every proof work cycle to determine the target Sorry and the math units to read before closing it."
skill-closure-kind: derivation
---
# orient

domain: the live `proof/` directory

Reads repository state and identifies the next actionable sorry.
The inference rules are fixed; the output is a judgment about which sorry is actionable.

---

## Step 1 — Get live sorry inventory

**MCP (preferred):** read `proof/PLANS.md` §Active Sorries table to get the file list,
then run `lean_diagnostic_messages` on each file listed there.

This gives sorry locations directly from Lean — ground truth, not documentation that may have drifted.

**Fallback:** read `proof/PLANS.md` §Active Sorries table.

---

## Step 2 — Cross-reference with PLANS.md

Read `proof/PLANS.md` regardless of Step 1 source.

For each live sorry, find its entry to get:
- Blocker type (Lean engineering / Math gap / Pending X)
- Sorry category (A/B/C/D) and standard witness pattern

If a sorry has no entry: it is uncharted — note it as a finding.

---

## Step 3 — Find the first unblocked sorry

```
Blocker: Lean engineering   →  actionable
Blocker: Pending X          →  BLOCKED if X is still sorry (check lean_diagnostic_messages)
Blocker: Math gap           →  run lookup on the math unit; check if proof_sketch now exists
Uncharted sorry             →  treat as actionable; use lean_goal to understand it
```

---

## Step 4 — Identify the corresponding math units

At this point `target_file` is known. Read its `-- Establishes:` comment:

```sh
grep -n "Establishes:" proof/RelationalHyperverse/RelationalHyperverse/{target_file}
```

Note each math unit ID listed. Run `lookup` on each to confirm the math files exist.

---

## Step 5 — Output (judgment)

Return:
- `target_sorry`: file + line + category (if known) + standard witness (if known)
- `target_file`: path to the Lean file
- `math_units`: list of math/ unit IDs to read before working
- OR: BLOCKED with reason

Accumulate CoursOfWork: skills called, files read, anything unexpected found.
Pass to `post-work-update` when running inside an `improve-proofs` context.

codomain: Sorry (as target_sorry), Lean file path (as target_file), list of math unit IDs (as math_units) — or: BLOCKED with reason
