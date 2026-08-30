---
title: "Introduction to Double-Entry Bookkeeping"
aliases:
  - "Introduction to Double-Entry Bookkeeping"
type: curriculum-lesson
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
keywords:
  - Accounting
teaches:
  - "Double-Entry Bookkeeping"
---

After completing this lesson, you'll be able to record simple business transactions as double-entry [journal entries](../../../glossary/terms/journal.md), explain why every transaction affects at least two [accounts](../../../glossary/terms/account.md), and verify your entries by checking that [debits equal credits](../../../glossary/terms/trial-balance.md).

## A transaction before the system

Suppose an owner contributes \$10,000 cash to a business and the governing facts
support equity classification. The business controls \$10,000 in cash, and the
owner's residual interest increases. Equity is not a liability merely “owed” to
the owner; distributions depend on the entity's structure, law, agreements, and
available resources.

Now the business buys a qualifying laptop for \$3,000 cash and recognizes that
amount as cost. Equipment at cost increases and cash decreases. The entry does
not establish that the laptop's market value equals its purchase price or that
fees, taxes, impairment, or capitalization thresholds are irrelevant.

[Double-entry bookkeeping](../../../glossary/terms/double-entry-bookkeeping.md) turns this observation into a rule: every transaction must be recorded in at least two places, and the two sides must be equal.

## The accounting equation

The system rests on one equation:

$$\text{Assets} = \text{Liabilities} + \text{Equity}$$

- **Assets** are recognized resources controlled by the entity under the
  governing basis.
- **Liabilities** are recognized present obligations of the entity.
- **Equity** is the residual interest after liabilities are deducted from
  assets; it is not another liability category.

Every transaction keeps this equation in balance. If assets increase, then either another asset decreases, a liability increases, or equity increases — there's no other possibility.

## Debits and credits

The mechanism for keeping the equation balanced is the [debit and credit](../../../glossary/terms/debit-and-credit.md) system. Every account has a left side (debit) and a right side (credit). Whether a debit increases or decreases the account depends on the account type:

| Account type | Debit | Credit |
|---|---|---|
| Asset | Increase | Decrease |
| Liability | Decrease | Increase |
| Equity | Decrease | Increase |
| Revenue | Decrease | Increase |
| Expense | Increase | Decrease |

The rule: in every transaction, total debits must equal total credits.

## Worked example

Let's record three transactions for a new consulting business.

**Transaction 1: Owner invests \$10,000 cash**

The business receives cash (an asset increases), and the owner's claim on the business increases (equity increases). Assets go up on the debit side; equity goes up on the credit side.

| Date | Account | Debit | Credit |
|---|---|---|---|
| Mar 1 | Cash | \$10,000 | |
| | Owner's Equity | | \$10,000 |

Check the equation: Assets (\$10,000) = Liabilities (\$0) + Equity (\$10,000). Balanced.

**Transaction 2: Buy a laptop for \$3,000 cash**

The business gains equipment (asset increases) and loses cash (asset decreases). One asset goes up, another goes down — both on the asset side.

| Date | Account | Debit | Credit |
|---|---|---|---|
| Mar 3 | Equipment | \$3,000 | |
| | Cash | | \$3,000 |

Check: Assets (\$10,000 - \$3,000 + \$3,000 = \$10,000) = Liabilities (\$0) + Equity (\$10,000). Balanced.

**Transaction 3: Borrow \$5,000 from a bank**

The business receives cash (asset increases) and takes on a loan (liability increases).

| Date | Account | Debit | Credit |
|---|---|---|---|
| Mar 5 | Cash | \$5,000 | |
| | Loans Payable | | \$5,000 |

Check: Assets (\$10,000 - \$3,000 + \$5,000 = \$12,000) = Liabilities (\$5,000) + Equity (\$10,000) = \$15,000. Wait — that doesn't balance. Let's recount: Cash is \$10,000 - \$3,000 + \$5,000 = \$12,000, Equipment is \$3,000. Total assets = \$15,000. Liabilities (\$5,000) + Equity (\$10,000) = \$15,000. Balanced.

## The trial balance

After recording these transactions, you can list every account with its balance to confirm the system is consistent. This is the [trial balance](../../../glossary/terms/trial-balance.md):

| Account | Debit | Credit |
|---|---|---|
| Cash | \$12,000 | |
| Equipment | \$3,000 | |
| Loans Payable | | \$5,000 |
| Owner's Equity | | \$10,000 |
| **Total** | **\$15,000** | **\$15,000** |

Totals match. This trial balance has aggregate debit-credit agreement; it could
still contain omissions, duplicates, unsupported values, or misclassifications.

## Self-check exercises

**Exercise 1**: A business pays \$1,200 rent for the month in cash. Which accounts are affected, and which side (debit or credit) does each go on?

<details>
<summary>Answer</summary>

Rent Expense is debited \$1,200 (expenses increase on the debit side). Cash is credited \$1,200 (assets decrease on the credit side).

| Account | Debit | Credit |
|---|---|---|
| Rent Expense | \$1,200 | |
| Cash | | \$1,200 |

</details>

**Exercise 2**: A business buys \$2,000 of inventory on credit (it will pay the supplier later). Record the journal entry.

<details>
<summary>Answer</summary>

Inventory is debited \$2,000 (asset increases). Accounts Payable is credited \$2,000 (liability increases — the business now owes the supplier).

| Account | Debit | Credit |
|---|---|---|
| Inventory | \$2,000 | |
| Accounts Payable | | \$2,000 |

</details>

**Exercise 3**: A client pays \$4,000 at the moment the business performs and
recognizes services that have not previously been invoiced or recorded. Record
the journal entry.

<details>
<summary>Answer</summary>

Cash is debited \$4,000 (asset increases). Service Revenue is credited \$4,000 (revenue increases on the credit side).

| Account | Debit | Credit |
|---|---|---|
| Cash | \$4,000 | |
| Service Revenue | | \$4,000 |

</details>

**Exercise 4**: After the three transactions above (rent, inventory purchase, client payment), prepare a trial balance that includes the original three transactions from the worked example.

<details>
<summary>Answer</summary>

| Account | Debit | Credit |
|---|---|---|
| Cash | \$14,800 | |
| Equipment | \$3,000 | |
| Inventory | \$2,000 | |
| Accounts Payable | | \$2,000 |
| Loans Payable | | \$5,000 |
| Owner's Equity | | \$10,000 |
| Service Revenue | | \$4,000 |
| Rent Expense | \$1,200 | |
| **Total** | **\$21,000** | **\$21,000** |

Cash: \$12,000 - \$1,200 + \$4,000 = \$14,800. Totals balance at \$21,000.

</details>

## What comes next

This lesson covered the core mechanism: every transaction recorded as equal debits and credits across at least two accounts. The next step is learning how the [chart of accounts](../../../glossary/terms/chart-of-accounts.md) is structured and how to choose the right level of detail for an entity's needs.
