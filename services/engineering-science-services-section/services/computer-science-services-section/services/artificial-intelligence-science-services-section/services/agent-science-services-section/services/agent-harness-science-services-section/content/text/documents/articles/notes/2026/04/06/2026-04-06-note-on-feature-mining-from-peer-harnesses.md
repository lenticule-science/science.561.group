---
title: Feature Mining from Peer Harnesses
description: Campaign to systematically extract actionable features and architectural ideas from extensively studied peer agentic harness systems.
date-created: 2026-04-06
type: note
name: feature-mining-from-peer-harnesses
keywords:
  - feature-mining
  - peer-harnesses
  - agentic-systems
  - anti-patterns
  - architectural-concepts
specialization: idea
source: captain-directive
serves: [system-architecture-refactor, operations-loop]
aliases:
  - Chop up ECC, Cline, OpenClaw, and peers for features and ideas
---

We have extensive research sessions that analyzed peer agentic harness systems — ECC (everything-claude-code), Cline, OpenClaw, and others (SWE-Agent, OpenHands, Aider, CrewAI, AutoGen, LangGraph, MemGPT/Letta, Mem0, Voyager, Reflexion). These analyses exist as library texts and session logs but have NOT been systematically mined for:

1. **Features we should adopt** — concrete capabilities (not patterns) that would give us Asana/Todoist/Linear parity or agentic capabilities we lack
2. **Ideas worth exploring** — architectural concepts, UX patterns, integration strategies that could inform our own design
3. **Anti-patterns to avoid** — things they tried that failed or that conflict with our architecture

Each peer system should be its own research PROJECT (not a task) with plans for: reading the analysis texts we already have, extracting features into a structured inventory, prioritizing against our goals, and creating tasks for adoption.

Research texts already in the library:
- `computing/texts/ecc-hook-architecture-analysis.md`
- `computing/texts/agentic-harness-landscape-2026.md`
- `computing/texts/personal-ai-os-landscape-2026.md`
- `computing/texts/multi-agent-orchestration-frameworks-2026.md`
- Session logs from: 0b5f8701, 140715ef, cc3621ac, 3e5c7b0b, 3b0757ee, eddb3b4b, bdf0db6c, etc.

This is NOT "research Cline" as a single task. It's a campaign to extract actionable value from every peer system we've studied.
