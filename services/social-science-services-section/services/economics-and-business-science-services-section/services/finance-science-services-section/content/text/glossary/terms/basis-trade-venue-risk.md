---
title: "Basis-Trade Venue Risk"
date-created: 2026-08-27
aliases:
  - "basis-trade venue risk"
description: "Counterparty, margin, settlement, custody, transfer, and operational risks retained when the legs of a basis trade depend on one or more venues."
references: {}
---

**Basis-trade venue risk** is the collection of risks retained because one or both legs of a [basis trade](./basis-trade.md) depend on an exchange, broker, custodian, clearing system, bridge, or protocol. Offsetting market exposure does not offset failure of the infrastructure holding or settling the positions.

The main channels include:

1. **Margin and liquidation risk:** the margined leg can be reduced or closed while the other leg survives.
2. **Reference and settlement risk:** an index, oracle, mark price, delivery rule, or settlement currency can differ from the hedge's executable market.
3. **Counterparty and custody risk:** assets can be frozen, lost, delayed, haircut, or made inaccessible by insolvency, exploit, legal action, or operational failure.
4. **Transfer risk:** collateral can arrive late, a bridge or banking rail can fail, or withdrawal controls can prevent rebalancing.
5. **Execution and liquidity risk:** spreads, market impact, order rejection, outages, and position limits can prevent matched entry or exit.
6. **Fee and financing risk:** fixed and variable charges, borrow availability, funding, and collateral remuneration can change the trade's net carry.

Using multiple venues can reduce concentration while adding transfers, reconciliation, collateral fragmentation, and more failure surfaces. Controls include explicit counterparty limits, segregated records, independent position and cash reconciliation, collateral buffers, tested transfer paths, settlement-calendar awareness, and preplanned unwind procedures.

The relevant return is the basis captured after these costs and losses—not the quoted spread in isolation.
