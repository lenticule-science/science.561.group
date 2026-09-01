---
part-of:
  - openclaw

title: "OpenProse"
date-created: 2026-03-09T00:00:00
aliases:
  - "OpenProse"
  - "openprose"
keywords:
  - open-claw
  - workflow-systems
  - multi-agent-systems
  - markdown
description: "A markdown-first workflow format and OpenClaw plugin for explicit, reusable agent programs."
references:
  - id: ref1
    type: document
    title: OpenClaw OpenProse
---

OpenProse is a markdown-first workflow format and OpenClaw plugin for explicit, reusable agent programs.
In OpenClaw it ships as a plugin that installs a skill pack plus a `/prose` slash command.

## Role

Programs live in `.prose` files and can spawn multiple sub-agents with explicit control flow.
The official docs describe research and synthesis, incident triage, code review, and content pipelines as core use cases.

## Scope

OpenProse sits above individual tools and below general agent behavior.
It is the program layer for repeatable multi-step workflows.

## Sources

- [OpenProse](https://docs.openclaw.ai/prose)
