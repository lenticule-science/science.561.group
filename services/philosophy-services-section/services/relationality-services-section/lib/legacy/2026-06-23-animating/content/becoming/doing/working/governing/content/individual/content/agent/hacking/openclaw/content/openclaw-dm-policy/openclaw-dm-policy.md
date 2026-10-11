---
part-of:
  - openclaw

title: "OpenClaw DM Policy"
date-created: 2026-03-09T00:00:00
aliases:
  - "OpenClaw DM Policy"
  - "openclaw dm policy"
  - "dm policy (openclaw)"
keywords:
  - open-claw
  - messaging-platforms
  - access-control
  - security-model
description: "The configuration that determines how OpenClaw handles inbound direct messages before they reach an agent."
references:
  - id: ref1
    type: document
    title: OpenClaw README
  - id: ref2
    type: document
    title: OpenClaw Security
---

The OpenClaw DM policy is the configuration that determines how OpenClaw handles inbound direct messages before they reach an agent.
It is a channel-level gate on message processing, not only a cosmetic notification preference.

## Modes

OpenClaw documents four DM policy modes:

- `pairing`: unknown senders receive a short code and their message is ignored until approval
- `allowlist`: only approved senders can reach the bot
- `open`: any sender can reach the bot if the channel allowlist explicitly opts in
- `disabled`: inbound DMs are ignored

## Function

This policy is one of OpenClaw's primary safety controls for consumer messaging surfaces.
It constrains who can steer a tool-using assistant before prompts, tool calls, or session routing become relevant.

## Sources

- [OpenClaw README](https://github.com/openclaw/openclaw/blob/main/README.md)
- [OpenClaw Security](https://docs.openclaw.ai/gateway/security)
