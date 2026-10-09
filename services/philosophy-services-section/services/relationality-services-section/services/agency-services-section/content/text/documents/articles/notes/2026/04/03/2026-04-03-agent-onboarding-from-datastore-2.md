---
title: "Session-start composes agent orientation from the datastore, not static docs"
specialization: task
date-created: 2026-04-03
plan: agentic-orchestration
produces: session-start hook that queries datastore for relevant infrastructure context based on the session's likely work area
work-type: procedure
description: "Action: Rewrite session-start.js to compose orientation from the datastore rather than static text."
---

**Action:** Rewrite session-start.js to compose orientation from the datastore rather than static text.
When the agent is about to work on engineering, it should see engineering infrastructure facts (hooks, datastore, tools) pulled from the graph.
When working on library content, it should see library structure facts.

**Why:** An agent spent an entire session building directory-scanning hooks because nothing told it the EAVT datastore existed.
The orientation was static paths ("Memory: operations/engineering/records/memory/") — no descriptions, no architecture, no facts about what tools exist.
The datastore has all this information.
The session-start hook should compose it.
