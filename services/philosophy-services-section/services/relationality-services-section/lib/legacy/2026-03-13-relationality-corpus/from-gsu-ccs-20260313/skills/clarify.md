---
name: clarify

description: "Finds confusing passages across a scope of files, asks the user the minimum questions to resolve them, then edits toward clarity. Loops until the scope is clear or the user stops it."
skill-closure-kind: procedure
---

domain: `$ARGUMENTS` — a file path, directory, or blank (defaults to entire repo)

codomain: edited files with improved clarity; a summary of what was asked and changed

---

1. **Set scope.** If `$ARGUMENTS` is blank, scope = all departments:
   `math/`, `proof/`, `spec/`, `src/`, root `*.md`.
   If `$ARGUMENTS` is a directory, scope = all `.md` files in it.
   If `$ARGUMENTS` is a file, scope = that file.

2. **Collect confusions.** For each file in scope, run `skills/find-confusing.md`.
   Collect all returned confusions into a single list, tagged by file.
   If the list is empty: report "nothing confusing found in scope" and halt.

3. **Group and prioritize.** Sort confusions:
   - `contradiction` and `wrong-level` first — these are structural errors
   - `undefined-term` and `scope-drift` second — these block understanding
   - `unsupported-claim` and `assumed-knowledge` third — these weaken the file

4. **Ask one round of questions.** Take the top group. Present each confusion as:
   ```
   [{kind}] {file} — "{passage}"
   Q: {question}
   ```
   Present all questions in the top group at once. Wait for answers.
   Do not proceed until the user responds.

5. **Edit.** For each answered question, edit the file at the flagged location to
   resolve the confusion using the user's answer. Prefer the minimal edit: clarify
   the existing sentence rather than rewriting the section.

6. **Loop.** Remove resolved confusions from the list. If any remain, go to step 4
   with the next group. Continue until the list is empty or the user says stop.

7. **Report.** When done, state: how many files were scanned, how many confusions
   were found, how many were resolved, and list any that were skipped.

## MUST

- Ask before editing — never resolve a confusion without the user's answer
- One group per round — do not dump all questions at once
- Minimal edits — clarify what is there; do not rewrite unless the user asks
