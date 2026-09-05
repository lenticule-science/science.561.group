---

title: "Fava"
description: "Fava is a web-based user interface for Beancount. It reads a Beancount file and presents the data through an interactive dashboard with account views, income statements, balance sheets, trial balances, journal entries, and charts."
aliases:
  - "Fava"
  - "fava"
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
---

Fava is a web-based user interface for Beancount.
It reads a Beancount file and presents the data through an interactive dashboard with account views, income statements, balance sheets, trial balances, journal entries, and charts.
Fava runs as a local web server:

```bash
fava ledger.beancount
```

This opens a browser interface at `localhost:5000` (by default).
Fava doesn't replace the text file — it's a read-mostly interface.
Users can edit transactions through Fava's editor, but the source file remains the authoritative record.

Fava makes Beancount accessible to users who want visualization without giving up the plain-text data model.
It provides features that the Beancount command-line tools don't, including:

- Interactive charts (net worth over time, income/expense breakdowns)
- Filtering by account, payee, tag, or date range
- Document and receipt linking
- Query editor for Beancount's SQL-like query language

Fava is a separate project from Beancount itself, maintained by a different developer `[citation needed]`.
