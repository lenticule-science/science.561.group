---
title: "Liquidation"
date-created: 2026-08-27
aliases:
  - "liquidation"
description: "A venue-enforced reduction or closure of a margined position after its collateral no longer satisfies the applicable maintenance requirement."
references: {}
---

**Liquidation** is a forced reduction or closure of a leveraged or collateralized position after the account or position fails the venue's maintenance requirement.

The trigger is venue-specific. It can depend on position size, entry price, mark or oracle price, collateral composition, unrealized profit and loss, maintenance-margin tiers, fees, funding, and whether margin is isolated or shared. A simple inverse-leverage estimate can illustrate sensitivity, but it is not a liquidation price and should not replace the venue's formula.

With **isolated margin**, collateral assigned to one position generally limits the direct loss to that allocation, subject to venue rules. With **cross margin**, qualifying collateral and profit and loss are shared across positions, so stress in one position can consume resources supporting another. Liquidation may occur in stages and may include penalties, auction slippage, or an insurance-fund process.

In a hedged construction, forced closure of one leg can be more dangerous than an equal loss on both legs: the surviving leg becomes directionally exposed. [Oracle divergence](./oracle-divergence.md), liquidity gaps, funding charges, or delayed collateral transfers can therefore break an otherwise matched hedge before its intended horizon.

Liquidation risk is path-dependent. Eventual convergence or a correct long-run view does not protect a position that cannot meet its intermediate collateral requirements.
