---
title: "Implement push vs pull dispatch selection by work type"
specialization: task
date-created: 2026-04-03
plan: ops-dispatch-stage
depends-on: [agent-capability-frontmatter]
produces: dispatch mechanism selection in dispatch-work.js
work-type: derivation
requires: [code-editing, dispatch]
assigned-to: operations-officer
description: "Action: Implement mechanism selection so dispatch uses pull for exploratory work and push for routine work."
---

**Action:** Implement mechanism selection so dispatch uses pull for exploratory work and push for routine work.

**Why:** Anderson's kanban insight: pull ordering lets the worker signal readiness, preventing overload.
But routine procedures and processes can be pushed directly because their execution path is known.

**Grounding:** Work type classification — process (both settled), procedure (execution settled), derivation (meaning settled), inquiry (neither settled).
Push when execution is settled; pull when it isn't.

**Open questions:** - Whether this is different `/dispatch-work` modes or different commands - How to signal "ready to pull" in stateless agent sessions - Whether the briefing already serves as the pull mechanism
