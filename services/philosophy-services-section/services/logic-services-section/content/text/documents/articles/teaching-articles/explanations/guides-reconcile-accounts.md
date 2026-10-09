---

title: "Reconcile Accounts"
description: Reconcile ledger accounts against external statements to catch errors and missing transactions. Use monthly when statements arrive.
date-created: 2026-03-06
keywords:
  - accounting
runtime:
  invocation: inference
  tool: human
region:
  reads: ["content/domesticity/disciplines/accounting/"]
  writes: ["content/domesticity/disciplines/accounting/"]
dependencies:
- /domesticity/accounting/curricula/account-reconciliation.md
part-of: domesticity/disciplines/accounting
---

- Retrieve the official statement for the account and period.
- Compare the statement ending balance against the ledger balance.
- Walk through statement transactions and mark each as present in the ledger.
- Record missing transactions (fees, interest, automatic payments).
- Correct errors in amount, date, or account assignment.
- Add a Beancount `balance` directive on the statement date to lock the reconciled balance.
- Run validation to confirm the balance assertion holds.
