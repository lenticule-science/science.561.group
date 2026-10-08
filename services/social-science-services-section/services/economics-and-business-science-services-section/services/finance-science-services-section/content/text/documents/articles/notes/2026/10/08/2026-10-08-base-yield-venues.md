---
title: "Base Yield Venues"
description: "Contract addresses, TVL, rates, fees, timelocks and admin models of the Base venues that can hold pooled USDC: Morpho, Aave, Spark, Compound, Moonwell, Euler, Uniswap v4, Aerodrome"
date-created: 2026-10-08
aliases:
  - "base yield venues"
keywords:
  - defi
  - base
  - erc-4626
  - lending
teaches:
  - "Base Yield Venues"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  morphocontracts2026:
    authors:
      - Morpho Contracts
    title: Morpho Blue, MetaMorpho and Vault V2 deployments on Base (read with cast and Sourcify)
    year: 2026
    url: https://docs.morpho.org/get-started/resources/addresses/
  morphoapi2026:
    authors:
      - Morpho API
    title: Morpho GraphQL API vault listing for chain 8453
    year: 2026
    url: https://api.morpho.org/graphql
  defillamaprotocols2026:
    authors:
      - DeFiLlama Protocols
    title: DeFiLlama protocols endpoint, chainTvls for Base, read 2026-10-08
    year: 2026
    url: https://api.llama.fi/protocols
  aavepool2026:
    authors:
      - Aave Pool
    title: "Aave v3 Base market: Pool, PoolAddressesProvider, USDC reserve, governance executor"
    year: 2026
    url: https://github.com/bgd-labs/aave-address-book/blob/main/src/AaveV3Base.sol
  sparkpsm2026:
    authors:
      - Spark PSM
    title: Spark PSM3, sUSDS and Savings USDC vault on Base
    year: 2026
    url: https://github.com/sparkdotfi/spark-psm
  compoundcomet2026:
    authors:
      - Compound Comet
    title: Compound III USDC Comet on Base
    year: 2026
    url: https://github.com/compound-finance/comet
  moonwellcore2026:
    authors:
      - Moonwell Core
    title: Moonwell Comptroller and Flagship vault on Base
    year: 2026
    url: https://github.com/moonwell-fi/moonwell-contracts-v2
  eulervault2026:
    authors:
      - Euler Vault Kit
    title: Euler v2 EVC and EVK GenericFactory on Base
    year: 2026
    url: https://github.com/euler-xyz/euler-vault-kit
  uniswapv4core2026:
    authors:
      - Uniswap v4 Core
    title: Uniswap v4 PoolManager on Base and Hooks.sol permission flags
    year: 2026
    url: https://github.com/Uniswap/v4-core
  aerodromecontracts2026:
    authors:
      - Aerodrome Contracts
    title: Aerodrome v1 and Slipstream contracts on Base
    year: 2026
    url: https://github.com/aerodrome-finance/slipstream
  defillamayields2026:
    authors:
      - DeFiLlama Yields
    title: DeFiLlama yields pools endpoint, Base USDC and USDS pools, read 2026-10-08
    year: 2026
    url: https://yields.llama.fi/pools
---

This note states what first-party reads of Base contracts, the Morpho API and DeFiLlama (all on 2026-10-08) establish about the places a cooperative pool can hold USDC and earn a yield.

## Morpho

Morpho Contracts 2026 finds Morpho Blue at 0xBBBB...EFFCb on Base, owned by a Safe with a 5 signature threshold and 9 owners. Two MetaMorpho factories are live, v1.0 and v1.1, and a Vault V2 factory is live at 0x4501...5857. The Vault V2 factory has no Sourcify match, the vaults it creates do. The largest Vault V2 on Base is Steakhouse High Yield USDC Edition with 459.26M USDC, a 25% performance fee, no management fee, one adapter, and a 3 day timelock on adding adapters. The largest MetaMorpho v1 is Gauntlet USDC Prime with 414.48M USDC, zero fee and a 7 day timelock.

Morpho API 2026 gives the ranked list. Vault V2 totals on Base: Steakhouse High Yield USDC Edition $459.1M, Steakhouse Prime USDC $272.2M, Grove x Steakhouse USDC $196.0M, Gauntlet USDC Prime $177.1M. Vault V1 netApy for the large USDC vaults sits between 3.45% and 4.62%. DeFiLlama Protocols 2026 puts Morpho Blue at $4.40B of Base TVL, with the curators Steakhouse ($1.04B) and Gauntlet ($611M) above Aave.

Every one of these vaults is an ERC-4626 share token, so a pool can hold its principal as vault shares and read its balance with convertToAssets. The vault owner, curator and guardian are separate roles; the curator cannot withdraw depositors' funds, and a timelock gates risk increases.

## Aave v3, Spark, Compound, Moonwell, Euler

Aave Pool 2026 reads the Base market: the pool is an upgradeable proxy administered by the Aave Governance V3 level-1 executor; USDC pays 4.49% supply and 5.49% variable borrow; the aToken holds 181.2M USDC. The address book lists an Aave V4 equities hub on Base. No Umbrella contract exists for Base mainnet (the search row for it is empty).

Spark PSM 2026 reads the Spark stack: PSM3 holds 3.05M of assets and swaps USDC, USDS and sUSDS; the savings rate oracle gives 3.80% APY; sUSDS has 10.83M supply on Base; sUSDC vault holds 5.76M USDC.

Compound Comet 2026 reads Comet: 9.56M USDC supplied, 8.70M borrowed, 91% utilization, 6.46% annualized supply rate, behind a Timelock with a 1 day delay.

Moonwell Core 2026 reads Moonwell: the Comptroller lists 21 markets and answers to a Temporal Governor; DeFiLlama counts $10.9M. Euler Vault Kit 2026 reads Euler v2: the connector and a factory of 432 vault proxies on Base, $16.0M of Base TVL.

## Exchange liquidity

Uniswap v4 Core 2026 reads the v4 PoolManager (owner is a cross-chain account) and the hook permission bits: the low 14 bits of a hook address encode which callbacks the manager invokes. Aerodrome Contracts 2026 reads Aerodrome: the voter, escrow, router and Slipstream factory are verified; two Aerodrome protocols hold $352.9M of Base TVL combined.

## Numbers by source

DeFiLlama Yields 2026 lists Base USDC pools: Aave 4.37%, Compound 6.07%, Spark savings 3.80%, Fluid 9.31%, Euler 6.13%. DeFiLlama's tvlUsd for Aave USDC ($16.9M) differs from the aToken supply read on-chain ($181.2M), because the listed number is net of borrows.

## Not found

Umbrella on Base mainnet; production Uniswap v4 hooks on Base were not enumerated; Euler USDC vault addresses on Base, Moonwell mUSDC totals and the Aerodrome voter governance addresses were not read.
