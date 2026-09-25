---
name: transaction-lens
description: "A transaction lens is a read-only projection of the witness event-log as a double-entry ledger."
type: concept
class: lens
status: draft
depends-on:
  - witness
  - event-log
  - operations-loop
  - operations-settling
instantiates:
  - lens
realizes:
  - tri-transaction-predicate-format
  - tri-detailed-balance-check
  - les-transaction-lens-entity
see-also:
  - chart-of-accounts
  - predication-algebra-model
title: transaction-lens
---

# Transaction lens

A **transaction lens** is a read-only projection of the witness event-log as a double-entry ledger.
Each [witness](../objects/witness.md) in the log is mapped to zero or more *postings* against the substrate's chart-of-accounts, and the lens exposes the standard ledger queries (postings stream, per-account tally, detailed-balance check) over the projection.

The lens is grounded in the predication-algebra-model (PAM) principle that *the witness IS the answer*: there is no parallel transaction substrate to maintain.
The event-log already records every operator invocation; the transaction lens is just a different reading of the same records, carrying the same content under a chart-of-accounts interpretation.

## Position

This realizes the captain's `transactional-record-infrastructure` plan (`tri-transaction-predicate-format`, `tri-detailed-balance-check`) and the `lens-entity-system` plan's `les-transaction-lens-entity` task on the existing FARS substrate.
It does *not* replace the chart-of-accounts.md the captain drafted under `operations/.../accounting/`; it consumes that chart as the target vocabulary for postings.

## Why this is the right shape

The [operations-loop](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/operations-loop.md) goal-doc states the convergence condition explicitly: *"the entropy theorem says entropy decreases monotonically until the stationary profile is reached.
The detailed balance condition (debits = credits) IS the signature of stationarity."* The transaction lens makes that condition *computable* from substrate state, without requiring the operations loop to run through any new piece of infrastructure.

## How the projection works

A *binding* is a rule that maps one operator's witnesses to postings:

```toml
[bindings.commit-drafted]
operator = "commit"
on = "diff_entities_drafted"
debit = "assets:knowledge:library"
credit = "equity:capability"
commodity = "ARTIFACTS"
memo = "entity drafted"
```

The `on` selector reads a key from the witness's `details`:

- absent / `_one_` — one posting per witness, amount = 1
- a list-valued key — one posting, amount = `len(list)`
- a numeric-valued key — one posting, amount = the number

A single witness may match multiple bindings (e.g. a `commit` whose diff drafts entities *and* drafts tasks emits two postings, one per matching binding).

Default bindings cover the operators FARS currently emits (`commit`, `fm_*`, `insertion`, `retraction`, `relocation`); `.fars/ledger.toml` overrides them.
Override is full-replacement, not merge — captains write the chart they want.

## Detailed balance and what imbalance means

`detailed_balance(postings)` returns a per-commodity check: `total_debits == total_credits` within tolerance.
When a commodity is imbalanced, the per-account imbalance list says *where* the accumulation happened.
Per the operations-loop doc's mathematical grounding, that account is the stage of the plan→dispatch→execute→ track→review→feedback loop that hasn't closed.

The lens does not interpret the imbalance — that's the captain's call.
The lens just makes the signature observable.

## Realization

`fars/runtime/ledger.py` (the lens itself) and `fars/cli/ledger.py` (the CLI verb).
Tests in `fars/tests/test_ledger.py`.
The verb is registered in `cli/__main__.py` and `cli/help.py`.

## Position relative to commit-as-witness

The [commit-as-witness](../commit-as-witness/commit-as-witness.md) work materializes git commits as witnesses in the event-log retroactively.
The transaction lens reads forward from any witness, regardless of how it got there — commit-derived witnesses, operator-emitted witnesses, or future session/dispatch witnesses all flow through the same projection.
The two are independent layers; the lens does not depend on the commit materializer.
