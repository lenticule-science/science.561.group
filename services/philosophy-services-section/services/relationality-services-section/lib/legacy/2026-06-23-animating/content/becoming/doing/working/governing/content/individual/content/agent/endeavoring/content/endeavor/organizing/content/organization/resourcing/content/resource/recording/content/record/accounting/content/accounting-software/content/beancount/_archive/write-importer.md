---
title: "Write a Beancount Importer"
type: skill
keywords:
  - Accounting
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
---

# Write a Beancount Importer

Beancount's import framework (`beancount.ingest`) provides a structured way to convert bank CSV or OFX files into Beancount transactions.
An importer is a Python class that implements three methods:

1. `identify(file)` — returns `True` if this importer can handle the given file (based on filename, headers, or content).
2. `file_account(file)` — returns the account name this file belongs to (e.g., `Assets:Checking`).
3. `extract(file)` — parses the file and returns a list of Beancount directive objects (transactions).

**Minimal example**:

```python
import csv
from beancount.core import data
from beancount.core.amount import Amount
from beancount.core.number import D
from beancount.ingest import importer
from datetime import date

class BankCSVImporter(importer.ImporterProtocol):
    def identify(self, file):
        return "bank_transactions" in file.name

    def file_account(self, file):
        return "Assets:Checking"

    def extract(self, file, existing_entries=None):
        entries = []
        with open(file.name) as f:
            for row in csv.DictReader(f):
                txn = data.Transaction(
                    meta=data.new_metadata(file.name, 0),
                    date=date.fromisoformat(row["date"]),
                    flag="!",
                    payee=row["description"],
                    narration="",
                    tags=set(),
                    links=set(),
                    postings=[
                        data.Posting("Assets:Checking",
                                     Amount(D(row["amount"]), "USD"),
                                     None, None, None, None),
                        data.Posting("Expenses:Uncategorized",
                                     None, None, None, None, None),
                    ],
                )
                entries.append(txn)
        return entries
```

The `!
` flag marks imported transactions as "needs review" — the user changes it to `*` after verifying and categorizing each one.

Run the importer with:

```bash
bean-extract config.py bank_download.csv >> ledger.beancount
```

Where `config.py` registers the importer instances.
The importer framework also supports `bean-identify` (which file goes to which importer) and `bean-file` (filing downloaded documents into an organized directory structure).
