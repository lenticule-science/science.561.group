---
name: "Revnet"
date-created: 2026-10-08
aliases:
  - "revnet"
  - "autonomous tokenized treasury"
  - "retailistic network"
description: "A Juicebox project that is owned by its deployer contract rather than a person and runs a fixed schedule of issuance stages, a cash-out bonding curve and borrowing against its own token."
references: {}
---

A **revnet** is a treasury and token whose terms are fixed at launch. It is a Juicebox project whose owner is a deployer contract, so no person can change its rules afterwards. Its rules are a list of stages: each stage sets how many tokens a unit of payment mints, how that issuance falls on a regular schedule, what share of new tokens goes to a named operator, and the cash-out tax rate that shapes how much of the treasury a token can redeem.

Payers who arrive earlier receive more tokens per unit, and every holder can redeem tokens against the treasury's surplus along a bonding curve whose tax rate is the stage's setting. A loan facility burns tokens as collateral and lends the cash-out value against them, charging fees that buy a prepaid duration, after which the collateral can no longer be recouped.

A revnet is a rule set that runs without administration, not a guarantee: the redeemable amount is only what later payers have put in, and the fixed schedule cannot adapt to conditions its authors did not foresee.
