---
title: "Prepare a Trial Balance"
type: skill
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
description: A trial balance projects ledger balances into debit and credit columns for a stated entity, ledger, and cutoff.
---

A [trial balance](../../../glossary/terms/trial-balance.md) projects
[ledger](../../../glossary/terms/ledger.md) balances into debit and credit
columns for a stated entity, ledger, and cutoff. It is an arithmetic control and
an input to adjustment and reporting, not a financial statement.

**Steps:**

1. Fix the ledger, reporting basis, currency treatment, and effective cutoff.
2. Confirm that all journals and supported adjustments through the cutoff have
   been posted once.
3. List the relevant ledger accounts and their ending balances. Zero-balance
   accounts may be retained when the report or close process requires them.
4. Enter each balance in the debit or credit column according to its actual
   balance, using normal balance as a diagnostic rather than forcing a sign:
   - Assets: debit
   - Liabilities: credit
   - Equity: credit
   - Revenue: credit
   - Expenses: debit
5. Sum the debit and credit columns in a common measurement unit or in separate
   balanced commodity columns when the ledger is multi-commodity.
6. Investigate any difference, unexpected-sign balance, dormant account with
   activity, or control-account mismatch.
7. Retain whether the trial balance is unadjusted, adjusted, or post-closing;
   those stages answer different questions.

**What a balanced trial balance establishes:** The selected ledger balances
have equal aggregate debits and credits under the report's transformation.

**What it does not establish:** That each transaction balanced when entered,
that transactions were posted to the correct accounts, that no events were
omitted or duplicated, that measurements are supported, or that the entity and
cutoff are correct. Offsetting errors can leave the aggregate columns equal.

**Finding errors when it doesn't balance:**

- Calculate the difference between debit and credit totals.
- A difference equal to twice a posting can indicate that a debit was placed in
  the credit column or vice versa.
- A difference divisible by nine can indicate a decimal shift or transposed
  digits, but it is only a search clue, not a diagnosis.
- Check for omitted postings—such as a journal entry recorded in the journal but
  never posted to the ledger.
- Recompute from source journals rather than inserting a suspense amount to
  force equality.
