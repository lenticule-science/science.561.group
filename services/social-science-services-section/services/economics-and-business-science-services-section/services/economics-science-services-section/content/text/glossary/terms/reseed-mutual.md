---
description: A Tidepool reserve-funded mutual that, on a computed breach of a member's declared barrier and absent a denial, re-seeds principal into the member's sleeve, up to a cap, at the pool's discretion.
identity: reseed-mutual
name: Reseed mutual
date-created: 2026-10-08
relations:
  requires:
    - absorbing-barrier
    - cooperation-premium
  uses:
    - tally-credit
---
The **reseed mutual** moves a member's [absorbing barrier](../../../../../finance-science-services-section/content/text/glossary/terms/absorbing-barrier.md) onto the pool. A member whose sleeve is below its declared barrier, with an obligation due within the lead time, may claim. The breach is computed from the barrier series, not argued; any member or steward may deny within the window, which makes the claim a held contradiction for a daimon; otherwise the mutual re-seeds min(cap, barrier − balance) as principal into the sleeve. The mutual is discretionary, with no contractual right to payout, and is funded from the reserve. Its cap reuses the actuarial throttle of the broodfonds family, an effective ratio bounded by 1/(p + z√(p(1−p)/N)), with p the pool's own measured default rate. The two-party sharing rule of the [cooperation premium](./cooperation-premium.md) is the admission test for a reseed edge between sleeves and between pools. Its falsifier is that a running pool fails to re-seed a ruined sleeve more often than the same money held individually would have absorbed the ruin.

Specification: [Tidepool §3 B4, The Reseed Mutual](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#b4-the-reseed-mutual). Lean: `ObsmetrologiaEconomics.Reseed.{payout, payout_le_cap, reserve_stays_above_barrier}`; `ObsmetrologiaEconomics.Decorrelation.shouldShare`.
