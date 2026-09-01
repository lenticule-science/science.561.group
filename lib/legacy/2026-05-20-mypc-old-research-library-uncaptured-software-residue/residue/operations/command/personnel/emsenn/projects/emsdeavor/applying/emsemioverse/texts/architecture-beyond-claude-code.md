---
title: "Architecture beyond Claude Code"
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
type: text
keywords:
  - Emsemioverse
  - ProgressiveAutomation
  - AgentialSemioverse
description: "The emsemioverse needs a heterogeneous agent architecture — not just Claude Code sessions, but local models, fine-tuned specialists, and the relational computer spec brought to life."
---

The current emsemioverse agent architecture is Claude Code sessions.
This is a single-model, single-vendor, session-scoped system. The
formal theory (multi-agent coordination, regions, fan-out, pipeline)
is more ambitious than the implementation: it describes
heterogeneous agents coordinating over shared state, but the actual
coordination happens through Claude Code's subagent model.

## What's missing

### Heterogeneous models

The system should be able to call agents that aren't Claude. Specific
motivations:

1. **OpenAI Codex API access** going unused — a resource that could
   handle tasks that don't require Claude's reasoning depth.
2. **Local 7B models** running on emsenn's laptop via Ollama — for
   tasks that are mechanical, high-volume, or privacy-sensitive. The
   [agent orchestration survey](../../technology/disciplines/artificial-intelligence/topics/agents/texts/agent-orchestration-ecosystem-2026.md)
   notes that 7-8B models hallucinate tool calls, but 24B models can
   run production-grade. Fine-tuned small models on domain-specific
   tasks (frontmatter validation, tag normalization, style checking)
   might work at 7B.
3. **Training/fine-tuning** is an open question. emsenn has no
   experience with model training. This is a research gap that needs
   a text, a curriculum, and eventually a skill.

### The relational computer connection

The [relational computer specification](../../technology/specifications/relational-computer/architecture.md)
describes a full computational architecture derived from the
relational derivation: cells as finite Heyting algebras, traces as
the temporal scaffold, profiles as emergent semantic spaces, an
observation pipeline for processing external information. The
[quasicrystalline hypertensor topos](../../mathematics/objects/topoi/quasicrystalline-hypertensor-topos/index.md)
is the mathematical structure underlying this architecture.

The triage directory contains extensive supporting material:

- **Information engine pipeline** — a five-stage canonical pipeline
  (intake/coding, measurement/normalization, towers and flow,
  sheaf/hypertensor state, domain views)
- **Parametric runtime** — the external I/O surface with abstraction
  theorem guarantees
- **30+ simulation specifications** for individual subsystems
- **70+ theorem files** providing mathematical justification
- **25+ architecture modules** (storage, networking, orchestration,
  monitoring, identity, deployment, etc.)

This material is not functional — it is speculative, may overstate
itself, and uses terminology that has since evolved. But it
represents a vision for what the emsemioverse's computational
substrate COULD be, and it contains ideas that the current
MCP-server-plus-Claude-Code architecture does not capture.

### OpenClaw as reference architecture

[OpenClaw](https://github.com/openclaw/openclaw) — the open-source
personal AI agent platform — implements a pattern close to what the
tech stack plan describes: local gateway + agentic loop + skills in
markdown + persistent memory + MCP integration + multi-model support
(Claude, GPT-4o, local via Ollama). 199K GitHub stars, 13,700+
community skills. It is the consumer-grade version of the pattern.

The emsemioverse needs more than OpenClaw provides (the
library/engine boundary, typed skill schemas, region-restricted
execution, the formal guarantees), but OpenClaw demonstrates that
the basic architecture is viable and that the ecosystem supports it.

## What to do about it

The immediate path is plan 0015 (MCP tooling): test the MCP server,
wire skills to tools, build toward the engine described in the tech
stack plan. But the broader architectural thinking should not be
limited to "better MCP tools." The triage material, the relational
computer spec, and the hypertensor topos spec contain ideas that
could shape the engine's design — not as immediate implementation
targets, but as sources of architectural constraints and patterns.

The question is not "how do we build a better Claude Code wrapper"
but "what is the computational architecture that the relational
derivation implies, and how do we incrementally build toward it
using the tools available today?"

## Source

emsenn raised these points on 2026-03-07: OpenClaw as a reference,
wanting to call non-Claude agents, recognizing the scattered triage
material (CCE, hypertensor topos machine spec) as a source of ideas
even though it's not functional, and wanting to think more
creatively and systems-architecturally about continued development.
