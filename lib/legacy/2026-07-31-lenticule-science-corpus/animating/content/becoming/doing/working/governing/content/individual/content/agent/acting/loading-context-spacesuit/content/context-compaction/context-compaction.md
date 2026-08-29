---

title: "Context Compaction"
description: "The technique of summarizing earlier conversation messages as a session approaches the context window limit — preserving key information while freeing space for continued work."
defines: Context Compaction
domain: agents
extends: context-window
requires:
  - large-language-model
  - context-window
acts-on: conversation-history
governed-by: context-window
enables: unbounded-session-length
contrasts-with: context-truncation
date-created: 2026-03-30
aliases:
  - Context Compaction
  - context compaction
  - context compression
  - conversation compaction
references:
  - id: anthropic-agent-sdk
    type: document
    title: Building agents with the Claude Agent SDK
    author:
      - literal: Anthropic
    container-title: Anthropic Engineering
    issued:
      - year: 2025
    URL: https://www.anthropic.com/engineering/building-agents-with-the-claude-agent-sdk
---

Context compaction is the technique of summarizing earlier messages in an [agentic](./agentic-system.md) conversation as the session approaches the [context window](../../../terms/context-window.md) limit.
Rather than truncating old messages (losing information) or ending the session (losing continuity), compaction replaces detailed earlier turns with condensed summaries that preserve the key decisions, findings, and state established so far.

The mechanism operates automatically.
When the conversation's token count approaches the window limit, the system identifies older turns that can be summarized without losing load-bearing information — typically early research, exploration, and intermediate reasoning — and replaces them with a compact summary.
Recent turns (the current working context) remain intact.
The result is that the agent retains awareness of what happened earlier in the session while freeing token budget for continued work.

Context compaction contrasts with **context truncation**, which simply drops the oldest messages.
Truncation loses information unconditionally; compaction is selective, preserving conclusions and decisions while discarding the reasoning steps that led to them.
The trade-off is that compaction is lossy — details of earlier exploration may not survive — but the information that does survive is the information most likely to matter for subsequent actions.

In [Claude Code](../../software/terms/claude-code.md), context compaction is what enables extended coding sessions that span many files, many tool calls, and many rounds of edit-test-debug without hitting a hard context boundary.
The user can also trigger compaction manually via the `/compact` command when the conversation feels cluttered.
The Claude Agent SDK provides compaction as a built-in capability for any application built on the SDK, not just Claude Code.

Context compaction is a practical instance of a broader principle: agentic systems must manage their own working memory because the tasks they handle routinely exceed the capacity of any fixed-size context window.
The alternative — requiring humans to break tasks into context-sized chunks — defeats the purpose of autonomy.
