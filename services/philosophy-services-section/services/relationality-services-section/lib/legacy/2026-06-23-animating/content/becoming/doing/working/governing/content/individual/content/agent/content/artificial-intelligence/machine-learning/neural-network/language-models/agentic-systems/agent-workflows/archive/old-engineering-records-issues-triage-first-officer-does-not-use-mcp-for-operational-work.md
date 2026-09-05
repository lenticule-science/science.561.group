---
name: first-officer-does-not-use-mcp-for-operational-work
date-created: 2026-04-05
severity: design-flaw
affects: [first-officer, mcp-usage, session-discipline]
reported-by: first-officer
triggered-by: session 01221bb8-d220-438c-a466-dd2c4861262e
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## Problem

The first officer has 15 typed MCP tools for operational work (graph_search, graph_entity, graph_query_attr, record_event, dispatch_report, sessions_list, channel, run_command, update_entity_status, etc.) but uses them rarely. Most operational work goes through direct file reads/edits and ad-hoc Bash scripts instead.

## Symptom

In session 01221bb8, the first officer:
- Used `graph_search`/`graph_entity`/`graph_query_attr` fewer than 10 times across a multi-hour session
- Hand-parsed frontmatter via regex in a custom Node script when `graph_query_attr` would have answered the same question
- Did not emit `record_event` calls for the entity-modifications performed (events only appeared via automatic hooks)
- Did not call `update_entity_status` when marking tasks completed — edited frontmatter directly
- Did not run `dispatch_report` before making dispatch decisions

## Root Cause

The agent treats Read/Edit/Write/Bash/Grep as the default toolkit and MCP tools as exotic alternatives. CLAUDE.md explicitly states MCP tools are the preferred surface ("Use these instead of Bash commands") but this is not enforced by hooks or by the first-officer identity prompt.

## Desired Behavior

1. First-officer session-start should prime the officer with MCP tool examples for common operations.
2. A PreToolUse hook should intercept Bash calls matching graph-query patterns (e.g., `node query-library-graph.js`) and suggest the MCP equivalent.
3. A PreToolUse hook should intercept Edit/Write on entity files (frontmatter status changes) and suggest `update_entity_status` MCP tool.
4. The /bridge command should use exclusively MCP tools to compose its view, demonstrating the pattern.

## Workaround

Captain manually prompts "use MCP" when noticing direct-file patterns.

## Related

- `CLAUDE.md` — documents preference hierarchy (MCP → mash-engine → in-session Agent)
- `operations/engineering/records/memory/feedback_use-mcp-not-bash.md`
