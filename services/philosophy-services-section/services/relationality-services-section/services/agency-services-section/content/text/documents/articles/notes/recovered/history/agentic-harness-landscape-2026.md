---
title: "Agentic Harness Landscape, April 2026"
description: "Survey of Claude Code harnesses, agentic frameworks, memory systems, and skill evolution projects as of April 2026 — what exists, what each does differently, and where the field is converging."
text-type: survey
date-created: 2026-04-04
domain: computing
see-also:
  - "./continuous-learning-in-agentic-harnesses.md"
  - "./ecc-skill-system-analysis.md"
sources:
  - title: "Everything Claude Code (ECC)"
    url: "https://github.com/affaan-m/everything-claude-code"
    type: repository
  - title: "Claude Forge"
    url: "https://github.com/sangrokjung/claude-forge"
    type: repository
  - title: "Claude Code Harness (Chachamaru127)"
    url: "https://github.com/Chachamaru127/claude-code-harness"
    type: repository
  - title: "CCharness"
    url: "https://github.com/elct9620/ccharness"
    type: repository
  - title: "Cline"
    url: "https://github.com/cline/cline"
    type: repository
  - title: "LangGraph"
    url: "https://www.langchain.com/langgraph"
    type: tool
  - title: "CrewAI"
    url: "https://github.com/crewAIInc/crewAI"
    type: repository
  - title: "Microsoft Agent Framework"
    url: "https://learn.microsoft.com/en-us/agent-framework/overview/"
    type: documentation
  - title: "OpenSpace — Self-Evolving Skill Engine"
    url: "https://github.com/HKUDS/OpenSpace"
    type: repository
  - title: "Voyager: An Open-Ended Embodied Agent with Large Language Models"
    url: "https://arxiv.org/abs/2305.16291"
    type: paper
    year: 2023
  - title: "Mem0"
    url: "https://github.com/mem0ai/mem0"
    type: repository
  - title: "Zep — Temporal Knowledge Graph Memory"
    url: "https://github.com/getzep/zep"
    type: repository
  - title: "Letta (MemGPT)"
    url: "https://github.com/letta-ai/letta"
    type: repository
  - title: "MemOS"
    url: "https://github.com/MemTensor/MemOS"
    type: repository
  - title: "Awesome Claude Code"
    url: "https://github.com/hesreallyhim/awesome-claude-code"
    type: repository
  - title: "Awesome Claude Skills"
    url: "https://github.com/BehiSecc/awesome-claude-skills"
    type: repository
  - title: "Glean Skills"
    url: "https://www.glean.com/blog/glean-skills-launch-2026"
    type: article
  - title: "A-MEM: Agentic Memory for LLM Agents"
    url: "https://arxiv.org/abs/2502.12110"
    type: paper
    year: 2026
---

This is a survey of what exists in the space of agent harnesses, orchestration frameworks, memory systems, and skill evolution as of April 2026. The field is moving fast. This text captures the state of play across four categories: Claude Code harnesses specifically, general agentic frameworks, memory systems, and skill/learning architectures.

## Claude Code Harnesses

Claude Code's plugin architecture — skills, hooks, agents, commands, rules installed under `.claude/` — has spawned a small ecosystem of third-party harnesses that customize the agent's behavior without touching the model.

### Everything Claude Code (ECC)

