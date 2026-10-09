---
description: The weight, and under a charter flag the payment, that a Tidepool pool gives each party for the reduction its outcome stream makes in the pool's pooled variance.
identity: decorrelation-dividend
name: Decorrelation dividend
date-created: 2026-10-08
relations:
  requires:
    - cooperation-premium
  uses:
    - ergodicity
---
The **decorrelation dividend** is Tidepool's way of rewarding the one thing the [cooperation premium](./cooperation-premium.md) depends on, members and sites whose outcomes are not perfectly correlated with the rest. Parties (members, cells, sites, pools) have per-cycle outcome streams told as cells. The reconciler computes, and the contract verifies against committed series digests, the pooled variance σ²_pool = (1/N²) Σᵢⱼ σᵢσⱼρᵢⱼ and each party's marginal reduction of it (the change when the party is removed).

The dividend is first a weight: allocation weight in [consensus by withdrawal](./consensus-by-withdrawal-allocation.md) and the matched-tally vote, reseed priority in the [reseed mutual](./reseed-mutual.md), and admission of a federation edge. It becomes a payment only by a charter flag that is off by default, because paying cash for reported outcome streams invites gaming while weighting is bounded. The two-party sharing rule μ₁ − 3σ₁²/4 < μ₂ − σ₂²/4 is the admission test for a reseed edge. Its falsifier is that the pooled variance reduction attributable to sites and pools is not positive over a year.

Specification: [Tidepool §3 B10, The Decorrelation Dividend](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#b10-the-decorrelation-dividend). Lean: `ObsmetrologiaEconomics.Decorrelation.{pooledVariance, marginalReduction, premium, shouldShare}`.
