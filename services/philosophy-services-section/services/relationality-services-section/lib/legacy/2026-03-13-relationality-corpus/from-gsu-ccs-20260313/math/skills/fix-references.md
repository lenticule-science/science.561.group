---
name: fix-references

description: "Fixes dead or incorrect section references in a math unit file. Use after a unit is renamed or when critique-unit reports broken citations."
skill-closure-kind: process
---

domain:
- `unit_file` — path to the math unit with dead §references
- `critique` — output of `critique-unit.md`, listing each dead §ref and its correct
  target (if known)

codomain: `unit_file` updated in place — all dead §references resolved or removed.

Precondition: the critique contains only dead §reference issues and no structural or
math problems (those are handled by other reform cases).

---

1. Read `unit_file` in full.

2. For each dead §ref listed in the critique with a known correct target:
   Replace `§<dead_ref>` with `§<correct_target>` everywhere it appears in `unit_file`.

3. For each dead §ref listed in the critique with no known correct target:
   Remove the parenthetical `(§<dead_ref>)` or inline `§<dead_ref>` citation.
   Do not leave a dangling or broken reference.

4. Save `unit_file`.

5. Verify: grep `unit_file` for each originally dead §ref. Confirm zero results remain.
