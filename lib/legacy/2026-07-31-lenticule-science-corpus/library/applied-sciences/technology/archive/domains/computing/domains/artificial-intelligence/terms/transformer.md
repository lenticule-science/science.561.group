---
title: "Transformer"
description: "A neural network architecture based on self-attention mechanisms that processes input sequences in parallel — introduced by Vaswani et al. (2017) and the basis for all current large language models."
defines: Transformer
domain: artificial-intelligence
instance-of: neural-network
requires: token
enables: large-language-model
determines: context-window
date-created: 2026-03-29
date-updated: 2026-03-29
---

The transformer is a [neural network](./neural-network.md) architecture introduced by Vaswani et al. in "Attention Is All You Need" (2017). It processes input sequences using **self-attention** — a mechanism that allows every element in a sequence to attend to every other element, computing relevance weights dynamically rather than relying on fixed-distance connections. This replaced the recurrent architectures (LSTMs, GRUs) that previously dominated sequence modeling, which processed inputs one step at a time and struggled with long-range dependencies.

The attention mechanism works as follows. Given a sequence of [tokens](./token.md), the transformer computes three vectors for each token: a query (what am I looking for?), a key (what do I contain?), and a value (what do I contribute?). Attention scores are computed by comparing each query against all keys; these scores determine how much each token's value contributes to the output at each position. The operation is a weighted sum, where the weights are learned through training. Every token attends to every other token, capturing long-range dependencies in a single operation.

Transformers process all positions in parallel (during training), making them much faster to train on modern hardware (GPUs, TPUs) than recurrent models, which must process positions sequentially. This parallelism is what enabled training on the massive datasets that produce [large language models](../../on-device-inference/terms/large-language-model.md).

The original transformer had both an encoder (processes input) and a decoder (generates output). Subsequent work split into three families:

- **Encoder-only** (BERT, 2018): processes input bidirectionally. Used for classification, embedding, and understanding tasks.
- **Decoder-only** (GPT, 2018; GPT-2, 2019; GPT-3, 2020): generates output autoregressively (left to right). This is the architecture behind all current large language models — GPT-4, Claude, Gemini, Llama, Qwen, Gemma.
- **Encoder-decoder** (T5, BART): uses both components. Used for translation and summarization.

The decoder-only architecture dominates because autoregressive generation (predict the next token given all previous tokens) scales well and naturally handles open-ended generation. The [context window](./context-window.md) — the maximum number of tokens the model can process at once — is a direct consequence of the attention mechanism: computing attention over N tokens requires O(N²) operations, so longer contexts require quadratically more compute. Extending context windows is an active area of research (sparse attention, sliding window attention, linear attention approximations).

## Related terms

- [Neural network](./neural-network.md) — the broader category transformers belong to
- [Token](./token.md) — the unit of input transformers process
- [Context window](./context-window.md) — the sequence length limit imposed by attention
- [Large language model](../../on-device-inference/terms/large-language-model.md) — what transformers become at scale
