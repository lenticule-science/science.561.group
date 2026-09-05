---
name: "journal"
aliases:
  - "journal"
  - "journals"
  - "journal entry"
  - "journal entries"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - Accounting
component-of: double-entry-bookkeeping
produces: ledger
contains: debit-and-credit
---

A journal is the chronological record of admitted accounting entries. A journal
entry carries the effective date, [accounts](./account.md),
[debit and credit](./debit-and-credit.md) effects, description, and enough source
provenance to recover the judgment. It is traditionally called the “book of
original entry,” but it is not the original economic evidence: invoices, bank
records, contracts, custody observations, and other source events exist before
their accounting interpretation.

A journal entry follows a standard format:

| Date | Account | Debit | Credit |
|---|---|---|---|
| 2026-03-06 | Equipment | \$5,000 | |
| | Cash | | \$5,000 |
| | *Purchased equipment for cash* | | |

The debited account is listed first, the credited account is indented below it, and the description follows in italics. When a transaction affects more than two accounts — a *compound entry* — all debits are listed before all credits, and the total debits still equal the total credits.

Specialized sales, purchases, cash-receipt, or cash-disbursement journals are one
implementation for high-volume streams. Modern systems may instead maintain one
event store with typed views. Either design needs stable source identifiers,
duplicate controls, reversal and correction semantics, and a trace from source
event through entry to [ledger](./ledger.md).
