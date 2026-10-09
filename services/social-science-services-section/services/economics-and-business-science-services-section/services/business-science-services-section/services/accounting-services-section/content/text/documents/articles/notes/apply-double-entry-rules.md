---
name: apply-double-entry-rules
id: apply-double-entry-rules
description: Apply double-entry accounting rules to transactions. Use when classifying transactions into debits and credits.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
keywords:
  - accounting
runtime:
  invocation: inference
  tool: human
region:
  reads: ["content/domesticity/disciplines/accounting/"]
  writes: ["content/domesticity/disciplines/accounting/"]
dependencies:
- /domesticity/accounting/curricula/double-entry.md
part-of: domesticity/disciplines/accounting
title: apply-double-entry-rules
---

# Apply Double-Entry Rules

Applying double-entry rules begins with the economic event, not with choosing a
debit and a credit. A balanced entry can still belong to the wrong entity,
period, account, quantity, or measurement basis.

## Procedure

1. **Identify the reporting entity and source event.** Determine whose resource
   or obligation changed and retain evidence for what occurred. A payment made
   by a related party is not automatically the entity's cash payment.
2. **Decide whether and when to recognize the event.** Distinguish transaction
   date, performance date, trade date, settlement date, and statement cutoff.
   Recognition follows the applicable accounting basis rather than whichever
   timestamp is easiest to obtain.
3. **Describe each economic effect.** Identify resources received or given up,
   obligations created or discharged, owner transactions, revenue earned, and
   expenses incurred. Do this before selecting account names.
4. **Select accounts at the required reporting granularity.** Use asset,
   liability, equity, revenue, expense, and contra accounts according to their
   economic roles. Preserve material distinctions such as restricted cash,
   related-party balances, and native asset quantities.
5. **Assign debits and credits.** Assets and expenses normally increase with
   debits; liabilities, equity, and revenue normally increase with credits.
   Contra accounts normally carry the opposite balance of the element they
   offset. These are posting conventions, not meanings of “good,” “bad,”
   “inflow,” or “outflow.”
6. **Measure every posting.** State the commodity or reporting unit, quantity,
   and any cost or price required by the measurement basis. A current market
   price does not supply missing historical cost.
7. **Test the entry.** Total debits must equal total credits in each balanced
   unit. Then separately test source support, entity, cutoff, classification,
   completeness, and duplicate risk.

## Example

An entity receives a 1,200 USD annual insurance policy on January 1 and pays
immediately. If the policy provides a future benefit, the initial entry is:

| Account | Debit | Credit |
|---|---:|---:|
| Prepaid Insurance | 1,200 USD | |
| Cash | | 1,200 USD |

After one month of coverage, a supported adjusting entry allocates 100 USD:

| Account | Debit | Credit |
|---|---:|---:|
| Insurance Expense | 100 USD | |
| Prepaid Insurance | | 100 USD |

The entries balance, but their correctness also depends on the entity receiving
the policy, the coverage period, and the policy's recognition threshold.
