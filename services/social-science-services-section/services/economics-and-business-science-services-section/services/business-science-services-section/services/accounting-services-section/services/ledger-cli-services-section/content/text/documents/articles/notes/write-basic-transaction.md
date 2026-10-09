---
title: "Write a Basic Transaction in Ledger"
aliases:
  - "Write a Basic Transaction in Ledger"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: A Ledger transaction consists of a date, description or payee text, and postings.
---


A Ledger transaction consists of a date, description or payee text, and
[postings](../../../glossary/terms/posting.md). Before writing one, identify the
reporting entity, source event, recognition date, accounts, commodities,
measurement, and evidence identifier. Syntax can preserve a judgment; it cannot
supply one.

Basic structure:

```
DATE PAYEE
    ACCOUNT1    AMOUNT
    ACCOUNT2    AMOUNT
```

Rules:

- The date format is `YYYY/MM/DD` or `YYYY-MM-DD`.
- Account names use colons as hierarchy separators: `Expenses:Food:Restaurants`.
- Amounts include the commodity symbol: `\$100.00`, `50 EUR`, `0.5 BTC`.
- One balancing posting amount can be omitted when Ledger can infer it from the
  other posting values.
- Ordinary posting values must balance under Ledger's commodity and cost rules;
  raw units of unlike commodities are not added as though they were the same
  unit.

Example — paying rent:

```
2024/04/01 Landlord
    Expenses:Housing:Rent    \$1200.00
    Assets:Checking
```

Example — a supported service invoice with a separately classified fee:

```
2024/04/15 Software Provider
    ; Source-ID: invoice-1042
    Expenses:Software:Subscription  \$100.00
    Expenses:Bank:Processing         \$8.00
    Liabilities:Accounts-Payable  \$-108.00
```

Transactions can share a date, and reports can sort or filter independently of
source-file order. Preserve source order only if a downstream control depends
on it. A semicolon introduces a note or comment; Ledger recognizes structured
metadata when the note follows its metadata syntax, such as `Key: Value`.

After entry, inspect the parsed transaction, run the book's balance and policy
checks, and reconcile the affected control accounts. Balanced syntax does not
establish completeness, authorization, cutoff, classification, or valuation.
See the official [Ledger transaction syntax](https://ledger-cli.org/doc/ledger3.html#Transactions)
for version-specific parsing rules.
