---
name: claude session
description: A single Claude Code session — a process bound to a working directory, an active character, an MCP tool surface, and a witness log; bracketed by SessionStart on one end and Stop on the other.
---

A claude-session is the running unit of work in Claude Code.
It is opened when Claude Code starts inside a repository, bound to whichever character the repository's `.mcp.json` and `CLAUDE.md` were installed against.
It runs until Claude Code's `Stop` event fires, at which point its witness log is settled.

The session is distinct from the *character* it runs as (the character persists across sessions); from the *agent* the character's agency may register as a tool (an agent is dispatchable, the session is the dispatcher); and from the *task* the session works on (a session may touch many tasks, or none).

## Characteristic predication-shape

- `runs-as(claude-session, character)` — the character whose `.mcp.json` / agency this session was installed against.
- `has-working-directory(claude-session, repository-root)` — the absolute path the session opened in.
- `bracketed-by(claude-session, {SessionStart, Stop})` — the lifecycle events that begin and end the session.
- `injects-context(claude-session, surface-file)` — the files read into the session prompt at start, in the order the SessionStart hook script enforces.
- `emits-witnesses-to(claude-session, code/logs/tool-uses/<YYYY-MM-DD>.jsonl)` — where the session's tool-use witnesses are appended by the MCP server.

## The order of context injection

When a claude-session opens, the surface files in the repository root are read into the session prompt by the `SessionStart` hook in this order:

1. **`SOUL.md`** — what the session is and what constraints it acts under.
  Read first because every later context is interpreted under these constraints.
2. **`MEMORY.md`** — standing facts (the 561 Group, the governance regimes, the math, the writing discipline, key paths).
3. **`HEARTBEAT.md`** — per-turn checks.
4. **`DREAMS.md`** — what the session works toward over time.
5. **`TOOLS.md`**, **`USER.md`**, **`AGENTS.md`** — references looked up against the established frame.

The order is structural: SOUL constrains what acts are admissible; the others are read under that constraint.
A session that reads HEARTBEAT before SOUL has to re-interpret its checks once SOUL lands.

`identity.md` is not in the order.
The file convention was invented by prior agents; the operator forbade it as not a real-world spec.
