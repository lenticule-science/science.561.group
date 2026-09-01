---
name: installing a character as a Claude configuration
description: The installing-a-character-as-a-claude-configuration skill projects a character's agency into Claude Code configuration files.
specializing: claude-configuration
closure-position: process
operation-kind: mutation
input-schema:
  type: object
  properties:
    character:
      type: string
      description: Character ref — either a bare slug (looked up at doing/governing/characters/<slug>/<slug>.md) or a relative/absolute path to a character directory (with the .md file at <dir>/<basename(dir)>.md).
    repoRoot:
      type: string
      description: Absolute path to the host root where .mcp.json and CLAUDE.md should be written. Default = process.cwd() at the time of invocation.
  required:
    - character
---

The `installing-a-character-as-a-claude-configuration` skill record.
Operational body in [`SKILL.md`](SKILL.md).

This skill is MCP-callable: any agent whose scope includes `installing` and `character-as-a-claude-configuration` can invoke it during a running session.
The agent record is at [`work/governance/staff/agents/installer-of-a-character-as-a-claude-configuration.md`](../../agents/installer-of-a-character-as-a-claude-configuration.md).

The skill is also the canonical install body for the shell-side `starting-a-session-with-character` launcher — that launcher invokes this skill's script as a step, then execs `claude`.
Install and start are separate verbs; this skill owns install, the launcher owns start.
