---
aliases:
  - commitment pool
  - voucher pool
description: Commitment pooling is the practice of routing issuers' redeemable promises, called vouchers, through a steward-curated pool that swaps supported vouchers at stated prices, limits and fees so that holders need not find a direct counterparty.
identity: commitment-pooling
name: Commitment pooling
date-created: 2026-10-08
---
Commitment pooling is the Grassroots Economics practice in which community members issue vouchers, which are redeemable promises of goods or services, and a pool steward chooses which vouchers a pool supports and publishes its rules, limits and fees. The documentation defines a commitment pool as "a curated place to exchange selected vouchers" and commitment pooling as "a protocol and practice for routing promises, settlement, and mutual support through shared pools" ([UBI and Local Currency Protocols](../../documents/articles/notes/2026/10/08/2026-10-08-ubi-and-local-currency-protocols.md)).

In the contracts a pool is a swap contract: a token registry says which vouchers are admitted, a limiter caps each, and a quoter (a per-token price index or an oracle) gives the exchange rate; the pool owner can seal each configuration field irreversibly. The price index is a judgment of the steward, which the Celo-era pool README states in so many words. In 2023-07-05 to 2025-07-20 the network recorded 188 active pools and 745 active vouchers.
