---
description: A Tidepool pool read as a sheaf over the cover of the chains it lives on: each chain is a site holding a section of the pool's cells, and the inconsistency between sections is counted as held contradictions.
identity: site-sheaf
name: Site sheaf
date-created: 2026-10-08
relations:
  uses:
    - pay-the-meet
  requires:
    - ergodicity
---
A **site sheaf** is how Tidepool states one pool that lives on several chains. A chain (or other ledger) is a site. The pool's state on a site is a section of its predication cells, each carrying a four-valued charge folded from witnessed tellings. The pool is the sheaf over the cover of sites, and a site publishes a 32-byte section digest committing to its section for the others.

The cheap measure of how far the sections fail to glue is the count of held contradictions over the merge; the expensive measure is the rank of the first cohomology of the cellular sheaf, computed off-chain and told back as a cell, and the cheap number is a lower bound of the expensive one. Where two sites report a quantity differently the pool follows [pay the meet](./pay-the-meet.md). The cover rule is that the site cover must be a forest unless a withdrawal-consensus question carries the edge that closes a cycle; a forest cover is obstruction-free, and first Betti number zero is the on-chain check. Chains and assets being diverse is the pool's own substrate being decorrelated, which feeds the [decorrelation dividend](./decorrelation-dividend.md).

Specification: [Tidepool §2, The world model](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#2-the-world-model) and [§3 A7, Sites](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#a7-sites). Lean: `ObsmetrologiaEconomics.SiteCover.{isForest, forest_iff_h1_zero}`; `PricedNerve.legs_order_into_rank`.
