---
name: "Dragon Router"
date-created: 2026-10-08
aliases:
  - "donation router"
  - "dragonRouter"
description: "In Octant v2 strategies, the address that receives the shares minted from a strategy's profit and that absorbs losses first when burning is enabled."
references: {}
---

A **dragon router** is the single address stored in an Octant v2 yield-donating strategy to receive profit shares. When a keeper calls the strategy's report function, new total assets minus old total assets is profit, and shares worth that profit are minted to the router. On a loss, the router's shares are burned first if burning is enabled, so donors absorb loss before depositors do.

The router can only be replaced through a two-step change with a 14-day cooldown. In practice the router is a payment splitter that releases fixed shares by pull payment, a multisig, or an allocation mechanism; the strategy itself does not decide how the donation is divided. It is the on-chain form of [yield donation](./yield-donation.md) for an [ERC-4626 tokenized vault](./erc-4626-tokenized-vault.md).
