---
description: "Takes find-weak-skill output and fixes defects: auto-fixes immediately, asks user about needs-input defects one file at a time."
skill-closure-kind: procedure
---

# fix-weak-skill

domain: `defects` — output of `skills/find-weak-skill.md`; or blank to run
find-weak-skill first

codomain: edited skill files; a summary of what was fixed and what was deferred

---

1. If `defects` is blank, run `skills/find-weak-skill.md`. Use its output.
   If empty, report "no weak skills found" and halt.

2. Take the weakest file. For each defect:

   **Auto-fix:**
   - Unnumbered steps → number them
   - `skill-closure-kind` inferable from steps (e.g., clear input→output transform = `derivation`,
     numbered procedure = `procedure`) → add it

   **needs-input — ask:**
   - Missing `domain` or `codomain`: "What does this skill take as input / produce as output?"
   - Vague step condition: "What condition makes this step apply?"
   - Broken reference: "Does [referenced file] need to be created, or should this reference be removed?"
   - No steps: "What are the steps for this skill?"

   Present all needs-input questions for the file at once. Wait. Edit.

3. Run `skills/post-work-update.md`. Move to next file. Repeat.

4. Report: files fixed, defects resolved, deferred.
