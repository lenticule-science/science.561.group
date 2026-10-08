---
name: "Automated Transaction"
aliases:
  - "Automated Transaction"
  - "automated transaction"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---


An automated transaction is a Ledger rule that generates postings when a
posting in the loaded journal matches a query predicate. It begins with `=` and
is evaluated as part of Ledger's processing pipeline rather than being written
back as an ordinary source transaction.

```
= /^Expenses:Food/
    (Budget:Food)    -1
```

Here the predicate targets matching expense postings, and the commodityless
`-1` acts as a multiplier on the matched posting's cost. The generated virtual
posting has the opposite amount. Predicate scope matters: a payee predicate can
match every posting in a transaction and generate more postings than intended.

Automated transactions can support allocations, analytic dimensions, budgets,
or derived classifications, but consistent execution is not the same as
correct policy. A rule can double-count, apply to historical periods after a
change, interact with another rule, or make two reports disagree when one
includes generated postings and another uses `--actual`.

Control the exact predicate, effective period, generated account, metadata,
rule order, tool version, and report flags. Test positive, negative, overlapping,
multi-commodity, and correction cases. Generated postings should remain
distinguishable from source events and admitted accounting entries. The
official Ledger 3 [automated-transactions reference](https://ledger-cli.org/doc/ledger3.html#Automated-Transactions)
defines multiplier and matching semantics.
