---
aliases:
  - TWAB
description: A time-weighted average balance is an on-chain measure of how much of a token an account held for how long, computed from checkpointed balances so that it cannot be inflated by a one-block deposit.
identity: time-weighted-average-balance
name: Time-weighted average balance
date-created: 2026-10-08
---
A time-weighted average balance (TWAB) records each account's balance at its changes as cumulative checkpoints, so the average held over any interval is the difference of two cumulative values divided by the interval. PoolTogether v5 uses it to compute a depositor's chance of winning a prize: a user-specific pseudo-random number is compared with the user's TWAB share of the vault, and the vault's share of contributions, over a tier's look-back range ([ROSCA and Prize-Savings Protocols](../../documents/articles/notes/2026/10/08/2026-10-08-rosca-and-prize-savings-protocols.md)).

It is the manipulation-resistant answer to "who contributed how much for how long", and it differs from the snapshot used by simple token voting; compare [time-weighted voting power](./time-weighted-voting-power.md), which applies a similar idea to votes.
