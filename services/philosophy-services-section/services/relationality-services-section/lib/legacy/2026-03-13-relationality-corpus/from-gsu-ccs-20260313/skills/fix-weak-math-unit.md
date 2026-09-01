---
name: fix-weak-math-unit

description: "Takes find-weak-math-unit output and fixes defects: auto-fixes immediately, asks user about needs-input defects one file at a time."
skill-closure-kind: procedure
---

domain: `defects` — output of `skills/find-weak-math-unit.md`; or blank to run
find-weak-math-unit first

codomain: edited math unit files; a summary of what was fixed and what was deferred

---

1. If `defects` is blank, run `skills/find-weak-math-unit.md`. Use its output.
   If the output is empty, report "no weak math units found" and halt.

2. Take the weakest file (lowest score). For each defect in that file:

   **Auto-fix defects — do immediately:**
   - `name` field in frontmatter → remove it (it is derivable from `id`)
   - `domain`/`codomain` without `defines` → remove `domain` and `codomain`
   - Heading uses type prefix (`### Theorem — X`) → rewrite as `### X {#id}`
   - Unnumbered but sequential steps → add numbers
   - Description contains LaTeX → rewrite description in plain prose

   **needs-input defects — ask the user:**
   Present each as:
   ```
   [{defect-kind}] {file}
   Problem: {description}
   Q: {specific question whose answer lets you fix it}
   ```
   Present all needs-input defects for this file at once. Wait for answers.
   Edit based on answers.

3. After fixing one file: run `skills/post-work-update.md` with what was done
   and any patterns noticed.

4. Move to the next file in the ranked list. Repeat from step 2.
   Continue until the defect list is empty or the user says stop.

5. Report: files fixed, defects resolved, defects deferred (with reason).
