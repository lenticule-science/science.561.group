---
name: "Token"
description: "The atomic unit of text that a language model processes — a subword fragment, whole word, or punctuation mark, typically 3-4 characters of English on average."
domain: artificial-intelligence
component-of: context-window
measures: context-window
produced-by: tokenizer
date-created: 2026-03-29
date-updated: 2026-03-29
---

A token is the atomic unit of text that a [large language model](../../on-device-inference/terms/large-language-model.md) processes. Models do not operate on characters or words directly; they operate on tokens — subword fragments produced by a tokenizer that splits text into pieces from a fixed vocabulary. The word "unbelievable" might be tokenized as ["un", "believ", "able"]; common words like "the" are single tokens; rare words or code identifiers are split into multiple tokens.

Tokenizers are trained on large text corpora to find a vocabulary (typically 32,000–100,000 tokens) that minimizes the total number of tokens needed to represent the training data. The dominant algorithm is Byte Pair Encoding (BPE), introduced for neural machine translation by Sennrich, Haddow, and Birch (2016). BPE starts with individual characters and iteratively merges the most frequent adjacent pairs until the vocabulary reaches the target size. The result is a vocabulary where common words and subwords are single tokens and rare sequences are composed from smaller pieces.

Tokens matter for three practical reasons:

1. **Cost.** API providers charge per token (input and output). A rough conversion for English is 1 token ≈ 4 characters, or about 750 words per 1,000 tokens. Code, non-English languages, and structured data (JSON, XML) tend to tokenize less efficiently — the same information may cost 2-3× more in tokens.

2. **Context window.** The [context window](./context-window.md) is measured in tokens, not words or characters. A 200,000-token context window holds roughly 150,000 words of English. Everything the model sees — the system prompt, the conversation history, tool definitions, tool results — must fit within this budget.

3. **Generation.** Language models generate text one token at a time, left to right. Each token produced requires a forward pass through the [transformer](./transformer.md). Generation speed is measured in tokens per second; latency is proportional to the number of output tokens.

Different providers use different tokenizers with different vocabularies, so the same text tokenizes differently across models. This means token counts are not directly comparable between providers, and a prompt that fits within one model's context window may not fit within another's even if the nominal window size is the same.

## Related terms

- [Transformer](./transformer.md) — the architecture that processes token sequences
- [Context window](./context-window.md) — the maximum number of tokens a model can process at once
- [Large language model](../../on-device-inference/terms/large-language-model.md) — the systems whose behavior tokens determine
