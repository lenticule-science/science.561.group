---
title: "Multi-Currency Accounting"
aliases:
  - "Multi-Currency Accounting"
id: accounting-lesson-multi-currency
authors:
- emsenn
date-created: 2026-03-06
type: lesson
keywords:
  - Accounting
  - Finance
  - Beancount
requires:
- /domesticity/accounting/curricula/beancount-basics.md
teaches:
  - "Multi-Currency Accounting"
---

Multi-currency accounting tracks holdings and transactions in more than one currency.
This includes foreign currencies, cryptocurrencies, and investment securities — anything denominated in a unit different from your base reporting currency.

## Core concepts

- **Operating currency**: the currency you report in and think in — usually the currency of the country where you live and pay taxes.
- **Cost basis**: the amount you paid for a holding in your operating currency at the time of acquisition.
  This is what matters for tax purposes.
- **Market value**: the current value of a holding at today's exchange rate or price.
  The difference between cost basis and market value is unrealized gain or loss.
- **Realized gain/loss**: when you sell or convert a holding, the difference between the proceeds and the cost basis becomes a realized gain or loss.

## In Beancount

Beancount handles multi-currency natively.
Each account is opened with a list of allowed currencies:

```
2024-01-01 open Assets:Bank:EuroAccount EUR
2024-01-01 open Assets:Crypto:Bitcoin BTC
```

Transactions that convert between currencies use the `@` (total cost) or `@@` (per-unit cost) syntax:

```
2025-03-01 * "Buy euros"
  Assets:Bank:EuroAccount    500.00 EUR @@ 540.00 USD
  Assets:Bank:Checking      -540.00 USD
```

Price directives track market values over time:

```
2025-03-01 price EUR 1.08 USD
2025-03-01 price BTC 65000.00 USD
```

## Practical considerations

- **Reconcile in the native currency.** Your euro bank statement is in euros; reconcile in euros.
  Currency conversion affects reporting, not reconciliation.
- **Track cost basis carefully.** When you sell or convert, Beancount uses the recorded cost basis.
  If the basis is wrong, gains and losses will be wrong.
- **Exchange rate sources.** Use consistent sources for exchange rates.
  Beancount supports price feeds that can automate this.
- **Tax implications.** Currency conversions and crypto transactions may be taxable events.
  The ledger should record enough detail to compute gains.