[GitHub](https://github.com/affaan-m/everything-claude-code). The largest community harness. 28 specialized agents, 119 skills, 60+ commands, security scanning via AgentShield (red/blue team pipeline with three-stage adversarial testing). Cross-platform: works across Claude Code, Cursor, Codex, and OpenCode from a single repository. ECC Tools uses git history analysis to auto-generate skill files. Open source. See [ECC Skill System Analysis](./ecc-skill-system-analysis.md) for detailed analysis of its skill architecture.

### Claude Forge

[GitHub](https://github.com/sangrokjung/claude-forge). 11 agents, 36 commands, 15 skills, 6-layer security hooks. Inspired by oh-my-zsh's plugin model — modular, composable, installable in five minutes. Security-first design: every tool call passes through layered hook validation. Open source.

### Claude Code Harness (Chachamaru127)

[GitHub](https://github.com/Chachamaru127/claude-code-harness). Focused on a Plan → Work → Review autonomous cycle. Less breadth than ECC, more emphasis on structured project delivery with integrated verification loops. Open source.

### CCharness

[GitHub](https://github.com/elct9620/ccharness). Lightweight TypeScript-based harness. Intercepts Claude Code hook events to provide additional functionality. Minimal footprint — useful as a reference for how hook interception works at a low level. Open source.

### Cline

[GitHub](https://github.com/cline/cline). VS Code extension providing an autonomous coding agent. Uses its own tool-use protocol rather than Claude Code's native plugin system. Strong community following. Positioned as a Cursor competitor rather than a Claude Code plugin.

### OpenClaw

Formerly a popular third-party harness for accessing Claude via messaging apps. As of April 2026, Anthropic restricted Claude subscription access to OpenClaw — users must now pay-as-you-go. Its developer recently joined OpenAI. Open source but declining relevance.

### Official Plugin Ecosystem

Anthropic runs a plugin marketplace with 9,000+ plugins as of March 2026. Supports slash commands, subagents, MCP servers, and hooks. Two installation modes: standalone `.claude/` configuration or full marketplace distribution via `marketplace.json`.

### Community Registries

[Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code) and [Awesome Claude Skills](https://github.com/BehiSecc/awesome-claude-skills) aggregate community-contributed skills across 30+ frameworks. The Awesome Claude Skills collection includes 65+ full-stack development skills covering React, NestJS, Python, and DevOps.

## Agentic Orchestration Frameworks

These are not Claude Code plugins but general-purpose frameworks for building multi-agent systems. They matter because they represent the design patterns the field is converging on.

### LangGraph (LangChain)

[Site](https://www.langchain.com/langgraph). Agent orchestration with stateful workflows, tool-using loops, branching, conversation memory, and human-in-the-loop patterns. Addresses prompt bloat through progressive skill loading: lightweight catalog always available, detailed instructions lazy-loaded only when a skill activates. LangMem adds three memory types — episodic, semantic, and procedural (agents rewriting their own instructions). Open source with commercial offerings.

### CrewAI

[GitHub](https://github.com/crewAIInc/crewAI). Role-playing autonomous agents with collaborative intelligence. Five capability types: tools, MCPs, apps, skills, knowledge. Short-term, long-term, and shared memory across agent teams. Supports automated and human-in-the-loop agent training. Open source.

### Microsoft Agent Framework (AutoGen successor)

[Docs](https://learn.microsoft.com/en-us/agent-framework/overview/). Convergence of AutoGen and Semantic Kernel. RC1.0 released February 2026. Multi-language SDK with session-based state, type safety, middleware, telemetry, and graph-based orchestration. AutoGen itself is in maintenance mode. Open source (MIT).

### AutoGPT

[GitHub](https://github.com/Significant-Gravitas/Auto-GPT). The most recognized autonomous agent project (170K+ stars). 2026 version includes a visual Agent Builder, persistent server, and plugin system. Still relevant as a baseline for what "give it a goal and let it work" looks like at scale. Open source.

### BabyAGI

[GitHub](https://github.com/yoheinakajima/babyagi). Pioneered task-driven autonomous agents — take a goal, decompose into tasks, execute in priority order, generate new tasks from results. Elegant architecture. Vector database memory enables continuous knowledge absorption. Good learning tool. Open source.

## Memory Systems

The problem: LLM agents lose all context at session boundaries. Memory systems persist knowledge across sessions without retraining. The field has converged on three memory types — episodic (what happened), semantic (what is known), procedural (how to do things) — with conversion pathways between them.

### Mem0

[GitHub](https://github.com/mem0ai/mem0) / [Site](https://mem0.ai). Universal memory layer. Three-tier scope: user, session, agent. Hybrid store combining vectors, graph relationships, and key-value lookups. 48K+ stars. Automatically compresses chat history into optimized representations. Best F1 score (28.64) on memory consolidation benchmarks. Standalone REST API works with any agent stack. Open source with managed service.

### Zep

[GitHub](https://github.com/getzep/zep) / [Site](https://www.getzep.com). Temporal knowledge graph. Graphiti engine combines episodic chats, semantic entities, and group-level subgraphs. Builds temporal knowledge graphs connecting past interactions with context changes. Best temporal reasoning: 63.8% on LongMemEval versus Mem0's 49%. Superior for long-running agent sessions where time-ordering matters. Open source with commercial offerings.

### Letta (MemGPT)

[GitHub](https://github.com/letta-ai/letta) / [Site](https://www.letta.com). OS-inspired memory architecture. Three tiers: core memory (always in-context, like RAM), archival memory (external vector store, like disk), recall memory (conversation history, searchable on demand). The key innovation: agents actively manage their own context using memory tools — they decide what to remember, forget, and retrieve. Foundational research. Open source.

### MemOS

[GitHub](https://github.com/MemTensor/MemOS). AI memory operating system. Enables persistent skill memory for cross-task reuse — skills learned in one task propagate to others without re-learning. Operates at the OS level rather than per-agent. Open source.

### LangMem

Part of LangChain. Adds episodic, semantic, and procedural memory to LangGraph agents. Procedural memory means agents rewrite their own instructions based on feedback. The three-type taxonomy is becoming standard across the field. Open source.

### A-MEM

[Paper](https://arxiv.org/abs/2502.12110). January 2026 research on unified long-term and short-term memory management. Bridges episodic and semantic consolidation. Academic, not production software.

## Skill Evolution and Continuous Learning

The frontier question: can agents learn new skills from experience without human intervention?

### Voyager (MineDojo)

[GitHub](https://github.com/MineDojo/Voyager) / [Paper](https://arxiv.org/abs/2305.16291). The foundational work. First LLM-powered lifelong learning agent (in Minecraft). Three components: (1) automatic curriculum maximizing exploration, (2) ever-growing skill library of executable code, (3) iterative prompting with environment feedback and self-verification. Skills are indexed by description embedding for retrieval in similar future situations. Complex skills compose from simpler programs. Results: 3.3x more unique items, 15.3x faster tech tree progression versus prior state of the art. 2023 paper but still the reference architecture for skill evolution. Open source.

### OpenSpace (HKUDS)

[GitHub](https://github.com/HKUDS/OpenSpace). Self-evolving skill engine. Skills auto-repair when tools break, auto-improve when better patterns emerge, and auto-propagate via cloud community. Demonstrates 4.2x income improvement and 46% token reduction across 50 real-world professional tasks. The closest thing to production-grade autonomous skill evolution. Open source.

### Glean Skills

[Blog](https://www.glean.com/blog/glean-skills-launch-2026). Enterprise skill standardization. Employees create and reuse personal and company skills. Skills integrate into Glean's knowledge graph and agentic engine. Proprietary but implements an open standard for skill packaging.

### Agent Skills Ecosystem

[agentskills.io](https://agentskills.io/) / [Awesome Agent Skills](https://github.com/skillmatic-ai/awesome-agent-skills). Modular SKILL.md packages — 44K+ skills across directories. Skills load on demand without stuffing the system prompt. Community-maintained. Open source.

### Self-Improving Loop Pattern

Emerging pattern across multiple projects: agent modifies its own code or configuration, runs tests, evaluates results, commits only if improvement is measured. Inspired by Andrej Karpathy's "Recursive Science" framing. Not a single project but a converging architectural pattern — seen in OpenSpace, ECC's skill generation, and several independent implementations.

## Convergences

Several patterns are converging across independently developed systems:

**The harness matters as much as the model.** The same Claude model performs completely differently in different harnesses due to tool availability, context management, error recovery, and permission design. This is now well-established.

**Progressive knowledge disclosure.** Multiple frameworks (LangGraph, CrewAI, Glean) converging on three-layer knowledge: lightweight catalog always available, detailed instructions lazy-loaded when a skill activates, domain context pulled by agent choice. This addresses token cost at scale.

**Three memory types with consolidation pathways.** Episodic → semantic (facts extracted from events), episodic → procedural (patterns become skills). Mem0, Zep, Letta, and LangMem all implement variants. The taxonomy is stabilizing.

**Graph memory in production.** Graph memory was experimental in 2024; it is production infrastructure in 2026 (Zep, Mem0, Glean). Vector memory finds semantically similar facts; graph memory traces relationships (temporal, causal, structural). Both are needed.

**Skills as executable code, not just prompts.** Voyager established this; OpenSpace and ECC continue it. Executable skills are composable, testable, versionable, and portable between agents. Prompt-only skills lack all four properties.

**Self-improvement requires test infrastructure.** Every self-evolving system (OpenSpace, Voyager, the recursive-science pattern) requires clear success metrics, iterative feedback, consolidation into reusable skills, and verification before committing changes. Autonomous learning without validation produces drift.

## What This Means for Custom Harnesses

A custom Claude Code harness (like the 561 system) occupies a specific niche: it is a Claude Code plugin with learning capabilities, running against a knowledge repository rather than a pure codebase. The landscape suggests several things:

1. **The plugin architecture is sufficient.** Claude Code's native hooks/skills/agents/commands system is the same architecture ECC, Claude Forge, and others build on. No need to build a custom runtime.

2. **Memory is a solved-enough problem.** Mem0, Zep, and Letta provide production-grade memory if file-based memory proves insufficient. The three-tier model (episodic/semantic/procedural) is the right taxonomy.

3. **Skill evolution is the frontier.** OpenSpace is the closest to production autonomous skill evolution. Voyager's architecture — skill library + self-verification + compositional stacking — remains the reference design.

4. **Progressive disclosure matters at scale.** Loading all skills into every session does not scale. LangGraph's three-layer approach (catalog → instructions → context) is worth studying.

5. **The field is not crowded in the learning niche.** Many harnesses exist; few implement continuous learning. The combination of observation → pattern detection → instinct creation → skill evolution is unusual.

## Related

- [Continuous Learning in Agentic Harnesses](./continuous-learning-in-agentic-harnesses.md) — deep dive on the learning mechanisms specifically
- [ECC Skill System Analysis](./ecc-skill-system-analysis.md) — detailed analysis of the largest community harness
