---
part-of:
  - claude-code

name: "IDE Integration"
description: "Claude Code's native extensions for VS Code and JetBrains IDEs — embedding the agent directly in the editor with inline diffs, checkpoints, and file mentions."
domain: claude-code
extends: editor-extension
requires: claude-code
acts-on: integrated-development-environment
enables:
  - inline-diff-review
  - checkpoint-management
  - file-mention
delivers: embedded-agent-in-editor
contrasts-with: cli
date-created: 2026-03-30
aliases:
  - VS Code Extension
  - JetBrains Extension
  - Claude Code IDE
references:
  - id: anthropic-ide-docs
    type: document
    title: Use Claude Code in VS Code
    author:
      - literal: Anthropic
    container-title: Claude Code Docs
    issued:
      - year: 2025
    URL: https://docs.anthropic.com/en/docs/claude-code/ide-integrations
  - id: anthropic-claude-code
    type: document
    title: Claude Code by Anthropic | AI Coding Agent, Terminal, IDE
    author:
      - literal: Anthropic
    container-title: Anthropic
    issued:
      - year: 2025
    URL: https://www.anthropic.com/claude-code
---

[Claude Code](./claude-code.md) provides native extensions for **VS Code** (including Cursor and Windsurf) and **JetBrains** IDEs (IntelliJ IDEA, PyCharm, WebStorm, and other IntelliJ-family editors). The extensions embed the same agent engine as the CLI directly in the editor, adding a graphical layer for code review and navigation.

The VS Code extension provides:

- **Inline diff review** — proposed edits appear as diffs in the editor; the user accepts or rejects each change before it is applied.
- **Auto-accept mode** — edits apply as they are made, for users who prefer post-hoc review.
- **File mentions** — `@`-mention files with specific line ranges from the current selection to direct Claude's attention to particular code.
- **Conversation history** — access and resume previous sessions.
- **Multi-tab conversations** — multiple Claude sessions in separate tabs or editor panes.
- **Checkpoints** — the extension tracks Claude's file edits and allows rewinding to any previous state via a rewind button on each message.
- **Status line** — a configurable status bar showing the agent's current activity.

Installation: open the Extensions view (`Ctrl+Shift+X` on Windows/Linux, `Cmd+Shift+X` on Mac), search "Claude Code", click Install.

The JetBrains plugin provides a parallel experience for IntelliJ-family editors, displaying proposed edits directly in the editor and supporting the same conversational workflow. It is available through the JetBrains Marketplace.

The IDE extensions run the same engine as the CLI. [CLAUDE.md](./claude-md.md) files, [hooks](./hooks.md), [skills](./slash-commands.md), [MCP servers](../../agents/terms/model-context-protocol.md), and permission settings all work identically across interfaces. What the extensions add is a visual layer — diff views, checkpoints, file mentions — that tightens the feedback loop between the agent's edits and the developer's review.

Claude Code is also available as a desktop app (Mac, Windows) and a web app (claude.ai/code, tasks run on Anthropic cloud infrastructure); these are distinct from the IDE extensions in that they do not integrate with an editor's file navigation and diff tools.

