---
aliases:
  - broodfund
  - solidarity-ratio mutual
description: A Broodfonds is a Dutch mutual-aid fund in which a small closed group of self-employed people each pay a monthly contribution into individual accounts and, when one falls ill, the others gift that member a monthly benefit out of their accounts, so that no insurer holds the risk.
identity: broodfonds
name: Broodfonds
date-created: 2026-10-08
references:
  breadchainsafetynetsource2026:
    authors:
      - Breadchain Safety Net Source
    title: "BreadchainCoop/safety-net: SafetyNet, DelegatedSafetyNet, DEPLOYMENTS.md (commit 2026-07-07)"
    year: 2026
    url: https://github.com/BreadchainCoop/safety-net
---
A Broodfonds is a Dutch mutual-aid fund in which a small closed group of self-employed people each pay a monthly contribution into individual accounts and, when one falls ill, the others gift that member a monthly benefit out of their accounts, so that no insurer holds the risk.

Breadchain's Safety Net contract implements the pattern on Gnosis Chain: a member's deposit is credited to a shared pool and a withdrawable balance of deposit times a ratio of 1 to 25 is credited to the member; the effective ratio is capped by an actuarial rule, 1 / (p + z * sqrt(p(1-p)/N)) with sick share p = 2% and z = 1.65 over N members, and by a six-month runway of the pool; withdrawal requests can be contested; a shortfall at wind-down is settled pro rata (Breadchain Safety Net Source 2026). The ratio is the member's leverage on the group's pooling: at ratio 1 the account is fully backed and the contract is a savings account; above 1 the excess is a claim on other members. See [rotating savings and credit association](../../../../../economics-science-services-section/content/text/glossary/terms/rotating-savings-and-credit-association.md) for the lump-sum counterpart and [crowdstaking](../../../../../economics-science-services-section/content/text/glossary/terms/crowdstaking.md) for the yield-routing counterpart.
