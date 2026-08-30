---
title: "Perpetual Future"
date-created: 2026-08-27
aliases:
  - "perpetual future"
  - "perpetual swap"
  - "perp"
description: "A margined derivative without a fixed expiry whose venue uses funding and reference-price rules to support convergence with an underlying market."
references: {}
---

A **perpetual future** or **perpetual swap** is a derivative contract with no fixed expiration date. It gives leveraged long or short exposure to an underlying asset or index without requiring the holder to roll a dated contract.

Because expiry does not force the contract toward a settlement price, venues use a [funding-rate](./funding-rate.md) mechanism and mark or index prices to discourage persistent divergence from a reference market. Funding conventions, calculation intervals, collateral, settlement currency, and price sources vary by contract.

Perpetuals are margined instruments. Profit and loss, funding, fees, and collateral changes affect the account's ability to meet maintenance requirements. A trader can therefore be [liquidated](./liquidation.md) even when a longer-horizon thesis would later prove correct. Cross margin, isolated margin, partial liquidation, and insurance or loss-sharing mechanisms are venue-specific.

The instrument supports hedging, speculation, and [funding-rate arbitrage](./funding-rate-arbitrage.md), but it also introduces basis, funding, oracle, counterparty, liquidity, custody, and operational risk. Venue minimums, fee schedules, permitted jurisdictions, and broker availability are dated implementation facts and do not define the instrument.
