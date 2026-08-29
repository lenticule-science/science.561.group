---
name: fix-weak-runbook

description: "Takes find-weak-runbook output and fixes defects: auto-fixes immediately, asks user about needs-input defects one runbook at a time."
skill-closure-kind: procedure
---

domain: `defects` — output of `skills/find-weak-runbook.md`; or blank to run
find-weak-runbook first

codomain: edited runbook files; a summary of what was fixed and what was deferred

---

1. If `defects` is blank, run `skills/find-weak-runbook.md`. Use its output.
   If empty, report "no weak runbooks found" and halt.

2. Take the weakest file. For each defect:

   **Auto-fix:**
   - Step missing `id` → derive from the step's action (slugify the `type` + position)
   - Missing `skill-closure-kind` inferable from structure → add it
   - Template expression referencing an undeclared input → add the input to `inputs:` block
     if the name is unambiguous

   **needs-input — ask:**
   - No `inputs` block: "What parameters does this runbook take?"
   - No `outputs` block: "What does this runbook produce?"
   - Hardcoded environment value: "Should '[value]' be a named input, or is it
     always fixed?"
   - Broken step reference: "Does runbook '[id]' need to be created, or should
     this `call` step be changed?"

   Present all needs-input questions for the file at once. Wait. Edit.

3. Run `skills/post-work-update.md`. Move to next file. Repeat.

4. Report: files fixed, defects resolved, deferred.
