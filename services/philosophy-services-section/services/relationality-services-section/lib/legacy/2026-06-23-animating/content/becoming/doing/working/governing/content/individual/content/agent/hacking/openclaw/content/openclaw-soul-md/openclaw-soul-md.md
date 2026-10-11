---
part-of:
  - openclaw

title: "OpenClaw SOUL.md"
date-created: 2026-03-09T00:00:00
aliases:
  - "OpenClaw SOUL.md"
  - "openclaw soul.md"
  - "soul.md (openclaw)"
keywords:
  - open-claw
  - assistant-configuration
  - identity-design
  - agent-infrastructure
description: "A workspace file in OpenClaw that defines assistant identity, style, and behavioral boundaries."
references:
  - id: ref1
    type: document
    title: OpenClaw Agent Bootstrapping
  - id: ref2
    type: document
    title: Learn OpenClaw: Your First 24 Hours with OpenClaw
---

OpenClaw SOUL.md is a workspace file that defines the assistant's identity, style, values, and behavioral boundaries.
In practice it is the main place where an operator specifies how the assistant should speak, what it should prioritize, and where it should stop.

## Role

The official bootstrapping flow writes `SOUL.md` during first-run setup after collecting identity and preference information.
Independent setup guides treat it as the highest-leverage file to write early because it shapes every later interaction.

## Scope

`SOUL.md` is not a knowledge base.
It is a behavioral and stylistic configuration surface.
Durable facts belong in [OpenClaw memory](./openclaw-memory.md), while long-term task or research behavior can be reinforced through skills and [OpenClaw HEARTBEAT.md](./openclaw-heartbeat.md).

## Sources

- [Agent Bootstrapping](https://docs.openclaw.ai/start/bootstrapping)
- [Your First 24 Hours with OpenClaw](https://learnopenclaw.com/getting-started/first-24-hours)
