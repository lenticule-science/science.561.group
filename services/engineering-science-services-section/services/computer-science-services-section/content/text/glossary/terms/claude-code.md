---
part-of:
  - claude-code

name: "Claude Code"
description: "Anthropic's agentic coding tool — a CLI and IDE extension that reads, writes, and executes code autonomously using Claude models."
domain: claude-code
extends: agentic-system
produced-by: anthropic
requires: claude
governed-by:
  - claude-md
  - permission-model
acts-on: codebase
enables: agentic-coding
delivers:
  - file-editing
  - code-execution
  - git-workflow
  - web-search
contrasts-with: chat-based-code-assistant
date-created: 2026-03-30
aliases:
  - Claude Code
  - claude-code
references:
  - id: anthropic-claude-code
    type: document
    title: Claude Code by Anthropic | AI Coding Agent, Terminal, IDE
    author:
      - literal: Anthropic
    container-title: Anthropic
    issued:
      - year: 2025
    URL: https://www.anthropic.com/claude-code
  - id: anthropic-37sonnet-2025
    type: document
    title: Claude 3.7 Sonnet and Claude Code
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-3-7-sonnet
  - id: anthropic-best-practices
    type: document
    title: Claude Code Best Practices
    author:
      - literal: Anthropic
    container-title: Anthropic Engineering
    issued:
      - year: 2025
    URL: https://www.anthropic.com/engineering/claude-code-best-practices
---

Claude Code is [Anthropic's](../../../../services/artificial-intelligence-science-services-section/content/text/glossary/terms/anthropic.md) agentic coding tool. It operates as an interactive [agent](../../../../../services/artificial-intelligence-science-services-section/services/agent-science-services-section/content/text/glossary/terms/agentic-system.md) that reads and searches codebases, edits files, executes shell commands, manages git workflows, and runs tests — using [Claude](../../../../../services/artificial-intelligence-science-services-section/content/text/glossary/terms/claude.md) models to reason about each step. Unlike chat-based code assistants that suggest snippets for a human to paste, Claude Code acts directly on the filesystem and shell, making it an agent rather than an advisor.

Claude Code is available as a **CLI** (the `claude` command, installed via npm), a **VS Code extension**, a **JetBrains extension**, a **desktop app** (Mac and Windows), and a **web app** (claude.ai/code). All interfaces run the same underlying agent engine. See [IDE integration](ide-integration.md) for the editor extensions.

The agent's built-in tools include **Read**, **Edit**, **Write** (file operations), **Bash** (shell execution), **Glob** and **Grep** (search), **Agent** (spawn [subagents](./subagents.md) for parallel or isolated work), **WebSearch** and **WebFetch** (web retrieval), and **TodoWrite** (task tracking).

Claude Code is extensible through four mechanisms that operate at different levels: [CLAUDE.md](claude-md.md) shapes the model's reasoning via project instructions loaded at session start; [slash commands and skills](slash-commands.md) provide task-specific instructions invoked on demand; [hooks](hooks.md) execute shell commands deterministically on tool-call lifecycle events; and [MCP servers](../../agents/terms/model-context-protocol.md) connect external tools and data via the Model Context Protocol. For how these extension points relate and when to use each, see [Extension Architecture in Claude Code](../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/2026/03/30/2026-03-30-claude-code-extension-architecture.md).

A permission system governs which tools execute automatically and which require user approval, defaulting to confirmation for destructive or externally visible actions. Each conversation manages its finite [context window](context-window.md) through automatic compaction — summarizing earlier messages to maintain coherence across long sessions.

For the development history and adoption of Claude Code, see [Claude Code Development and Adoption](../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/2026/03/30/2026-03-30-claude-code-development-and-adoption.md).
