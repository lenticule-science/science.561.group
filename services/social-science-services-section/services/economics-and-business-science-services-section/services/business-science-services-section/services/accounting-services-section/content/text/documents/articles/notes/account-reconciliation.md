---
title: "Account Reconciliation"
description: "Reconciliation explains a ledger balance by comparing it with independent evidence or a subsidiary record at the same effective time."
aliases:
  - "Account Reconciliation"
date-created: 2026-03-06
keywords:
  - accounting
  - finance
requires:
- /domesticity/accounting/curricula/plain-text-accounting.md
teaches:
  - "Account Reconciliation"
id: accounting-lesson-account-reconciliation
type: lesson
---

Reconciliation is the construction of an explanation between two records of the
same economic subject at the same effective time. One record is usually a
general-ledger balance. The other may be independent evidence, such as a bank or
custodian statement, or a controlled subsidiary record, such as the sum of
customer balances supporting accounts receivable.

Equality is the conclusion, not the method. A ledger balance can happen to equal
a statement while containing offsetting errors. A reconciliation therefore
matches the populations and explains every remaining difference before it
asserts the ending balance.

## Why reconcile

- It tests whether recorded quantity and value are complete as of a stated
  cutoff.
- It separates timing differences from omissions, recording errors, source
  errors, and unsupported differences.
- It connects the reported balance to retained evidence so another person can
  repeat the comparison.
- It can expose duplicate entries, unauthorized activity, stale receivables,
  and transactions recorded in the wrong account or period.

## Process

1. **Define the subject and cutoff.** Name the ledger account, evidence source,
   currency or commodity, and exact effective time. A statement's publication
   date is not necessarily its balance date.
2. **Retain the evidence.** Preserve the statement or export and give it a
   stable source identifier. Record enough provenance to retrieve it without
   putting secrets in the ledger.
3. **Compare opening balance and activity.** Match opening balance, additions,
   reductions, transfers, and ending balance. For a subsidiary ledger, also
   prove that its detailed items sum to the control account.
4. **Classify every difference.** A difference may be a legitimate timing item,
   a book omission or error, a source error, or unresolved. Do not use an
   unexplained plug to force agreement.
5. **Post supported adjustments.** Record fees, interest, omissions, and errors
   using dated entries with source references. In controlled books, correct a
   closed period with an adjusting entry rather than silently rewriting it.
6. **Recompute and review.** The adjusted book balance and adjusted evidence
   balance must agree, and the matched activity must support that equality.
7. **Assert the result.** In Beancount, a `balance` directive makes the expected
   amount executable:

   ```
   2025-01-31 balance Assets:Bank:Checking  1,234.56 USD
   ```

   The checker flags a mismatch on later validation. The directive preserves an
   expected amount; the source identifier and reconciliation record preserve
   why that amount was accepted.

## Reconciliation record

A useful control record contains the account, cutoff, source identifier,
statement or subsidiary balance, ledger balance before adjustments, identified
differences, posted adjustment references, final difference, preparer, reviewer
when applicable, and status. “Pending” is a valid status. “Reconciled” is not
valid while an unexplained difference remains.

## Frequency

- Cash, bank, card, brokerage, custodial, and debt accounts: whenever their
  statements or independently observable cutoffs arrive, commonly monthly.
- Physical cash and inventory: when counted and at each reporting cutoff for
  which the balance is material.
- Receivables, payables, and other control accounts: on the reporting cadence
  and before the period is closed.

Frequency should respond to volume, volatility, loss exposure, reporting need,
and how quickly a discrepancy must be detected; an arbitrary calendar cadence
does not replace those judgments.

## Common sources of discrepancy

- Pending or in-transit transactions that have not cleared.
- Fees, interest, rewards, distributions, or custody activity not yet recorded.
- Transactions entered with the wrong quantity, amount, date, commodity, or
  account.
- Differences between trade date, settlement date, block time, and statement
  cutoff.
- Foreign-exchange or price differences when two records use different
  measurement bases.
- Unsupported opening balances or incomplete acquisition history.

A current market price can support market value, but it cannot repair missing
historical cost. Quantity reconciliation, cost-basis reconciliation, and market
valuation answer different questions and should remain visibly separate.
