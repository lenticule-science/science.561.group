---
name: "Keeper Network"
date-created: 2026-08-27
aliases:
  - "keeper network"
  - "automation network"
  - "keeper bot"
description: "External actors and coordination mechanisms that submit state-changing transactions when smart-contract conditions or schedules require maintenance."
references: {}
---

A **keeper** is an off-chain actor that observes a system and submits a transaction when an on-chain application needs maintenance it cannot initiate by itself. Typical work includes [liquidations](./liquidation.md), order execution, interest or reward updates, collateral checks, and scheduled vault operations.

A **keeper network** coordinates one or more such actors. Admission may be permissionless, bonded, allowlisted, or operated by a designated service. Compensation may be a fixed fee, reimbursement, competitive bounty, auction result, subscription payment, or an indirect opportunity such as a [liquidation bonus](./liquidation-bonus.md). Therefore, “keeper” describes a function, not a uniform labor market or access model.

A keeper's net economics include monitoring and node costs, transaction fees, failed or superseded calls, capital and financing, latency, and penalties. A public callable function does not guarantee profitable execution because several actors can compete for the same state transition.

System controls should address missed execution, duplicate execution, stale observations, gas-price spikes, chain reorganization, key compromise, operator concentration, and incentive failure. Idempotent contract logic, multiple independent operators, bounded permissions, monitoring, and safe fallback procedures reduce dependence on any one keeper.
