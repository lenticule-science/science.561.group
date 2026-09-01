---
title: "Accounting for Hive Assets with Beancount"
date-created: 2026-08-27T00:00:00
type: note
section: accounting
aliases:
  - "Accounting for Hive Assets with Beancount"
  - "Hive asset accounting in Beancount"
keywords:
  - Accounting
  - Beancount
  - Hive
  - digital assets
  - cost basis
description: "A double-entry model for Hive and Hive Engine rewards, staking, swaps, and reconciliation that keeps blockchain evidence distinct from accounting judgments."
requires:
  - /accounting/plain-text-accounting
  - /accounting/beancount-basics
---


Hive activity creates an accounting problem before it creates a software
problem. One wallet history can contain transfers, author rewards, curation
rewards, staking rewards, token swaps, delegations, liquidity-pool deposits,
and withdrawals. The chain records what happened to token quantities. It does
not decide which reporting entity owns the tokens, whether an event is income,
which valuation source governs, or which units were disposed of later.

[Plain-text accounting](../../../plain-text-accounting.md) and
[Beancount](../../../beancount-basics.md) are useful here because the source
record, classification policy, and correcting entries remain inspectable. A
ledger should preserve the chain evidence while making every accounting
judgment explicit.

## Keep three records distinct

A dependable workflow separates three layers that are easy to collapse:

1. **Source event:** the block, transaction identifier, operation index,
   timestamp, wallet, quantities, and counterparties reported by Hive or Hive
   Engine.
2. **Accounting interpretation:** the reporting entity, account, event class,
   recognition date, valuation source, and cost-basis method applied to the
   source event.
3. **Ledger posting:** the balanced Beancount transaction produced by that
   interpretation.

The source event is evidence, not a journal entry. Re-importing the same event
must not create a second posting, so every imported transaction needs a stable
source identifier. A later change in interpretation belongs in a dated
correcting entry or an explicitly reviewed rebuild; it must not silently alter
the retained source record.

## Model custody, asset, and state separately

Account names should answer where an asset is held and what operational state
it is in. Commodities answer what unit is held. For example:

```beancount
2026-01-01 commodity HIVE
2026-01-01 commodity HBD
2026-01-01 commodity VESTS
2026-01-01 commodity WORKERBEE
2026-01-01 commodity SWAP.HIVE

2026-01-01 open Assets:Digital:Hive:Liquid
2026-01-01 open Assets:Digital:Hive:Vesting
2026-01-01 open Assets:Digital:HiveEngine:Liquid
2026-01-01 open Assets:Digital:HiveEngine:Staked
2026-01-01 open Income:DigitalAssets:AuthorRewards USD
2026-01-01 open Income:DigitalAssets:MiningRewards USD
2026-01-01 open Income:DigitalAssets:RealizedGain USD
2026-01-01 open Expenses:DigitalAssets:RealizedLoss USD
```

The wallet name can be another account segment when one reporting entity has
several wallets. Do not put a person's name into the commodity symbol, and do
not invent separate commodities merely to represent custody or restrictions.
Hive itself is an important exception to a simple state-transfer model: a
power-up converts HIVE into vesting shares recorded by the protocol in VESTS.
Hive Power is a user-facing estimate derived from VESTS and the global vesting
fund ratio, not another fixed quantity of HIVE. The ledger should therefore
retain the VESTS quantity and the conversion evidence rather than relabeling it
as unchanged HIVE.

## Choose and document a measurement policy

Quantity alone is insufficient for financial reporting. Each acquisition lot
needs a value in the ledger's reporting currency. The policy should identify:

- the reporting currency;
- the price source and market pair;
- whether the relevant price is a spot price, interval average, or another
  consistently applied measure;
- the timestamp convention when the chain timestamp and price observation do
  not align exactly;
- treatment of fees and illiquid tokens; and
- the lot-relief method used when units are disposed of.

These are accounting-policy decisions. Beancount can retain and calculate from
them, but it cannot choose them from the blockchain data alone.

## Recognize rewards as lots

When the governing policy classifies a reward as income on receipt, the debit
recognizes the asset at its measured value and the credit recognizes income.
The cost annotation preserves that value for a later disposition:

```beancount
2026-08-27 * "Claim Hive author reward"
  source_id: "hive:transaction-id:operation-index"
  valuation_source: "documented USD market source"
  Assets:Digital:Hive:Liquid             10 HIVE {0.2500 USD}
  Income:DigitalAssets:AuthorRewards  -2.5000 USD
```

A mining or staking reward follows the same double-entry shape when it has the
same recognition policy, but it should use a distinct income account so the
ledger does not erase economically different reward mechanisms:

```beancount
2026-08-27 * "Receive WORKERBEE mining reward"
  source_id: "hive-engine:transaction-id:operation-index"
  Assets:Digital:HiveEngine:Liquid          50 WORKERBEE {0.0015 USD}
  Income:DigitalAssets:MiningRewards     -0.0750 USD
```

