---
name: triage

description: "Takes raw operator input and routes it to the best-fit department INBOX(es). Fast-path for dropping thoughts, tasks, questions, conjectures, or principles into the correct queues without running the full do-work loop."
skill-closure-kind: procedure
---

domain:
- `$ARGUMENTS` — raw operator text to classify and route

---

1. Pass `$ARGUMENTS` to `skills/interpret-prompt.md`.
   - If the PromptUnit list is empty: write the full text to root `INBOX.md` as a
     `type: Question, from: operator, urgency: Normal` Message. Stop here.

2. Pass the PromptUnit list to `skills/route-prompt-units.md`.

3. Report back: one line per unit in the form `{type} → {department}/INBOX.md`
   (or `→ {department}/SOUL.md` for Principles).

No MEMORY update. No context file loading. No post-work pass.
This skill has one job: classify and drop.

codomain: a routing report — what each part of the input was classified as and
where it was placed.
