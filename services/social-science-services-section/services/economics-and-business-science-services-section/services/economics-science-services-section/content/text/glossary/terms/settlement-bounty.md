---
description: An escrow posted against a contested or unknown cell that pays a claimant who tells a settlement report which a determinate settlement cell then references and the poster admits.
identity: settlement-bounty
name: Settlement bounty
date-created: 2026-10-08
relations:
  requires:
    - attention-worklist
---
A **settlement bounty** puts a price on resolving a held contradiction or an unknown. The poster escrows against a cell whose charge is contradictory or unknown; a claimant tells a digest of a settlement report; payout happens if and only if a determinate settlement cell references the digest and the poster tells admission, the two-witness condition. A bounty the poster never admits is itself a held contradiction, public, and releasable by [consensus by withdrawal](./consensus-by-withdrawal-allocation.md). The reserve takes a fee on payout, and outsiders, not only members, may post. The mechanism converts an item on the [attention worklist](./attention-worklist.md) into paid work without giving the poster unilateral power to refuse a valid settlement and keep the escrow indefinitely.

Specification: [Tidepool §3 B5, The Settlement Bounty](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#b5-the-settlement-bounty). Lean: `AttentionAllocation`; `ObsmetrologiaEconomics.Bounty.payout_iff_two_witness`.
