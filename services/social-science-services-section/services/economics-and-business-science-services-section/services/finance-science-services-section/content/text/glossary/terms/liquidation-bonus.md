---
name: "Liquidation Bonus"
date-created: 2026-08-27
aliases:
  - "liquidation bonus"
  - "liquidation incentive"
  - "seize discount"
description: "The protocol-defined gross incentive offered for repaying or closing an unhealthy position and acquiring its collateral."
references: {}
---

A **liquidation bonus** or **liquidation incentive** is the gross economic reward a lending protocol offers for helping close an undercollateralized position. A liquidator repays an eligible amount of debt and receives collateral valued above that repayment, or acquires collateral at a protocol-defined discount.

The quoted bonus is not the liquidator's profit. Net profit also depends on transaction fees, priority payments, slippage while disposing of collateral, financing or flash-loan charges, failed attempts, price movement, and any auction or oracle-extractable-value mechanism. Protocol parameters may vary by collateral, debt asset, position health, market conditions, and governance decisions.

The incentive compensates external actors for monitoring positions, financing repayment, and competing to execute promptly. Permissionless access to a liquidation function does not imply equal access to its economics: latency, transaction ordering, capital, and execution reliability affect who captures the opportunity.

The mechanism connects [liquidation](./liquidation.md), [keeper networks](./keeper-network.md), and [maximal extractable value](./maximal-extractable-value.md).
