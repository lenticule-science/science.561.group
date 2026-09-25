---
title: "Adjusting Entries and the Accounting Cycle"
aliases:
  - "Adjusting Entries and the Accounting Cycle"
type: curriculum-lesson
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
keywords:
  - accounting
teaches:
  - "Adjusting Entries"
  - "The Accounting Cycle"
requires:
  - /business/disciplines/accounting/curricula/reading-financial-statements.md
description: After completing this lesson, you'll be able to explain why end-of-period adjustments are necessary, record common accrual and deferral adjustments, and describe the accounting cycle from source event through period close.
---

After completing this lesson, you'll be able to explain why end-of-period
adjustments are necessary, record common accrual and deferral adjustments, and
describe the accounting cycle from source event through period close.

## Why adjustments exist

Imagine a consulting business pays \$6,000 on January 1 for six months of office rent. The cash left the bank account on January 1, but only \$1,000 of that rent applies to January — the other \$5,000 covers February through June. Without an adjustment, January's income statement is wrong in one of two ways:

- If the bookkeeper recorded the entire \$6,000 as Rent Expense on January 1, January's expenses are overstated by \$5,000.
- If the bookkeeper recorded it as Prepaid Rent and made no adjustment, January's expenses are understated by \$1,000 because no rent expense appears at all.

Neither version reflects the supported January consumption pattern. Under
[accrual accounting](../../../glossary/terms/accrual-accounting.md), recognition
follows when the applicable asset, liability, income, or expense criteria are
met rather than when cash happens to move. Adjusting entries bring the books to
that basis at a reporting cutoff.

## Common accrual and deferral adjustments

Accrued revenue, accrued expense, deferred revenue, and deferred expense are
four common families. They are not an exhaustive taxonomy: depreciation,
amortization, impairment, estimates, reclassification, foreign-exchange
remeasurement, and error correction can require other adjustments.

### Accrued revenue

The consulting business completed \$2,000 of work for a client in March but won't send the invoice until April. The revenue was earned in March, so March's books need to reflect it.

| Account | Debit | Credit |
|---|---|---|
| Accounts Receivable | \$2,000 | |
| Service Revenue | | \$2,000 |

This entry records the revenue in the correct period and creates a receivable — the client owes the business money.

### Accrued expense

Employees earned \$3,000 in wages during the last week of March, but payday falls in April. The expense belongs to March even though no cash has left the bank yet.

| Account | Debit | Credit |
|---|---|---|
| Wages Expense | \$3,000 | |
| Wages Payable | | \$3,000 |

March's income statement now includes the wages employees earned, and the balance sheet shows the obligation to pay them.

### Deferred revenue (unearned revenue)

A client paid \$12,000 upfront on March 1 for a 12-month consulting retainer. On March 1, the business hasn't performed any work yet — the \$12,000 is a liability because the business owes 12 months of future services.

**Initial entry on March 1:**

| Account | Debit | Credit |
|---|---|---|
| Cash | \$12,000 | |
| Unearned Revenue | | \$12,000 |

By March 31, one month of service has been delivered. The business has earned \$1,000 (\$12,000 / 12 months), so the adjustment moves \$1,000 from the liability to revenue.

**Month-end adjusting entry:**

| Account | Debit | Credit |
|---|---|---|
| Unearned Revenue | \$1,000 | |
| Service Revenue | | \$1,000 |

After this entry, Unearned Revenue shows \$11,000 (the remaining obligation) and Service Revenue includes the \$1,000 earned in March.

### Deferred expense (prepaid expense)

This is the \$6,000 prepaid rent from the opening example. When the business paid cash on January 1, it received an asset — the right to use office space for six months.

**Initial entry on January 1:**

| Account | Debit | Credit |
|---|---|---|
| Prepaid Rent | \$6,000 | |
| Cash | | \$6,000 |

At the end of January, one month of that asset has been consumed. The adjustment transfers \$1,000 from the asset to an expense.

**Month-end adjusting entry:**

| Account | Debit | Credit |
|---|---|---|
| Rent Expense | \$1,000 | |
| Prepaid Rent | | \$1,000 |

After this entry, Prepaid Rent drops to \$5,000 (five months remaining) and Rent Expense shows \$1,000 for January.

