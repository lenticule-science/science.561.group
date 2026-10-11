---
title: "Openings for Tidepool from Credit, Money, Mutual and Streaming Protocols"
description: "What the B2 reading of Superfluid, Sablier, Circles, Sarafu, Trustlines, Kolektivo, GoodDollar, Nexus Mutual, PoolTogether, Goodghosting, Goldfinch, Liquity v2, Reserve and mutual-credit systems implies for a priced rotating credit association with member credit lines and pooled risk"
date-created: 2026-10-08
aliases:
  - "b2-openings-for-tidepool"
keywords:
  - tidepool
  - mutual-credit
  - rosca
  - pooled-risk
  - synthesis
teaches:
  - "Openings for Tidepool from Credit, Money, Mutual and Streaming Protocols"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references: {}
---
This note collects, in one place, the design openings drawn from the nine B2 records. Each claim rests on a row in the note named beside it; numbers are as read on 2026-10-08. Gaps are listed at the end.

## 1. The credit object: limits around zero, a balance-of-trade account, a yield engine

Every mutual credit system that runs (Sardex: 10,000 firms and over one billion credits transacted by 2025-06) or is specified (Credit Commons) uses accounts that trade within limits straddling zero, with a balance-of-trade account that shows a group's net position and which members commit to return toward zero; Trustlines adds per-direction limits, per-direction interest and imbalance-priced fees. See [Mutual Credit at Scale](./2026-10-08-mutual-credit-first-party-sardex-wir-credit-commons.md) and [Mutual Credit and Trustline Protocols](./2026-10-08-mutual-credit-and-trustline-protocols.md). None has a yield stream underneath, and the two protocol-only systems have gone unmaintained (Credit Commons last commit 2021-02-22; Trustlines sites down on 2026-10-08). Tidepool's opening is a signed-balance member credit line with a limit pair, a pool-level balance-of-trade account, and routed yield paying the keepers who keep lines liquid.

## 2. The share ledger already exists

Superfluid's distribution pools give an on-chain ledger of integer member units with continuous settlement; one transaction serves any number of members, and Flow Councils reuse the units as votes. A Tidepool pool contract can be the pool admin, member units can be member shares, and the flow into the pool can be routed yield. Design work remaining: the deposit buffer and liquidation period of the stream token, and who holds the upgrade key (on Base a 2-of-4 Safe). See [Streaming and Distribution Protocols](./2026-10-08-streaming-and-distribution-protocols.md). Sablier's Lockup is the vesting form (deposit up front, transferable NFT) and Flow the payroll form (receiver bears uncovered debt); neither prices or shares that risk.

## 3. Priced rotation

ChitChain on Aptos is the minimal priced rotating pool: full collateral, then monthly discount auctions, winner takes pot minus bid, others share the bid. It has no audit or deployment found. PoolTogether v5 contributes the audited pieces a rotation needs: a time-weighted average balance for who held what for how long, permissionless claiming by keepers, adaptive tiers, a shutdown path, and a pool with no upgrade key. Goodghosting shows the discipline variant (miss a deposit, lose the interest) and its wind-down shows the operating risk. See [ROSCA and Prize-Savings Protocols](./2026-10-08-rosca-and-prize-savings-protocols.md).

## 4. Write the loss order before launch

Reserve ranks losses: trade to restore backing, seize the first-loss stake, then declare a haircut. Goldfinch sizes first loss by a leverage ratio, writes down by lateness and reverses on repayment, and queues exits by epoch. Nexus Mutual holds capital at 7.2 times its minimum requirement and keeps the share price near book value through a ratcheting AMM. See [Rate Markets and Collateral Baskets](./2026-10-08-rate-markets-and-collateral-baskets.md), [Uncollateralized Credit Protocols](./2026-10-08-uncollateralized-credit-protocols.md) and [On-Chain Mutuals and Insurance](./2026-10-08-on-chain-mutuals-and-insurance.md). The smaller uncollateralized lenders read far below their peaks on the dashboard, with no cause stated there.

## 5. Let members price their own liquidity

Liquity v2 lets each borrower name an annual rate, redeems the lowest-rate positions first, and charges an upfront fee for changing rate too soon. For a pool, the rate paid becomes queue position in redemption or exit, discovered by members instead of set by an operator.

## 6. Admission by priced sponsorship

Circles makes the inviter burn 96 units to give a newcomer 48, requires prior trust, and expires trust edges. Sponsorship cost and expiry are a tested sybil answer short of identity proofs. The Berlin pilot ended with its cooperative in 2023, which shows the organising body, not the contract, was the point of failure. See [UBI and Local Currency Protocols](./2026-10-08-ubi-and-local-currency-protocols.md).

## 7. Member-issued claims settling against a pool

Cosmo-Local Credit pools combine a token registry, per-token limiter, a price quoter, irreversible configuration seals and a floor on the protocol fee. The quoter's price is a steward's judgment, so the steward must be an accountable, witnessed role. This is a template for enterprise vouchers that settle against a Tidepool pool.

## 8. Legal wrapper for pooled risk

Nexus Mutual offers cover as a discretionary mutual: no enforceable cover contract, a decision process instead. Its claims process moved from stake-voted to a three-person committee with an advisory-board override in 2025-11.

## 9. Where Tidepool can lead

No deployed pool combining mutual credit with a yield engine was found. No audited rotating-savings contract was found. None of the sources read for Circles, Sarafu, Kolektivo, Credit Commons, Unyt, Holo or Trustlines mentions a limit tied to energy return. A credit unit whose limit is a function of the pool's measured net energy return is open ground.

## Gaps

Not read or not found: Superfluid's own post-mortem, Sablier volume, WIR turnover, Nexus claims-paid total, a Kolektivo reserve contract, Unyt source, Metri, Sarafu totals after 2025-07-20, Etherisc, Colony, Aragon, Toucan and Regen, Sky contracts.
