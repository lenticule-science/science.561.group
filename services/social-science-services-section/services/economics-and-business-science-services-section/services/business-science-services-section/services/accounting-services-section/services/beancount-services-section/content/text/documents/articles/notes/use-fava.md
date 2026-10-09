---
title: "Use Fava for Reporting"
type: skill
keywords:
  - accounting
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
description: Fava is a web application over a Beancount source population.
---


Fava is a web application over a Beancount source population. It can display
reports, run queries, upload documents, and edit or insert source entries. It
does not create an independent accounting basis or turn passing Beancount
checks into evidence that the books are complete.

Install the reviewed version in the ledger's managed Python environment, for
example:

```bash
pip install fava
```

Start the server:

```bash
fava ledger.beancount
```

The default local address is `http://localhost:5000`. The interface exposes
sensitive financial data and write paths, so binding it beyond the local host
requires deliberate authentication, transport security, authorization, and
network controls.

Common views include:

- **Income Statement**: Presents mapped income and expense activity for a
  selected period. The result depends on account structure, filters, entries,
  plugins, and valuation choices.
- **Balance Sheet**: Presents mapped [assets and liabilities](../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/03/06/2026-03-06-account.md)
  and equity at a cutoff. It is a report over the loaded book, not an
  independent reconciliation.
- **Trial Balance**: Lists account balances and supports the limited mechanical
  equality check described by the [trial balance](../../../../../../../content/text/glossary/terms/trial-balance.md).
- **Journal**: Chronological list of all transactions, filterable by account, payee, or tag.
- **Account pages**: Click any account to see its transaction history and balance over time.
- **Query**: Write BQL (Beancount Query Language) queries — a SQL-like language for custom reports:
  ```sql
  SELECT account, sum(position) WHERE account ~ "Expenses" GROUP BY account ORDER BY sum(position) DESC
  ```

Fava detects source changes. Its default behavior and automatic-reload option
depend on configuration and version; current documentation says external
changes show a reload notification unless automatic reload is enabled, while
writes initiated through Fava reload the page. After any edit, inspect parser
errors and the actual source diff before relying on refreshed reports.

The official [Fava getting-started guide](https://beancount.github.io/fava/usage.html)
and [feature documentation](https://github.com/beancount/fava/blob/main/src/fava/help/features.md)
define the current interface. Reporting cadence and review criteria belong to
the accounting controls, not the web application's defaults.
