---
description: The gain in time-average growth rate that entities obtain by pooling and sharing resources every step under multiplicative growth, (σ²/2)(1 − 1/N) for N entities with independent fluctuations of volatility σ.
identity: cooperation-premium
name: Cooperation premium
date-created: 2026-10-08
references:
  petersadamou2018:
    authors:
      - Ole Peters
      - Alexander Adamou
    title: An evolutionary advantage of cooperation
    year: 2018
    publication: arXiv:1506.03414v2
    url: https://arxiv.org/abs/1506.03414
relations:
  requires:
    - ergodicity
  uses:
    - volatility-drag
---
The **cooperation premium** is the difference between the time-average growth rate of an entity that pools and shares resources with others every step and that of an entity that does not, in the model of Peters and Adamou (Peters & Adamou 2018). With multiplicative noisy growth of drift μ and volatility σ, a non-cooperator grows at g = μ − σ²/2 and N cooperators who pool and share every step grow at g = μ − σ²/(2N); the premium is (σ²/2)(1 − 1/N). It rises with N, so larger cooperatives are favored, and it approaches σ²/2 as N grows. The premium is the [volatility drag](../../../../../finance-science-services-section/content/text/glossary/terms/volatility-drag.md) that pooling removes, so it is a property of the [ergodicity](./ergodicity.md) gap and not of any complementarity between members.

With pairwise correlation ρ between members' fluctuations the many-cooperator limit is μ − σ²ρ/2, so the premium is σ²(1 − ρ)/2 in the limit and is zero when fluctuations are perfectly correlated; the source states that cooperation relies on diversity in individual outcomes. See [pooling as a manufactured ensemble](../../documents/articles/notes/2026/10/08/2026-10-08-note-on-pooling-as-a-manufactured-ensemble.md) for the statement with its source language. A [decorrelation dividend](./decorrelation-dividend.md) is the protocol's measure of who supplies that diversity.

Specification: [Tidepool §1, Thesis](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#1-thesis). Lean: `ObsmetrologiaEconomics.Decorrelation.premium`, `premium_nonneg`, `premium_zero_iff_perfect_correlation` (declared in the roadmap, not yet written).
