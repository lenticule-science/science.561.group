---
title: "Rate Markets and Collateral Baskets: Liquity v2, Reserve, Mento"
description: "How Liquity v2 lets each borrower set an interest rate and orders redemptions by that rate, how Reserve ranks losses (backing trades, staked RSR, then haircut), what Mento V3 states about oracle-priced FX stables, and their scale on 2026-10-08"
date-created: 2026-10-08
aliases:
  - "rate-markets-and-collateral-baskets"
  - "liquity-v2-reserve-mento"
keywords:
  - liquity
  - reserve-protocol
  - mento
  - stablecoin
  - interest-rate
  - redemption
  - first-loss
teaches:
  - "Rate Markets and Collateral Baskets: Liquity v2, Reserve, Mento"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  liquitybold2026:
    authors:
      - Liquity V2 Source
    title: "liquity/bold (Liquity v2): Constants.sol and README"
    year: 2026
    url: https://github.com/liquity/bold
  ratesdefillama2026:
    authors:
      - DeFiLlama Rate Markets
    title: "DeFiLlama reads: Liquity v2, Reserve Protocol, Mento v2, Sky Lending"
    year: 2026
    url: https://api.llama.fi/protocols
  reservesource2026:
    authors:
      - Reserve Protocol Source
    title: "reserve-protocol/protocol: overview, recollateralization docs, audits"
    year: 2026
    url: https://github.com/reserve-protocol/protocol
  mentodocs2026:
    authors:
      - Mento Docs
    title: "docs.mento.org: Mento V3 overview"
    year: 2026
    url: https://docs.mento.org/mento
  celochain2026:
    authors:
      - Celo Chain Reads
    title: Celo mainnet reads via forno.celo.org (block 79591962)
    year: 2026
    url: https://forno.celo.org
---
Three collateral-backed stablecoin systems carry mechanisms a pooled credit design can borrow: a market in which each borrower names a price for the right to stay out of redemption, a ranked list of who absorbs a loss, and a basket that can be defined by its holders.

## Liquity v2: the rate is the place in the queue

Each borrower sets their own annual interest rate between 0.5 and 250 percent on their position (a Trove). A change inside 7 days of the previous one costs an upfront fee of 7 days of interest at the system average rate. When BOLD is redeemed for collateral, the Troves with the lowest rates are redeemed first, with a fee floor of 0.5 percent and a base rate that starts at 100 percent and decays with a six-hour half-life, so redemptions start only when BOLD trades below about 0.95 ([Liquity V2 Source 2026](https://github.com/liquity/bold)). A borrower who pays a higher rate buys protection from redemption; a borrower who pays a low one accepts being redeemed against. Interest is minted: 75 percent to the Stability Pool and the rest to a yield router for liquidity incentives. Rates can be delegated to a manager within a band, and batch managers hold one rate for many positions and charge up to 10 percent a year. On severe collapse or an oracle failure a collateral branch shuts down, freezing borrowing and interest and opening redemptions with a 2 percent bonus.

This is a pool-pricing mechanism in the literal sense: the rate paid is discovered by borrowers bidding for position in a queue, and the pool's average rate sets the fee for changing it. DeFiLlama reads 100.3 million USD for v2 against a peak of 180.0 million, and 182.4 million for v1 ([DeFiLlama Rate Markets 2026](https://api.llama.fi/protocols)).

## Reserve: a ranked list of who loses

An RToken is an ERC-20 defined by a basket of collateral units; the BackingManager holds the collateral and rebalances through dutch auctions with a batch-auction fallback; a Furnace melts RTokens slowly to pay yield to holders; staked RSR (StRSR) is an overcollateralization layer that is seized when backing is short. When backing is short the order is: trade to restore backing, then seize staked RSR, then reduce the number of basket units the RToken is promised so that it is collateralized by definition, which is the haircut ([Reserve Protocol Source 2026](https://github.com/reserve-protocol/protocol)). StRSR warns that if all RSR is seized balances reset to zero. The repository lists audits by Ackee, Certora, Code4rena, Halborn and an Oak Security audit of 2026-03-12, and the implementations are immutable with proxies deployed per RToken. DeFiLlama reads 38.6 million USD (peak 529.7 million) ([DeFiLlama Rate Markets 2026](https://api.llama.fi/protocols)).

## Mento: FX at the oracle rate

The V3 documentation describes a decentralized exchange for onchain foreign exchange with fixed-price market makers that quote an oracle rate, with Chainlink the only oracle source, and with USDm and EURm backed by the Reserve and other stables such as GBPm backed by collateralized debt positions ([Mento Docs 2026](https://docs.mento.org/mento)). The page read does not give reserve composition or the Celo L2 transition text, and it names USDm rather than cUSD. Celo itself is an OP-stack L2 at chain id 42220, and the Mento Dollar contract at the old cUSD address now reads symbol USDm with a supply of 13.57 million ([Celo Chain Reads 2026](https://forno.celo.org)). DeFiLlama shows Mento V2 at 12.9 million USD against a peak of 858.7 million. Kolektivo's whitepaper proposed a modified Mento with a leverage parameter for partially backed community currencies.

## Sky Lending

Sky Lending reads 5.91 billion USD on Ethereum (peak 19.8 billion) ([DeFiLlama Rate Markets 2026](https://api.llama.fi/protocols)); its contracts were not read in this pass.

## For a member pool

The loss ordering (backing trades, then a first-loss stake, then a stated haircut) is the clearest model for writing down in advance who absorbs a shortfall. The redemption-by-rate queue is the clearest model for letting members price their own liquidity instead of the pool setting one price.
