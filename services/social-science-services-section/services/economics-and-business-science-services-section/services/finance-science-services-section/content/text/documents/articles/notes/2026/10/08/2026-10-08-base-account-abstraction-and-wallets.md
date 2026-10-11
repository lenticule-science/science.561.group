---
title: "Base Account Abstraction and Wallets"
description: "ERC-4337 EntryPoint, Coinbase Smart Wallet, Permit2 and USDC with CCTP on Base: addresses, verification, upgrade model and audit links"
date-created: 2026-10-08
aliases:
  - "base-account-abstraction-and-wallets"
keywords:
  - erc-4337
  - account-abstraction
  - usdc
  - permit2
teaches:
  - "Base Account Abstraction and Wallets"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  entrypoint2026:
    authors:
      - ERC-4337 EntryPoint
    title: ERC-4337 EntryPoint v0.7 and v0.8 on Base
    year: 2026
    url: https://github.com/eth-infinitism/account-abstraction
  coinbasewallet2026:
    authors:
      - Coinbase Smart Wallet
    title: Coinbase Smart Wallet factory, implementation and VerifyingPaymaster on Base
    year: 2026
    url: https://github.com/coinbase/smart-wallet
  permit2contract2026:
    authors:
      - Permit2 Contract
    title: Uniswap Permit2 on Base
    year: 2026
    url: https://github.com/Uniswap/permit2
  circleusdc2026:
    authors:
      - Circle USDC
    title: USDC and CCTP on Base
    year: 2026
    url: https://github.com/circlefin/stablecoin-evm
---

This note states what first-party reads on 2026-10-08 establish about the account-abstraction and wallet-layer contracts on Base that a cooperative onboarding flow can use.

## EntryPoint and wallets

ERC-4337 EntryPoint 2026 finds both EntryPoint v0.7 (0x0000...a032) and v0.8 (0x4337...f108) deployed and verified on Base; the repository audit directory lists 2023, 2024 and 2025 reviews and a v0.9 review. Coinbase Smart Wallet 2026 finds the Coinbase Smart Wallet factories at 0x0BA5...428a and 0xBA5E...5842, the shared implementation at 0x0001...9E72, and a verified VerifyingPaymaster at 0x2FAE...FD4c whose operator the read did not establish. The wallet repository lists Cantina, Certora and Code4rena reviews.

## Signature and token plumbing

Permit2 Contract 2026 finds Permit2 at the canonical 0x0000...8BA3 on Base. Circle USDC 2026 reads USDC on Base: 4.35B supply behind a FiatTokenProxy (implementation 0x2Ce6...D779), with CCTP v2 contracts present for cross-chain transfers.

## Not found

The Coinbase paymaster operator, bundler and third-party paymaster (Pimlico, Alchemy) addresses, the RIP-7212 precompile, Circle audit reports in the cloned repositories, Circle native yield claims and USYC were not read; the two search rows record that.
