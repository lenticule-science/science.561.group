---
name: "Conviction Voting"
date-created: 2026-10-08
aliases:
  - "conviction voting"
  - "continuous proposal voting"
description: "A funding-allocation rule in which members stake tokens on proposals, the stake accumulates conviction over time by a decaying recursion, and a proposal executes when its conviction passes a threshold that rises with the share of the pool requested."
references: {}
---

**Conviction voting** is a funding-allocation rule without a vote deadline. Members stake tokens on the proposals they support; a proposal's conviction is a recursion that adds stake each block and decays the old total by a factor a below 1, so stake held for ever converges to stake over (1 - a); a proposal executes once its conviction exceeds a threshold proportional to total stake over (1 - a) and to 1 over the square of (maxRatio minus the fraction of the pool requested).

It differs from a deadline vote in that preferences are expressed continuously and can be withdrawn, and from [quadratic funding](./quadratic-funding.md) in that it allocates a held [common pool](./common-pool-resource.md) by stake over time rather than a matching pool by contributor count. Its deployed forms, parameters, the Gnosis Chain 1Hive instance's activity by year, the Gardens v2 accounting bugs and what it does not do are in [Conviction Voting as Deployed](../../../../../finance-science-services-section/content/text/documents/articles/notes/2026/10/08/2026-10-08-conviction-voting-deployed.md).
