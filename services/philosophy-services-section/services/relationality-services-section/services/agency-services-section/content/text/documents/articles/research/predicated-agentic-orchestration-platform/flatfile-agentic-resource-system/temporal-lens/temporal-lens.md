---
name: temporal-lens
description: "The transaction lens, rewound to any past timestamp."
type: concept
class: pattern
depends-on: [transaction-lens]
see-also: [witness-routing, replay, event-sourcing]
references:
  - "@561-group/predication-algebra-model event-log/replay.js"
  - "Event sourcing: Fowler 2005"
title: temporal-lens
---

# Temporal lens

The transaction lens, rewound to any past timestamp.

Because the substrate's state is the witness event-log, *as-of-time* queries are free: filter the log to witnesses with timestamp ≤ T, project, sum.
No journal-snapshot, no audit-tables, no denormalization — the temporal axis falls out of event-sourcing.

## Surface

Every read verb (`postings`, `tally`, `balance`, `coverage`) accepts `--as-of TIMESTAMP`.
The timestamp is ISO-8601 UTC; lexicographic comparison is total because `now_iso` always emits the same precision and timezone marker.

```
pyfars ledger tally --as-of 2026-04-01T00:00:00Z          # Q1 close
pyfars ledger balance --as-of 2026-05-01T00:00:00Z        # M1 stationarity
pyfars ledger coverage --as-of 2026-04-15T12:00:00Z       # what gaps existed mid-month
```

Composes with every other filter.
The bilattice-conservative balance *as it stood last quarter* is:

```
pyfars ledger balance --as-of 2026-04-01T00:00:00Z --weight-by k_meet
```

## Why this is more than convenience

Three operational moves depend on as-of replay:

1. **Bisecting an imbalance.** When `balance` reports a leak today, binary-search `--as-of` to find the date the leak opened — the responsible witnesses are in that day's log file.
2. **Auditing past decisions in their original epistemic context.** "What did we know on the day the captain ratified instinct X?" is `coverage --as-of <ratification-date>`.
3. **Counterfactual binding swaps.** Edit `.fars/ledger.toml`, `tally --as-of <prior-date>` — see what the chart-of-accounts *would have* read had today's bindings existed then.
  Pure rebinding, no new witnesses.

## What this is not

- Not a snapshot system.
  There is no compacted state to corrupt.
- Not a branch system.
  There is one event log; `--as-of` is a *view* parameter, not a fork.
- Not a write surface.
  You cannot `--as-of` mutate.
  The temporal lens is read-only by construction; the only way to change history is to append a corrective witness *now* (see [witness-routing](../dispatch/witness-routing/witness-routing.md) for the `learning` channel pattern of recording corrections explicitly).