The classification and tax consequences of a reward depend on the reporting
entity's jurisdiction and facts. The durable principle is narrower: preserve
the quantity, source event, measurement, and classification as separate data
so a changed policy can be applied without inventing transaction history.

## Treat staking principal and staking rewards as different events

For a token whose staking operation merely restricts the same units, moving
principal between liquid and staked-state asset accounts can be an internal
transfer. A Hive power-up is different because the protocol converts HIVE into
VESTS. The posting must record both quantities and carry the recognized value
into the acquired vesting-share lot. If 100 HIVE with a USD 25 carrying amount
produce 50,000 VESTS, an illustrative posting is:

```beancount
2026-08-27 * "Stake HIVE"
  source_id: "hive:transaction-id:operation-index"
  Assets:Digital:Hive:Liquid  -100 HIVE {0.2500 USD}
  Assets:Digital:Hive:Vesting  50000 VESTS {0.0005 USD}
```

The VESTS amount is illustrative; production entries use the quantities in the
irreversible source event. Whether the conversion is a nonrecognition transfer
or a disposal and acquisition is a policy question under the applicable
reporting and tax rules. New vesting shares received as a reward are a separate
event and a separate lot. Keeping principal conversion apart from rewards
prevents an importer from treating the whole vesting balance as current-period
income.

## Record swaps as disposals and acquisitions

A token swap is not merely a transfer between two asset accounts. It disposes
of one commodity and acquires another. The entry therefore needs the relieved
cost of the disposed lot, the measured value of what was received, and the
difference as a realized gain or loss.

In this simplified example, 25 WORKERBEE with a USD 0.0015 unit cost are
exchanged for 0.1 SWAP.HIVE measured at USD 0.50 per unit:

```beancount
2026-08-27 * "Swap WORKERBEE for SWAP.HIVE"
  source_id: "hive-engine:transaction-id:operation-index"
  Assets:Digital:HiveEngine:Liquid  -25 WORKERBEE {0.0015 USD} @ 0.0020 USD
  Assets:Digital:HiveEngine:Liquid  0.1 SWAP.HIVE {0.5000 USD}
  Income:DigitalAssets:RealizedGain              -0.0125 USD
```

The numbers are illustrative. A production posting must use the adopted price
and lot-relief policies and must record any fee. If proceeds are worth less
than the relieved cost, the difference belongs in the realized-loss account
instead of the gain account.

## Do not guess at liquidity-pool ownership

A liquidity-pool deposit may exchange two assets for a pool token, or the pool
token may evidence a continuing beneficial interest in the contributed
assets. Those interpretations produce different recognition and measurement.
The ledger should not decide between them merely because an API labels the
operation `addLiquidity`.

For each pool, document:

- what legal or protocol claim the pool token represents;
- whether depositing assets is treated as a disposal;
- how fees and incentive tokens are classified;
- how the pool interest is measured; and
- how withdrawals allocate proceeds and relieved basis.

Until that policy is settled, retain the source event in an import queue rather
than forcing it into a plausible-looking but unsupported entry.

## Reconcile the ledger to the chain

Reconciliation should compare quantities by wallet, commodity, and state at a
specific block or timestamp. A useful close sequence is:

1. import source events through the cutoff from irreversible blocks, retaining
   the block number and transaction or virtual-operation identity;
2. reject duplicate source identifiers;
3. resolve held events whose classification or price is missing;
4. compare ledger quantities with liquid, staked, delegated, and Hive Engine
   balances from the same cutoff;
5. investigate differences as missing events, timing differences, fees,
   precision rules, or incorrect classifications; and
6. record balance assertions only after those differences are explained.

A balanced transaction proves only that its debits and credits agree. It does
not prove that every chain event was imported, that a valuation was reasonable,
or that the ledger belongs to the correct reporting entity. Source-identifier
controls and quantity reconciliation supply those missing tests.

## Automation boundary

Automation is well suited to fetching finalized event fields, normalizing
quantities, attaching stable identifiers, detecting duplicates, and proposing
entries under an explicit policy. Human or governed review remains necessary
when ownership, valuation, reward classification, pool-token substance, or
counterparty identity is unresolved.

This boundary keeps the ledger reproducible without pretending that accounting
judgment is present in the chain data. It also lets a web interface, importer,
or reporting application change without making the accounting record dependent
on proprietary storage: the Beancount journal remains readable, reviewable, and
portable.

## Protocol references

- Hive Developer Portal, [Converting VESTS to HIVE](https://developers.hive.io/tutorials-recipes/vest-to-hive.html),
  explains that the displayed HIVE Power amount is derived from VESTS using
  global vesting-fund and vesting-share totals.
- Hive Developer Portal, [Delegate Power](https://developers.hive.io/tutorials-javascript/delegate_power.html),
  identifies VESTS as the balance delegated by the protocol and distinguishes
  delegated, withdrawing, and available vesting shares.
- Hive Developer Portal, [Streaming blockchain transactions](https://developers.hive.io/tutorials-recipes/virtual-operations-when-streaming-blockchain-transactions.html),
  distinguishes the head block from the last irreversible block and explains
  why virtual-operation ingestion uses irreversible blocks.
