---
title: "Mutual Credit and Trustline Protocols: Trustlines Network"
description: "How the Trustlines contracts store bilateral credit lines with per-direction interest, route payments by rippling along a supplied path, price imbalance, and the state of the project on 2026-10-08"
date-created: 2026-10-08
aliases:
  - "mutual-credit-and-trustline-protocols"
  - "trustlines-network-mechanisms"
keywords:
  - trustlines
  - mutual-credit
  - rippling
  - credit-lines
  - currency-network
teaches:
  - "Mutual Credit and Trustline Protocols: Trustlines Network"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  trustlinescontracts2026:
    authors:
      - Trustlines Contracts
    title: "trustlines-protocol/contracts: CurrencyNetwork, CurrencyNetworkBasic"
    year: 2026
    url: https://github.com/trustlines-protocol/contracts
  trustlinesstatus2026:
    authors:
      - Trustlines Status
    title: Trustlines organisation, website and docs status check
    year: 2026
    url: https://github.com/trustlines-protocol
---
Trustlines is the on-chain implementation of the idea that money is the netting of bilateral debts. It stores no token supply at all: the unit of a currency network is a signed number between two addresses, and the credit lines and interest rates between them decide how far it can move.

## The record

For each pair of addresses (the lower address is A) the contract holds creditlineGiven and creditlineReceived, both uint64 and set separately by each side; interestRateGiven and interestRateReceived, int16 in hundredths of a percent a year, also per direction; a frozen flag; and one signed balance, positive when B owes A, with the other direction its negation ([Trustlines Contracts 2026](https://github.com/trustlines-protocol/contracts)). The lines are set by agreement: updateTrustline records a request that the counterparty has to match, and closing a line requires first settling its balance by direct or triangular transfer. Interest accrues on the balance, compounded with a Taylor approximation when read.

Network parameters are fixed at initialisation: a default interest rate bounded to plus or minus 20 percent, whether custom interests are allowed, a flag that prevents a transfer from making an intermediary pay more interest than it receives unless the transfer only reduces debts, an expiry after which the network freezes, and the imbalance fee divisor ([Trustlines Contracts 2026](https://github.com/trustlines-protocol/contracts)).

## Payment by rippling

A payment is a path, supplied by the caller and computed off-chain by a relay: transfer(value, maxFee, path, extraData) shifts each hop's balance in turn, accumulating fees backwards from the receiver. The fee at each intermediary is 1 over the divisor times the imbalance the hop creates, so a hop that moves a line back toward balance pays nothing and one that pushes it toward its limit pays the most. Variants let the receiver pay the fees, or let a creditor pull a debt from a debtor along a path (debitTransfer). The cost of finding a path is outside the contract, so the contract needs no global graph and no consensus about topology; a bad path just reverts ([Trustlines Contracts 2026](https://github.com/trustlines-protocol/contracts)).

The version history ends on 2022-12-16 with version 3.0.0, which moved identities from Trustlines identity contracts to Gnosis Safes.

## Status on 2026-10-08

The organisation's repositories were last pushed in 2024 (documentation) and 2022-2023 (contracts, relay, clients and websites); nothing was pushed in 2025 or 2026. The network website answered with a 523 error and the docs host returned an empty body ([Trustlines Status 2026](https://github.com/trustlines-protocol)). DeFiLlama has no Trustlines listing, and no active user or volume figure was found from a first-party surface. The statement that can be made is that the code exists, is unchanged since 2022-12 and that the public surfaces read were down or empty.

## What it shows

It is the cleanest on-chain statement of mutual credit: per-direction limits, interest on a balance, fees that price imbalance, paths that ripple. It also shows the failure the idea has on-chain: with no issuer and no pool, there is nothing that anyone is paid to maintain, and the project's surfaces went dark. A pool with a yield stream under it pays someone to keep the lines liquid.