### Cash and one more common adjustment

Period-end accrual and deferral entries generally do not touch Cash because the
cash movement, if any, is a separate source event that should already be
recorded. A correction discovered during adjustment can affect Cash when the
books failed to record or misrecorded an actual cash event; “no cash in an
adjustment” is therefore a workflow convention, not an accounting identity.

One more frequent adjustment is
[depreciation](../../../glossary/terms/depreciation.md). Depreciation allocates
an asset's depreciable amount over its expected consumption pattern. It does
not assert that market value fell by the same amount.

**Example:** The business bought a delivery vehicle for \$12,000 with a useful life of 5 years (60 months). Each month, \$200 of the vehicle's cost is recognized as an expense.

| Account | Debit | Credit |
|---|---|---|
| Depreciation Expense | \$200 | |
| Accumulated Depreciation | | \$200 |

Accumulated Depreciation is a contra-asset account — it reduces the vehicle's carrying value on the balance sheet without changing the original cost recorded in the asset account.

## The full accounting cycle

Now that you understand adjusting entries, you can see the complete [accounting cycle](../../../glossary/terms/accounting-cycle.md) — the sequence of steps a business follows each period to go from raw transactions to finished financial statements.

1. **Analyze and record transactions in the journal.** Every business event that has a financial impact gets recorded as a journal entry with equal debits and credits.

2. **Post to the ledger.** Transfer each journal entry to the appropriate accounts in the general ledger so you can see the running balance of every account.

3. **Prepare an unadjusted trial balance.** List all ledger accounts and their balances to verify that total debits equal total credits. This catches posting errors but doesn't guarantee the balances are correct for the period.

4. **Record adjusting entries.** Apply the accruals and deferrals covered in this lesson so that revenues and expenses reflect the current period.

5. **Prepare an adjusted trial balance.** Verify debits still equal credits after the adjustments. This trial balance feeds directly into the financial statements.

6. **Prepare financial statements.** Transform the adjusted ledger into the
   required statements, equity roll-forward, comparisons, and disclosures.
   The exact set and preparation sequence depend on the reporting framework and
   system.

7. **Record [closing entries](../../../glossary/terms/closing-entry.md) when the
   ledger design uses them.** Transfer temporary balances through the entity's
   defined closing accounts. The destination may be retained earnings, an owner
   capital account, or another equity structure; it is not universally retained
   earnings.

8. **Prepare a post-closing trial balance and close record.** Confirm the
   expected permanent balances, arithmetic agreement, completed
   reconciliations, and explicitly held exceptions. Equal columns do not by
   themselves establish that the period is ready.

## Self-check exercises

**Exercise 1.** On October 1, a business paid \$2,400 for a 12-month insurance policy. By December 31, three months have passed. What type of adjustment is this, and what's the adjusting entry?

<details><summary>Answer</summary>

This is a **deferred expense** (prepaid expense). The business paid cash upfront for a benefit that spans multiple periods.

Three months of coverage have been used: \$2,400 / 12 = \$200/month, so \$600 total.

| Account | Debit | Credit |
|---|---|---|
| Insurance Expense | \$600 | |
| Prepaid Insurance | | \$600 |

</details>

**Exercise 2.** A company has a savings account that earned \$350 in interest during March. The bank won't deposit the interest until April 5. Record the adjusting entry for March.

<details><summary>Answer</summary>

This is **accrued revenue** — the interest was earned in March but the cash hasn't arrived yet.

| Account | Debit | Credit |
|---|---|---|
| Interest Receivable | \$350 | |
| Interest Revenue | | \$350 |

</details>

**Exercise 3.** A colleague asks, “Why do period-end accrual and deferral
adjustments normally avoid Cash?” How do you explain it?

<details><summary>Answer</summary>

The cash movement is a separate source event and should have been recorded when
it occurred. The period-end accrual or deferral then recognizes an amount earned,
incurred, or consumed without inventing a second cash movement. If review finds
that a real cash event was omitted or misrecorded, however, the correcting entry
can affect Cash.

</details>

