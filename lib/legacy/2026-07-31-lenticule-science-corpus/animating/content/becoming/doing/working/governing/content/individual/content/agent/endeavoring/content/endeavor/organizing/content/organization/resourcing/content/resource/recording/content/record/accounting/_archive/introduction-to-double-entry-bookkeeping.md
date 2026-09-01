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

After completing this lesson, you'll be able to record simple business transactions as double-entry [journal entries](../terms/journal.md), explain why every transaction affects at least two [accounts](../terms/account.md), and verify your entries by checking that [debits equal credits](../terms/trial-balance.md).

## A transaction before the system

Suppose you start a business with \$10,000 of your own money.
Before any system of recording, you know two things: the business has \$10,000 in cash, and that cash came from you — the business owes it to you, in a sense, as the owner.
One event, two facts.

Now the business buys a \$3,000 laptop.
Again, two facts: the business has a new piece of equipment worth \$3,000, and the business has \$3,000 less cash.
The total value of what the business owns hasn't changed — it shifted from one form (cash) to another (equipment).

[Double-entry bookkeeping](../terms/double-entry-bookkeeping.md) turns this observation into a rule: every transaction must be recorded in at least two places, and the two sides must be equal.

## The accounting equation

The system rests on one equation:

$$\text{Assets} = \text{Liabilities} + \text{Equity}$$

- **Assets** are what the business owns (cash, equipment, inventory, money owed to it by customers).
- **Liabilities** are what the business owes to others (loans, bills, wages owed to employees).
- **Equity** is what the business owes to its owners — the residual after subtracting liabilities from assets.

Every transaction keeps this equation in balance.
If assets increase, then either another asset decreases, a liability increases, or equity increases — there's no other possibility.

## Debits and credits

The mechanism for keeping the equation balanced is the [debit and credit](../terms/debit-and-credit.md) system.
Every account has a left side (debit) and a right side (credit).
Whether a debit increases or decreases the account depends on the account type:

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

The business receives cash (an asset increases), and the owner's claim on the business increases (equity increases).
Assets go up on the debit side; equity goes up on the credit side.

| Date | Account | Debit | Credit |
|---|---|---|---|
| Mar 1 | Cash | \$10,000 | |
| | Owner's Equity | | \$10,000 |

Check the equation: Assets (\$10,000) = Liabilities (\$0) + Equity (\$10,000).
Balanced.

**Transaction 2: Buy a laptop for \$3,000 cash**

The business gains equipment (asset increases) and loses cash (asset decreases).
One asset goes up, another goes down — both on the asset side.

| Date | Account | Debit | Credit |
|---|---|---|---|
| Mar 3 | Equipment | \$3,000 | |
| | Cash | | \$3,000 |

Check: Assets (\$10,000 - \$3,000 + \$3,000 = \$10,000) = Liabilities (\$0) + Equity (\$10,000).
Balanced.

**Transaction 3: Borrow \$5,000 from a bank**

The business receives cash (asset increases) and takes on a loan (liability increases).

| Date | Account | Debit | Credit |
|---|---|---|---|
| Mar 5 | Cash | \$5,000 | |
| | Loans Payable | | \$5,000 |

Check: Assets (\$10,000 - \$3,000 + \$5,000 = \$12,000) = Liabilities (\$5,000) + Equity (\$10,000) = \$15,000.
Wait — that doesn't balance.
Let's recount: Cash is \$10,000 - \$3,000 + \$5,000 = \$12,000, Equipment is \$3,000.
Total assets = \$15,000.
Liabilities (\$5,000) + Equity (\$10,000) = \$15,000.
Balanced.

## The trial balance

After recording these transactions, you can list every account with its balance to confirm the system is consistent.
This is the [trial balance](../terms/trial-balance.md):

| Account | Debit | Credit |
|---|---|---|
| Cash | \$12,000 | |
| Equipment | \$3,000 | |
| Loans Payable | | \$5,000 |
| Owner's Equity | | \$10,000 |
| **Total** | **\$15,000** | **\$15,000** |

Totals match.
The system is internally consistent.

## Self-check exercises

**Exercise 1**: A business pays \$1,200 rent for the month in cash.
Which accounts are affected, and which side (debit or credit) does each go on?

<details>
<summary>Answer</summary>

Rent Expense is debited \$1,200 (expenses increase on the debit side).
Cash is credited \$1,200 (assets decrease on the credit side).

| Account | Debit | Credit |
|---|---|---|
| Rent Expense | \$1,200 | |
| Cash | | \$1,200 |

</details>

**Exercise 2**: A business buys \$2,000 of inventory on credit (it will pay the supplier later).
Record the journal entry.

<details>
<summary>Answer</summary>

Inventory is debited \$2,000 (asset increases).
Accounts Payable is credited \$2,000 (liability increases — the business now owes the supplier).

| Account | Debit | Credit |
|---|---|---|
| Inventory | \$2,000 | |
| Accounts Payable | | \$2,000 |

</details>

**Exercise 3**: A client pays the business \$4,000 for services rendered.
Record the journal entry.

<details>
<summary>Answer</summary>

Cash is debited \$4,000 (asset increases).
Service Revenue is credited \$4,000 (revenue increases on the credit side).

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

Cash: \$12,000 - \$1,200 + \$4,000 = \$14,800.
Totals balance at \$21,000.

</details>

## What comes next

This lesson covered the core mechanism: every transaction recorded as equal debits and credits across at least two accounts.
The next step is learning how the [chart of accounts](../terms/chart-of-accounts.md) is structured and how to choose the right level of detail for an entity's needs.
