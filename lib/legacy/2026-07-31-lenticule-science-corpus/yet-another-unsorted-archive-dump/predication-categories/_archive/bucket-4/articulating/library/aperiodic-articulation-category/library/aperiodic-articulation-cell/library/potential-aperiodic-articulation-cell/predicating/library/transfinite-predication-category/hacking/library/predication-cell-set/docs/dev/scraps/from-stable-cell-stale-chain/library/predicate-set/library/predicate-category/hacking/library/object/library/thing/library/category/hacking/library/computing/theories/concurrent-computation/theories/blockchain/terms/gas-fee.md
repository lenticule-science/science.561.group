---
title: Gas Fee
description: The cost paid to execute a transaction or smart contract operation on a blockchain, denominated in the chain's native currency.
defines: gas-fee
aliases: [gas fee, gas fees, gas, gas cost, transaction fee]
date-created: 2026-04-05
sources:
  - title: "Ethereum Yellow Paper"
    url: https://ethereum.github.io/yellowpaper/paper.pdf
  - title: "EIP-1559: Fee market change for ETH 1.0 chain"
    url: https://eips.ethereum.org/EIPS/eip-1559
---

A gas fee is the cost a user pays to execute a transaction on a blockchain. On Ethereum, every operation — transferring tokens, calling a [smart contract](./smart-contract.md) function, storing data — consumes a measurable quantity of gas, and users pay for that gas in ETH.

Gas serves two purposes: it compensates validators for the computational resources they expend processing transactions, and it prevents abuse by making denial-of-service attacks economically prohibitive. Without gas, an attacker could submit infinite loops or spam transactions at no cost, overwhelming the network.

**How gas works on Ethereum**:

Each operation in the Ethereum Virtual Machine has a fixed gas cost. Addition costs 3 gas. Storing a 32-byte value costs 20,000 gas. A simple ETH transfer costs 21,000 gas. A complex DeFi transaction might cost 200,000–500,000 gas.

The total fee a user pays is: **gas used × gas price**. Before EIP-1559 (August 2021), users bid a gas price in a first-price auction — whoever bid highest got included first. This was volatile and unpredictable.

**EIP-1559** restructured the fee market:

1. **Base fee**: A protocol-determined price that adjusts algorithmically based on block utilization. If blocks are more than 50% full, the base fee increases; if less, it decreases.
2. **Priority fee (tip)**: An optional payment to validators to incentivize inclusion.
3. **Fee burning**: The base fee is burned (destroyed), not paid to validators. This makes ETH deflationary under high network usage.

**Implications for application design**:

Gas costs shape what is feasible to build on-chain. Storing data is expensive; computation is moderately expensive; reading data is free (for off-chain callers). This is why [autonomous worlds](./autonomous-world.md) face fundamental design constraints: every state change costs real money. Layer 2 rollups (Optimism, Arbitrum, Base) reduce costs by batching many transactions into a single L1 submission, achieving 10–100× fee reductions while inheriting Ethereum's security.

Games, governance votes, and micro-transactions become practical only when gas fees are low enough that the cost does not exceed the value of the action.

See also: [smart contract](./smart-contract.md), [on-chain state](./on-chain-state.md), [consensus mechanism](./consensus-mechanism.md)
