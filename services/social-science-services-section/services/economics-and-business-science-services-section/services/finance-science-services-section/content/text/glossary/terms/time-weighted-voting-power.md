---
aliases:
  - balance-time voting
  - checkpoint-integral voting power
description: Time-weighted voting power gives a holder a vote equal to the integral of their token balance over a past window, so that votes measure how much and how long a balance was held rather than the balance at the moment of voting.
identity: time-weighted-voting-power
name: Time-weighted voting power
date-created: 2026-10-08
references:
  breadchainfundsource2026:
    authors:
      - Breadchain Fund Source
    title: "BreadchainCoop/solidarity-fund: YieldDistributor, ButteredBread, VotingMultipliers (commit 2026-03-13)"
    year: 2026
    url: https://github.com/BreadchainCoop/solidarity-fund
  crowdstakesource2026:
    authors:
      - Crowdstake Source
    title: BreadchainCoop/crowdstake.fun and O.U.R.COOP fork (commit 2026-07-12)
    year: 2026
    url: https://github.com/BreadchainCoop/crowdstake.fun
---
Time-weighted voting power gives a holder a vote equal to the integral of their token balance over a past window, so that votes measure how much and how long a balance was held rather than the balance at the moment of voting.

Breadchain's YieldDistributor sums checkpoint balance times blocks over the previous cycle's window, so a deposit made now cannot vote until the next cycle (Breadchain Fund Source 2026); its crowdstake framework offers a variant that averages over the current cycle so far (Crowdstake Source 2026). Both defend against the flash-loan or last-minute-deposit capture that a balance snapshot invites, and both remain coin-weighted: ten times the balance is ten times the vote. A window integral is a cheap sybil-cost, not a sybil defence. See [crowdstaking](../../../../../economics-science-services-section/content/text/glossary/terms/crowdstaking.md).
