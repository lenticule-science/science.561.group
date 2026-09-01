---
name: post-work-update

description: "Classifies findings from a completed work unit into five categories (Pattern, Gap, Fix, Cross-department, Done) and routes them to PLANS, IDEAS, or INBOX accordingly. Use after every work unit in an improvement skill loop to close the feedback cycle."
skill-closure-kind: derivation
---

domain:
- `work_summary` — one sentence describing what was just done
- `files_touched` — list of files modified or created during the work unit
- `findings` — list of things noticed during the work that were not the primary task
  (bad skill, stale doc, missing spec, pattern that may apply elsewhere, etc.)

codomain: a set of context file updates (edits to PLANS and IDEAS files across
any department); the content of each update is a judgment about where the finding
belongs and what action it implies.

---

Inference rules (apply to each item in `findings`):

1. **Pattern rule.** If the finding describes a problem that likely affects files
   similar to the ones touched (e.g., "this skill was missing field X — other
   skills of this type probably are too"):
   → Add to the owning department's PLANS: "compliance scan — check all [type] files
     for [problem]"

2. **Gap rule.** If the finding names a concept, spec, or skill that does not
   exist but is needed (e.g., "this skill referenced a type that has no spec"):
   → Add to the owning department's IDEAS: the concept name, the context in which
     it was discovered, and what a spec or skill for it would do.

3. **Fix rule.** If the finding names a specific file that needs updating and
   the fix is clear (e.g., "AGENTS.md lists knowledge-graph-schema.md as needed
   but it now exists"):
   → Add to the owning department's PLANS: "update [file] — [one-sentence description
     of what to change]"
   → If the fix is small enough to do immediately: do it now and note it as done.

4. **Cross-department rule.** If the fix or gap belongs to a different department than
   the one currently being worked (e.g., a finding in spec/ work reveals a bug
   in a proof/ skill, or a new lemma found during proof work needs documenting
   in math/):
   → Call `skills/deposit-message-in-agent-inbox.md` with:
     - `from_department`: current department
     - `to_department`: the department that owns the fix or gap
     - `message_type`: `FixNeeded`, `GapFound`, or `Discovery` as appropriate
     - `subject`: one sentence naming the finding
     - `body`: full context so the target department agent can act without asking
     - `urgency`: `Blocking` if it prevents current work, otherwise `Normal` or `Low`
   → Do not write to the target department's files directly — only via deposit-message-in-agent-inbox.
   → Note in the current department's PLANS that a message was sent (so it isn't sent again).

5. **Done rule.** If the finding was already addressed during this work unit
   (e.g., the stale file was updated as part of the work):
   → Note it as resolved; do not add to PLANS.

6. **Batch rule.** If the finding is a Pattern AND the scope is known to be
   systemic (the agent can confirm that more than 20% of files of this type
   carry the violation, or the violation is known to affect the entire
   department):
   → Do NOT add one WorkItem per affected file.
   → Add ONE WorkItem: "batch-fix: [violation type] across all [type] files
     in [department]/"
   → Add additional WorkItems only if there are distinct violation subtypes
     that require different fix approaches (one item per subtype, not per file).
   This rule overrides Rule 1 when the pattern is confirmed systemic. Rule 1
   applies when the pattern is suspected but scope is unknown.

Apply all six rules to every item in `findings`. One finding may trigger more
than one rule (e.g., a systemic pattern finding triggers both Rule 1 and Rule 6;
Rule 6 wins on the WorkItem count).

After applying all rules: summarize the context updates made. This summary is
the output — it feeds into the improvement skill's loop state so the next
iteration knows what was added to PLANS.
