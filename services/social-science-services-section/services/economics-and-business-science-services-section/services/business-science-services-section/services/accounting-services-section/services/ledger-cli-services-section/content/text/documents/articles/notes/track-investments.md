---
title: "Track Investments and Commodities in Ledger"
aliases:
  - "Track Investments and Commodities in Ledger"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: Ledger can represent security quantities as commodities, acquisition lots as cost annotations, transaction values as prices or total costs, and dated market observations as price directives.
---


Ledger can represent security quantities as commodities, acquisition lots as
cost annotations, transaction values as prices or total costs, and dated market
observations as price directives. Those are different measurement layers. A
purchase can be represented as:

```
2024/01/15 Buy AAPL
    Assets:Brokerage    10 AAPL @ \$185.00
    Assets:Checking     $-1850.00
```

This records 10 AAPL units and a USD 1,850 transaction value. Production books
also need the reporting entity, custodian account, trade and settlement dates,
fees, source identifier, and the lot-identification data required by policy.

**Updating prices**: Add price entries to track market values over time:

```
P 2024/03/01 AAPL \$190.00
P 2024/06/01 AAPL \$210.00
```

**Reporting with market values**: `--market` (or `-V`) uses the applicable last
known price under Ledger's valuation rules:

```bash
ledger -f journal.ledger balance Assets:Brokerage --market
```

**Gains view**: `--gain` (or `-G`) reports a price-history-based net gain/loss
view for the selected population:

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

The `{\$185.00}` annotation identifies the historical unit cost used for the
disposed position, and the blank gain posting balances the USD difference in
this example. Ledger's arithmetic does not decide whether this is the correct
lot, whether fees alter proceeds or basis, whether the gain is realized under
the governing basis, or whether the income account and period are correct.

Quantity reconciliation to the custodian, lot reconciliation to acquisition
history, historical-cost reporting, and market valuation must remain separate.
The Ledger 3 manual also states that Ledger does not itself implement FIFO or
LIFO selection, so a required lot-relief policy needs explicit lot identity or
an external controlled process. Price observations need timestamp, source,
pair, and freshness; the latest stored price is not automatically the relevant
fair value.

See the official Ledger 3 [commodities, costs, and lots](https://ledger-cli.org/doc/ledger3.html#Commodities-and-Currencies)
documentation for syntax mechanics.
