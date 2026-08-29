---
title: On-Chain State
description: Data stored directly on a blockchain and maintained by every validating node, serving as the canonical, publicly verifiable record of a system's current condition.
defines: on-chain-state
aliases: [on-chain state, on-chain data, chain state]
date-created: 2026-04-05
sources:
  - title: "Ethereum Whitepaper"
    url: https://ethereum.org/en/whitepaper/
  - title: "Understanding Autonomous Worlds – Dojo Documentation"
    url: https://dojoengine.org/theory/autonomous-worlds
---

On-chain state is data stored directly on a blockchain, replicated across every validating node, and verifiable by anyone without trusting a central authority. It is the canonical record of what is true in a blockchain-based system at any given block.

In Ethereum, on-chain state consists of the global state trie — a data structure mapping every account address to its balance, nonce, code hash (for [smart contracts](./smart-contract.md)), and storage root. Each contract's storage root points to its own trie of key-value pairs: the persistent variables the contract reads and writes. When a transaction modifies a contract's variable, every node updates its copy of the state trie and the new [Merkle root](./merkle-root.md) is recorded in the next block header.

**What makes on-chain state distinctive**:

- **Consensus-backed**: Every piece of on-chain data has been validated by the network's [consensus mechanism](./consensus-mechanism.md). It is not merely stored — it is agreed upon.
- **Publicly readable**: Any contract, node, or external observer can read any piece of on-chain state. There are no access controls on reads (only on writes).
- **Immutably historied**: While current state changes with each block, the history of all state transitions is preserved in the chain's block history.
- **Expensive**: Every byte stored on-chain must be maintained by every full node indefinitely. On Ethereum, storing 32 bytes costs 20,000 gas (~$0.50–$5.00 depending on network conditions). This cost is the fundamental constraint shaping what goes on-chain versus off-chain.

**On-chain vs. off-chain**: Most blockchain applications store only essential state on-chain — ownership records, balances, governance votes, game rules — and keep bulky data (images, metadata, detailed logs) off-chain using [content-addressed storage](./content-identifier.md) like IPFS. The trade-off is trust: on-chain data is trustless and permanent; off-chain data requires trusting the storage provider or the availability of the content network.

**In autonomous worlds**, on-chain state is what makes the world real. A character's position, inventory, and attributes stored on-chain exist independently of any client, server, or developer. Any [smart contract](./smart-contract.md) can read that state and build on it — this is what enables the [composability](./composability.md) that distinguishes autonomous worlds from traditional games with proprietary servers.

See also: [Merkle root](./merkle-root.md), [smart contract](./smart-contract.md), [gas fee](./gas-fee.md)
