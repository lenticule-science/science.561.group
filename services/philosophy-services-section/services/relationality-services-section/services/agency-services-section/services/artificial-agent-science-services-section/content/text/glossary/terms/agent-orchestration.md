---
title: "Agent Orchestration"
description: "The pattern by which a controlling process, protocol, or set of role assignments directs how multiple LLM-based agents take turns, exchange messages, invoke tools, and hand off subtasks within a shared run — the coordination layer that frameworks such as AutoGen, MetaGPT, and ChatDev each implement differently, and whose breakdowns (ambiguous role specification, agents talking past each other, unchecked termination) make up the bulk of the empirically-derived MAST failure taxonomy."
date-created: 2026-08-22
aliases:
  - "agent orchestration"
  - "multi-agent orchestration"
  - "orchestration framework"
defines:
  - "Agent Orchestration"
  - "multi-agent orchestration"
instance-of: coordination-protocol
---

Agent orchestration is the coordination layer of a multi-agent system: the controlling logic — whether a fixed conversation protocol, a graph of role hand-offs, or a dynamically-generated plan — that decides which agent acts next, what each agent is allowed to see, how messages and tool results are routed between agents, and when the overall run terminates. It is the part of a multi-agent system that is not any individual agent's own reasoning, but the scaffolding around all of them.

Contemporary LLM multi-agent frameworks each instantiate orchestration differently. AutoGen (Wu et al., COLM 2024; first posted to arXiv in 2023, Microsoft Research) frames orchestration as a general-purpose multi-agent conversation, with configurable agents that converse and automatically reply to each other, optionally invoking tools or looping in a human. MetaGPT (Hong et al., ICLR 2024) instead encodes fixed standardized operating procedures borrowed from human software teams — a product manager, an architect, engineers, and QA testers each with a scripted hand-off to the next role. ChatDev (Qian et al., ACL 2024) organizes orchestration as a chat chain through a simulated software company's waterfall phases, with a specific finding that natural language suits design-phase hand-offs while programming-language communication suits debugging hand-offs.

Orchestration design is exactly where the empirically-derived MAST failure taxonomy (Cemri et al., "Why Do Multi-Agent LLM Systems Fail?", NeurIPS 2025) locates most of its 14 named failure modes: **system design issues** (the orchestration gave an agent an ambiguous or incomplete role), **inter-agent misalignment** (the orchestration let two agents talk past each other or lose needed shared context), and **task verification** (the orchestration allowed the run to terminate before its output was actually checked). Because these are failures *of the orchestration layer itself*, not of any one agent's underlying model quality, they recur across frameworks that differ substantially in how they orchestrate — which is part of why the taxonomy's authors built it from traces spanning seven different frameworks rather than one.

See the fuller literature survey in [the study note on multi-agent systems science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-multi-agent-systems-science.md).
