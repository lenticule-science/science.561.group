---
name: dispatch-execution-bridge
specialization: task
date-created: 2026-04-04
date-completed: 2026-04-04
plan: ops-dispatch-stage
work-type: derivation
---

**Implementation:**
- Added `--dispatch` flag to `dispatch-work.js`
- `--dispatch` implies `--assign` (records assignment events)
- Builds duty officer prompts from task files (reads frontmatter + body)
- Launches via `mash-engine start` for each top-N assignment
- Optional `--max-dispatch N` to limit concurrent dispatches (default 5)
- Usage: `node dispatch-work.js --dispatch --max-dispatch 3`
- Also available via MCP: `dispatch_report` tool shows ready work, `run_command` can execute dispatch
