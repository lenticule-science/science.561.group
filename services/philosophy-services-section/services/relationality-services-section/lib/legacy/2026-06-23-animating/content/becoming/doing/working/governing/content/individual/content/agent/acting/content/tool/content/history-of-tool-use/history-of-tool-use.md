---

title: "History of Tool Use in Language Models"
description: "How language models gained the ability to call external functions, from Toolformer through MCP."
traces: tool-use
milestones: toolformer, chatgpt-plugins, openai-function-calling, gemini-function-calling, anthropic-tool-use, computer-use, model-context-protocol
date-created: 2026-03-29
---

Schick et al. published "Toolformer: Language Models Can Teach Themselves to Use Tools" (Meta AI, February 2023, arXiv 2302.04761).
They showed that a language model could learn, through self-supervised training, to decide when a function call would help and what arguments to pass.
The model inserted API calls into its own training data, kept the ones that improved prediction, and fine-tuned on the result.
This demonstrated that tool use could be learned rather than hand-coded.

OpenAI's ChatGPT Plugins (March 2023) were the first commercial deployment.
Plugins let ChatGPT call external services — search engines, calculators, booking systems — but only inside the ChatGPT interface.
Developers could not access the mechanism through an API.

OpenAI's function calling API (June 13, 2023) changed this.
The `gpt-4-0613` and `gpt-3.5-turbo-0613` models accepted function schemas as part of the API request and returned structured JSON specifying function name and arguments.
This established the contract pattern — developer provides JSON Schema, model returns conforming JSON — that every subsequent provider adopted.
OpenAI extended to parallel function calls in November 2023, migrating from a `functions` parameter to a `tools` parameter so a model could request multiple calls in a single turn.

Google launched Gemini 1.0 with function calling in December 2023, following the same JSON Schema contract pattern.

Anthropic's tool use reached general availability across Claude, Amazon Bedrock, and Google Vertex AI on May 30, 2024.
The implementation followed the established contract pattern but added explicit support for chain-of-thought reasoning before tool calls, making the model's decision process visible.

Anthropic extended the concept twice in late 2024.
Computer use (October 2024) let Claude interact with desktop GUIs by interpreting screenshots and producing mouse and keyboard actions — tool use applied to a visual environment rather than an API.
The Model Context Protocol (November 2024) standardized how models connect to external tools through a common protocol, decoupling tool definitions from any single provider's API format.

By early 2026, tool use is a commodity feature.
Every major model provider supports it.
The differentiators have moved from whether a model can call functions to how reliably it selects the right function, how well it handles errors, and how efficiently it uses tool calls within a token budget.
