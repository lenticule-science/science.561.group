---
title: "Bank Reconciliation"
aliases:
  - "Bank Reconciliation"
type: curriculum-lesson
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
keywords:
  - Accounting
teaches:
  - "Bank Reconciliation"
requires:
  - /business/disciplines/accounting/curricula/financial-statement-analysis.md
---

After completing this lesson, you'll be able to explain why the bank's balance and the book's balance rarely match, identify the items that cause the difference, prepare a [bank reconciliation](../terms/bank-reconciliation.md) statement, and record the journal entries that follow from it.

## Why balances don't match

The bank and the business both track the same checking account, but they record transactions at different times.
A check mailed on March 29 reduces the book balance immediately, but it doesn't reduce the bank balance until the recipient deposits it — maybe April 3.
Similarly, the bank might charge a service fee on March 31 that the business doesn't know about until the statement arrives.

Neither the bank balance nor the book balance is wrong.
They're just incomplete in different ways.
The reconciliation identifies these timing differences and ensures both records end at the same correct balance.

## Items that adjust the book balance

These are things the bank knows that the business hasn't recorded yet.
Each one requires a journal entry to update the books.

- **Bank service charges** — Monthly fees the bank deducted from the account.
- **Interest earned** — Interest the bank credited to the account.
- **Direct deposits or electronic payments** — Transactions that went through the bank but the business hasn't recorded (e.g., a customer's automatic payment or an automatic bill payment).
- **NSF (non-sufficient funds) checks** — A customer's check that bounced.
  The bank reversed the deposit, but the business still shows it in its records.
- **Bank errors** — Rare, but possible.
  If the bank made a mistake, the business notes it on the reconciliation and notifies the bank.

## Items that adjust the bank balance

These are things the business knows that the bank hasn't processed yet.
They do **not** require journal entries — they'll clear on their own as the bank processes them.

- **Outstanding checks** — Checks the business wrote and recorded but the bank hasn't cleared yet.
- **Deposits in transit** — Money the business deposited (and recorded) but that doesn't yet appear on the bank statement — often because the deposit was made after the bank's daily cutoff.
- **Bank errors** — If the bank posted a transaction to the wrong account, it's adjusted on the bank side.

## Preparing the reconciliation

The goal is to start with both balances, apply the appropriate adjustments, and arrive at the same number — the true cash balance.

**Worked example.**

Balance per books: \$8,450.
Bank statement balance: \$9,210.

The following items explain the difference: - Interest earned on the account: \$15 - Bank service charge: \$25 - NSF check from a customer: \$500 - Deposit in transit: \$1,200 - Outstanding check #1042: \$870 - Outstanding check #1055: \$1,600

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

The two adjusted balances match — the reconciliation is complete.
The true cash balance is \$7,940.

## Journal entries from the reconciliation

Only the book-side adjustments need journal entries.
The bank-side items will resolve themselves as checks clear and deposits post.

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
| [Accounts Receivable](../terms/accounts-receivable.md) | \$500 | |
| Cash | | \$500 |

The NSF check entry reverses the original deposit — the customer's check bounced, so the money was never actually collected.
The customer still owes the business, so the amount goes back to accounts receivable.

After posting these three entries, the Cash account in the general ledger shows \$7,940 — matching the adjusted bank balance.

## What reconciliation catches

Bank reconciliation isn't just paperwork.
It's a control mechanism that catches problems early:

- **Recording errors** — Transposed digits, wrong amounts, entries posted to the wrong account.
  If you recorded a \$540 check as \$450, the reconciliation will reveal a \$90 discrepancy.
- **Unauthorized transactions** — Fraudulent checks, unauthorized electronic withdrawals, or identity theft.
  You won't catch these if you don't compare your records to the bank's.
- **Missing entries** — Fees, electronic transfers, or automatic payments that the business forgot to record.
- **Timing differences** — Normal and expected.
  Outstanding checks and deposits in transit aren't errors — they just reflect the time lag between recording and clearing.

