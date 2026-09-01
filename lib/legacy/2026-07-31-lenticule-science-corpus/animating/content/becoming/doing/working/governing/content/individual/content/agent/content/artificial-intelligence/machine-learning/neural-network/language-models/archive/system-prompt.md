---

title: "System Prompt"
description: "A set of instructions provided to a language model at the beginning of an interaction that shapes its behavior, role, and constraints — invisible to the end user but determinative of the model's output character."
domain: artificial-intelligence
aliases:
  - System Prompt
  - system prompt
  - system message
governs: agentic-system
component-of: context-window
instance-of: context-engineering
requires: fine-tuning
delivered-via: large-language-model
acts-on: large-language-model
date-created: 2026-03-29
---

A system prompt is a block of text provided to a [large language model](../../on-device-inference/terms/large-language-model.md) at the start of an interaction that establishes the model's role, behavioral constraints, available tools, output format, and any other instructions the deployer wants the model to follow. It is distinct from the user's message: the user provides the task; the system prompt provides the context in which the task is interpreted.

In API terms, the system prompt occupies a dedicated `system` role in the message array (or equivalent, depending on the provider). The model treats system prompt content as high-priority instructions that frame all subsequent interaction. The system prompt is typically invisible to the end user but is visible to the model — it appears at the beginning of the [context window](./context-window.md) and consumes [tokens](./token.md) from the same budget as the conversation.

System prompts serve several functions:

1. **Role specification.** "You are a financial analyst" or "You are a coding assistant that writes Python." This constrains the model's register, vocabulary, and domain focus.

2. **Behavioral constraints.** "Do not generate content about X," "Always cite sources," "Respond in JSON format." These are soft constraints — the model follows them with high reliability but not deterministically, because they operate through learned instruction-following rather than hard-coded rules.

3. **Tool definitions.** In [agentic systems](theories/agents/terms/agentic-system.md), the system prompt includes descriptions of available tools ([tool use](theories/agents/terms/tool-use.md) schemas), allowing the model to decide when and how to invoke them.

4. **Context injection.** Agent instruction files like [AGENTS.md](theories/agents/terms/agents-md.md), [SOUL.md](theories/agents/terms/soul-md.md), and `CLAUDE.md` work by injecting their content into the system prompt (or equivalent high-priority position), making project-specific instructions and agent identity available to the model throughout the interaction.

System prompt effectiveness depends on the model's instruction-following capability, a product of [fine-tuning](./fine-tuning.md) and [RLHF](./rlhf.md). Base models (trained only on next-token prediction) follow system prompts unreliably. Instruction-tuned models follow them consistently because they have been trained to treat system-role content as authoritative.

The system prompt is the primary mechanism for customizing model behavior without retraining. The system prompt must be detailed enough to constrain behavior, but every token it consumes reduces the [context window](./context-window.md) available for the task. In agentic applications where tool definitions, conversation history, and multi-step reasoning all compete for context, prompt budgeting is a binding constraint.

