---
title: "Add explicit capability frontmatter to agent definitions"
specialization: task
date-created: 2026-04-03
plan: ops-dispatch-stage
produces: updated agent definitions in operations/engineering/fars/agentic/agents/
work-type: procedure
task-done: 2026-04-03
description: "Action: Add capabilities: frontmatter to each agent definition listing domain capabilities and work types."
---

**Action:** Add `capabilities:` frontmatter to each agent definition listing domain capabilities and work types.

**Why:** The current `extractCapabilities()` function in dispatch-work.js guesses capabilities from description text via keyword matching.
This is fragile — adding a word to a description changes what work gets dispatched to the agent.
Explicit capability declarations make dispatch deterministic and auditable.

**What exists now:** 11 agent definitions in `operations/engineering/fars/agentic/agents/`.
The dispatch system knows what capabilities it looks for: domain (planning, review, execution, documentation, security, research, infrastructure, operations, coordination, learning) and work-type (derivation, inquiry, procedure, process).

**Acceptance criteria:** - Every agent has a `capabilities:` block with `domains:` and `work-types:` lists - dispatch-work.js reads capabilities from frontmatter instead of extracting from description - Dispatch results are identical or better than keyword-extracted results
