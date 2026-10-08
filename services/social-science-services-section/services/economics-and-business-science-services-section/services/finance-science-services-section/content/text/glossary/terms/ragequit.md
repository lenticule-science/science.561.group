---
name: "Ragequit"
date-created: 2026-10-08
aliases:
  - "ragequit"
  - "rage quit"
  - "pro-rata exit"
description: "A member's right to burn membership tokens at any time and withdraw a pro-rata share of the treasury, used in Moloch-family DAOs as the exit that makes majority spending votes survivable."
references: {}
---

**Ragequit** is the exit right introduced by the Moloch DAO family. A member burns voting shares, non-voting loot, or both, and receives from the treasury the fraction `burned / (total shares + total loot)` of each token they name. The payout is computed from the treasury balance at the moment of the call, so it is a claim on assets, not on a promised value.

The right is paired with a delay between a vote ending and its execution, so that a member who objects to a passed proposal can leave with their share before the proposal spends. In Baal, the Moloch v3 implementation, the exit call itself has no time restriction, and a proposal also fails automatically if enough members have left during its vote that total shares plus loot fall under the DAO's minimum retention percent.

Ragequit bounds what a majority can take from a minority, at the cost of making the treasury run-prone: an exit by many members at once shrinks the pool that every remaining member's later exit is computed from, and a treasury holding illiquid or vesting assets can only pay out what the contract actually holds.
