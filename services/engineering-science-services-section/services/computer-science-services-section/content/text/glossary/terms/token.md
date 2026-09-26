---
name: "Token"
description: "The atomic unit of text that a language model processes — a subword fragment, whole word, or punctuation mark, typically 3-4 characters of English on average."
domain: artificial-intelligence
component-of: context-window
measures: context-window
produced-by: tokenizer
date-created: 2026-03-29
date-updated: 2026-03-29
aliases:
  - subword token
  - tokens
references:
  - id: sennrich2016
    type: document
    title: Neural Machine Translation of Rare Words with Subword Units
    author:
      - literal: Rico Sennrich
      - literal: Barry Haddow
      - literal: Alexandra Birch
    container-title: Proceedings of the 54th Annual Meeting of the Association for Computational Linguistics
    issued:
      - year: 2016
sources:
  - title: "ERC-20 Token Standard"
    url: https://eips.ethereum.org/EIPS/eip-20
  - title: "ERC-721 Non-Fungible Token Standard"
    url: https://eips.ethereum.org/EIPS/eip-721
---

A token is the atomic unit of text that a [large language model](large-language-model.md) processes. Models do not operate on characters or words directly; they operate on tokens — subword fragments produced by a tokenizer that splits text into pieces from a fixed vocabulary. The word "unbelievable" might be tokenized as ["un", "believ", "able"]; common words like "the" are single tokens; rare words or code identifiers are split into multiple tokens.

Tokenizers are trained on large text corpora to find a vocabulary (typically 32,000–100,000 tokens) that minimizes the total number of tokens needed to represent the training data. The dominant algorithm is Byte Pair Encoding (BPE), introduced for neural machine translation by Sennrich, Haddow, and Birch (2016). BPE starts with individual characters and iteratively merges the most frequent adjacent pairs until the vocabulary reaches the target size. The result is a vocabulary where common words and subwords are single tokens and rare sequences are composed from smaller pieces.

Tokens matter for three practical reasons:

1. **Cost.** API providers charge per token (input and output). A rough conversion for English is 1 token ≈ 4 characters, or about 750 words per 1,000 tokens. Code, non-English languages, and structured data (JSON, XML) tend to tokenize less efficiently — the same information may cost 2-3× more in tokens.

2. **Context window.** The [context window](context-window.md) is measured in tokens, not words or characters. A 200,000-token context window holds roughly 150,000 words of English. Everything the model sees — the system prompt, the conversation history, tool definitions, tool results — must fit within this budget.

3. **Generation.** Language models generate text one token at a time, left to right. Each token produced requires a forward pass through the [transformer](transformer.md). Generation speed is measured in tokens per second; latency is proportional to the number of output tokens.

Different providers use different tokenizers with different vocabularies, so the same text tokenizes differently across models. This means token counts are not directly comparable between providers, and a prompt that fits within one model's context window may not fit within another's even if the nominal window size is the same.

## Related terms

- [Transformer](transformer.md) — the architecture that processes token sequences
- [Context window](context-window.md) — the maximum number of tokens a model can process at once
- [Large language model](large-language-model.md) — the systems whose behavior tokens determine

A token is a unit of value represented by a [smart contract](smart-contract.md) on a blockchain. The contract maintains a ledger of balances and exposes functions for transferring ownership. Tokens are not native to the blockchain's protocol (those are coins, like ETH on Ethereum); they are programs that run on top of it.

**Two fundamental categories**:

1. **Fungible tokens** (ERC-20 on Ethereum): Each unit is interchangeable with every other unit of the same token. One DAI is identical to any other DAI. The contract tracks a single balance per address. Use cases include currencies, governance votes, reward points, and staking deposits.

2. **Non-fungible tokens** ([NFTs](nft.md), ERC-721): Each unit has a unique identifier and is not interchangeable. Token #42 is distinct from token #43. The contract maps each token ID to an owner address. Use cases include digital art, game items, land deeds, and identity credentials.

**How a fungible token works (ERC-20)**:

The contract stores a mapping from addresses to balances. It exposes standard functions: `transfer(to, amount)`, `approve(spender, amount)`, and `transferFrom(from, to, amount)`. The approve/transferFrom pattern enables third-party contracts (like decentralized exchanges) to move tokens on a user's behalf — the foundation of DeFi [composability](composability.md).

Fabian Vogelsteller and Vitalik Buterin proposed ERC-20 in November 2015. Its adoption as a standard meant that any wallet, exchange, or contract could interact with any ERC-20 token without custom integration. Standardization made the Ethereum token ecosystem possible.

**Token economics**: The rules governing a token's supply, distribution, and utility are collectively called its tokenomics. Critical parameters include total supply (fixed or inflationary), emission schedule (how new tokens enter circulation), and sinks (mechanisms that remove tokens from circulation). The collapse of Axie Infinity's SLP token — which had uncapped supply and insufficient sinks — illustrates what happens when tokenomics fail. See [token inflation](token-inflation.md).

**Tokens are not inherently valuable**. A token's value derives from what it grants access to: governance rights in a [DAO](dao.md), utility within a game, yield from a protocol, or a claim on real-world assets. Tokens without clear utility tend toward zero.

See also: [NFT](nft.md), [token inflation](token-inflation.md), [smart contract](smart-contract.md)
