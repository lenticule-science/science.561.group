---
title: "Uncollateralized Credit Protocols: Goldfinch, Maple, TrueFi, Clearpool, Credix"
description: "How Goldfinch tranches borrower pools into junior and senior, how its senior pool recognises losses and queues withdrawals, what Maple now states it lends against, and the peak-to-now decline of the uncollateralized lenders on DeFiLlama"
date-created: 2026-10-08
aliases:
  - "uncollateralized-credit-protocols"
  - "goldfinch-tranching"
keywords:
  - goldfinch
  - maple
  - truefi
  - clearpool
  - credix
  - uncollateralized-credit
  - tranching
teaches:
  - "Uncollateralized Credit Protocols: Goldfinch, Maple, TrueFi, Clearpool, Credix"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  goldfinchsource2026:
    authors:
      - Goldfinch Source
    title: "goldfinch-eng/mono: TranchedPool, SeniorPool, FixedLeverageRatioStrategy, UniqueIdentity"
    year: 2026
    url: https://github.com/goldfinch-eng/mono
  goldfinchdocs2026:
    authors:
      - Goldfinch Docs
    title: docs.goldfinch.finance front page
    year: 2026
    url: https://docs.goldfinch.finance/goldfinch/
  mapledocs2026:
    authors:
      - Maple Docs
    title: docs.maple.finance front page
    year: 2026
    url: https://docs.maple.finance/
  uncollateralizeddefillama2026:
    authors:
      - DeFiLlama Credit History
    title: "DeFiLlama reads: peak versus 2026-10-08 TVL for uncollateralized and mutual-risk protocols"
    year: 2026
    url: https://api.llama.fi/protocol/goldfinch
---
Uncollateralized on-chain lending is the attempt to make credit decisions without posted collateral, using an off-chain underwriter or a first-loss capital layer. It is the closest relative to a Tidepool member credit line, which is also extended without full collateral and also needs a loss rule.

## Goldfinch: a first-loss layer sized by a ratio

A Goldfinch borrower pool is a TranchedPool made of slices; each slice has a junior tranche (backers, who take first loss) and a senior tranche. The senior pool invests in the senior tranche of the latest slice through a strategy, and the fixed-leverage strategy sets senior capital as a configured multiple of the junior capital ([Goldfinch Source 2026](https://github.com/goldfinch-eng/mono)). Part of the senior interest goes to the junior tranche as a junior fee. The borrower's lateness drives a writedown: SeniorPool.writedown assesses the pool, computes a writedown percent, and spreads the loss through the senior pool's share price, reversing it if the borrower repays. Since protocol 3.0.0 (2022-11-30) senior-pool withdrawals are by epoch (request, cancel, claim), so lenders cannot exit instantly while loans are outstanding. Participation is gated through non-transferable identity tokens (Go and UniqueIdentity contracts).

The mechanics answer three questions any pooled credit design must answer: who takes the first loss (backers, sized by the leverage ratio), when is the loss recognised (writedown from lateness, reversible), and how can lenders leave (by epoch queue). The docs page read now describes a different product: Goldfinch Prime, a USDC-on-Base product investing in large private credit managers such as Ares, Apollo and Golub; it does not mention tranches, underwriting or defaults ([Goldfinch Docs 2026](https://docs.goldfinch.finance/goldfinch/)).

## Maple

Maple's documentation states that its yield comes primarily from fixed-rate, overcollateralized loans to institutional borrowers of short duration, supported by liquidity provision and futures basis trading; it presents Syrup as the route that opens the institutional marketplace to everyone ([Maple Docs 2026](https://docs.maple.finance/)). The page mentions no undercollateralized lending, pool delegates, defaults or losses. DeFiLlama reads Maple at 2.87 billion USD on 2026-10-08, against a peak of 3.25 billion on 2025-10-30 ([DeFiLlama Credit History 2026](https://api.llama.fi/protocol/goldfinch)).

## The decline of the smaller lenders

On the same dashboard the uncollateralized lenders read far below their peaks: Goldfinch 1.9 million USD against 53.5 million (2022-02-21); TrueFi 21.7 thousand against 814 million (2021-08-15); Clearpool Lending 0.2 million against 25.4 million (2022-04-12); Credix 1 USD against 5.0 million (2022-06-13) ([DeFiLlama Credit History 2026](https://api.llama.fi/protocol/goldfinch)). The dashboard states no cause. The only pattern the data supports is that the one large lender listed is the one that states it lends against collateral.

## For a member credit line

A first-loss tranche and a reversible writedown are portable; an off-chain underwriter and a legal borrower are not, since Tidepool's borrowers are its own members. The epoch queue for exits is the other portable part: it is how a pool avoids a run.
