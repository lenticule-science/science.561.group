---
name: "Asynchronous Vault"
date-created: 2026-10-08
aliases:
  - "ERC-7540"
  - "async vault"
description: "An ERC-4626 vault whose deposits, redemptions or both complete in separate request and claim steps, so the share price at settlement need not be known when the request is made."
references: {}
---

An **asynchronous vault** (ERC-7540) extends [ERC-4626 tokenized vaults](erc-4626-tokenized-vault.md) with a request, pending, claimable and claim sequence and an operator model. The preview functions for the asynchronous direction must revert, since no price is available at request time. It fits assets that settle in batches, such as real-world assets or credit. See [ERC Standards for Vaults](../../documents/articles/notes/2026/10/08/2026-10-08-erc-standards-for-vaults.md).
