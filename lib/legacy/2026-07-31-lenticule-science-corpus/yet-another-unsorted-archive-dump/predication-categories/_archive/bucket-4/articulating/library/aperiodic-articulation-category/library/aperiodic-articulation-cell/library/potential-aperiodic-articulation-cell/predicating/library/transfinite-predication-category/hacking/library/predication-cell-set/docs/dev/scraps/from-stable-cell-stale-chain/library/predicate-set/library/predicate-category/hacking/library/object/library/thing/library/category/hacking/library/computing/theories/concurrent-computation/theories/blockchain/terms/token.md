---
title: Token
description: A unit of value on a blockchain, implemented as a smart contract that tracks balances and transfers according to a standard interface.
defines: token
aliases: [tokens, crypto token]
date-created: 2026-04-05
sources:
  - title: "ERC-20 Token Standard"
    url: https://eips.ethereum.org/EIPS/eip-20
  - title: "ERC-721 Non-Fungible Token Standard"
    url: https://eips.ethereum.org/EIPS/eip-721
---

A token is a unit of value represented by a [smart contract](./smart-contract.md) on a blockchain. The contract maintains a ledger of balances and exposes functions for transferring ownership. Tokens are not native to the blockchain's protocol (those are coins, like ETH on Ethereum); they are programs that run on top of it.

**Two fundamental categories**:

1. **Fungible tokens** (ERC-20 on Ethereum): Each unit is interchangeable with every other unit of the same token. One DAI is identical to any other DAI. The contract tracks a single balance per address. Use cases include currencies, governance votes, reward points, and staking deposits.

2. **Non-fungible tokens** ([NFTs](./nft.md), ERC-721): Each unit has a unique identifier and is not interchangeable. Token #42 is distinct from token #43. The contract maps each token ID to an owner address. Use cases include digital art, game items, land deeds, and identity credentials.

**How a fungible token works (ERC-20)**:

The contract stores a mapping from addresses to balances. It exposes standard functions: `transfer(to, amount)`, `approve(spender, amount)`, and `transferFrom(from, to, amount)`. The approve/transferFrom pattern enables third-party contracts (like decentralized exchanges) to move tokens on a user's behalf — the foundation of DeFi [composability](./composability.md).

Fabian Vogelsteller and Vitalik Buterin proposed ERC-20 in November 2015. Its adoption as a standard meant that any wallet, exchange, or contract could interact with any ERC-20 token without custom integration. Standardization made the Ethereum token ecosystem possible.

**Token economics**: The rules governing a token's supply, distribution, and utility are collectively called its tokenomics. Critical parameters include total supply (fixed or inflationary), emission schedule (how new tokens enter circulation), and sinks (mechanisms that remove tokens from circulation). The collapse of Axie Infinity's SLP token — which had uncapped supply and insufficient sinks — illustrates what happens when tokenomics fail. See [token inflation](./token-inflation.md).

**Tokens are not inherently valuable**. A token's value derives from what it grants access to: governance rights in a [DAO](./dao.md), utility within a game, yield from a protocol, or a claim on real-world assets. Tokens without clear utility tend toward zero.

See also: [NFT](./nft.md), [token inflation](./token-inflation.md), [smart contract](./smart-contract.md)
