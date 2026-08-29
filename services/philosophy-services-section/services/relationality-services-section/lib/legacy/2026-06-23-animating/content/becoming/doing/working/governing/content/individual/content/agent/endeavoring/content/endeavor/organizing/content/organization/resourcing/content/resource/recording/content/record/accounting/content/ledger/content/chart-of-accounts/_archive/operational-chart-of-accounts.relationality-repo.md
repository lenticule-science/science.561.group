---
title: "Chart of Accounts for Operational Double-Entry"
specialization: idea
date-created: 2026-04-04
serves: operations-loop
relates-to:
  - double-entry-operational-accounting
  - plaintext-accounting-operations
  - ops-tracking-stage
---

## Sketch: Accounts for double-entry operational tracking

Every event debits one account and credits another.
The accounts aren't just financial — they cover all resource flows in the system.

### Asset accounts (things we have) - `assets:compute:tokens` — available API tokens/budget - `assets:compute:sessions` — running session capacity - `assets:knowledge:library` — library entity count (grows with research) - `assets:knowledge:skills` — harness capability count - `assets:knowledge:instincts` — learned behavioral patterns - `assets:work:tasks-ready` — dispatchable work - `assets:work:plans-active` — active plan count - `assets:infrastructure:services` — running services (daemon, MCP servers) - `assets:financial:usd` — actual money

### Expense accounts (things consumed) - `expenses:compute:api-cost` — money spent on API calls - `expenses:compute:tokens-used` — tokens consumed - `expenses:time:session-duration` — wall-clock time in sessions - `expenses:attention:captain-turns` — human attention spent

### Income accounts (value produced) - `income:knowledge:terms-written` — new terms created - `income:knowledge:texts-written` — new texts created - `income:work:tasks-completed` — work finished - `income:work:plans-completed` — plans finished - `income:infrastructure:hooks-added` — system capabilities added - `income:research:surveys-completed` — research produced

### Liability accounts (obligations) - `liabilities:work:tasks-open` — work owed - `liabilities:work:tasks-blocked` — work stuck - `liabilities:attention:failures-unreviewed` — failures needing human review

### Equity accounts (fundamental value) - `equity:charter` — the endeavor's foundational commitment

## How events map to transactions

| Event | Debit | Credit |
|-------|-------|--------|
| Session dispatched | expenses:compute:api-cost | assets:financial:usd |
| Session completed (with output) | assets:knowledge:* | income:work:tasks-completed |
| Session failed | liabilities:attention:failures-unreviewed | expenses:compute:api-cost |
| Term written | assets:knowledge:library | income:knowledge:terms-written |
| Task created | assets:work:tasks-ready | liabilities:work:tasks-open |
| Task completed | income:work:tasks-completed | liabilities:work:tasks-open |

## Balance checks that reveal problems

- `expenses:compute` growing but `income:knowledge` flat → spending without producing
- `liabilities:attention:failures-unreviewed` growing → failures not being learned from
- `assets:work:tasks-ready` high but `expenses:compute:sessions` low → capacity underutilized
- `liabilities:work:tasks-blocked` growing → systemic blockers accumulating

## Implementation note

This doesn't require beancount.
Transactions are EAVT entities with `type: transaction`, `debit-account`, `credit-account`, `amount`, `unit`.
The daemon records them when sessions complete.
The MCP server queries them.
The TUI shows balances.
