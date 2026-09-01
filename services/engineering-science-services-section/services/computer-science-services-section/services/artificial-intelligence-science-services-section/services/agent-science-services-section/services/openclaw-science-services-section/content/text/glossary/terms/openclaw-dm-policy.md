---
aliases:
  - dm policy (openclaw)
description: The configuration that determines how OpenClaw handles inbound direct messages before they reach an agent.
identity: openclaw-dm-policy
name: OpenClaw DM Policy
provenance:
  date-created: 2026-03-09
  date-modified: 2026-03-09
  sources:
    - OpenClaw README
    - OpenClaw Security
---
The OpenClaw DM policy is the configuration that determines how
OpenClaw handles inbound direct messages before they reach an agent.
It is a channel-level gate on message processing, not only a cosmetic
notification preference.

## Modes

OpenClaw documents four DM policy modes:

- `pairing`: unknown senders receive a short code and their message is
  ignored until approval
- `allowlist`: only approved senders can reach the bot
- `open`: any sender can reach the bot if the channel allowlist
  explicitly opts in
- `disabled`: inbound DMs are ignored

## Function

This policy is one of OpenClaw's primary safety controls for consumer
messaging surfaces. It constrains who can steer a tool-using assistant
before prompts, tool calls, or session routing become relevant.

## Sources

- [OpenClaw README](https://github.com/openclaw/openclaw/blob/main/README.md)
- [OpenClaw Security](https://docs.openclaw.ai/gateway/security)
