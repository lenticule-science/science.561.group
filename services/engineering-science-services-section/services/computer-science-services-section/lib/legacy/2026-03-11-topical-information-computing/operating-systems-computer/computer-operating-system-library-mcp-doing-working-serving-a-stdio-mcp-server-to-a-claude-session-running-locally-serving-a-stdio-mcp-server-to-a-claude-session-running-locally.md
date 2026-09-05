---
name: serving-a-stdio-mcp-server-to-a-claude-session-running-locally
description: The transformer that launches a stdio-mcp-server bound to the root character at 561.md, registers exactly the character's listed skills as MCP tools, and serves them to a local Claude Code session for the duration of that session.
specializing: mcp
---

A morphism that takes the root character surface `561.md` and produces a running stdio-mcp-server exposing that character's `skills:` list as MCP tools.
The morphism's body lives at [scripts/serve-a-stdio-mcp-server-to-a-claude-session-running-locally.mjs](scripts/serve-a-stdio-mcp-server-to-a-claude-session-running-locally.mjs).

## How it runs

Claude Code reads the repository-root `.mcp.json` and launches this script as a subprocess.
The script reads `561.md`, globs every `SKILL.md` under the repository root, validates that each slug in the character's `skills:` list resolves to exactly one `*/<slug>/SKILL.md`, registers each as an MCP tool, and serves JSON-RPC requests until Claude Code closes the connection.

## Witness emission

Each tool call is appended to the per-day witness log (current location: `code/logs/tool-uses/<YYYY-MM-DD>.jsonl`).
The witness row carries the timestamp, the character name, the tool name, the call arguments, a 500-character result summary, the call duration in milliseconds, and an ok flag.

## Inputs and outputs

- **Reads:** the root character surface [`561.md`](../../../../../../../../../../../561.md), every `SKILL.md` under the repository root, and the script body of each invoked skill.
- **Writes:** standard output (JSON-RPC responses to Claude Code), standard error (startup and per-call logs), and one witness row per call to the per-day witness log.

## Distinguishing predication-shape

- `specializing` (mcp) — this transformer specializes the abstract `mcp` morphism to the stdio-transport, locally-running-claude-session case.
- The script reads only `561.md` and the discovered `SKILL.md` files; it does not read any other root surface file.
