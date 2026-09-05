---
part-of:
  - claude-code

name: "Slash Commands and Skills"
description: "User-defined and bundled commands in Claude Code invoked with /name — skills carry SKILL.md instructions loaded on demand rather than at session start."
domain: claude-code
extends: command-pattern
requires: claude-code
governed-by: skill-md
enables: progressive-disclosure
delivers: task-specific-instructions
contrasts-with: claude-md
date-created: 2026-03-30
aliases:
  - Skills
  - Slash Commands
  - SKILL.md
references:
  - id: anthropic-skills-docs
    type: document
    title: Extend Claude with skills
    author:
      - literal: Anthropic
    container-title: Claude Code Docs
    issued:
      - year: 2025
    URL: https://docs.anthropic.com/en/docs/claude-code/slash-commands
  - id: anthropic-plugins
    type: document
    title: Customize Claude Code with plugins
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-code-plugins
---

Slash commands are [Claude Code's](./claude-code.md) mechanism for invoking task-specific instructions on demand. A user types `/name` at the prompt to load a command's instructions into the conversation context. Claude Code ships with built-in commands (`/help`, `/clear`, `/compact`, `/context`, `/review`) that perform fixed operations, and supports user-defined **skills** backed by `SKILL.md` files.

A skill is a slash command with its own instruction document. Each `SKILL.md` has YAML frontmatter (name, description) and markdown body (the instructions Claude follows when the skill is invoked). The `name` field becomes the `/slash-command`. The `description` field serves double duty: it labels the command for the user and tells Claude when to load the skill automatically — if a user's request matches the description, Claude may invoke the skill without being asked.

Skills can be placed at three locations: project skills (`.claude/skills/<name>/SKILL.md`) are version-controlled and shared with the team; user skills (`~/.claude/skills/<name>/SKILL.md`) are personal and available across all projects; plugin skills are installed via `/plugin` from published packages.

The key distinction from [CLAUDE.md](./claude-md.md) is temporal: CLAUDE.md loads on every session regardless of relevance, while skills load only when invoked or when Claude judges them relevant. This makes skills the primary mechanism for [progressive disclosure](./progressive-disclosure.md) — keeping root instructions minimal while allowing deep task-specific guidance to exist in the project without consuming context on every request.

Skills consume context when loaded. The budget scales dynamically at 2% of the [context window](../../../terms/context-window.md), with a 16,000-character fallback. Skills exceeding the budget may be excluded; `/context` surfaces warnings. The limit is overridable via the `SLASH_COMMAND_TOOL_CHAR_BUDGET` environment variable.

As of late 2025, skills can be bundled as **plugins** — installable packages of slash commands, [subagents](./subagents.md), [MCP servers](../../agents/terms/model-context-protocol.md), and [hooks](./hooks.md) distributed and installed with `/plugin`.

