---
name: "Decentralized Hive Fund"
date-created: 2026-10-08
aliases:
  - "DHF"
  - "Hive proposal system"
description: "The Hive blockchain treasury account that pays stake-voted proposals a daily amount in HBD, capped at one percent of its HBD balance per day."
references: {}
---

The **Decentralized Hive Fund (DHF)** is the on-chain treasury of the Hive blockchain, the account hive.fund. It receives a share of inflation, proposal fees and stabilizer proceeds, converts a small fraction of its HIVE to HBD each hour, and pays active proposals a daily amount in HBD. Each proposal names a receiver, a daily pay and a start and end date; stakeholders vote with their staked HIVE, directly or through a proxy to a fixed depth. Proposals are paid in descending vote order until one percent of the treasury HBD balance for the day is spent; a standing return proposal asks for far more than the budget, so any proposal ranking below it receives nothing and funding is a contest against the return proposal's votes. Funding is by recurring daily pay, not by lump grants.
