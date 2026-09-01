---

title: "Enforce that the agent uses commands instead of bypassing them with Write"
specialization: task
date-created: 2026-04-01
plan: agentic-orchestration
serves: reactive-consequences
depends-on:
  - parameterizable-record-commands
produces: command-enforcement hook or rule
work-type: procedure
contributes-to-milestone: agentic-orchestration-m6-harness-selfuse
task-done: 2026-04-01
status: completed
---

**Action:** Once parameterizable commands exist for creating tasks, plans, terms, objectives — add a PreToolUse hook or rule that detects when the agent writes to records/ or library/terms/ directly and suggests using the command instead.

**Why:** The agent bypasses its own harness by using Write directly.
This is the equivalent of running SQL instead of using the API.
Commands enforce structure, trigger hooks, propagate consequences.
Direct writes skip all of that.
The user also bypasses commands (sending chat instead of slash commands) because the commands are unreliable — making commands reliable is part of this.
