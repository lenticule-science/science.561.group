---
name: "the accounting cycle"
aliases:
  - "the accounting cycle"
  - "accounting cycle"
date-created: 2026-03-06
keywords:
  - Accounting
composes:
  - journal
  - ledger
  - trial-balance
  - adjusting-entry
  - closing-entry
  - financial-statements
governed-by: gaap
---

# The Accounting Cycle

The accounting cycle is a family of processes that transforms source evidence
and accounting judgments into maintained records, period adjustments, and
financial reports. The familiar sequence is a useful control map, not a chain of
independent proofs: several steps reorganize the same admitted data and cannot
detect an event omitted before entry.

Transaction capture and reconciliation continue across reporting periods, while
cutoff, adjustment, review, and presentation recur for each close. Continuous
systems need not erase or restart the underlying ledger.

## 1. Identify and Analyze Transactions

Before anything is recorded, determine the economic event, the reporting
entity, the applicable basis, and whether an element meets recognition and
measurement requirements. “Changes the accounting equation” is not a
recognition test: every balanced entry preserves that equation, and some
important events require disclosure or control follow-up without a recognized
amount.

This step requires judgment. You need to identify the accounts affected, determine the amounts involved, and classify the transaction correctly. Mistakes here propagate through every subsequent step.

## 2. Record in the Journal

Once you've identified a transaction, you record it as a [journal](./journal.md) entry. Each entry captures the date, the accounts affected, the amounts, and a brief description. Every entry must follow the double-entry rule: total debits must equal total credits.

The journal is the chronological accounting record. Raw source data should
remain distinguishable from the admitted journal entry so a later policy change
does not masquerade as changed source history.

## 3. Post to the Ledger

Journal entries organize transactions by time. The [ledger](./ledger.md) reorganizes them by account. Posting transfers each debit and credit from the journal to the appropriate account in the ledger, so you can see the running balance of every individual account.

Posting restructures admitted information by account. Account balances are
necessary inputs, but meaningful statements also require entity, recognition,
measurement, consolidation, classification, and disclosure judgments.

## 4. Prepare a Trial Balance

The [trial balance](./trial-balance.md) lists every account in the ledger along
with its debit or credit balance. Its primary purpose is a mechanical check: do
total debits equal total credits for the selected ledger population? If they do
not, the journal, posting process, report population, currency translation, or
rounding configuration needs investigation.

A balanced trial balance does not establish accuracy: an entry can use the
wrong accounts or amounts, and an event can be omitted entirely while equality
is preserved. An imbalance establishes a contradiction between the selected
records and the equality the report claims to test; its cause still has to be
located rather than assumed.

## 5. Make Adjusting Entries

At the reporting cutoff, routine records may not yet reflect every required
accrual, deferral, allocation, estimate, impairment, or correction. Adjusting
entries bring the record to the selected reporting basis; they do not “fix
economic reality,” and each still needs evidence and review.

Common adjustments include:

- **Accruals** — recording revenues earned or expenses incurred that haven't yet been captured. This aligns with [accrual accounting](./accrual-accounting.md) principles.
- **Deferrals** — allocating previously recorded amounts (like prepaid rent or unearned revenue) to the correct period.
- **[Depreciation](./depreciation.md)** — spreading the cost of long-lived assets over their useful lives.
- **Estimates** — adjusting for expected but uncertain amounts, like bad debt allowances.

Required adjustments left unrecorded can misstate timing, classification,
measurement, or disclosure. An unnecessary or unsupported adjustment can do the
same.

## 6. Prepare an Adjusted Trial Balance

After posting the adjusting entries, you prepare another trial balance. This confirms that debits still equal credits after the adjustments. It's the same mechanical check as step 4, applied to the updated account balances.

The adjusted trial balance supplies classified balances for statement
preparation. Equality and correct adjustments do not establish completeness of
cash-flow classifications, notes, consolidations, or presentation mappings.

## 7. Prepare Financial Statements

From the adjusted trial balance, you produce the [financial statements](./financial-statements.md):

- **Income statement** — reports revenues and expenses for the period, yielding net income or net loss.
- **Balance sheet** — reports assets, liabilities, and equity at the end of the period.
- **Cash flow statement** — reports cash inflows and outflows, categorized by operating, investing, and financing activities.

The statements articulate with one another: period performance changes the
applicable equity accounts, and the cash-flow statement explains the change in
cash and cash equivalents. Roll-forward and articulation checks detect some
mapping defects, but a shared wrong classification can remain consistent across
all statements.

## 8. Close Temporary Accounts

In a traditional manual ledger, revenue, expense, and distribution accounts are
temporary. Closing entries transfer their balances to retained earnings (or the
applicable equity account), zeroing the temporary accounts.

Systems that retain continuous history can instead produce period activity by
report-time filtering and summarization. They should not also post manual
closing entries unless their reporting model expects them. The
[period close](../../documents/articles/notes/period-closing.md) is the control
process; closing entries are one implementation.

## 9. Prepare a Post-Closing Trial Balance

Where explicit closing entries are used, the final trial balance confirms that
only permanent accounts remain with balances and that debits still equal
credits. Continuous-ledger systems use equivalent post-close reports and
assertions without forcing temporary accounts to lifetime zero.

A post-closing trial balance that satisfies those conditions is mechanically
ready for the next reporting period. It does not establish that opening
balances, classifications, estimates, or disclosures are substantively
correct. The recurring controls then continue into the next period.

## The Cycle as a Verification Architecture

The cycle combines distinct controls. Journal admission separates source events
from accounting conclusions. Double entry constrains accepted entries. Posting
preserves those entries by account. Trial balances test equality. Reconciliation
compares books with independent evidence. Adjustments implement cutoff policy,
and close review decides whether unresolved work is material or held open.

These controls overlap but are not automatically independent. Their strength
depends on provenance, segregation of duties, review quality, and whether tests
run in both directions. A sound close reports unresolved contradictions rather
than treating passage through the workflow as self-authentication.
