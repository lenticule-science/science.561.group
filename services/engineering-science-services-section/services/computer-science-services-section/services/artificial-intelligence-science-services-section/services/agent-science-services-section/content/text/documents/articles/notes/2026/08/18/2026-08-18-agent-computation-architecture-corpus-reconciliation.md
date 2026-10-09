---
title: "Agent-computation architecture corpus reconciliation"
date-created: 2026-08-18
type: note
status: canonical-summary
sources:
  - "2026-06-20-relational-predication-corpus/windows-archive-2026-08-17-unique/_archive/bucket-4/.../computing/prose"
  - "2026-06-20-relational-predication-corpus/windows-archive-2026-08-17-unique/_archive/bucket-4/.../computing/texts"
description: The recovered surveys compare agent harnesses, orchestration frameworks, memory systems, MCP/SDK boundaries, and tool-using models.
---


The recovered surveys compare agent harnesses, orchestration frameworks,
memory systems, MCP/SDK boundaries, and tool-using models. They are comparative
research, not specifications of the 561 system. The active agent-science
glossary and notes remain the canonical homes for the individual terms.

## Shared architectural findings

1. **A tool-using agent is an action/observation loop.** A typed action, an
   observation of what actually happened, and a durable trajectory are more
   informative than a prompt transcript alone.
2. **Context is an engineered resource.** Letta-style tiered memory, Mem0-style
   graph extraction, and Cline-style compaction all separate durable state from
   the current working window. Conflict resolution needs explicit add/update/
   delete/none semantics rather than silent overwrites.
3. **Skills and commands are a capability boundary.** ECC, Aider, SWE-agent,
   Cline, OpenHands, and Voyager differ in interfaces, but all make the action
   vocabulary, state transitions, and verification surface explicit. A skill
   description is not a proof that the capability is safe or correct.
4. **Orchestration needs termination and attribution.** CrewAI, AutoGen,
   LangGraph, and OpenClaw provide useful patterns for delegation, memory, and
   heartbeats; production use still requires bounded retries, provenance,
   conflict handling, and a clear human-controlled stop condition.
5. **Not every duty needs an LLM.** Classification, graph queries, routing,
   deterministic validation, and many office-task decisions can be implemented
   as ordinary programs. The non-LLM-computation survey is therefore an
   architectural constraint, not a competing agent framework.

The source contains product-specific details and time-sensitive model claims.
Those remain in the dated legacy corpus; this note records only the stable
cross-system conclusions and points future work toward the existing glossary.
