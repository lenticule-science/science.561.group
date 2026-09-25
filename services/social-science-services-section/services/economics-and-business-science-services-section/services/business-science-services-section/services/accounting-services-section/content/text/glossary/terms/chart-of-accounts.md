---
name: "chart of accounts"
aliases:
  - "chart of accounts"
  - "charts of accounts"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - Accounting
contains: account
governs: ledger
---

A chart of accounts is the controlled, structured list of [accounting accounts](./accounting-account.md)
an entity may use. It assigns stable names or codes, account classes, and any
dimensions or constraints needed by the ledger. The chart governs available
classification, but detail can also reside in counterparties, projects,
commodities, locations, or subsidiary records rather than a new account for
every distinction.

Account numbering typically follows a convention that groups accounts by type:

| Range | Type | Examples |
|---|---|---|
| 1000–1999 | Assets | 1010 Cash, 1200 Accounts Receivable, 1500 Equipment |
| 2000–2999 | Liabilities | 2010 Accounts Payable, 2100 Loans Payable |
| 3000–3999 | Equity | 3010 Owner's Equity, 3200 Retained Earnings |
| 4000–4999 | Revenue | 4010 Sales Revenue, 4200 Service Revenue |
| 5000–5999 | Expenses | 5010 Rent Expense, 5200 Wages Expense |

Numbering is one common implementation, not a requirement. Hierarchical names,
alphanumeric codes, or separate classification dimensions can carry the same
role. Whatever representation is chosen should remain stable enough that a
renaming does not silently rewrite historical meaning.

A chart of accounts is an architectural decision. Too few accounts and the entity can't see where its money goes. Too many and the system becomes unwieldy, with transactions routinely posted to the wrong account because the distinctions are too fine. The chart should reflect the level of detail the entity needs for decision-making and reporting — no more, no less.

## Earlier material

A chart of accounts is the complete, structured list of all [accounts](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/03/06/2026-03-06-account.md) an entity uses to record financial transactions.
It assigns each account a name, a number, and a type (asset, liability, equity, revenue, or expense).
The chart defines what the entity can track and report — an expense that doesn't have its own account gets lumped into a broader category, invisible to anyone reviewing the financial statements.

The numbering scheme varies between entities, but the principle is consistent: the number's first digit or digits encode the account type, and gaps are left between numbers so new accounts can be inserted without renumbering.
