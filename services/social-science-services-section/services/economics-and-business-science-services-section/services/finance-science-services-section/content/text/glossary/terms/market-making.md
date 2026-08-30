---
title: "Market Making"
date-created: 2026-08-28
aliases:
  - "market making"
  - "market maker"
description: "Supplying executable buy and sell liquidity while managing inventory, adverse selection, execution costs, and operational risk."
references: {}
---

**Market making** is the activity of supplying executable liquidity on both sides of a market. An order-book market maker posts bids and offers; an automated market maker supplies inventory to a pricing curve. Both forms exchange immediacy for compensation while accepting inventory and information risk.

The quoted spread is not guaranteed profit. A market maker earns only on orders that execute, and subsequent price movement can show that its quote traded against better-informed or faster counterparties. Net results include realized spread, fees or rebates, inventory gains and losses, hedging costs, adverse selection, queue position, cancellations, failed executions, financing, and technology and operational costs.

Quote width and size respond to volatility, inventory, liquidity, information asymmetry, risk limits, and competition. Tighter quotes can win more flow but provide less compensation per trade and greater exposure to adverse selection. Inventory controls may skew quotes, reduce size, hedge elsewhere, or stop quoting.

Order-book and AMM market making share the inventory problem but differ operationally. Order books require quote placement, cancellation, priority, and latency management. AMMs encode pricing and inventory changes in a contract and expose providers to pool-specific fees, [divergence loss](./impermanent-loss.md), and transaction-ordering effects. Neither form is defined by a particular account size, fee schedule, or access claim.
