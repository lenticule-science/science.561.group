---
type: question
class: open
status: open
depends-on:
  - teaching/explanations/agentic-system.md
  - teaching/explanations/persistent-state.md
  - teaching/explanations/agentness-spectrum.md
see-also:
  - ../texts/toward-a-falsifiable-definition-of-agentic-systems.md
  - teaching/explanations/environmental-action.md
references:
  - references/bent2025.md
---

# When is the autopoiesis threshold crossed?

## Question

What observable conditions mark an agentic system as having crossed from "produced by external processes" to "operationally self-producing"?
Is self-production a binary threshold or a continuum?
Can the three-condition characterization be extended to detect it?

## Background

The [toward-a-falsifiable-definition](../texts/toward-a-falsifiable-definition-of-agentic-systems.md) text raises the autopoietic question: autopoiesis, in the sense of Maturana and Varela, refers to systems that generate their own components — that are their own cause.
Contemporary agentic systems are not autopoietic: they are produced, deployed, and maintained by external processes (developers, DevOps pipelines, human operators).

However, some agentic systems approach operational closure:

- A system that modifies its own tool schemas (extending its own action space through a meta-tool that installs new tools).
- A system that updates its own instructions or soul files, changing its own goal-direction.
- A system that persists and builds its own memory structures indefinitely, accumulating knowledge without external curation.

No existing agentic system as of early 2026 has crossed all three of these thresholds simultaneously.
Claude Code modifies files in its working directory (including its own configuration files, if granted access) but does not modify its own model weights or training.
Agent self-improvement systems ([agent-self-improvement](../terms/agent-self-improvement.md)) modify their own instructions but operate within externally provided infrastructure.

## Why this matters

If self-production is achievable through incremental extension of the three conditions, then the three-condition characterization misses a qualitative threshold — a system that crosses into self-production has a fundamentally different risk profile, governance requirement, and behavioral predictability.
A falsifiable test for the autopoiesis threshold would extend the three-condition framework with a fourth condition.

## Open subquestions

1. **Is self-production binary or continuous?** A system that modifies one tool schema is slightly more self-producing than one that modifies none.
  Is there a meaningful threshold, or is self-production a dimension on the agentness spectrum?

2. **What is the minimal form?** A system that can install one new tool schema and that tool schema grants it the ability to install further schemas is operationally self-expanding.
  Is this self-production?
  Does it matter whether the initial tool-installation schema was externally provided?

3. **Does self-production require self-knowledge?** An autopoietic system produces its own components while maintaining its organization.
  An agent that modifies its own tools without modeling its own structure is not autopoietic in the strict sense.
  Does the agent need to represent its own architecture to qualify?
