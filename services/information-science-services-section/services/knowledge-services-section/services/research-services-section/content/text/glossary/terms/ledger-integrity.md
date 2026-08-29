---
title: "Ledger Integrity"
specialization: duty
description: "The ledger must always balance and pass validation — no unbalanced transactions, no undefined accounts"
attached-to:
  - bookkeeper
triggers:
  - transaction-recorded
  - reconciliation-requested
  - periodic (weekly)
actions:
  - Run bean-check after every ledger modification
  - Ensure all transactions balance (debits = credits)
  - Ensure all accounts are defined in the chart of accounts
  - Flag discrepancies between ledger and external sources
  - Never modify historical transactions without creating an adjustment entry
---


The fundamental duty of bookkeeping: the ledger must balance. Every debit has a credit. Every account is defined. Every modification is validated. Historical entries are corrected by adjustment, never by silent edit.
