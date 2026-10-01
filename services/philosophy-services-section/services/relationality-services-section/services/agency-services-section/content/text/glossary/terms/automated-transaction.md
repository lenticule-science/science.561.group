---

name: "Automated Transaction"
description: "An automated transaction is a rule that generates additional postings whenever a real transaction matches a pattern."
aliases:
  - "Automated Transaction"
  - "automated transaction"
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
type: term
---

An automated transaction is a rule that generates additional postings whenever a real transaction matches a pattern.
It's defined with a `=` sign followed by a matching expression:

```
= /Grocery/
    (Budget:Food)    -1
```

This rule adds a virtual posting to `Budget:Food` for the negative of the matched amount on every transaction whose payee matches "Grocery."
Automated transactions are useful for budget tracking, tax categorization, and allocation — they apply consistently without manual intervention.
They run at report time, not at data entry time, so they don't modify the source file.
