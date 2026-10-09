---
aliases:
  - solidarity primitive (Breadchain)
description: Crowdstaking is Breadchain Cooperative's name for a mechanism in which a person deposits a stablecoin, receives a token redeemable one-for-one for it, and the deposit is held in a yield-bearing vault whose yield goes not to the holder but to a shared fund distributed on a cycle among member projects.
identity: crowdstaking
name: Crowdstaking
date-created: 2026-09-05
references:
  breadchain2026:
    authors:
      - Breadchain Cooperative
    title: Crowdstaking, the BREAD token, and yield governance (documentation as fetched 2026-09-05)
    year: 2026
    publisher: Breadchain Cooperative
    url: https://docs.bread.coop/solidarity-primitives/crowdstaking/
---
Crowdstaking is Breadchain Cooperative's name for a mechanism in which a person deposits a stablecoin, receives a token redeemable one-for-one for it, and the deposit is held in a yield-bearing vault whose yield goes not to the holder but to a shared fund distributed on a cycle among member projects. BREAD runs on Gnosis Chain, backed one-to-one by xDAI held as sDAI; minting is called baking and redeeming is called burning; the monthly sDAI yield is split half evenly across all member projects and half by a vote weighted by each holder's average BREAD balance over the month.

It differs from staking in that the deposit secures no network and earns the holder nothing, from a donation in that the principal stays redeemable, and from a yield-bearing stablecoin in that the yield is directed away from the holder by design. Its fee, stablecoin-risk, vault-risk, and legal-form disclosures must be checked before treating it as a model for a public offering.

The issued token is the part of the mechanism that United States law treats as payment-stablecoin issuance, so a domestic design keeps the yield direction and the cycle split and drops the token, leaving each member's principal in their own account with only the yield routed. That is Tidepool's design, specified in the [economic specification](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/09/05/2026-09-05-specification-of-the-directed-yield-pool-economics.md) of the same day: a member-held vault position with the yield routed by the member's own transaction, and the pool's split of that yield into reserve, float, and the cycle distribution. The mechanism is the newest member of the lineage the [rotating savings and credit association](./rotating-savings-and-credit-association.md) began, and its cycle split is one answer to the allocation problem [quadratic funding](./quadratic-funding.md) states generally.

Contract-level measurements of the deployed Bread implementation, read 2026-10-08, are in [the Breadchain teardown](../../../../../finance-science-services-section/content/text/documents/articles/notes/2026/10/08/2026-10-08-breadchain-cooperative-teardown.md): the token is minted one-to-one for xDAI into the sDAI vault, the YieldDistributor splits each 30-day distribution in two halves (equal, and by previous-cycle time-weighted vote), 25 claims have moved 64,180.45 BREAD since 2024-07-01, and a 5-of-12 Safe without a timelock holds upgrade authority over the token and the distributor.
