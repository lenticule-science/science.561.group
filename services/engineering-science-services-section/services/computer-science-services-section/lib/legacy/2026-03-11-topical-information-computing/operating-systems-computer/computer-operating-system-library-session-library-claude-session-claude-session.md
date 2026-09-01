---
name: claude-session
description: A single Claude Code session — a process bound to a working directory, an active character, an MCP tool surface, and a witness log; bracketed by SessionStart on one end and Stop on the other.
specializing: session
realizes-standard: claude-code-session
bracketed-by:
  - session-start
  - stop
---

A **claude-session** is one running unit of work in Claude Code.
It is opened when Claude Code starts inside a repository, bound to whichever character the repository's `.mcp.json` and `CLAUDE.md` were installed against.
It runs until Claude Code's `Stop` event fires, at which point its witness log is settled.

The claude-session is a [session](../../session.md) specialized by the runtime being Claude Code (with its SessionStart hook, its MCP wire, its Stop event).
Other session subkinds (git-session, mcp-session) realize the same abstract session form in different runtimes.

## Distinct from character, agent, task

- The character persists across sessions; the claude-session is one runtime instance bound to a character.
- An agent is the dispatchable record; the session is the dispatcher.
- A task may touch many sessions, or a session may touch many tasks; the relationship is many-to-many.

## Characteristic predication-shape

- `runs-as(claude-session, character)` — the character whose .mcp.json and CLAUDE.md installed this session.
- `has-working-directory(claude-session, repository-root)` — the absolute path the session opened in.
- `bracketed-by(claude-session, {SessionStart, Stop})` — the lifecycle events that begin and end the session.
- `injects-context(claude-session, surface-file)` — the files read into the session prompt at start.
- `emits-witnesses-to(claude-session, code/logs/tool-uses/<YYYY-MM-DD>.jsonl)` — where the session's tool-use witnesses are appended.

## The order of context injection

When a claude-session opens, the surface files in the repository root are read into the session prompt by the SessionStart hook in this order:

1. **SOUL.md** — what the session is and what constraints it acts under.
  Read first because every later context is interpreted under these constraints.
2. **MEMORY.md** — standing facts (the 561 Group, the governance regimes, the math, key paths).
3. **HEARTBEAT.md** — per-turn checks.
4. **DREAMS.md** — what the session works toward over time.
5. **TOOLS.md**, **USER.md**, **AGENTS.md** — references looked up against the established frame.

The order is structural: SOUL constrains what acts are admissible; the others are read under that constraint.
