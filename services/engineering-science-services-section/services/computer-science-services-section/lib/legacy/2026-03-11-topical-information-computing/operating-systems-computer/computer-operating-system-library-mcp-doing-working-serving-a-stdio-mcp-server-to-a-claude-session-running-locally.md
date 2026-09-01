---
name: serving-a-stdio-mcp-server-to-a-claude-session-running-locally
description: Runs the 561 MCP stdio server. Reads the root character surface 561.md, validates and registers each listed skill as an MCP tool, and serves JSON-RPC requests to the connecting Claude Code session.
---

## Requirements

- A root character surface at `561.md` carrying a non-empty `skills:` array in frontmatter, plus `name` and `description`.
- Each skill named in `561.md::skills` resolves to exactly one `*/<slug>/SKILL.md` path under the repository root.

## Steps

1. Read `561.md`.
  Exit non-zero if the file is absent or its frontmatter lacks a non-empty `skills:` array.
2. Glob every `SKILL.md` under the repository root, pruning `.git`, `node_modules`, `theories`, and `old-archive`.
3. For each slug in `561.md::skills`, require exactly one matching `*/<slug>/SKILL.md` path.
  Zero or multiple matches abort startup.
4. Validate each exposed `SKILL.md` has a non-empty `description:` frontmatter cell.
5. Register one MCP tool per listed skill via the MCP SDK's `ListToolsRequestSchema` and `CallToolRequestSchema` handlers.
6. On each `CallToolRequest`, invoke the skill's unique non-helper `scripts/*.mjs` body when exactly one is present; otherwise return the `SKILL.md` procedure body as the tool result.
7. Append one witness row to `code/logs/tool-uses/<YYYY-MM-DD>.jsonl` per call, carrying `{ ts, character, tool, args, result_summary, duration_ms, ok }`.

## Outcomes

- The MCP server runs over stdio, exposing exactly the skills named in `561.md::skills` as tools.
- Helper skills reached transitively through `composes:` chains are not registered as tools.
- A malformed character file, a malformed skill, a slug that does not resolve, or a slug that resolves ambiguously aborts startup with a stderr message naming the failure.
