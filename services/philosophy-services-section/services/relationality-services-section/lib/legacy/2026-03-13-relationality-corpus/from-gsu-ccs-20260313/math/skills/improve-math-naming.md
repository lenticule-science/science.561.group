---
name: improve-math-naming

description: "Presents naming violation candidates to the user and applies rename-unit or apply-unit-frontmatter as approved. Use when find-naming-targets has returned candidates."
skill-closure-kind: procedure
---

domain: `target` — a file path or unit id if the user named one; otherwise `null`.

codomain: `reformed_files[]` — list of renamed or updated unit files.

---

## Step 1 — Find targets

```
target is non-null
  → use it as target_file
  → candidate_files = [{file: target_file, check: "user-supplied", note: ""}]

target is null
  → call math/skills/find-naming-targets.md
  → receive: candidate_files[]
  → if candidate_files[] is empty → go to §Nothing to do
```

Present `candidate_files[]` to the user as a numbered list with check type and note.
Ask: "Which should I work on? (number, or 'all', or 'none')"

```
User says none → go to §Nothing to do
User says all  → process each in order; collect all reformed_files; go to §Report
User picks N   → process candidate N only; go to §Report
```

---

## Step 2 — Process one candidate

For each `{file: target_file, check, note}` selected:

### If check = "invalid-prefix"
  Report to user: "This unit has an invalid heading prefix ('<prefix>'). It must be
  reclassified before naming. Options: (a) change the heading to a valid type prefix,
  (b) delete the file if it is organizational only."
  Ask user how to proceed. If no clear action: skip and continue to next candidate.

### Otherwise (check = meta-head, head-mismatch, name-drift, user-supplied)
  Call `math/skills/name-math-unit.md` with `target_file`.
  Receive: `name_recommendation`.

  If `name_recommendation` has flag "invalid-prefix": handle as above.

  Present to user:
  - Current: `id`, `name`
  - Proposed: `id`, `name`
  - Classification and head word criterion cited
  - Any other flags

  ```
  User confirms   → go to §Execute
  User declines   → skip; continue to next candidate
  User proposes alternative name
    → call math/skills/name-math-unit.md with the alternative
      as unit_file=null and description=<alternative name + original heading content>
    → receive: new name_recommendation
    → repeat presentation
  ```

---

## §Execute

If `name_recommendation` has flag "id-conflict": stop; report conflict to user.

If `name_recommendation.id` = current `id` (only `name:` field wrong):
  Call `math/skills/apply-unit-frontmatter.md` with corrected `name:` field only.
  Add `target_file` to `reformed_files`.

If `name_recommendation.id` ≠ current `id`:
  Call `math/skills/rename-unit.md` with `(target_file, name_recommendation)`.
  Add new file path to `reformed_files`.

Continue to next selected candidate if any.

---

## §Nothing to do

```
candidate_files[] was empty → report: no naming targets found
user said none              → report: no changes made
```

---

## §Report

Return `reformed_files[]`.
