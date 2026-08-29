---
title: "OpenClaw HEARTBEAT.md"
date-created: 2026-03-09T00:00:00
authors:
  - claude
date-updated: 2026-03-09T00:00:00
type: term
aliases:
  - "OpenClaw HEARTBEAT.md"
  - "openclaw heartbeat.md"
  - "heartbeat.md (openclaw)"
keywords:
  - OpenClaw
  - Automation
  - Proactivity
  - AssistantConfiguration
description: "An optional workspace file that defines OpenClaw's low-frequency proactive behavior."
defines:
  - "OpenClaw HEARTBEAT.md"
cites:
  - "OpenClaw Heartbeat"
  - "Learn OpenClaw: Automation"
---

OpenClaw HEARTBEAT.md is an optional workspace file that defines what
the assistant should check or notice when it is idle. It is the main
configuration surface for low-frequency proactive behavior.

## Role

The official heartbeat documentation describes `HEARTBEAT.md` as a
small checklist that the default prompt reads on a regular heartbeat.
Independent guides distinguish it from cron: cron handles scheduled
tasks at exact times, while `HEARTBEAT.md` handles opportunistic
awareness and gentle proactive suggestions.

## Constraints

The file should stay short. The official docs recommend keeping it
small and safe to include repeatedly in prompt context. Secrets and
large reference documents do not belong here.

## Sources

- [Heartbeat](https://docs.openclaw.ai/gateway/heartbeat)
- [Automation - Cron Jobs, Webhooks & Heartbeat](https://learnopenclaw.com/core-concepts/automation)
