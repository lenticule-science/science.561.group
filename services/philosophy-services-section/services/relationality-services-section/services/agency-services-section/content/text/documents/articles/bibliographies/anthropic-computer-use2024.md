---
type: reference
class: foundational
status: active
authors: ["Anthropic"]
year: 2024
venue: "Anthropic blog and API documentation (October 2024)"
title: "Introducing computer use, a new Claude 3.5 Sonnet, and Claude 3.5 Haiku"
description: Anthropic.
---

# Anthropic 2024 — Computer Use

Anthropic.
(2024, October).
Introducing computer use, a new Claude 3.5 Sonnet, and Claude 3.5 Haiku.
Anthropic blog and API documentation.

The Anthropic release introducing *Computer Use* — direct keyboard/mouse/screen control as a tool for Claude.
The capability extended LLM agent action capacity from API-mediated tools to *human-style interaction with arbitrary software*.

Key elements:

- **Vision-capable model** perceives screen state.
- **Action API** for clicks, key presses, text input.
- **Iterative loop** with screenshot updates.
- **Sandboxed deployment** recommended.

Significance:

- **First production-deployed computer-use capability** from a major LLM vendor.
- **Qualitative action-space expansion.** Software without modern APIs becomes accessible.
- **Substantial new safety surface.** Computer use enables vastly more potential actions, and risks.
- **Architectural template.** Subsequent vendor computer-use offerings (OpenAI Operator, Google Project Mariner) follow the same general pattern.

The release was an inflection point in agentic AI: it extended the action paradigm from "tools through APIs" to "tools through UIs," vastly expanding the class of software addressable by AI agents.

Reliability is partial; computer-use error rates are substantially higher than API tool-use error rates.
But the capability is real and growing.

Safety mechanisms emerging in response:

- Sandboxed deployment recommendations.
- Human-in-loop for high-stakes actions.
- Capability-evaluation methodology.
- Action-injection threat modeling.

Cited by: [computer-use](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/content/tool/content/tool-use/computer-use/anthropic-computer-use2024/teaching/explanations/computer-use.md), [from-react-to-tool-use](../notes/undated/from-react-to-tool-use.md), [tool-use-and-safety](../notes/undated/tool-use-and-safety.md).
