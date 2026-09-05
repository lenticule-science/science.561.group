---
type: concept
class: system
description: The central server that orchestrates agent turns, skills, heartbeats, and cron jobs in OpenClaw.
status: draft
depends-on: []
---

# Gateway

The **gateway** is the central orchestration server in OpenClaw.
It is responsible for:

- Receiving and scheduling agent turns (prompts sent to the agent runtime).
- Managing skills (discovering, loading, and executing them).
- Running heartbeat polls to check for scheduled tasks (cron jobs).
- Exposing APIs (REST, MCP, etc.) for external interaction.
- Maintaining the workspace and file system access for the agent.

In the OpenClaw theory, the gateway is the substrate on which agentic computations occur.
It is analogous to an operating system kernel for agent orchestration: it provides the primitives (agent turns, skill invocations, heartbeats) and manages their lifecycle.

The gateway does not prescribe a particular mathematical substrate (e.g., predication categories); it is defined purely by its operational responsibilities and interfaces.
