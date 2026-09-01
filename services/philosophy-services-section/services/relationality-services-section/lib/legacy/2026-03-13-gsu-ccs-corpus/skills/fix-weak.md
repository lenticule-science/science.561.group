---
description: "Finds the weakest files in a scope and fixes them. Dispatches to the correct find-weak and fix-weak skill via the find-weak runbook."
skill-closure-kind: procedure
dispatch:
  input: kind
  reason: |
    If kind is explicitly "math-unit", use math-unit.
    If kind is explicitly "skill", use skill.
    If kind is explicitly "spec", use spec.
    If kind is explicitly "runbook", use runbook.
    If kind is blank or "all", or if the scope covers multiple directories, use all.
    If kind is blank but scope starts with "math/", use math-unit.
    If kind is blank but scope starts with "spec/", use spec.
    If kind is blank but scope contains "skills/", use skill.
    If kind is blank but scope starts with "runbooks/", use runbook.
  routes:
    math-unit: skills/fix-weak-math-unit.md
    skill:     skills/fix-weak-skill.md
    spec:      skills/fix-weak-spec.md
    runbook:   skills/fix-weak-runbook.md
    all:
      sequence:
        - skills/fix-weak-math-unit.md
        - skills/fix-weak-spec.md
        - skills/fix-weak-skill.md
        - skills/fix-weak-runbook.md
---

# fix-weak

domain:
- `$ARGUMENTS` — a directory, file path, kind (`math-unit` | `skill` | `spec` |
  `runbook`), or blank for the entire repo

codomain: fixed files across the scope; a summary report

---

1. Parse `$ARGUMENTS` into `scope` and `kind`.

2. Call `runbooks/dispatch-skill.yaml` with this skill file and `{scope, kind}`.
   The dispatch block above routes to the correct fix skill.

3. The fix skill calls `runbooks/find-weak.yaml`, presents the top 10 weakest
   files to the user, and proceeds file by file.

4. After all fixes, run `skills/post-work-update.md` with the full summary.
