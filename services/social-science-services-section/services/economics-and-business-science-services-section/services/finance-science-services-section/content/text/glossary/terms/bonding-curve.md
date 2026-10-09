---
name: "Bonding Curve"
date-created: 2026-10-08
aliases:
  - "bonding curve"
  - "token bonding curve"
  - "continuous token model"
description: "A contract that is counterparty to every trade of its own token: it mints on deposit of a reserve asset and burns on redemption, at a price that is a function of the circulating supply."
references: {}
---

A **bonding curve** is a contract that mints a token when a buyer deposits a reserve asset and burns it when a holder redeems, at a price set by a function of supply. In the Bancor form the purchase return is supply times ((1 + deposit / reserve) to the power connector weight, minus 1), so the connector weight fixes how fast price rises with reserve; at weight 100% price is constant. The contract is always the counterparty, so liquidity is guaranteed to the extent the reserve covers it.

The augmented variant with entry and exit tributes is [augmented bonding curve](./augmented-bonding-curve.md); the contract-level reading of the Bancor formula, Aragon Fundraising, Fairmint's two-curve design and the Token Engineering Commons is in [Bonding Curves and the Token Engineering Commons](../../documents/articles/notes/2026/10/08/2026-10-08-bonding-curves-and-the-tec.md).
