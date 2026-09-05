---
name: Composability
description: The property of blockchain systems where any smart contract can interact with any other, enabling complex applications built from independent, interoperable components.
aliases: [composability, composable, money legos, DeFi legos]
date-created: 2026-04-05
sources:
  - title: "Composability is Innovation"
    url: https://future.com/how-composability-unlocks-crypto-and-everything-else/
  - title: "Loot: The Epitome of Composability"
    url: https://naavik.co/deep-dives/loot-deconstruction-pro/
---

Composability is the property of a system where its components can be freely combined, recombined, and built upon by anyone, without coordination with or permission from the original creators. In blockchain systems, composability means any [smart contract](./smart-contract.md) can call any other smart contract's public functions, read any piece of [on-chain state](./on-chain-state.md), and build new functionality on top of existing protocols.

The term draws an analogy to Unix pipes, LEGO bricks, or API composition — but blockchain composability is stronger than any of these because it operates on shared, permissionless state. A Unix program can pipe data to another, but both must run on the same machine under the same user's control. A blockchain contract can interact with any other contract deployed by anyone, at any time, without prior agreement.

**How it works**:

1. **Open state**: All contract storage is publicly readable. A lending protocol can check a user's collateral in a different protocol without any API key or partnership.
2. **Standardized interfaces**: Token standards (ERC-20, ERC-721) define common function signatures. Any wallet, exchange, or protocol that supports ERC-20 can interact with any ERC-20 [token](./token.md) — thousands of them — using the same code.
3. **Atomic transactions**: Multiple contract calls within a single transaction either all succeed or all revert. This enables flash loans: borrow, trade, arbitrage, and repay in one atomic transaction — an operation that would be impossible without composability and atomicity.

**DeFi as composability in action**:

Decentralized finance is the clearest demonstration. A user can deposit ETH into Aave (lending), use the receipt token as collateral in MakerDAO (borrowing), swap the borrowed DAI on Uniswap (trading), and stake the result in Yearn (yield optimization) — all without any of these protocols having formal partnerships. Each protocol reads and writes to shared on-chain state. The community calls these "money legos" because each protocol is a building block that snaps onto others.

**In autonomous worlds**:

Composability is what makes [autonomous worlds](./autonomous-world.md) fundamentally different from traditional games. In a traditional game, only the studio can add mechanics. In an autonomous world, any developer can deploy a new contract that reads the world's state and adds functionality — a crafting system, a marketplace, a governance layer — without modifying the original code. The Loot project demonstrated this: 8,000 bags of on-chain text spawned over 40 derivative projects, each composing on the original data.

**Risks**: Composability creates systemic interdependence. A bug or exploit in one protocol can cascade through every protocol that depends on it. The 2022 collapse of Terra/UST propagated through the DeFi ecosystem precisely because protocols were deeply composed with each other. Composability amplifies both innovation and contagion.

See also: [smart contract](./smart-contract.md), [on-chain state](./on-chain-state.md), [token](./token.md), [autonomous world](./autonomous-world.md)
