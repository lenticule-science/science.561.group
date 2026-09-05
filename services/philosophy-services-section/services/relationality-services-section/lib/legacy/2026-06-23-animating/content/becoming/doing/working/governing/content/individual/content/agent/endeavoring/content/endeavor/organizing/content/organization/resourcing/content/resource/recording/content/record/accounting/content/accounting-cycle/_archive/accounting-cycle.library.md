---
title: "the accounting cycle"
description: "The accounting cycle is the sequence of steps that transforms raw transactions into financial statements within a single reporting period. It's not just a workflow — it's a verification architecture. Each step checks the one before it, making it progressively harder for errors to survive all the way to the finished financial statements."
aliases:
  - "the accounting cycle"
  - "accounting cycle"
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
composes:
  - journal
  - ledger
  - trial-balance
  - adjusting-entry
  - closing-entry
  - financial-statements
governed-by: gaap
---

The accounting cycle is the sequence of steps that transforms raw transactions into financial statements within a single reporting period.
It's not just a workflow — it's a verification architecture.
Each step checks the one before it, making it progressively harder for errors to survive all the way to the finished financial statements.

The cycle repeats every reporting period, whether that's monthly, quarterly, or annually.
Once the books close at the end of one period, the cycle starts over for the next.

## 1. Identify and Analyze Transactions

Before anything gets recorded, you have to determine which events qualify as financial transactions.
Not every business event has a financial dimension, and not every financial event belongs in the accounting system.
The test is whether the event changes the accounting equation (assets = liabilities + equity).
If it doesn't, it's not a transaction and doesn't get recorded [citation needed].

This step requires judgment.
You need to identify the accounts affected, determine the amounts involved, and classify the transaction correctly.
Mistakes here propagate through every subsequent step.

## 2. Record in the Journal

Once you've identified a transaction, you record it as a [journal](../terms/journal.md) entry.
Each entry captures the date, the accounts affected, the amounts, and a brief description.
Every entry must follow the double-entry rule: total debits must equal total credits.

The journal serves as the chronological record of all transactions — sometimes called the "book of original entry."
It's where the raw data first enters the formal accounting system.

## 3. Post to the Ledger

Journal entries organize transactions by time.
The [ledger](../terms/ledger.md) reorganizes them by account.
Posting transfers each debit and credit from the journal to the appropriate account in the ledger, so you can see the running balance of every individual account.

This step doesn't add new information — it restructures existing information to make it useful.
You can't prepare meaningful financial statements from a chronological list of transactions, but you can from a set of account balances.

## 4. Prepare a Trial Balance

The [trial balance](../terms/trial-balance.md) lists every account in the ledger along with its debit or credit balance.
Its primary purpose is mechanical verification: do total debits equal total credits?
If they don't, something went wrong in the recording or posting steps.

A balanced trial balance doesn't guarantee accuracy — you could have posted the right amount to the wrong account, or missed a transaction entirely — but an unbalanced trial balance guarantees that an error exists.
It's the first of several checkpoints in the cycle.

## 5. Make Adjusting Entries

At the end of the reporting period, the accounts won't yet reflect economic reality.
Cash-basis records don't capture revenue that's been earned but not received, expenses that have been incurred but not paid, or the gradual consumption of long-lived assets.
Adjusting entries fix this.

Common adjustments include:

- **Accruals** — recording revenues earned or expenses incurred that haven't yet been captured.
  This aligns with [accrual accounting](../terms/accrual-accounting.md) principles.
- **Deferrals** — allocating previously recorded amounts (like prepaid rent or unearned revenue) to the correct period.
- **[Depreciation](../terms/depreciation.md)** — spreading the cost of long-lived assets over their useful lives.
- **Estimates** — adjusting for expected but uncertain amounts, like bad debt allowances.

Without adjusting entries, the financial statements would misstate both the timing and the magnitude of economic activity.

## 6. Prepare an Adjusted Trial Balance

After posting the adjusting entries, you prepare another trial balance.
This confirms that debits still equal credits after the adjustments.
It's the same mechanical check as step 4, applied to the updated account balances.

The adjusted trial balance serves as the direct source for building the financial statements.
If it balances and the adjustments are correct, the financial statements will be internally consistent.

## 7. Prepare Financial Statements

From the adjusted trial balance, you produce the [financial statements](../terms/financial-statements.md):

- **Income statement** — reports revenues and expenses for the period, yielding net income or net loss.
- **Balance sheet** — reports assets, liabilities, and equity at the end of the period.
- **Cash flow statement** — reports cash inflows and outflows, categorized by operating, investing, and financing activities.

The statements aren't independent of each other.
Net income from the income statement flows into retained earnings on the balance sheet.
Changes in balance sheet accounts feed the cash flow statement.
This interconnection provides yet another layer of error detection.

## 8. Close Temporary Accounts

Revenue, expense, and dividend accounts are temporary — they accumulate activity for a single period and then reset.
Closing entries transfer their balances to retained earnings (or the equivalent equity account), zeroing them out.

After closing, temporary accounts have no balances and are ready to accumulate the next period's activity.
Permanent accounts — assets, liabilities, and equity — carry their balances forward.

## 9. Prepare a Post-Closing Trial Balance

The final trial balance confirms that only permanent accounts remain with balances and that debits still equal credits.
It's the last verification step before the books officially open for the next period.

If the post-closing trial balance is clean, the ledger is in the correct starting state for the new cycle.
The whole process then begins again.

## The Cycle as a Verification Architecture

What makes the accounting cycle more than a checklist is how each step constrains the next.
Journal entries enforce double-entry balance.
Posting reorganizes without altering totals.
Trial balances catch imbalances.
Adjusting entries bring cash records in line with economic reality.
Closing entries reset the system for the next period.

Each layer narrows the space where errors can hide.
A mistake that slips past one checkpoint faces another, and then another.
By the time the numbers reach the financial statements, they've survived multiple independent tests.
The cycle doesn't guarantee perfection, but it makes undetected errors progressively less likely.
