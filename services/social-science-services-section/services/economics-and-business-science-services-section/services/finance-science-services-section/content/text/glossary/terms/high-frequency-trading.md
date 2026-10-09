---
name: "High-Frequency Trading"
date-created: 2026-09-05
aliases:
  - "high-frequency trading"
  - "HFT"
description: "Trading strategies operating on very short time horizons using high-speed infrastructure, typically market-making or latency-sensitive arbitrage."
references: {}
---

**High-frequency trading (HFT)** describes strategies that operate on very short time horizons — from microseconds to seconds — and depend on infrastructure built to minimize the time between observing market information and acting on it: co-located servers physically near an exchange's matching engine, low-latency network connections, and hardware or software built specifically to shave processing time. The strategies run at this speed are not one uniform activity: a large share of HFT activity is electronic [market-making](./market-making.md), continuously posting and updating bid and ask quotes and profiting from the spread and rebates while managing inventory risk at very high turnover; a separate share is latency arbitrage, acting on a price discrepancy between two venues or instruments before it disappears, which depends specifically on being faster than other participants doing the same thing.

Because HFT strategies interact directly with [market-microstructure](./market-microstructure.md) — they are frequently the market makers whose quoting behavior the Glosten-Milgrom and Kyle models describe, and frequently the counterparties whose speed determines who bears adverse selection in a given trade — HFT firms are commonly named as the practical face of microstructure theory rather than a separate topic from it.

Citadel Securities, Jane Street, and Jump Trading are commonly cited firms operating market-making and other latency-sensitive strategies at this speed across equities, options, and, in some cases, crypto markets; each also runs other lines of business beyond HFT specifically (Jane Street runs broader proprietary quantitative trading, and Citadel Securities' affiliate Citadel runs a separate multi-strategy hedge fund), so "an HFT firm" describes one activity a firm engages in rather than a complete description of the firm.
