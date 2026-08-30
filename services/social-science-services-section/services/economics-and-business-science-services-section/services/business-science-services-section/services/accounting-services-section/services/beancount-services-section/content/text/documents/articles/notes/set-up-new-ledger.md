---
title: "Set Up a New Beancount Ledger"
type: skill
keywords:
  - Accounting
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
---

# Set Up a New Beancount Ledger

A Beancount ledger is a set of plain-text source files, conventionally using the
`.beancount` extension, interpreted together with options, includes, plugins,
and tool versions. File creation is the last part of setup, not the first. Begin
by defining the reporting entity, accounting basis, opening cutoff, reporting
currency, source population, account dimensions, and required reports and
controls.

**Minimal starting file**:

```
option "title" "Example Entity"
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

; Supported conversion entry
2024-01-01 * "Bring forward supported opening cash"
  source_id: "opening-statement-2023-12-31"
  Assets:Checking                  5000.00 USD
  Equity:Opening-Balances         -5000.00 USD

2024-01-02 balance Assets:Checking  5000.00 USD
```

Key decisions:

1. **Entity and source boundary**: inventory bank, payment, payroll, custody,
   receivable, payable, debt, tax, fixed-asset, inventory, and related-party
   sources. Missing evidence is an unresolved balance, not zero.
2. **Account naming**: Beancount's default account types are `Assets`,
   `Liabilities`, `Equity`, `Income`, and `Expenses`, with colon-delimited
   subaccounts. Account names should preserve entity, custody, economic class,
   and reporting mappings without encoding changing facts in names.
3. **Opening balances**: post explicit, sourced conversion entries when the
   admitted opening populations are known. A `pad` directive is a migration
   mechanism, not evidence and not a substitute for resolving a difference.
4. **File organization**: choose includes by control boundary—such as entity,
   source, or period—while ensuring the complete included population is
   deterministic. File layout does not change the reporting entity.
5. **Admission and correction**: require stable source identifiers, retain raw
   evidence separately, reject duplicates, and correct accepted history with a
   traceable entry or governed rebuild rather than silent mutation.
6. **Validation**: run the installed Beancount checker and the book's policy
   controls. Parser success, balanced postings, and passing assertions are
   necessary mechanical results; they do not establish recognition,
   classification, valuation, completeness, or ownership.

See also: [double-entry bookkeeping](../../../../../../../content/text/glossary/terms/double-entry-bookkeeping.md),
[chart of accounts](../../../../../../../content/text/glossary/terms/chart-of-accounts.md),
and the official [Getting Started with Beancount](https://beancount.github.io/docs/getting_started_with_beancount/)
guide for syntax and tool mechanics.
