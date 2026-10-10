---
description: "Runs the full AgentLoop for the math department. Thin wrapper around skills/run-agent-loop.md with math-specific executor, compliance, and discovery skills."
skill-closure-kind: procedure
---

# do-math-work

domain: none — reads current state of `math/` autonomously

codomain: `work_report` from [run-agent-loop](../../skills/run-agent-loop.md)

---

Call `skills/run-agent-loop.md` with:

- `department`: `math`
- `executor`: `math/skills/improve-math.md`
- `compliance_skill`: `math/skills/audit-math-compliance.md`
- `discovery_skill`: `math/skills/next-math-target.md`

Return the work_report.

---

## Pending

- `math/skills/audit-math-compliance.md` — not yet written; run-agent-loop skips
  compliance when absent. When written, it should: sample math/ units against
  spec requirements; handle violation rates (individual items below 20%, batch
  items at or above); run the spec-alignment audit (Phase 3b logic from the prior
  version of this file).
- `math/skills/next-math-target.md` — not yet written; run-agent-loop skips
  discovery when absent. When written, it should: look for concepts referenced
  in spec/math-unit.md, spec/naming-math-unit.md, spec/frontmatter.md
  that have no corresponding math/ unit.
