---
description: The per-cycle selection of held contradictions and stale half-tallies a Tidepool pool chooses to resolve, each an obstruction with a cost and a benefit, selected as the optimum under the cycle's budget and verified on-chain.
identity: attention-worklist
name: Attention worklist
date-created: 2026-10-08
relations:
  uses:
    - tally-credit
    - pay-the-meet
---
The **attention worklist** is the pool's queue of its own unresolved business. Every held contradiction and every [tally credit](../../../../../monetary-economics-science-services-section/content/text/glossary/terms/tally-credit.md) half-tally older than the settlement window is an obstruction with a cost (to resolve) and a benefit (the frozen mass). Each cycle the pool tells its attention budget and an attested optimal selection, computed off-chain by the allocation solver and judged by the existing golden vectors. The contract must verify that a submitted selection is feasible and dominates any challenger, and must disclose the number of choice bits, the degree to which the optimum is not unique. The solver maximizes benefit under a cost budget; it says nothing about equal treatment of members, and it is exponential in the universe, so it specifies small on-chain selections only. An [algedonic cell](./algedonic-cell.md) jumps to the top of the worklist.

Specification: [Tidepool §3 B9, The Worklist and the algedonic channel](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#b9-the-worklist-and-the-algedonic-channel). Lean: `AllocationSolver.{solveL_optimal, solvers_agree_value, choiceBits_zero_iff_effectively_unique}`.