**Exercise 4.** Below is a simplified unadjusted trial balance for March. Prepare the adjusted trial balance after recording the following adjustments: (a) \$500 of prepaid rent has been used, (b) \$800 of services have been performed from unearned revenue, (c) \$1,200 of wages were earned by employees but not yet paid.

| Account | Unadjusted Debit | Unadjusted Credit |
|---|---|---|
| Cash | \$10,000 | |
| Prepaid Rent | \$3,000 | |
| Equipment | \$15,000 | |
| Unearned Revenue | | \$4,000 |
| Common Stock | | \$20,000 |
| Service Revenue | | \$6,000 |
| Wages Expense | \$2,000 | |
| **Totals** | **\$30,000** | **\$30,000** |

<details><summary>Answer</summary>

**Adjusting entries:**

(a) Debit Rent Expense \$500, Credit Prepaid Rent \$500
(b) Debit Unearned Revenue \$800, Credit Service Revenue \$800
(c) Debit Wages Expense \$1,200, Credit Wages Payable \$1,200

**Adjusted trial balance:**

| Account | Adjusted Debit | Adjusted Credit |
|---|---|---|
| Cash | \$10,000 | |
| Prepaid Rent | \$2,500 | |
| Equipment | \$15,000 | |
| Unearned Revenue | | \$3,200 |
| Wages Payable | | \$1,200 |
| Common Stock | | \$20,000 |
| Service Revenue | | \$6,800 |
| Wages Expense | \$3,200 | |
| Rent Expense | \$500 | |
| **Totals** | **\$31,200** | **\$31,200** |

Notice that Cash didn't change in any of the adjustments, two new accounts appeared (Wages Payable and Rent Expense), and total debits still equal total credits.

</details>

## What comes next

You now understand the full cycle from recording a transaction to producing financial statements — including the adjusting entries that make those statements accurate. The next step is learning how to *analyze* financial statements: using ratios and comparisons to extract meaning from the numbers and evaluate a business's performance, liquidity, and financial health.

## Earlier material

After completing this lesson, you'll be able to explain why end-of-period adjustments are necessary, record the four main types of adjusting entries (plus depreciation), and describe the full accounting cycle from the moment a transaction occurs through the preparation of financial statements.

Neither version reflects what actually happened in January.
Under [accrual accounting](../../../glossary/terms/accrual-accounting.md), revenues and expenses must match the period they belong to — not the period cash happens to move.
Adjusting entries fix this mismatch at the end of each accounting period.

Every adjusting entry falls into one of four categories: accrued revenue, accrued expense, deferred revenue, or deferred expense.
Walk through each one below.

Notice that none of the adjusting entries above touch the Cash account.
That's not a coincidence — it's a rule.
If cash moved, it was already recorded in a regular journal entry.
Adjusting entries correct the non-cash side: they recognize revenue that was earned but not yet billed, expenses that were incurred but not yet paid, or they allocate previously recorded amounts to the correct period.

One more adjustment you'll encounter frequently is [depreciation](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/terms/depreciation.md).
Long-lived assets like vehicles and equipment lose value over time, and that cost must be spread across the asset's useful life.

6. **Prepare financial statements.** Use the adjusted trial balance to build the income statement, statement of retained earnings, and balance sheet — in that order, because each statement provides numbers the next one needs.

7. **Record [closing entries](../../../glossary/terms/closing-entry.md).** Transfer the balances of all revenue, expense, and dividend accounts to [retained earnings](../../../glossary/terms/retained-earnings.md).
  This resets temporary accounts to zero so they're ready for the next period.

8. **Prepare a post-closing trial balance.** Confirm that only permanent accounts (assets, liabilities, equity) remain open and that debits equal credits.
  The books are now ready for the next period.

**Exercise 3.** A colleague asks, "Why can't an adjusting entry debit or credit Cash?"
How do you explain it?

The Cash account only changes when cash physically moves into or out of the business.
That movement is always captured by a regular journal entry at the time it happens — paying a bill, receiving a payment, etc. Adjusting entries exist to fix accounts that don't yet reflect economic reality for the period.
They handle timing differences between when cash moves and when the related revenue or expense belongs.
Since the cash side was already recorded, adjustments only touch the non-cash accounts (revenues, expenses, receivables, payables, prepaids, or unearned amounts).
