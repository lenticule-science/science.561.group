---
title: "Track Investments and Commodities in Ledger"
aliases:
  - "Track Investments and Commodities in Ledger"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---


Ledger handles investments by treating securities as commodities with prices.
A stock purchase looks like this:

```
2024/01/15 Buy AAPL
    Assets:Brokerage    10 AAPL @ \$185.00
    Assets:Checking     $-1850.00
```

This records buying 10 shares of AAPL at \$185 each.
Ledger now knows the account `Assets:Brokerage` holds 10 AAPL, and it paid \$185 per share.

**Updating prices**: Add price entries to track market values over time:

```
P 2024/03/01 AAPL \$190.00
P 2024/06/01 AAPL \$210.00
```

**Reporting with market values**: Use `--market` (or `-V`) to value holdings at the most recent price:

```bash
ledger -f journal.ledger balance Assets:Brokerage --market
```

**Gains reporting**: Use `--gain` (or `-G`) to show unrealized gains:

```bash
ledger -f journal.ledger balance Assets:Brokerage --gain
```

**Selling**: Record the sale with the actual sale price:

```
2024/06/15 Sell AAPL
    Assets:Checking      \$2100.00
    Assets:Brokerage    -10 AAPL {\$185.00}
    Income:Capital:Gains
```

The `{\$185.00}` is the lot price ([cost basis](../../terms/cost-basis.md)).
Ledger calculates the capital gain automatically.

This same mechanism works for any commodity — foreign currencies, cryptocurrencies, precious metals, or anything with a unit price.
