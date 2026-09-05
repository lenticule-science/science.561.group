---
title: "Add agent_context MCP resource — parameterized context for office+domain"
specialization: task
date-created: 2026-04-05
plan: mcp-operations-surface
depends-on: mcp-list-get-task-tools
assigned-to: harness-optimizer
work-type: procedure
requires: [writing, code-editing]
produces: [plan-file]
contributes-to-milestone: mcp-operations-surface-m2-typed-dispatch
---
**Action:** Add `context://{office}/{domain}` resource template to MCP server.

**Acceptance criteria:** - New ResourceTemplate registered at `context://{office}/{domain}` - Given office + domain, queries the knowledge graph for: terms in that domain (type=term, path contains domain), texts referencing those terms, potential plans touching that domain, relevant instincts (trigger matches office patterns) - Returns a markdown bundle: "## Terms" (titles + paths), "## Related Texts", "## potential Plans", "## Instincts" - Total output should be ~500 tokens of high-relevance context, not a full dump - Auto-completion on both `office` (from agent definition files) and `domain` (from graph domain paths)

**Context:** - Idea file: `operations/command/ideas/parameterized-agent-context.md` - Existing resource templates in `server.js` (entity://{type}/{name}) show the pattern - Agent definitions in `operations/engineering/fars/agentic/agents/` have action-domain fields - Graph has domain paths on entities: query `graph_query_attr` for domain filtering

**Work type:** derivation (requires judgment about what's relevant vs not)
