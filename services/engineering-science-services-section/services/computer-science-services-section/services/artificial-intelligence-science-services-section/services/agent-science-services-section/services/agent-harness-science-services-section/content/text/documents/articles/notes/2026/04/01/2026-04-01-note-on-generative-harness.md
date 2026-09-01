---
title: Generative Harness as Agent-Session Interfacer
description: "Describes the generative harness as the agent-system interfacer with three core functions: compose context, situate experience, translate actions."
date-created: 2026-04-01
type: note
name: generative-harness
keywords:
  - agent-session-interfacer
  - context-composition
  - agent-locale
  - message-translation
  - system-boundary
  - fars-fibers
specialization: project
goal:
  - endeavor-resource-planning
  - operations-loop
serves: [endeavor-resource-planning, operations-loop]
campaign: build-the-coordination-substrate
serves-system: foah
requires: [fars-substrate, respond, knowledge-graph, mcp, offices]
produces: [agent-contexts, dispatched-work, learning-artifacts, progressive-automation]
depends-on: [flatfile-system, convergent-enrichment-plan, frontmatter-foundations]
design-ideas:
  - fars-faoh-mash-architecture-from-first-principles
  - predication-chain-charter-to-dispatch
  - feature-mining-from-peer-harnesses
---

The generative harness IS the agent-session interfacer — the boundary between the agent's computing environment (its "ship") and the system (the "station"). See bussard-interface-architecture analysis for the full model.

Three jobs:

1. **Compose** — deterministically produce the agent's context from FARS entity fibers via respond(). This is the interfacer's extract direction: fiber state → format the agent consumes. Context composition IS Γ(H*) — global sections of the settled subsheaf, projected through the agent-session interfacer.

2. **Situate** — make the agent experience the system as a navigable world. Per the Bussard model: each agent session is a "ship" — an environment with its own filesystem (personnel directory), modes (office capabilities), and REPL (message()). The system is the "station" accessed through the boundary's authorization.

3. **Translate** — convert agent actions back into FARS messages. This is the interfacer's apply direction: tool calls and file edits become messages that enter the wavefront and settle. Hooks are thin adapters at this boundary — each translates one Claude Code lifecycle event into message() and interprets the settlement result as an exit code (decision 006: hooks-are-interfacers, zero exceptions).

The harness is NOT a framework surrounding the agent. It IS the interfacer entity connecting the agent's locale to the system's locale. The interfacer's fiber carries the office's deontic profile as predicates, not hardcoded rules.
