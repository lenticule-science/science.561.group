---
part-of:
  - claude-code

name: "Permission Model"
description: "The set of rules governing which Claude Code tool calls execute automatically and which require human approval — balancing agent autonomy against safety for destructive or externally visible actions."
domain: claude-code
extends: human-in-the-loop
requires: claude-code
acts-on: tool-call
governed-by: user-configuration
enables: safe-agentic-coding
contrasts-with: unrestricted-execution
date-created: 2026-03-30
aliases:
  - Permission Model
  - permission model
  - permission mode
references:
  - id: anthropic-autonomous
    type: document
    title: Enabling Claude Code to work more autonomously
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/enabling-claude-code-to-work-more-autonomously
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

The permission model is the set of rules governing which [tool calls](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/tool-call.md) [Claude Code](claude-code.md) executes automatically and which require human approval before proceeding. It is the primary mechanism for balancing agent autonomy against safety in [agentic coding](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/03/30/2026-03-30-agentic-coding.md).

Claude Code categorizes actions by reversibility and blast radius. **Local, reversible actions** — reading files, searching code, writing to local files — default to automatic execution. **Destructive or externally visible actions** — force-pushing to a remote, deleting files, posting to APIs, sending messages to external services — default to requiring confirmation. The user sees the proposed action and must approve or deny it before the runtime executes the tool call.

Users select a **permission mode** that sets the baseline:

- **Default** — most read operations are automatic; writes and shell commands require approval
- **Broader grants** — users can approve specific tools or tool patterns for automatic execution within a session or project, progressively widening the agent's autonomy for trusted workflows
- **Background/autonomous** — for unattended execution (e.g., via GitHub Actions), permissions can be configured to allow broader automatic execution with guardrails

The permission model operates at the runtime layer, not the prompt layer. The model generates a [tool call](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/tool-call.md); the runtime checks the permission rules before executing. This is the same layer where [hooks](hooks.md) operate — and hooks can supplement the permission model with custom validation logic (e.g., a PreToolUse hook that rejects shell commands matching a blocklist).

The permission model matters because [agentic coding](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/03/30/2026-03-30-agentic-coding.md) introduces a category of risk that chat-based assistance does not: the agent can act on shared systems. A poorly worded instruction can lead to a force-push that overwrites a colleague's branch, a shell command that drops a database, or an API call that sends unintended messages. The permission model is the checkpoint that prevents these outcomes from being one misinterpretation away.
