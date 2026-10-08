---
title: "Arbitrum, Base and Solana specifics for a pool contract: Stylus, Timeboost, BoLD, Flashblocks and Token-2022"
description: "What each chain's own documentation and public endpoints establish on 2026-10-08 about execution models, fees, sequencing features, dispute design and token extensions relevant to a cooperative pooling contract."
date-created: 2026-10-08
aliases:
  - arbitrum base solana specifics
keywords: [Arbitrum, Stylus, Timeboost, BoLD, Base, Flashblocks, Solana, Token-2022, interest-bearing]
teaches:
  - what Stylus, Timeboost and BoLD are and what they change
  - fee levels on Arbitrum One and Base
  - which Token-2022 extensions fit or do not fit a pool
requires: []
authors: [claude-sonnet-5-5]
type: text
references:
  arbitrumdocs2026:
    authors:
      - Arbitrum Docs
    title: "docs.arbitrum.io: Stylus gentle introduction, Timeboost, BoLD, Arbitrum vs Ethereum comparison"
    year: 2026
    url: https://docs.arbitrum.io/stylus/gentle-introduction
  arbitrumonchain2026:
    authors:
      - Arbitrum On Chain
    title: cast reads on Arbitrum One precompiles ArbSys 0x64 and ArbGasInfo 0x6c (2026-10-08)
    year: 2026
    url: https://arbiscan.io/address/0x0000000000000000000000000000000000000064
  baseonchain2026:
    authors:
      - Base On Chain
    title: cast reads on Base mainnet (chain id 8453, 2026-10-08)
    year: 2026
    url: https://mainnet.base.org
  basedocs2026:
    authors:
      - Base Docs
    title: docs.base.org Flashblocks overview and Base Account page
    year: 2026
    url: https://docs.base.org/base-chain/flashblocks/overview
  solanarpc2026:
    authors:
      - Solana RPC
    title: api.mainnet-beta.solana.com getAccountInfo and getSlot (2026-10-08)
    year: 2026
    url: https://api.mainnet-beta.solana.com
  solanatoken2026:
    authors:
      - Solana Token Docs
    title: solana-program.com Token-2022 docs and extensions guide
    year: 2026
    url: https://www.solana-program.com/docs/token-2022/extensions
---

## Arbitrum One

Execution. Arbitrum's Stylus adds a second virtual machine that runs WebAssembly beside the EVM; Rust has the supported toolkit, C and C++ are supported, and Solidity and Stylus contracts call each other. The documentation states the gain is in compute and memory, that storage operations cost "roughly the same as in the EVM", that contracts must be activated and reactivated every 365 days or after a Stylus upgrade, and that the Security Council has temporarily paused new activations on Arbitrum One and Nova (Arbitrum Docs 2026). A pool whose work is accounting and token transfers is storage-bound, so Stylus gives it nothing, and a contract that needs activation cannot currently be newly activated on mainnet.

Sequencing. Timeboost auctions an express lane in 60-second rounds by sealed-bid second-price auction (reserve 0.001 WETH by default), and delays non-express transactions by 200 ms by default; proceeds go to a beneficiary designated by the chain owner. The express-lane holder cannot reorder or guarantee the top slot (Arbitrum Docs 2026). For a pool this means settlement transactions are never blocked, only delayed by a fraction of a second.

Disputes. BoLD makes validation permissionless: anyone can open a challenge to an incorrect assertion, and the stated resolution window is 6.4 days plus a two-day Security Council grace period; it is live on Arbitrum One and Nova (Arbitrum Docs 2026). A withdrawal from Arbitrum to Ethereum by the canonical route therefore takes about a week, which is why messaging protocols and CCTP, not the canonical bridge, carry funds in the other designs of this series.

Fees and state. Arbitrum fees are an L2 execution fee plus a charge for posting calldata to the parent chain (Arbitrum Docs 2026). Measured at block 512,999,361: ArbOS version call returns 116, minimum gas price 0.02 gwei, current gas price 0.0205 gwei, L1 base-fee estimate 5.48 million wei (Arbitrum On Chain 2026). The comparison page read does not describe ArbOS, and the AnyTrust and data-availability-committee text was not fetched.

## Base

Base is an OP Stack chain with chain id 8453 and a gas price of 0.006 gwei at the time of reading (Base On Chain 2026). Flashblocks are 200 ms preconfirmations inside a 2-second block, built by the sequencer, after which ordering is locked; the page does not say whether they are enabled on mainnet or how applications read them (Base Docs 2026). The Base Account documentation has moved to the Coinbase Developer Platform and the SDK is now the Coinbase Wallet SDK, so account features were not read. Base carries 4.35 billion USDC and is a CCTP v2 domain (see the stablecoin transfer note).

## Solana

The Token-2022 program is deployed at TokenzQdBNbLqP5VEhdkAS6EPFLC1PHnBqCXEpPxuEb (Solana RPC 2026). Its mint extensions are confidential transfers, transfer fees, interest-bearing tokens, non-transferable tokens, permanent delegate and transfer hook, plus default account state for accounts; extensions are chosen at mint creation and may be combined (Solana Token Docs 2026).

Interest-bearing mints are display only: no tokens are created, the interface adds continuously compounded interest to the raw amount using the network timestamp, and the rate authority can change the rate at any time. A pool cannot pay yield through that extension; it can only show a rate. A transfer hook runs a program after the transfer logic and is skipped for self-transfers, so it can enforce allowlists or post pool accounting for a member token; a permanent delegate has unlimited authority over every token account of the mint and does not work with confidential balances, so it is a custodial control and not a member-safe default. Non-transferable mints fit membership shares that must not trade. The confidential-transfer limits are on a separate page that was not read.

## Reading for a pool

Arbitrum and Base give the same EVM contract model and gas prices of 0.0205 gwei (Arbitrum One) and 0.006 gwei (Base) at the time of reading; their differences are in sequencing and withdrawal delay, not contract capability. Solana is a different programming model with token-level features, of which only non-transferable shares and transfer hooks apply to a cooperative; its yield cannot come from the token standard.
