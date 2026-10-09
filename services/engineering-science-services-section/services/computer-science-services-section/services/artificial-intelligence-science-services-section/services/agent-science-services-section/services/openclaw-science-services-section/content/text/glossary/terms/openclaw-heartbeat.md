---
aliases:
  - heartbeat.md (openclaw)
description: An optional workspace file that defines OpenClaw's low-frequency proactive behavior.
identity: openclaw-heartbeat
name: OpenClaw HEARTBEAT.md
date-created: 2026-03-09
date-modified: 2026-03-09
provenance:
  sources:
    - OpenClaw Heartbeat
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
