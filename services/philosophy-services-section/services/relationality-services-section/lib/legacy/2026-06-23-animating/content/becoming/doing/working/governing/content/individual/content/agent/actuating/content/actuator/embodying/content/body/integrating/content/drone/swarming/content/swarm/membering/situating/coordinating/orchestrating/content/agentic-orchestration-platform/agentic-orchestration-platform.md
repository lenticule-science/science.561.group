---
title: "Agentic Orchestration Platforms"
component-of: agents
type: theory
class: engineering-theory
status: active
derives-methods-from-theory: [agents]
---


The theory of platforms that coordinate agents — human and AI — through structured dispatch, heartbeat scheduling, skill invocation, and governance.
An agentic orchestration platform is the infrastructure layer that turns individual agents into a governed collective: it decides who acts, on what, when, and under what authorization.

This theory is a subtheory of [agents](../_index.md): it presupposes the three-condition characterization of an agent (environmental action, goal-directed planning, persistent state) and asks what the surrounding platform must provide for agents to act reliably, accountably, and at scale.

## What this theory studies

An agentic orchestration platform commits to at least:

- **Dispatch** — selecting which agent (or skill) handles a given work item, based on authorization, capability, and context.
- **Scheduling** — determining when agents act: event-driven, heartbeat-driven, or request-driven.
- **Skill/runbook model** — the form in which agent capabilities are declared, composed, and invoked.
- **Session and memory** — how agent state is bounded, persisted, and made available across invocations.
- **Governance** — the accountability structure: who can authorize what, and how that is enforced.

What the theory leaves open — and what sub-theories settle — is the *substrate*: what the platform's internal representation of agents, skills, and work items actually is, and what operations that substrate supports.

## Sub-theories

Sub-theories specialize by substrate and architectural commitment:

- **[predicated-agentic-orchestration-platform/](theories/predicated-agentic-orchestration-platform/_index.md)** — the platform realized on a predicated-computing substrate: agents, skills, runbooks, offices, and governance rules are all substrate entities; dispatch and scheduling operate through closure-driven settling.
  Derives from both this theory and [predicated-computing](../../../../predicated-computing/_index.md).
- **[openclaw/](theories/openclaw/_index.md)** — OpenClaw as a concrete agentic orchestration platform: its gateway, skills, agent turns, heartbeat/cron mechanism, and operational concepts, studied without presupposing a specific mathematical substrate.
