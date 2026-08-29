---
title: "Intraday Margin"
date-created: 2026-08-27
aliases:
  - "intraday margin"
  - "intraday margin deficit"
description: "Margin availability and requirements measured from positions and transactions within the trading day rather than only at the prior close."
references: {}
---

**Intraday margin** refers to credit availability, collateral requirements, and deficits measured as positions change within a trading day. It recognizes that an account can create and close substantial exposure between end-of-day snapshots.

An intraday calculation can incorporate account equity, long and short positions, concentration, volatility, liquidity, security eligibility, open orders, and house or regulatory requirements. A broker may reject an order, reduce buying power, issue a call, liquidate positions, or restrict new exposure when the account does not meet the applicable requirement.

Terms such as **intraday margin level**, **day-trading buying power**, and **intraday margin deficit** are rule-set-specific. Their formulas, cure periods, de minimis thresholds, and exclusions must be read from the governing rule and broker implementation in force for the account.

Intraday margin is distinct from ordinary cash availability. A trade can be cash-covered yet affect a broker's risk calculation, while displayed buying power can include credit that is neither settled cash nor withdrawable funds. Accounting and execution systems should preserve those quantities separately.
