---
name: "account"
aliases:
  - "account"
  - "accounts"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - Accounting
relations:
  component-of: double-entry-bookkeeping
  uses: commodity
references:
  gnucash2026:
    authors: ["GnuCash Documentation Team"]
    title: "Transaction and Split Reference"
    year: 2026
    publication: "GnuCash Documentation"
    url: "https://wiki.gnucash.org/docs/STABLE/group__Transaction.html"
---

An account is a stable classification address that accumulates selected effects
of admitted transactions. It is a basic unit of
[double-entry bookkeeping](./double-entry-bookkeeping.md): postings debit or
credit accounts so balances can be read by economic role, entity, period, and
other maintained dimensions.

An introductory commercial chart commonly groups accounts into five roots, each
with a normal balance (the side ordinarily increased):

| Type | Normal balance | Examples |
|---|---|---|
| Asset | Debit | Cash, accounts receivable, equipment, inventory |
| Liability | Credit | Accounts payable, loans payable, wages payable |
| Equity | Credit | Owner's equity, retained earnings, common stock |
| Revenue | Credit | Sales revenue, service revenue, interest income |
| Expense | Debit | Rent expense, wages expense, supplies expense |

Contra accounts, accumulated other comprehensive income, gains, losses,
statistical accounts, and entity-specific control accounts complicate that
table. “Normal” is a sign expectation, not a validation rule: an asset can have
a credit balance because of timing, offset policy, or error. The
[chart of accounts](./chart-of-accounts.md) governs available account addresses,
while subsidiary dimensions and source metadata can carry detail without
creating a new account for every fact.

An account uses a commodity to identify its counted unit. That accounting unit
does not establish the account holder, custody, provider restrictions, or a
right to transfer the underlying service [@gnucash2026].
