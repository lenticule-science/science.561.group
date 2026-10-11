---
name: "Merkle Payout Vault"
date-created: 2026-10-08
aliases:
  - "merkle distributor vault"
  - "root-per-epoch payout"
description: "A contract that holds funds and pays each claimant on presentation of a merkle proof against a root an administrator posts once per epoch."
references: {}
---

A **merkle payout vault** keeps balances in one contract and stores one merkle root per epoch. Each claimant submits an amount and a proof; the contract checks the proof against that epoch's root and pays. The reward arithmetic happens off chain, and the chain verifies only that a claim belongs to the posted tree.

Octant v1 uses this: a multisig sets each epoch's root once and the same multisig can withdraw an emergency amount. The design makes payouts cheap and auditable after the fact, and puts all trust in whoever computes and posts the root. See [yield donation](./yield-donation.md).
