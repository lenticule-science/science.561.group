---
description: "Takes find-weak-spec output and fixes defects: auto-fixes immediately, asks user about needs-input defects one file at a time."
skill-closure-kind: procedure
title: fix-weak-spec
---

# fix-weak-spec

domain: `defects` — output of `skills/find-weak-spec.md`; or blank to run find-weak-spec first

codomain: edited spec files; a summary of what was fixed and what was deferred

---

1. If `defects` is blank, run `skills/find-weak-spec.md`.
  Use its output.
  If empty, report "no weak specs found" and halt.

2. Take the weakest file.
  For each defect:

   **Auto-fix:**
   - Missing `defines` when the file clearly defines one named thing → add it
   - Instance content in a concept spec (wrong-level) → move the content to an
     Encodings or Implementations subsection per `spec/specs.md`

   **needs-input — ask:**
   - No opening definition: "What is [thing]? One paragraph."
   - No normative claims: "What must/cannot be true of [thing]?"
   - Uncited MUST on mathematical object: "Which math unit backs this claim: '[claim]'?"
   - Pending longer than body: "Which pending items can be resolved now?
     Which should be removed?"

Present all needs-input questions for the file at once.
Wait.
Edit.

3. Run `skills/post-work-update.md`.
  Move to next file.
  Repeat.

4. Report: files fixed, defects resolved, deferred.
