---
title: "OpenClaw Node"
date-created: 2026-03-09T00:00:00
authors:
  - claude
date-updated: 2026-03-09T00:00:00
type: term
aliases:
  - "OpenClaw Node"
  - "openclaw node"
  - "paired node (openclaw)"
keywords:
  - OpenClaw
  - DeviceIntegration
  - AgentInfrastructure
  - SelfHosting
description: "A paired device surface that exposes host-local capabilities to an OpenClaw Gateway."
defines:
  - "OpenClaw Node"
cites:
  - "OpenClaw README"
  - "OpenClaw Security"
---

An OpenClaw node is a paired device surface that exposes host-local
capabilities to an OpenClaw Gateway. Nodes let the assistant act
through device-specific interfaces such as voice, camera, screen
capture, notifications, and host-local command execution.

## Pairing model

OpenClaw documents node pairing as an operator-approved connection to a
Gateway. Once paired, node actions are treated as trusted operator
actions on that device rather than as requests from an untrusted
external sender.

## Scope

The term covers both mobile and desktop surfaces when they operate as
Gateway-connected execution or sensing endpoints. In OpenClaw's
architecture, a node is not another independent assistant. It is a
paired capability surface attached to a Gateway-managed assistant.

## Sources

- [OpenClaw README](https://github.com/openclaw/openclaw/blob/main/README.md)
- [OpenClaw Security](https://docs.openclaw.ai/gateway/security)
