---
name: "Proof of Authority"
date-created: 2026-10-08
aliases:
  - "proof of authority"
  - "PoA"
  - "authority set consensus"
description: "A consensus arrangement in which a small, curated set of identified validators produce blocks, with security resting on their accountability and on the cost of replacing them, not on stake-weighted economic penalty."
references: {}
---

In **proof of authority**, block production is limited to a named, bounded set of validators. Adding or removing a validator is a governance act, and the set is small enough (in Regen Ledger, 11) that each validator is a known operator.

Liveness depends on the set: with a two-thirds voting-power threshold for finality, losing three of eleven validators in one upgrade left the chain a few percentage points above the point where it halts. Token issuance no longer needs to pay for security, so emission can be set to zero, but then validator operating costs must be met from fees or a treasury.

The arrangement trades the open entry of proof of stake for predictability and low cost, and moves the question of who may validate into the same governance process that handles everything else.
