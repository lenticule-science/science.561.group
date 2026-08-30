---
title: "Set Up a Chart of Accounts in GnuCash"
aliases:
  - "Set Up a Chart of Accounts in GnuCash"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---

GnuCash can create predefined [account](../../../../../../../content/text/glossary/terms/account.md)
hierarchies during new-book setup. A template is a vocabulary proposal, not a
reporting policy and not evidence that the accounts fit the entity. Design the
[chart of accounts](../../../../../../../content/text/glossary/terms/chart-of-accounts.md)
from the entity, basis, source systems, required statements, tax and management
mappings, currencies, custody locations, control accounts, and consolidation
boundary.

To set one up:

1. Create a new GnuCash file (File > New).
2. Select the book currency deliberately and identify every source account or
   instrument whose commodity differs from it.
3. Choose a template only if its accounts can be mapped to the approved design;
   otherwise create the hierarchy directly.
4. Review every proposed account's type, commodity, parent, code, description,
   opening state, and report mapping before importing activity.
5. Use the major accounting classes—assets, liabilities, equity, income, and
   expenses—while selecting the more specific GnuCash account types required by
   cash, credit card, receivable, payable, security, trading, or other behavior.
6. Bring forward opening balances from statements and subsidiary records at a
   defined cutoff. Do not use an orphan or imbalance account as an unexplained
   opening plug.

Accounts can be reparented later, which changes how existing activity rolls up
in reports. Treat that as a controlled mapping change: inspect comparative
reports, saved report configuration, commodity behavior, and downstream exports
before accepting it. The official GnuCash 5 [account documentation](https://www.gnucash.org/docs/v5/C/gnucash-guide/basics-accounts1.html)
describes the current interface and account types.
