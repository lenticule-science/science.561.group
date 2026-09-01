---
name: "Fine-Tuning"
description: "The process of further training a pre-trained neural network on a smaller, task-specific dataset to adapt its behavior — the mechanism by which base language models become instruction-following, tool-using agents."
domain: artificial-intelligence
optimizes: neural-network, large-language-model
enables: tool-use, system-prompt
acts-on: neural-network
contrasts-with: system-prompt
date-created: 2026-03-29
date-updated: 2026-03-29
---

Fine-tuning is the process of continuing the training of a pre-trained [neural network](./neural-network.md) on a smaller, task-specific dataset to adapt its behavior for a particular use case. The pre-trained model has already learned general patterns from a large corpus; fine-tuning adjusts its weights to specialize in a narrower domain or capability while retaining its general knowledge.

The concept predates large language models. Transfer learning — training on a large dataset then specializing on a small one — was established in computer vision (Yosinski et al., 2014) before being applied to NLP. For language models, the two-stage pipeline (pre-train on large text, fine-tune on task-specific data) was popularized by Howard and Ruder (2018, ULMFiT) and refined by the GPT and BERT model families.

In the context of [large language models](../../on-device-inference/terms/large-language-model.md), fine-tuning serves three primary purposes:

1. **Instruction following.** Base models (trained only on next-[token](./token.md) prediction) generate plausible continuations of text but do not reliably follow instructions. Instruction fine-tuning — training on datasets of (instruction, desired response) pairs — transforms the model into one that interprets and executes natural language instructions. This is what makes [system prompts](./system-prompt.md) effective.

2. **[Tool use](../domains/agents/terms/tool-use.md).** Models learn to produce structured [tool call](../domains/agents/terms/tool-use.md) outputs by being fine-tuned on datasets containing examples of conversations where tool calls were appropriate, including the JSON-formatted function name and arguments. OpenAI's function calling API (June 2023) and Anthropic's tool use (GA May 2024) both rely on models fine-tuned for this capability.

3. **Safety and alignment.** Combined with [RLHF](./rlhf.md), fine-tuning is used to reduce harmful outputs, improve helpfulness, and align model behavior with human preferences. This is where fine-tuning intersects with the broader alignment research program.

Fine-tuning modifies the model's weights. [System prompt](./system-prompt.md) engineering constrains behavior at inference time without changing the model. In-context learning provides examples in the prompt without changing weights either. Fine-tuning produces more reliable behavioral changes but requires training infrastructure, curated datasets, and compute. Prompting is cheaper and more flexible but less robust.

Efficient fine-tuning methods reduce the computational cost. LoRA (Low-Rank Adaptation; Hu et al., 2022) freezes most model weights and trains only small rank-decomposition matrices, reducing the number of trainable parameters by orders of magnitude. QLoRA (Dettmers et al., 2023) combines LoRA with quantized base models, enabling fine-tuning of large models on consumer hardware.

## Related terms

- [Neural network](./neural-network.md) — the model being fine-tuned
- [RLHF](./rlhf.md) — a training method that often follows or accompanies fine-tuning
- [System prompt](./system-prompt.md) — the inference-time alternative to fine-tuning
- [Tool use](../domains/agents/terms/tool-use.md) — a capability acquired through fine-tuning
- [Large language model](../../on-device-inference/terms/large-language-model.md) — the models fine-tuning is most commonly applied to

## Consolidated material from fine-tuning.md

---

title: "Fine-Tuning"
description: "The process of further training a pre-trained neural network on a smaller, task-specific dataset to adapt its behavior — the mechanism by which base language models become instruction-following, tool-using agents."
defines: Fine-Tuning
domain: artificial-intelligence
optimizes: neural-network, large-language-model
enables: tool-use, system-prompt
acts-on: neural-network
contrasts-with: system-prompt
date-created: 2026-03-29
---
