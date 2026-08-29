---

title: "RLHF"
description: "Reinforcement learning from human feedback — a training method where human preference judgments between model outputs are used to train a reward model, which then guides the language model toward preferred behavior."
defines: RLHF
domain: artificial-intelligence
aliases:
  - RLHF
  - reinforcement learning from human feedback
references:
  - id: christiano2017
    type: document
    title: Deep Reinforcement Learning from Human Preferences
    author:
      - literal: Paul Christiano
      - literal: Jan Leike
      - literal: Tom B. Brown
      - literal: Miljan Martic
      - literal: Shane Legg
      - literal: Dario Amodei
    container-title: Advances in Neural Information Processing Systems
    issued:
      - year: 2017
  - id: ouyang2022
    type: document
    title: Training Language Models to Follow Instructions with Human Feedback
    author:
      - literal: Long Ouyang
      - literal: Jeff Wu
      - literal: Xu Jiang
      - literal: Diogo Almeida
      - literal: Carroll L. Wainwright
      - literal: Pamela Mishkin
      - literal: Chong Zhang
      - literal: Sandhini Agarwal
      - literal: Katarina Slama
      - literal: Alex Ray
      - literal: et al.
    container-title: Advances in Neural Information Processing Systems
    issued:
      - year: 2022
extends: fine-tuning
optimizes: large-language-model
enables: system-prompt
requires: fine-tuning
acts-on: neural-network
contrasts-with: agent-self-improvement
date-created: 2026-03-29
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

The connection to [agentic systems](theories/agents/terms/agentic-system.md) is direct: RLHF is what gives language models the instruction-following reliability required for agent behavior. A model that cannot reliably follow [system prompt](./system-prompt.md) instructions, produce structured [tool call](theories/agents/terms/tool-use.md) outputs, and defer to human judgment when uncertain is not a viable agent. RLHF (and its variants) produce these capabilities.

