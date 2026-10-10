---
name: "OpenClaw Gateway"
date-created: 2026-03-09T00:00:00
authors:
  - claude
date-updated: 2026-03-09T00:00:00
aliases:
  - "OpenClaw Gateway"
  - "openclaw gateway"
  - "gateway (openclaw)"
keywords:
  - OpenClaw
  - ControlPlane
  - AgentInfrastructure
  - SelfHosting
description: "The long-running control-plane process in an OpenClaw deployment."
cites:
  - "OpenClaw README"
  - "OpenClaw Security"
---

The OpenClaw Gateway is the long-running control-plane process in an OpenClaw deployment.
It coordinates sessions, channels, tools, configuration, routing, and web interfaces while the assistant remains the user-facing product surface.

## Role

The Gateway gives OpenClaw a persistent runtime.
It keeps the assistant reachable through chat channels, the Control UI, WebChat, and paired device surfaces without reducing the system to a single interactive terminal session.

## Trust boundary

OpenClaw's security model treats the Gateway as a trusted operator boundary, not as a hostile multi-tenant service.
Within one Gateway instance, authenticated control-plane access carries authority over the configured agents, sessions, and policies in that deployment.

## Sources

- [OpenClaw README](https://github.com/openclaw/openclaw/blob/main/README.md)
- [OpenClaw Security](https://docs.openclaw.ai/gateway/security)
