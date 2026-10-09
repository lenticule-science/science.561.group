---
name: "Cross-Chain Transfer Protocol (CCTP)"
date-created: 2026-10-08
aliases:
  - "CCTP"
  - "Circle CCTP"
description: "Circle's burn-and-mint protocol that moves native USDC between chains after its attestation service signs the burn message."
references: {}
---

The **Cross-Chain Transfer Protocol (CCTP)** burns USDC on a source chain and mints native USDC on the destination after an attestation service run by the issuer signs the burn message; no wrapped token or liquidity pool is involved. Version 2 adds Fast Transfer, which is attested at a lower confirmation threshold for a basis-point fee drawn against an allowance, and hooks, metadata on the burn message that a destination contract may act on. The trust assumption is the issuer's attester keys. A chain not assigned a domain cannot receive native USDC through it.
