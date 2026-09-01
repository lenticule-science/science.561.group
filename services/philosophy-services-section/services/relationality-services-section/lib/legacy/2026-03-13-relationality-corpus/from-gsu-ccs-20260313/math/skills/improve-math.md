---
name: improve-math

description: "Selects and executes one math improvement task by type: critique, write, frontmatter, or naming. Use as the single work-unit executor called by do-math-work for each PLANS item."
skill-closure-kind: procedure
---

domain: `user_prompt` — the user's request or intention (the opening input).

codomain: `work_report` — {what was done, next open item from PLANS.md}.

Entry point for all work in `math/`.

---

## Step 1 — Read context

Read `math/PLANS.md`.

Extract and name:
- `priorities` — the current top items in §Open Math Gaps
- `known_gaps` — undefined symbols, open theorems, named debt

These are threaded into step 6 (next open item).

---

## Step 2 — Parse intent

From `user_prompt`, extract:
- `task_type`: one of `write`, `critique`, `naming`, `prose`, `frontmatter`, `unknown`
- `target`: a file path or unit id, if the user named one; otherwise `null`

If `user_prompt` is absent or purely meta (e.g. "run improve-math", "go"):
  Ask: "What kind of work? write / critique / naming / frontmatter"
  Do not proceed until `task_type` is resolved.

If `task_type` is `unknown` or ambiguous: ask the user to specify one of the above.
Do not proceed until `task_type` is resolved.

---

## Step 3 — Dispatch

```
task_type = write       → go to §Write
task_type = critique    → go to §Critique
task_type = naming      → go to §Naming
task_type = prose       → go to §Prose
task_type = frontmatter → go to §Frontmatter
```

---

### Write

Input: `target` (the user's description of the unit to write, or null)

If `target` is null: ask the user for the unit id, description, and where it fits
in the dependency order. Name the result `unit_spec: {id, description, depends_on}`.

Call `math/skills/write-unit.md` with `unit_spec`.

Receive: `unit_file` — the written file path.

Go to §Report.

---

### Critique

Input: `target` (file path, or null)

If `target` is null: pick a file (e.g., randomly from `math/*.md` excluding planning docs).
Name it `target_file`.

Call `math/skills/critique-unit.md` with `target_file`.

Receive: `(target_file, critique)`.

Present critique to user. Ask whether to reform.

IF user confirms reform:
  Call `math/skills/reform-unit.md` with `(target_file, critique)`.
  Receive: `reformed_files` — list of modified/created file paths.
  Go to §Report with `reformed_files`.

IF user declines:
  Go to §Report with no files changed.

---

### Naming

Input: `target` (file path or unit id, or null).

Call `math/skills/improve-math-naming.md` with `target`.

Receive: `reformed_files[]`.

Go to §Report.

---

### Prose

Input: `target` (file path, or null)

If `target` is null: pick a file using the same method as §Critique.
Name it `target_file`.

Note: no `apply-prose-principles` skill exists yet. Flag this gap and stop.
Report to user: prose improvement requires `math/skills/apply-prose-principles.md`
which has not been written.

---

### Frontmatter

Input: `target` (file path, or null)

If `target` is null: pick a file from `math/*.md` (excluding planning docs) that is
missing at least one optional frontmatter field (`defines:`, `describes:`, `symbol:`,
`domain:`, `codomain:`). Prefer definition-class units (heading prefix "Definition —",
"Construction —", "Axiom —") since `defines:` enables `describes:` in other units.

Name the chosen file `target_file`.

Call `math/skills/classify-unit-frontmatter.md` with `target_file`.
Receive: `frontmatter_additions`.

If `frontmatter_additions.flags` is non-empty: present flags to user. Ask whether to
proceed with the unambiguous additions and defer the flagged ones, or to stop.

IF proceeding: strip any UNRESOLVED items from `frontmatter_additions`.
Call `math/skills/apply-unit-frontmatter.md` with `(target_file, frontmatter_additions)`.
Receive: updated `target_file`.

Go to §Report with `[target_file]`.

---

## Step 6 — Report {#Report}

Produce `work_report`:
- **Done**: list of files created or modified (from sub-skill outputs)
- **Next open item**: first entry from `priorities` not addressed in this session

Report to user and stop.
