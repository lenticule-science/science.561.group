---
name: "Vault Curator"
date-created: 2026-10-08
aliases:
  - "curator"
  - "risk curator"
description: "The role in a Morpho vault that chooses which lending markets the vault may supply to and sets their caps, while holding no power to withdraw depositors' assets to itself."
references: {}
---

A **vault curator** manages the allocation policy of an ERC-4626 lending vault: which markets are allowed and how much each may receive. In MetaMorpho and Vault V2 the curator is distinct from the owner (who sets fees and appoints roles), the allocator (who moves funds within the caps) and the guardian (who can veto pending changes during a timelock). Curators earn a performance fee on interest; for example Steakhouse High Yield USDC Edition charges 25% and Gauntlet USDC Prime charges 0. See [Base Yield Venues](../../documents/articles/notes/2026/10/08/2026-10-08-base-yield-venues.md).
