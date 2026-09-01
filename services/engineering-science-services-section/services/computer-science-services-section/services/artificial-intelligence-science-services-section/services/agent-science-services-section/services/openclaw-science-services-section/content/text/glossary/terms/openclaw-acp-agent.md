---
aliases:
  - acp agent (openclaw)
description: An external harness runtime that OpenClaw can run through an ACP backend plugin.
identity: openclaw-acp-agent
name: OpenClaw ACP Agent
provenance:
  date-created: 2026-03-09
  date-modified: 2026-03-09
  sources:
    - OpenClaw ACP Agents
---
An OpenClaw ACP agent is an external harness runtime that OpenClaw can
run through an ACP backend plugin. ACP agents let OpenClaw delegate
work to tools such as Codex, Claude Code, OpenCode, Gemini CLI, or Pi
without reducing them to native OpenClaw sub-agents.

## Role

The official ACP docs distinguish ACP sessions from OpenClaw-native
sub-agent runs. ACP is used when the operator wants an external
runtime, its own session semantics, or harness-specific capabilities.

## Function

ACP agents turn OpenClaw into a coordinator of external agent runtimes.
OpenClaw handles the surrounding channel, session, and thread context
while the ACP target performs the delegated task.

## Sources

- [ACP Agents](https://docs.openclaw.ai/tools/acp-agents)
