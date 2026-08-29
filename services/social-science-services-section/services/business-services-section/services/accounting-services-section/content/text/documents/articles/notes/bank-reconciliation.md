---
title: "Bank Reconciliation"
aliases:
  - "Bank Reconciliation"
type: curriculum-lesson
date-created: 2026-03-06T00:00:00
keywords:
  - Accounting
teaches:
  - "Bank Reconciliation"
requires:
  - /business/disciplines/accounting/curricula/financial-statement-analysis.md
---

After completing this lesson, you'll be able to explain why the bank's balance and the book's balance rarely match, identify the items that cause the difference, prepare a [bank reconciliation](../../../glossary/terms/bank-reconciliation.md) statement, and record the journal entries that follow from it.

## Why balances don't match

The bank and the business both track the same checking account, but they record transactions at different times. A check mailed on March 29 reduces the book balance immediately, but it doesn't reduce the bank balance until the recipient deposits it — maybe April 3. Similarly, the bank might charge a service fee on March 31 that the business doesn't know about until the statement arrives.

The difference may be a normal timing difference, but either record can also be
wrong or incomplete. Reconciliation classifies the difference and supports the
adjusted balance; it must not assume both starting balances are correct.

## Items that adjust the book balance

These are items reflected in bank evidence but not yet correctly reflected in
the books. A supported book omission or error requires an entry; a bank error
does not become a book transaction merely because it appears on the statement.

- **Bank service charges** — Monthly fees the bank deducted from the account.
- **Interest earned** — Interest the bank credited to the account.
- **Direct deposits or electronic payments** — Transactions that went through the bank but the business hasn't recorded (e.g., a customer's automatic payment or an automatic bill payment).
- **NSF (non-sufficient funds) checks** — A customer's check that bounced. The bank reversed the deposit, but the business still shows it in its records.
- **Bank errors** — Rare, but possible. If the bank made a mistake, the business notes it on the reconciliation and notifies the bank.

## Items that adjust the bank balance

These are supported book items the bank has not processed at the cutoff. They
normally require no duplicate entry, but they must be followed until they clear,
are voided, are reissued, or are otherwise resolved.

- **Outstanding checks** — Checks the business wrote and recorded but the bank hasn't cleared yet.
- **Deposits in transit** — Money the business deposited (and recorded) but that doesn't yet appear on the bank statement — often because the deposit was made after the bank's daily cutoff.
- **Bank errors** — If the bank posted a transaction to the wrong account, it's adjusted on the bank side.

## Preparing the reconciliation

The goal is to compare both populations at the same cutoff, classify each
difference, post supported book adjustments, and arrive at one supported
adjusted book balance. Reconciliation does not reveal a metaphysical “true cash”
amount independent of entity boundary, cutoff, restrictions, and evidence.

**Worked example.**

Balance per books: \$8,450. Bank statement balance: \$9,210.

The following items explain the difference:
- Interest earned on the account: \$15
- Bank service charge: \$25
- NSF check from a customer: \$500
- Deposit in transit: \$1,200
- Outstanding check #1042: \$870
- Outstanding check #1055: \$1,600

**Adjustments to the book balance:**

| | |
|---|---|
| Balance per books | \$8,450 |
| Add: Interest earned | \$15 |
| Less: Bank service charge | (\$25) |
| Less: NSF check | (\$500) |
| **Adjusted book balance** | **\$7,940** |

**Adjustments to the bank balance:**

| | |
|---|---|
| Balance per bank statement | \$9,210 |
| Add: Deposit in transit | \$1,200 |
| Less: Outstanding check #1042 | (\$870) |
| Less: Outstanding check #1055 | (\$1,600) |
| **Adjusted bank balance** | **\$7,940** |

The two adjusted balances match at \$7,940. Completion also requires retaining
the matched population and support for each reconciling item; equal totals alone
could contain offsetting errors.

## Journal entries from the reconciliation

Only supported changes to the books receive journal entries. Outstanding items
already recorded in the books are not posted again, but stale or disputed items
need active resolution rather than an assumption that they will clear.

**Interest earned:**

| Account | Debit | Credit |
|---|---|---|
| Cash | \$15 | |
| Interest Revenue | | \$15 |

**Bank service charge:**

| Account | Debit | Credit |
|---|---|---|
| Bank Service Charges | \$25 | |
| Cash | | \$25 |

**NSF check:**

| Account | Debit | Credit |
|---|---|---|
| [Accounts Receivable](../../../glossary/terms/accounts-receivable.md) | \$500 | |
| Cash | | \$500 |

The NSF entry shown assumes the original receipt settled a valid customer
receivable that remains enforceable after the return. If the original event had
another substance, the debit account must follow that evidence instead of
defaulting to accounts receivable.

After posting these three entries, the Cash account in the general ledger shows \$7,940 — matching the adjusted bank balance.

## What reconciliation catches

Bank reconciliation isn't just paperwork. It's a control mechanism that catches problems early:

