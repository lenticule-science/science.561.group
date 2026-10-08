---
title: "Gnosis Primitives"
description: "sDAI, BREAD, Aave v3, Safe, Superfluid and Circles on Gnosis Chain: addresses, size and admin model"
date-created: 2026-10-08
aliases:
  - "gnosis-primitives"
keywords:
  - gnosis
  - sdai
  - bread
  - circles
teaches:
  - "Gnosis Primitives"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  sdaigno2026:
    authors:
      - Savings xDAI
    title: sDAI SavingsXDai vault on Gnosis
    year: 2026
    url: https://gnosisscan.io/address/0xaf204776c7245bF4147c2612BF6e5972Ee483701
  breadtoken2026:
    authors:
      - Breadchain Token
    title: BREAD on Gnosis
    year: 2026
    url: https://gnosisscan.io/address/0xa555d5344f6FB6c65da19e403Cb4c1eC4a1a5Ee3
  aavegnosis2026:
    authors:
      - Aave Gnosis
    title: Aave v3 Gnosis market
    year: 2026
    url: https://github.com/bgd-labs/aave-address-book/blob/main/src/AaveV3Gnosis.sol
  safegnosis2026:
    authors:
      - Safe Gnosis
    title: Safe singleton and factory on Gnosis
    year: 2026
    url: https://github.com/safe-global/safe-smart-account
  superfluidgno2026:
    authors:
      - Superfluid Gnosis
    title: Superfluid on Gnosis
    year: 2026
    url: https://github.com/superfluid-org/protocol-monorepo/blob/dev/packages/metadata/networks.json
  stablecoinsgno2026:
    authors:
      - DeFiLlama Stablecoins
    title: Stablecoin charts for Gnosis
    year: 2026
    url: https://stablecoins.llama.fi/stablecoincharts/xdai?stablecoin=1
  circleshub2026:
    authors:
      - Circles Hub
    title: Circles v2 hub on Gnosis
    year: 2026
    url: https://docs.aboutcircles.com
---

This note states what first-party reads on 2026-10-08 establish about Gnosis Chain primitives, the chain Breadchain issues on.

## Savings and BREAD

Savings xDAI 2026 reads sDAI: an ERC-4626 vault over WXDAI holding 42.08M against 33.38M shares, a share price of 1.2608. Breadchain Token 2026 reads BREAD: 392,011.84 in supply behind an upgradeable proxy owned by one address (0x918d...99ad), with 1,756.73 BREAD of yield accrued; 550.44 BREAD sit in Superfluid contracts. The yield source and the distribution contracts were not read.

## Money markets, custody, streams, identity

Aave Gnosis 2026 reads Aave v3 on Gnosis: nine reserves; the USDC.e supply rate is about 0.001%. Safe Gnosis 2026 finds the Safe 1.4.1 singleton and factory on Gnosis. Superfluid Gnosis 2026 lists the Superfluid Gnosis addresses. DeFiLlama Stablecoins 2026 gives USDC circulating on Gnosis as $643,569, so the chain's stablecoin base is the xDAI family, not USDC. Circles Hub 2026 finds a 48.9 KB contract at the Circles candidate hub address with name "Circles".

## Not found

Gnosis Pay and Spark on Gnosis addresses (search row empty), and audit links for BREAD and Circles.
