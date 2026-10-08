---
title: "Set Up a New Beancount Ledger"
type: skill
keywords:
  - accounting
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
description: A Beancount ledger starts as a plain text file (conventionally .beancount extension).
---


A Beancount ledger starts as a plain text file (conventionally `.beancount` extension).
Unlike [GnuCash](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/beancount/gnucash.md), there are no templates — the user builds the structure from scratch.

**Minimal starting file**:

```
option "title" "Personal Finances"
option "operating_currency" "USD"

; Account declarations
2024-01-01 open Assets:Checking        USD
2024-01-01 open Assets:Savings         USD
2024-01-01 open Liabilities:CreditCard USD
2024-01-01 open Equity:Opening-Balances USD
2024-01-01 open Expenses:Food          USD
2024-01-01 open Expenses:Housing       USD
2024-01-01 open Expenses:Transport     USD
2024-01-01 open Income:Salary          USD

; Opening balances
2024-01-01 pad Assets:Checking Equity:Opening-Balances
2024-01-01 balance Assets:Checking  5000.00 USD
```

Key decisions:

1. **Account naming**: Beancount requires accounts to start with one of five root types: `Assets`, `Liabilities`, `Equity`, `Income`, `Expenses`.
  Use colons for sub-accounts: `Expenses:Food:Groceries`.
2. **Opening balances**: Use `pad` and `balance` directives to set starting balances from bank statements.
3. **File organization**: For a simple setup, one file works.
  For larger books, use `include` directives to split by year or category: `include "2024.beancount"`.
4. **Validation**: Run `bean-check ledger.beancount` after every editing session.
  It reports parse errors, unbalanced transactions, and failed balance assertions.

See also: [double-entry bookkeeping](../../../../../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/services/accounting-services-section/content/text/glossary/terms/double-entry-bookkeeping.md), [chart of accounts](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/terms/chart-of-accounts.md).
