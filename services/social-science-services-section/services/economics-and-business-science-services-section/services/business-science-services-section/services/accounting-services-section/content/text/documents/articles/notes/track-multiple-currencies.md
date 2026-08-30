---
title: "Track Multiple Currencies"
description: Record and report on holdings in multiple currencies, including cost basis and exchange rates. Use when the ledger includes foreign currencies or crypto.
date-created: 2026-03-06
keywords:
  - accounting
  - finance
  - beancount
runtime:
  invocation: inference
  tool: llm
region:
  reads: ["content/domesticity/disciplines/accounting/"]
  writes: ["content/domesticity/disciplines/accounting/"]
dependencies:
- /domesticity/accounting/curricula/multi-currency.md
part-of: domesticity/disciplines/accounting
name: track-multiple-currencies
id: track-multiple-currencies
type: learn
authors:
- emsenn
---

Multi-currency accounting must preserve the difference between the thing held,
the consideration exchanged, historical cost, and a dated reporting value.
Calling each coordinate “the balance” conceals both custody and measurement
errors.

## Establish the policy

Identify the entity's functional currency, presentation currency, permitted
account commodities, recognition basis, exchange-rate sources, rate-selection
convention, and treatment of transaction gains and losses. Tax measurement is a
separate jurisdiction-specific conclusion and must not be inferred from the
book presentation alone.

## Record transactions

1. Preserve the exact native quantity received or surrendered.
2. Record the consideration and supported acquisition cost at the transaction's
   applicable recognition date. Fees may be part of cost or current expense
   depending on the asset and governing basis.
3. Identify lots when later disposal accounting depends on acquisition history.
4. Treat a transfer between the entity's own custody locations as a transfer,
   not as revenue or disposal, unless the governing facts establish otherwise.
5. Record realized exchange effects when settlement or disposal requires them;
   do not derive realized gain from the difference between two unrelated spot
   quotes.

In Beancount syntax, `@` expresses a per-unit price and `@@` a total price. A
cost annotation identifies lot cost. Those syntactic forms encode supplied
facts; they do not establish that the facts are correct or that a price is an
admissible substitute for cost.

## Reconcile and report

Reconcile each custody account in its native commodity first. Then reconcile
costed lots to acquisition and disposal evidence. Apply dated prices or closing
rates only under the selected reporting basis, with source, timestamp, market,
and unit explicit. Missing price may make reporting value unavailable; it does
not make native quantity zero.

Separate realized effects, recognized unrealized effects, and merely
supplemental market-value observations. Translation of a foreign operation and
remeasurement of a foreign-currency transaction answer different questions and
may be presented differently under the governing framework.
