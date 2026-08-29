---

title: "AGENTS.md"
description: "A file convention for providing AI coding agents with project-specific instructions — a README for agents, stewarded by the Linux Foundation's Agentic AI Foundation since December 2025."
defines: AGENTS.md
domain: agents
instance-of: context-engineering
governs: agentic-system
delivered-via: system-prompt
contrasts-with: soul-md
date-created: 2026-03-29
---

AGENTS.md is a file convention for providing AI coding agents with project-specific instructions.
It is a Markdown file placed in a project's root directory (or subdirectories in monorepos) that functions as a README for agents — a dedicated, predictable location for context that would clutter a human-oriented README: build commands, test procedures, code style rules, git workflow conventions, and security boundaries.

The convention emerged from a collaboration across the AI development ecosystem.
OpenAI introduced it alongside the Codex research preview (May 2025) and released the format publicly in **August 2025**.
Collaborators included OpenAI (Codex), Google (Jules), Cursor, Factory, and Amp.
On **December 9, 2025**, the Linux Foundation announced the **Agentic AI Foundation (AAIF)**, with AGENTS.md as one of its three founding project contributions alongside Anthropic's [MCP](../domains/model-context-protocol/index.md) and Block's goose.

The format is intentionally minimal: standard Markdown with no required fields, no schema, no versioning.
Agents read the closest AGENTS.md file in the directory tree, with files nearest the edited file taking precedence.
This nearest-ancestor resolution is the only specified behavior.
Typical sections include build and test commands, project structure, code style conventions, testing instructions, git workflow, and security constraints, but nothing is mandatory.

As of early 2026, over **60,000 open-source projects** use AGENTS.md.
It is supported by 20+ tools including OpenAI Codex, Google Jules, GitHub Copilot, Cursor, Windsurf, VS Code, Devin, JetBrains Junie, Aider, Gemini CLI, and others.
GitHub published guidance on writing effective AGENTS.md files based on analysis of 2,500+ repositories.

AGENTS.md sits within a broader landscape of agent instruction files that includes `CLAUDE.md` (Claude Code-specific), `.cursorrules` (Cursor-specific), `.windsurfrules` (Windsurf-specific), `.github/copilot-instructions.md` (GitHub Copilot-specific), and [SOUL.md](./soul-md.md) (agent identity and personality).
The key distinction is scope: AGENTS.md encodes *project-level instructions* (what to do and how), while [SOUL.md](./soul-md.md) encodes *agent-level identity* (who the agent is).
Tool-specific files like `CLAUDE.md` combine both functions for a single agent runtime.

The convention's strength is its simplicity — any agent that can read Markdown can consume AGENTS.md without special tooling.
Its weakness is the same: without a schema or required fields, the quality and structure of AGENTS.md files varies enormously, and there is no way to validate that an agent has correctly interpreted the instructions.
