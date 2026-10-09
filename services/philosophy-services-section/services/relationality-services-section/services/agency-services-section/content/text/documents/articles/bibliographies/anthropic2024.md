---
type: reference
class: technical-documentation
status: active
cites:
  - teaching/explanations/agentic-system.md
  - teaching/explanations/coordination-topology.md
  - ../theorems/three-condition-characterization.md
  - ../theorems/single-agent-parity-below-saturation.md
title: Anthropic (2024) — Building Effective Agents
description: "Full citation: Anthropic."
---

# Anthropic (2024) — Building Effective Agents

**Full citation:** Anthropic.
"Building Effective Agents."
December 19, 2024.
Available at: https://www.anthropic.com/research/building-effective-agents

## Summary

Anthropic's guide to building agentic systems with Claude.
The document:

1. **Defines the workflow/agent distinction.** Workflows: LLMs and tools orchestrated through predefined code paths (developer controls execution).
  Agents: systems where LLMs dynamically direct their own processes and tool usage (model controls execution).
  Both are "agentic systems."

2. **Recommends starting simple.** Explicitly states that many use cases are well served by simple pipelines rather than multi-agent coordination.
  The document notes: "The simplest agentic architecture — a single LLM with a good tool set — outperforms multi-agent systems for most tasks."

3. **Identifies five augmentation patterns:** prompt chaining, routing, parallelization, orchestrator-workers, and evaluator-optimizer.
  These correspond to the [coordination-topology](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/hacking/content/system/agentizing/content/agentic-system-b4/anthropic2024/teaching/explanations/coordination-topology.md) concept.

4. **Emphasizes minimal footprint.** Recommends requesting only necessary permissions, preferring reversible over irreversible actions, and confirming with users when uncertain.

## Contribution to the agents theory

The workflow/agent distinction (locus of control: developer vs. model) is adopted in the [agentic-system](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/hacking/content/system/agentizing/content/agentic-system-b4/anthropic2024/teaching/explanations/agentic-system.md) concept as a secondary distinction within agentic systems, not a binary between agentic and non-agentic.

The five augmentation patterns provide the empirical basis for the [coordination-topology](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/hacking/content/system/agentizing/content/agentic-system-b4/anthropic2024/teaching/explanations/coordination-topology.md) concept's four topology classification.
The "simplest agent outperforms for most tasks" finding is corroborated by the MASFT study and is one of the grounds for [single-agent-parity-below-saturation](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/hacking/content/system/agentizing/content/agentic-system-b4/theorems/single-agent-parity-below-saturation.md).

The minimal-footprint recommendation is the operational expression of the minimal-authority design principle developed in the accountability theorems.
