---
type: concept
class: operator
description: A single invocation of the agent runtime with a prompt, executed within the gateway.
status: draft
depends-on: []
---

# Agent Turn

An **agent turn** is one execution cycle of the agent runtime: the gateway receives a prompt (from a user, a cron job, or another agent), runs the agent model on that prompt (with access to enabled skills and tools), and returns the resulting output.

In the OpenClaw theory: - Agent turns are the basic unit of computational work performed by the platform. - They are scheduled and executed by the gateway. - Each turn operates in a session context (main, isolated, current, or named session) and may spawn subagent turns. - Agent turns are deterministic given the same prompt, session state, skill set, and tool configuration (modulo model stochasticity).

The concept abstracts away from the particular model or tool usage and focuses on the turn as an operable step in agent orchestration.
