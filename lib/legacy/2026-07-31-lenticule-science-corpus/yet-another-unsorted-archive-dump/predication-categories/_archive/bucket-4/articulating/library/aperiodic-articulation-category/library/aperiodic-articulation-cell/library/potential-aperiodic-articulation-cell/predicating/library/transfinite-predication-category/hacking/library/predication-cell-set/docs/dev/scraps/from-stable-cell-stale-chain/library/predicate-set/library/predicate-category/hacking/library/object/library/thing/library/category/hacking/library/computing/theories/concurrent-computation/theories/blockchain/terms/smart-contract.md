---
title: Smart Contract
description: A program stored on a blockchain that executes automatically when its conditions are met, without intermediaries.
defines: smart-contract
aliases: [smart contracts]
date-created: 2026-04-05
sources:
  - title: "Formalizing and Securing Relationships on Public Networks"
    url: https://firstmonday.org/ojs/index.php/fm/article/view/548/469
  - title: "Ethereum Whitepaper"
    url: https://ethereum.org/en/whitepaper/
---

A smart contract is a program deployed to a blockchain that executes deterministically when triggered by a transaction. Once deployed, the code cannot be altered unilaterally — it runs exactly as written, enforced by the network's consensus mechanism rather than by any party to the agreement.

Nick Szabo introduced the term in 1994, defining it as "a computerized transaction protocol that executes the terms of a contract." Szabo's insight was that many contractual clauses — collateral, bonding, property delineation — could be embedded in software and hardware, reducing the need for trusted intermediaries. His canonical example was the vending machine: it holds goods, accepts payment, and delivers the product without a shopkeeper.

**How they work on Ethereum**:

1. A developer writes contract logic in a high-level language (typically Solidity).
2. The code is compiled to bytecode and deployed to the blockchain via a transaction.
3. The contract receives an address on the chain. Anyone can send transactions to that address to invoke its functions.
4. Each invocation costs [gas](./gas-fee.md) proportional to the computational resources consumed.
5. The contract's storage — its persistent variables — lives on-chain and is readable by any other contract or external observer.

**Key properties**:

- **Deterministic**: Given the same inputs and state, every node produces the same output. This is what allows thousands of independent validators to agree on the result.
- **Immutable**: Once deployed, the bytecode at that address cannot change. (Upgradeable proxy patterns exist but introduce trust assumptions.)
- **Composable**: Any contract can call any other contract's public functions, enabling complex systems built from simple, interacting components. See [composability](./composability.md).
- **Transparent**: All code and state are publicly visible on-chain.

Smart contracts are the mechanism through which [DAOs](./dao.md) govern, [tokens](./token.md) transfer, and [autonomous worlds](./autonomous-world.md) enforce their rules. They are the executable layer of blockchain systems — the thing that makes a blockchain a computer rather than merely a ledger.

**Limitations**: Smart contracts cannot access off-chain data directly (they need oracles), cannot be patched after deployment without architectural workarounds, and bugs in deployed contracts have led to catastrophic losses (the 2016 DAO hack drained $60 million from a flawed contract).

See also: [gas fee](./gas-fee.md), [on-chain state](./on-chain-state.md), [composability](./composability.md)
