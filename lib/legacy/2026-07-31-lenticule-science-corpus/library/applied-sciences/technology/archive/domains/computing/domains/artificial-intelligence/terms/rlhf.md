---
name: "RLHF"
description: "Reinforcement learning from human feedback — a training method where human preference judgments between model outputs are used to train a reward model, which then guides the language model toward preferred behavior."
domain: artificial-intelligence
extends: fine-tuning
optimizes: large-language-model
enables: system-prompt
requires: fine-tuning
acts-on: neural-network
contrasts-with: agent-self-improvement
date-created: 2026-03-29
date-updated: 2026-03-29
---

Reinforcement learning from human feedback (RLHF) is a training method in which human evaluators compare pairs of model outputs, a reward model learns to predict which output humans prefer, and the language model is then optimized to produce outputs that score highly under the reward model. The method was described by Christiano et al. (2017, "Deep Reinforcement Learning from Human Preferences") and applied to language models at scale by Ouyang et al. (2022, "Training Language Models to Follow Instructions with Human Feedback") at OpenAI, producing InstructGPT.

The standard RLHF pipeline has three stages:

1. **Supervised fine-tuning (SFT).** A pre-trained base model is [fine-tuned](./fine-tuning.md) on a dataset of high-quality (prompt, response) pairs written or curated by humans. This produces a model that can follow instructions but whose outputs may still be inconsistent, verbose, or unsafe.

2. **Reward model training.** Human evaluators are shown pairs of responses to the same prompt and asked which they prefer. These preference labels are used to train a separate [neural network](./neural-network.md) — the reward model — that takes a (prompt, response) pair and outputs a scalar score predicting human preference.

3. **Policy optimization.** The language model (now called the "policy") is further trained using reinforcement learning (typically Proximal Policy Optimization / PPO; Schulman et al., 2017) to maximize the reward model's score while staying close to the SFT model's distribution (via a KL divergence penalty). The KL constraint prevents the model from "reward hacking" — finding degenerate outputs that score highly on the reward model but are not genuinely preferred by humans.

RLHF is what makes the difference between a base model (which generates plausible text continuations) and an assistant model (which follows instructions, declines harmful requests, and produces helpful responses). The method encodes human preferences into the model's behavior without requiring explicit rules for every possible scenario — the reward model generalizes from the preference data.

Variants and alternatives to RLHF have emerged since 2022:

- **DPO (Direct Preference Optimization; Rafailov et al., 2023)** eliminates the separate reward model by directly optimizing the language model on preference pairs, simplifying the pipeline.
- **RLAIF (Reinforcement Learning from AI Feedback)** uses a model's own judgments (or those of another model) as the preference signal, reducing dependence on human evaluators.
- **Constitutional AI (Anthropic, 2022)** combines RLAIF with a set of principles ("a constitution") that the model uses to self-evaluate and revise its outputs.

The connection to [agentic systems](../domains/agents/terms/agentic-system.md) is direct: RLHF is what gives language models the instruction-following reliability required for agent behavior. A model that cannot reliably follow [system prompt](./system-prompt.md) instructions, produce structured [tool call](../domains/agents/terms/tool-use.md) outputs, and defer to human judgment when uncertain is not a viable agent. RLHF (and its variants) produce these capabilities.

## Related terms

- [Fine-tuning](./fine-tuning.md) — the broader category RLHF belongs to
- [Neural network](./neural-network.md) — the model being trained
- [System prompt](./system-prompt.md) — the instructions RLHF-trained models learn to follow
- [Tool use](../domains/agents/terms/tool-use.md) — a capability RLHF-trained models support
- [Agentic system](../domains/agents/terms/agentic-system.md) — the systems RLHF enables
