---
description: "Advances the spec/ department by working its PLANS queue, running compliance audits, and discovering missing specs; loops until all three exit conditions hold simultaneously. Thin wrapper around skills/run-agent-loop.md."
skill-closure-kind: procedure
---

# improve-specs

domain: none — reads current state of `spec/` autonomously

codomain: `work_report` from [run-agent-loop](../../skills/run-agent-loop.md)

---

Call `skills/run-agent-loop.md` with:

- `department`: `spec`
- `executor`: `spec/skills/improve-spec.md`
- `compliance_skill`: `spec/skills/spec-compliance-check.md`
- `discovery_skill`: `spec/skills/next-spec-target.md`

Return the work_report.
