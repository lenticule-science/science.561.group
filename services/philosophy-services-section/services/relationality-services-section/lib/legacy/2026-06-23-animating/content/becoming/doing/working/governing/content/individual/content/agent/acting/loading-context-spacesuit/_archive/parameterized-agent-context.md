---
name: parameterized-agent-context
specialization: idea
date-created: 2026-04-05
source: captain-directive
connects-to:
  - mcp-and-agent-sdk-deep-dive
  - kernel-shell-architecture
  - offices-as-fuzzy-cells
---

## Captain's words (2026-04-05)

> Those all treat those as questions with one answer, not questions whose answer changes based on who's asking.
> Something we could do to make this more multi-agentic is like, more MCP server stuff, more specific/parameterized of stuff, not just global/abstract.

> Descriptions of terms, notification of related texts, plans, all just as part of the provided prompt.

## The insight

Every tool and command we have answers one global question.
`/forecast` shows one velocity number.
`/whats-next` shows one priority list.
But the researcher doesn't need the same picture as the operations officer.
When an agent gets dispatched to work in a specific domain, the context it receives should be *pre-filtered to what it needs*.

## What this looks like concretely

### MCP resource: `context://{office}/{domain}`

A new resource template on the 561-datastore server.
When a researcher gets dispatched to work on epistemology:

```
context://researcher/epistemology
```

Returns a tailored bundle: - **4 existing epistemology terms** (titles + paths, from graph query: type=term, domain contains epistemology) - **2 texts that reference them** (from graph: type=text, related-terms intersects epistemology terms) - **1 active plan touching this domain** (from ops graph: type=plan, tasks have domain=epistemology) - **Relevant instincts** (from instinct files: trigger matches research/writing patterns) - **Recent sessions in this domain** (from session records: task description mentions epistemology)

Total: ~500 tokens of highly relevant context instead of 25K tokens of everything.

### MCP resource: `context://{office}/{task-id}`

Even more specific — given a task ID:

```
context://writer/write-epistemology-survey
```

Returns: - The task file content - The plan it belongs to (with objective) - Terms and texts in the task's domain - The skill most relevant to this work type (writing-surveys) - Instincts about writing quality

### How this changes dispatch

Current: officer loads CLAUDE.md (25K tokens), reads generic instructions, then searches for what it needs.

Better: officer starts with a `context://` resource that already contains the 500 tokens of domain-specific context it needs.
The MCP host includes this automatically based on the resource's priority annotation.

### What the MCP spec provides

- **Resource templates** with parameters: `context://{office}/{domain}` is a valid URI template (RFC 6570)
- **Audience annotations**: mark resources as `assistant`-facing so the host auto-includes them
- **Priority annotations**: 0.0-1.0 float, so domain-relevant context ranks higher than generic
- **Auto-completion**: the `complete` handler can suggest valid offices and domains

### Implementation

The MCP server already has: - The knowledge graph loaded (11,662 entities) - Entity type filtering (type=term, type=text, etc.) - Text search across entities - Resource templates with `list` and `complete` handlers

Adding `context://{office}/{domain}` is: 1.
Query graph for entities where domain path contains the parameter 2.
Filter by entity types relevant to the office (researcher → terms, texts; operations-officer → plans, tasks) 3.
Format as a concise markdown bundle 4.
Set priority annotation based on match quality

This is ~100 lines of JS in the MCP server.
The graph queries are already implemented.

### Beyond dispatch

The same pattern works for: - **Session-start hooks**: inject relevant context when a session begins, based on who's starting it - **Heartbeat checks**: the storyteller surfaces different priorities for different offices - **Review**: a code-reviewer's context includes the diff and related code conventions, not the full org state - **The captain**: sees strategic overview (goals, plan progress, budget), not task-level detail
