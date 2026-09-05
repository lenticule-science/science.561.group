---

title: "Use Fava for Reporting"
description: "Fava provides a web interface for browsing and querying Beancount data."
introduces: skill
keywords:
  - accounting
date-created: 2026-03-06T00:00:00
---

Fava provides a web interface for browsing and querying Beancount data.
Install it with pip:

```bash
pip install fava
```

Start the server:

```bash
fava ledger.beancount
```

This opens a web interface (default: `http://localhost:5000`) with several views:

- **Income Statement**: Shows revenue and expenses for a selected period — the same as an [income statement](../../../../../terms/income-statement.md) in traditional accounting.
- **Balance Sheet**: Shows [assets](../../../../../terms/account.md), [liabilities](../../../../../terms/account.md), and equity at a point in time — equivalent to the [balance sheet](../../../../../terms/balance-sheet.md).
- **Trial Balance**: Lists all accounts with their balances — the [trial balance](../../../../../terms/trial-balance.md) that confirms debits equal credits.
- **Journal**: Chronological list of all transactions, filterable by account, payee, or tag.
- **Account pages**: Click any account to see its transaction history and balance over time.
- **Query**: Write BQL (Beancount Query Language) queries — a SQL-like language for custom reports:
  ```sql
  SELECT account, sum(position) WHERE account ~ "Expenses" GROUP BY account ORDER BY sum(position) DESC
  ```

Fava reloads the Beancount file on each page load, so edits to the text file appear immediately in the web interface.
For day-to-day use, keep Fava running in a terminal while editing the Beancount file in a text editor — the workflow is edit, save, refresh browser.
