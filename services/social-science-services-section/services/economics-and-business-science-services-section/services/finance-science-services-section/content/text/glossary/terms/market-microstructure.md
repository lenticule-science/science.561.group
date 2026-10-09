---
name: "Market Microstructure"
date-created: 2026-09-05
aliases:
  - "market microstructure"
  - "microstructure"
description: "The study of how a trading venue's specific rules and information structure determine prices, spreads, and trading costs."
references:
  glostenmilgrom1985:
    authors: ["Lawrence R. Glosten", "Paul R. Milgrom"]
    title: "Bid, Ask and Transaction Prices in a Specialist Market with Heterogeneously Informed Traders"
    publication: "Journal of Financial Economics 14(1)"
    year: 1985
  kyle1985:
    authors: ["Albert S. Kyle"]
    title: "Continuous Auctions and Insider Trading"
    publication: "Econometrica 53(6)"
    year: 1985
---

**Market microstructure** is the study of how a market's specific trading mechanism — its order types, information disclosure, and the incentives of the participants who supply and demand liquidity — determines the prices actually observed, rather than treating price formation as a black box that simply reveals fundamental value. Two classic models anchor the field's treatment of the bid-ask spread. Glosten and Milgrom (1985) model a market maker who cannot distinguish an informed trader from a liquidity (noise) trader and sets bid and ask prices apart from the true expected value specifically to be compensated, on average, for the losses taken on trades against informed counterparties — the spread as adverse-selection insurance. Kyle (1985) instead models a single informed trader strategically sizing trades against market makers who set prices as a function of aggregate order flow, producing the price-impact result described in [market-impact](./market-impact.md).

These models explain why a [market-making](./market-making.md) participant's compensation and risk depend on the mix of informed and uninformed order flow it faces, why [maker-taker-fee](./maker-taker-fee.md) schedules exist as one lever venues use to attract liquidity-supplying order flow specifically, and why market impact and the width of the bid-ask spread are both, at root, consequences of the same information asymmetry rather than two unrelated frictions.

Microstructure effects operate on time scales from milliseconds to minutes, which is also the operating range of [high-frequency-trading](./high-frequency-trading.md); but the theory itself is scale-independent, describing the same adverse-selection and inventory mechanics whether the venue is a modern electronic limit order book or the specialist markets Glosten and Milgrom originally modeled.
