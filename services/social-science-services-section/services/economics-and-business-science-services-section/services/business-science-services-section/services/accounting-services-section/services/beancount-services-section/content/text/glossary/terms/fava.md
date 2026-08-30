---
title: "Fava"
aliases:
  - "Fava"
  - "fava"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - Accounting
defines:
  - "Fava"
---

# Fava

Fava is a separately maintained web interface for Beancount. It loads a
Beancount source population and provides filtered reports, journals, account
views, charts, queries, document handling, and source-entry workflows. It does
not replace the ledger or independently establish the accounting correctness of
the reports it renders.

```bash
fava ledger.beancount
```

The default local address is `localhost:5000`. Fava includes an editor and
transaction-insertion features, so it is not merely read-only. Its process and
network boundary should be treated as access to the financial record. Version
control can preserve source changes, but authorization, source evidence,
reconciliation, and backup controls remain separate requirements.

Fava adds interactive workflows around the plain-text model, including:

- Interactive charts (net worth over time, income/expense breakdowns)
- Filtering by account, payee, tag, or date range
- Document and receipt linking
- Query editor for Beancount's SQL-like query language

Feature availability and reload behavior vary by release and configuration.
Consult the official [Fava documentation](https://beancount.github.io/fava/)
for the installed version and test the reports and write paths required by the
book's controls.
