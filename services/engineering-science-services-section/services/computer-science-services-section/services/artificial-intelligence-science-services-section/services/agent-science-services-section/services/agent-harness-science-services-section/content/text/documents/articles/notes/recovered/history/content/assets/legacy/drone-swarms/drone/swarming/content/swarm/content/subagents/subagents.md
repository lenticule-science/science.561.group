---
part-of:
  - claude-code

title: "Subagents"
description: "Child agents that Claude Code spawns for parallel or isolated tasks — each runs in its own context window with scoped tools and a custom system prompt."
defines: Subagents
domain: claude-code
extends: agent-delegation
requires:
  - claude-code
  - context-window
acts-on: subtask
governed-by: tool-permissions
enables:
  - parallel-execution
  - context-isolation
delivers: task-result-message
date-created: 2026-03-30
aliases:
  - Subagents
  - Agent Tool
  - Child Agents
references:
  - id: anthropic-subagents-docs
    type: document
    title: Create custom subagents
    author:
      - literal: Anthropic
    container-title: Claude Code Docs
    issued:
      - year: 2025
    URL: https://docs.anthropic.com/en/docs/claude-code/sub-agents
  - id: anthropic-advanced-patterns
    type: document
    title: Claude Code Advanced Patterns: Subagents, MCP, and Scaling to Real Codebases
    author:
      - literal: Anthropic
    container-title: Anthropic Webinars
    issued:
      - year: 2025
    URL: https://www.anthropic.com/webinars/claude-code-advanced-patterns
---

Subagents are child agents that [Claude Code](./claude-code.md) spawns via the **Agent tool** to handle focused tasks.
Each subagent runs in its own [context window](../../../terms/context-window.md) with a custom system prompt, scoped tool access, and independent permissions.
When the subagent completes, it returns a single result message to the parent — only the relevant output, not the child's full working context.

The purpose is twofold. **Context isolation**: the subagent's file reads, searches, and intermediate reasoning do not consume the parent's context, preventing long research or exploration from diluting the parent's working memory. **Parallelism**: multiple subagents can run concurrently on independent tasks, and the parent can continue its own work while background subagents execute.

Claude Code ships with predefined subagent types:

- **Explore** — fast codebase exploration (file search, grep, reading).
  Cannot edit files.
  Used when the parent needs information but does not need to act on the codebase through the subagent.
- **Plan** — software architecture planning.
  Reads and searches but cannot write.
  Returns implementation plans and architectural analysis.
- **General-purpose** — full tool access for complex multi-step tasks.
  Can read, write, execute, and search.

Users can define **custom subagent types** by creating agent definition files with a tailored system prompt and tool whitelist.

Subagents run in two modes: **foreground** (default), where the parent waits for the result before proceeding, and **background**, where the parent continues working and is notified on completion.
For file-modifying tasks, subagents can optionally run in a **git worktree** — an isolated copy of the repository that prevents edit conflicts with the parent's work.

The subagent pattern is also available in the **Claude Agent SDK**, the library that powers Claude Code's own conversation loop and tool infrastructure.
