---
type: reference
class: engineering-system
status: cited
authors: [Anthropic]
year: 2024
title: "Building Effective Agents and Computer Use Documentation"
venue: "Anthropic Engineering Blog and Claude API Documentation"
description: Anthropic.
---

## Source

Anthropic. *Building Effective Agents* (engineering blog post, December 2024) and *Computer Use* / *Tool Use* / *Agent SDK* documentation. <https://www.anthropic.com/engineering/building-effective-agents>, <https://docs.anthropic.com/en/docs/agents-and-tools/>.

## Form

Vendor engineering documentation.
Anthropic's public guidance on agent architectures, treated here as an engineering-system reference complementary to [openai-agents-docs](../openai-agents-docs/openai-agents-docs.md).

## Content summary

The *Building Effective Agents* post distinguishes *workflows* (LLM-orchestrated systems where the control flow is predetermined by the developer) from *agents* (systems where the LLM dynamically directs its own processes and tool use).
Anthropic argues that simple, composable workflow patterns (prompt chaining, routing, parallelization, orchestrator-workers, evaluator-optimizer) suffice for most LLM-mediated applications, and that fully agentic loops are appropriate only when open-ended reasoning over a large action space is genuinely needed.
The post catalogs each pattern with concrete prompts, error modes, and engineering trade-offs.
The companion *Tool Use* and *Computer Use* documentation specifies Anthropic's tool-use surface: tools as JSON-schema-typed function declarations; the model emits tool-use blocks in its response; the application executes and returns tool-result blocks; iteration continues until the model produces a non-tool-use response.
The *Computer Use* tool specifically gives the model access to mouse, keyboard, and screenshot operations on a host system — extending tool use to GUI-mediated action.
