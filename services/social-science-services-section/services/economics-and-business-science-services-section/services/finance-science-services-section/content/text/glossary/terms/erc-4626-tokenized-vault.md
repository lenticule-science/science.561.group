---
name: "ERC-4626 Tokenized Vault"
date-created: 2026-10-08
aliases:
  - "ERC-4626"
  - "tokenized vault"
  - "4626 vault"
description: "A smart contract that accepts one underlying ERC-20 asset and issues fungible shares whose redemption value grows with the vault's holdings, with a fixed interface for deposit, withdrawal and conversion."
references: {}
---

An **ERC-4626 tokenized vault** holds a single underlying asset and issues an ERC-20 share token against it. The share price is the ratio of `totalAssets()` to total share supply, and the standard fixes the functions that move between assets and shares: `deposit`, `mint`, `withdraw`, `redeem`, the `convertToShares` and `convertToAssets` views (which round down), and `preview` and `max` views. Because the interface is fixed, one integration reads MetaMorpho vaults, Spark and sDAI savings vaults and Yearn strategies alike. See the note [Base Yield Venues](../../documents/articles/notes/2026/10/08/2026-10-08-base-yield-venues.md) and [ERC Standards for Vaults](../../documents/articles/notes/2026/10/08/2026-10-08-erc-standards-for-vaults.md).
