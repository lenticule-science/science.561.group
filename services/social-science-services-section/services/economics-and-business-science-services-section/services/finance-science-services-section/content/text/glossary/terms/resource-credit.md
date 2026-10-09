---
name: "Resource Credit"
date-created: 2026-10-08
aliases:
  - "RC"
  - "Hive resource credits"
description: "A regenerating allowance of blockchain bandwidth and computation, proportional to staked tokens, spent instead of a per-transaction fee."
references: {}
---

A **resource credit (RC)** is a non-transferable allowance that an account spends when it sends transactions on the Hive blockchain; it replaces a per-transaction fee. An account's maximum equals its staked VESTS in micro-units and regenerates over five days, can be delegated to other accounts, and each operation costs an amount derived from pool levels for history, state, market and execution resources. A custom_json operation costs about the same as a transfer. Systems layered on the chain, such as Magi, copy the idea with allowances tied to HBD held. The design makes a message cheap for a holder and impossible for an account with no stake and no delegation.
