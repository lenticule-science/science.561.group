---
title: "Set Up a Chart of Accounts in GnuCash"
aliases:
  - "Set Up a Chart of Accounts in GnuCash"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: GnuCash ships with predefined account hierarchies (personal, business, etc.) that users can select when creating a new file.
---

GnuCash ships with predefined [account](2026-03-06-account.md) hierarchies (personal, business, etc.) that users can select when creating a new file.
These templates provide a reasonable starting [chart of accounts](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/terms/chart-of-accounts.md) based on common accounting needs.

To set one up:

1. Create a new GnuCash file (File > New).
2. Select a currency for the book.
3. Choose one or more account templates (Personal Accounts, Business Accounts, etc.).
  GnuCash will create the full hierarchy.
4. Review and prune — delete accounts that don't apply.
  It's easier to delete unused accounts than to create missing ones later.
5. Add any accounts specific to the situation.
  Follow the five top-level types: Assets, Liabilities, Equity, Income, Expenses.
  Each can have arbitrary sub-accounts.

**Note**: The chart of accounts can be restructured later by dragging accounts in the account tree, but transactions already posted to an account will follow it.
Plan the structure before entering significant data.
