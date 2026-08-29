---
description: "Advances the src/ department by working its PLANS queue. Thin wrapper around skills/run-agent-loop.md."
skill-closure-kind: procedure
---

# improve-src

domain: none — reads current state of `src/` autonomously

codomain: `work_report` from [run-agent-loop](../../skills/run-agent-loop.md)

---

Call `skills/run-agent-loop.md` with:

- `department`: `src`
- `executor`: `src/skills/do-src-work.md`
- `compliance_skill`: (not yet written — omit)
- `discovery_skill`: (not yet written — omit)

Return the work_report.

---

## Constraint

Every work item executed MUST correspond to a spec in `spec/`. If no spec exists
for the behavior being implemented, send a cross-department message to `spec/INBOX.md`
and defer the item until the spec is written.

## Pending

- `src/skills/do-src-work.md` — executor skill; receives `(item_text, department)`,
  executes one src/ work item, returns `work_report`.
