---
title: "Multi-Currency Accounting"
description: "Multi-currency accounting preserves native quantities, transaction measurements, historical costs, and reporting values across multiple monetary and nonmonetary commodities."
aliases:
  - "Multi-Currency Accounting"
date-created: 2026-03-06
keywords:
  - accounting
  - finance
  - beancount
requires:
- /domesticity/accounting/curricula/beancount-basics.md
teaches:
  - "Multi-Currency Accounting"
id: accounting-lesson-multi-currency
authors:
- emsenn
type: lesson
---

Multi-currency accounting records transactions and balances involving more than
one monetary unit and often extends the same commodity machinery to securities,
digital assets, and physical units. Native quantity, transaction measurement,
historical cost, and reporting value remain distinct coordinates.

## Core concepts

- **Functional currency**: the currency of the primary economic environment in
  which the entity operates, determined under the governing framework.
- **Presentation currency**: the currency in which statements are presented;
  it may differ from functional currency.
- **Native quantity**: the number of units actually held in the commodity of the
  account. This is the amount reconciled to a bank statement, wallet, custodian,
  or inventory count.
- **Cost basis**: the historical measurement attached to an acquired lot under
  the entity's accounting policy. It is not a current quote, and its tax use
  depends on the applicable jurisdiction and lot-relief rules.
- **Transaction price or proceeds**: the conversion rate or disposal price for
  one transaction. It can differ from historical cost without changing the
  quantity held.
- **Market value**: the value of a holding at a stated timestamp, market, and
  price source. It is a dated measurement, not a replacement for native quantity
  or historical lot record.
- **Realized gain or loss**: the amount recognized on disposal or settlement
  under the applicable basis after supported proceeds, relieved cost, and
  transaction effects are determined.

## In Beancount

Beancount handles multi-currency natively. Each account is opened with a list
of allowed currencies:

```
2024-01-01 open Assets:Bank:EuroAccount EUR
2024-01-01 open Assets:Crypto:Bitcoin BTC
```

Transactions that convert between currencies use a price annotation. `@` states
a **per-unit price** and `@@` states the **total price** of the posting:

```
2025-03-01 * "Buy euros"
  Assets:Bank:EuroAccount    500.00 EUR @@ 540.00 USD
  Assets:Bank:Checking      -540.00 USD
```

Cost and price answer different questions. A single-brace cost such as
`10 SHARE {5.00 USD}` attaches a USD 5 historical cost to each share; a
double-brace cost such as `10 SHARE {{50.00 USD}}` states the total cost of the
lot. A posting may carry both historical cost and a transaction price on a
disposal:

```beancount
2025-03-02 * "Sell shares"
  Assets:Broker:Shares       -10 SHARE {5.00 USD} @ 7.00 USD
  Assets:Broker:Cash          70.00 USD
  Income:CapitalGains        -20.00 USD
```

The account loses 10 native `SHARE` units. Its balancing weight comes from the
USD 50 historical cost, the cash proceeds are USD 70, and the USD 20 difference
is realized gain. The price annotation does not overwrite the lot's cost.

An empty cost selector, as in `-10 SHARE {}`, does not mean “value these shares
at face.” It asks the booking system to select costed units already held in the
account. Under strict booking, a partial reduction that could come from several
lots is ambiguous and must remain unresolved. FIFO or LIFO may supply an
ordering rule when that rule is the entity's adopted lot-relief policy. A sound
ledger either identifies the relieved lot or holds the transaction for review;
it does not choose an economically convenient basis after seeing the gain.

Price directives track market values over time:

```
2025-03-01 price EUR 1.08 USD
2025-03-01 price BTC 65000.00 USD
```

A price directive belongs to a dated price database used for valuation. It does
not post anything, change a reconciled quantity, or retroactively alter cost.
This separation follows Beancount's documented distinction between posting
[costs, prices, and balancing weights](https://beancount.github.io/docs/beancount_language_syntax/#costs-and-prices).

If an evidenced opening quantity lacks acquisition records, a dated price can
still support a market-value report. The report must leave book value and
unrealized gain or loss missing, however. Writing zero basis would turn absent
evidence into a positive accounting claim and overstate any later realized
gain. The opening-balance worklist remains open for basis even when quantity and
current market measurement are both known.

## Practical considerations

- **Reconcile in the native currency.** Your euro bank statement is in euros;
  reconcile in euros. Currency conversion affects reporting, not reconciliation.
- **Track lots, not only aggregate basis.** Acquisition date, unit cost, and any
  lot label determine which historical cost is relieved on disposal. An
  aggregate amount can balance while selecting the wrong lot.
- **Keep the measurement layers reproducible.** Retain native quantity,
  historical cost, transaction price, and dated market-price evidence as
  separate facts. Derive reporting values from them instead of overwriting one
  with another.
- **Exchange-rate sources.** Define admissible markets, timestamps, quote
  direction, fallbacks, and review controls. Automated feeds transport prices;
  they do not make a price appropriate for the accounting policy.
- **Tax implications.** Currency conversions and crypto transactions may be
  taxable events. The ledger should record enough detail to compute gains.
