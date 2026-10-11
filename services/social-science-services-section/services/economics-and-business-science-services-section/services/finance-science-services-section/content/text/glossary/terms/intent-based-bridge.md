---
name: "Intent-Based Bridge"
date-created: 2026-10-08
aliases:
  - "intents bridge"
  - "solver-settled bridge"
description: "A cross-chain transfer in which a user states the desired outcome and a solver supplies the destination funds, later repaid through a settlement layer."
references: {}
---

An **intent-based bridge** lets a user commit funds on the origin chain and state the result wanted on the destination; a competing relayer or solver supplies the destination funds immediately from its own capital and is repaid after a settlement process proves the fill. The user's risk is the solver's performance within a deadline and the origin escrow's refund rule; the solver's and liquidity providers' risk is the settlement layer, for example bonded bundles with an optimistic dispute window. Standards such as ERC-7683 describe the order format and do not fix the settlement security.