- **Recording errors** — Transposed digits, wrong amounts, entries posted to the wrong account. If you recorded a \$540 check as \$450, the reconciliation will reveal a \$90 discrepancy.
- **Unauthorized transactions** — Fraudulent checks, unauthorized electronic withdrawals, or identity theft. You won't catch these if you don't compare your records to the bank's.
- **Missing entries** — Fees, electronic transfers, or automatic payments that the business forgot to record.
- **Timing differences** — Normal and expected. Outstanding checks and deposits in transit aren't errors — they just reflect the time lag between recording and clearing.

Monthly reconciliation commonly aligns with monthly statements. Higher-volume
or higher-risk accounts may need more frequent review; lower-frequency
statements still need reconciliation at each reporting cutoff. Waiting longer
lets errors compound and delays detection of unauthorized activity.

## Self-check exercises

**Exercise 1.** Classify each item as a book-side adjustment or a bank-side adjustment:

(a) Outstanding check for \$350
(b) Bank service fee of \$15
(c) Deposit in transit of \$2,000
(d) Interest earned of \$8
(e) NSF check from a customer for \$275

<details><summary>Answer</summary>

(a) **Bank-side** — The business already recorded the check; the bank just hasn't cleared it yet.
(b) **Book-side** — The bank charged the fee, but the business hasn't recorded it. Requires a journal entry.
(c) **Bank-side** — The business already recorded the deposit; the bank just hasn't posted it yet.
(d) **Book-side** — The bank credited interest, but the business hasn't recorded it. Requires a journal entry.
(e) **Book-side** — The bank reversed a customer's bounced check; the business needs to reverse it too. Requires a journal entry.

The deciding question is which record needs correction. A valid event omitted
from the books produces a book-side adjustment; a supported book item not yet
processed by the bank remains a bank-side reconciling item; a bank error is
reported to the bank rather than copied into the books.

</details>

**Exercise 2.** Prepare a bank reconciliation from the following information:

- Balance per books: \$5,200
- Balance per bank statement: \$4,214
- Outstanding checks: #301 for \$600, #315 for \$250
- Deposit in transit: \$1,500
- Bank service fee: \$30
- Interest earned: \$12
- NSF check from customer: \$318

<details><summary>Answer</summary>

**Adjustments to the book balance:**

| | |
|---|---|
| Balance per books | \$5,200 |
| Add: Interest earned | \$12 |
| Less: Bank service fee | (\$30) |
| Less: NSF check | (\$318) |
| **Adjusted book balance** | **\$4,864** |

**Adjustments to the bank balance:**

| | |
|---|---|
| Balance per bank statement | \$4,214 |
| Add: Deposit in transit | \$1,500 |
| Less: Outstanding check #301 | (\$600) |
| Less: Outstanding check #315 | (\$250) |
| Less: Bank error (none) | \$0 |
| **Adjusted bank balance** | **\$4,864** |

The adjusted book balance and adjusted bank balance both equal \$4,864. If they
did not, the reconciliation would remain unresolved while the difference was
investigated.

</details>

**Exercise 3.** Write the journal entries for the book-side adjustments from Exercise 2.

<details><summary>Answer</summary>

**Interest earned:**

| Account | Debit | Credit |
|---|---|---|
| Cash | \$12 | |
| Interest Revenue | | \$12 |

**Bank service fee:**

| Account | Debit | Credit |
|---|---|---|
| Bank Service Charges | \$30 | |
| Cash | | \$30 |

**NSF check:**

| Account | Debit | Credit |
|---|---|---|
| Accounts Receivable | \$318 | |
| Cash | | \$318 |

After posting these entries, the Cash account reflects the supported book-side
adjustments. Outstanding checks and the deposit in transit require no duplicate
entries; they remain open until subsequent evidence establishes their clearance
or another supported disposition.

</details>

**Exercise 4.** A business never reconciles its bank account. What risks does it face?

<details><summary>Answer</summary>

Several serious risks compound over time:

1. **Undetected errors** — Recording mistakes (wrong amounts, transposed digits, omitted entries) go unnoticed. Each month's errors pile on top of the previous month's, making the cash balance increasingly unreliable.
2. **Unauthorized activity is detected late** — Forged checks or unauthorized
   electronic withdrawals can continue while the two records remain
   unexamined.
3. **Unreliable cash balance** — The business doesn't actually know how much cash it has. Decisions based on the book balance (paying bills, making investments, distributing profits) could be wrong.
4. **Incorrect financial statements** — If the cash balance is wrong, the [balance sheet](../../../glossary/terms/balance-sheet.md) is wrong. If unrecorded fees or bounced checks affect expense and receivable accounts, the [income statement](../../../glossary/terms/income-statement.md) may be wrong too.
5. **Missed fee disputes** — Banks occasionally charge incorrect fees. Without reconciliation, the business pays fees it could have contested.

Reconciliation frequency should respond to statement availability, transaction
volume, loss exposure, reporting cutoff, and the required detection time.

</details>

## What comes next

With bank reconciliation in hand, you now have the complete toolkit for day-to-day bookkeeping — from recording transactions through adjustments to verification against external records. The next lesson introduces budgeting: using accounting data to plan ahead rather than just record the past.