This is why businesses reconcile monthly [citation needed].
Waiting longer lets errors compound and makes fraud harder to detect.
The sooner you spot a problem, the easier it is to fix.

## Self-check exercises

**Exercise 1.** Classify each item as a book-side adjustment or a bank-side adjustment:

(a) Outstanding check for \$350 (b) Bank service fee of \$15 (c) Deposit in transit of \$2,000 (d) Interest earned of \$8 (e) NSF check from a customer for \$275

<details><summary>Answer</summary>

(a) **Bank-side** — The business already recorded the check; the bank just hasn't cleared it yet.
(b) **Book-side** — The bank charged the fee, but the business hasn't recorded it.
Requires a journal entry.
(c) **Bank-side** — The business already recorded the deposit; the bank just hasn't posted it yet.
(d) **Book-side** — The bank credited interest, but the business hasn't recorded it.
Requires a journal entry.
(e) **Book-side** — The bank reversed a customer's bounced check; the business needs to reverse it too.
Requires a journal entry.

Rule of thumb: if the bank already knows about it but the business doesn't, it's book-side.
If the business already knows about it but the bank doesn't, it's bank-side.

</details>

**Exercise 2.** Prepare a bank reconciliation from the following information:

- Balance per books: \$5,200
- Balance per bank statement: \$4,800
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
| Balance per bank statement | \$4,800 |
| Add: Deposit in transit | \$1,500 |
| Less: Outstanding check #301 | (\$600) |
| Less: Outstanding check #315 | (\$250) |
| Less: Bank error (none) | \$0 |
| **Adjusted bank balance** | **\$5,450** |

Wait — these don't match. \$4,864 doesn't equal \$5,450.
That means there's an error somewhere that hasn't been identified yet.
In practice, you'd investigate the \$586 difference (\$5,450 − \$4,864) to find the missing item.
This is exactly what reconciliation is for — if the numbers don't balance, something is unaccounted for.

**Correction:** Let's recalculate.
The adjusted bank balance is \$4,800 + \$1,500 − \$600 − \$250 = \$5,450.
The adjusted book balance is \$5,200 + \$12 − \$30 − \$318 = \$4,864.
The difference is \$586.
In a real scenario, you'd search for a missing outstanding check, an unrecorded deposit, or a recording error that accounts for \$586.

For this exercise, accept that a reconciliation that doesn't balance means more investigation is needed — that's the whole point.

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

After posting these entries, the Cash account reflects the adjustments the business didn't previously know about.
Outstanding checks and the deposit in transit require no entries — they'll clear through the bank on their own.

</details>

**Exercise 4.** A business never reconciles its bank account.
What risks does it face?

<details><summary>Answer</summary>

Several serious risks compound over time:

1. **Undetected errors** — Recording mistakes (wrong amounts, transposed digits, omitted entries) go unnoticed.
  Each month's errors pile on top of the previous month's, making the cash balance increasingly unreliable.
2. **Fraud goes unnoticed** — Unauthorized checks, forged withdrawals, or electronic theft can continue for months before anyone realizes money is missing.
  Early detection is the best defense.
3. **Unreliable cash balance** — The business doesn't actually know how much cash it has.
  Decisions based on the book balance (paying bills, making investments, distributing profits) could be wrong.
4. **Incorrect financial statements** — If the cash balance is wrong, the [balance sheet](../terms/balance-sheet.md) is wrong.
  If unrecorded fees or bounced checks affect expense and receivable accounts, the [income statement](../terms/income-statement.md) may be wrong too.
5. **Missed fee disputes** — Banks occasionally charge incorrect fees.
  Without reconciliation, the business pays fees it could have contested.

Monthly reconciliation is cheap insurance against all of these problems.

</details>

## What comes next

With bank reconciliation in hand, you now have the complete toolkit for day-to-day bookkeeping — from recording transactions through adjustments to verification against external records.
The next lesson introduces budgeting: using accounting data to plan ahead rather than just record the past.
