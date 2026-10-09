---
name: "Holder-Directed Yield"
date-created: 2026-10-08
aliases:
  - "AutoPGF"
  - "automatic public goods funding"
description: "A stablecoin design in which each holder chooses which recipient the reserve income attributable to their balance is donated to, with the issuer and not the holder receiving the income."
references: {}
---

**Holder-directed yield** lets a holder of a reserve-backed [stablecoin](../../../../../economics-science-services-section/content/text/glossary/terms/stablecoin.md) pick the recipient of the income their balance generates, without receiving that income. Glo Dollar calls it automatic public goods funding: one token counts as one vote, the choice is recorded as a signed message, the issuer invests the reserve off chain and passes a monthly revenue share to a foundation, and the foundation donates it to the chosen recipients.

The structure is a form of [yield donation](./yield-donation.md) where the vote and the arithmetic are off chain and the on-chain contract only issues and redeems the token. The issuer may keep a threshold of the income before any share is passed on.
