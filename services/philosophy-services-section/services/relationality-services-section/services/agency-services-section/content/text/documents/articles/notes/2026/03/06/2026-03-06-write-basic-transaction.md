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
introduces: skill
description: A Ledger transaction consists of a date, a payee/description, and two or more postings.
---


A Ledger transaction consists of a date, a payee/description, and two or more [postings](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/ledger-cli/terms/posting.md).
The format is whitespace-sensitive — postings must be indented (by at least one space or tab; two spaces is conventional).

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
- The last posting's amount can be omitted — Ledger infers it.
- All postings must sum to zero.

Example — paying rent:

```
2024/04/01 Landlord
    Expenses:Housing:Rent    \$1200.00
    Assets:Checking
```

Example — paycheck with splits:

```
2024/04/15 Employer
    Assets:Checking           \$3200.00
    Expenses:Taxes:Federal     \$800.00
    Expenses:Taxes:State       \$200.00
    Income:Salary             $-4200.00
```

Transactions can appear in any order in the file — Ledger sorts by date at report time.
Multiple transactions can share a date.
Add metadata with `;` comments on any line.
