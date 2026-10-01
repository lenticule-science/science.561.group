---
name: "Balance Assertion"
aliases:
  - "Balance Assertion"
  - "balance assertion"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: A balance assertion is a directive that declares what an account's balance should be on a given date.
---


A balance assertion is a directive that declares what an account's balance should be on a given date.
Beancount checks this assertion against the computed balance from all preceding transactions.
If they don't match, Beancount reports an error.

```
2024-03-31 balance Assets:Checking  1547.23 USD
```

This asserts that `Assets:Checking` holds exactly \$1,547.23 at the start of March 31.
If the computed balance differs, something is wrong in the transaction data.

Balance assertions are Beancount's primary mechanism for catching errors.
The recommended practice is to add an assertion after every bank statement reconciliation — the assertion amount comes from the bank's ending balance.
If a typo or missing transaction causes the books to drift from reality, the assertion catches it.

This is a philosophical difference from [Ledger](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/beancount/content/ledger-cli.md), which supports balance assertions but doesn't emphasize them.
Beancount's design assumes assertions are used frequently and treats them as first-class validation.
