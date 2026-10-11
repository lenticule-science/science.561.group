---
kind: task
title: "Build hledger renderer"
description: "Captain's accounting-render-as-hledger decision implies a renderer that emits substrate accounting cells in hledger journal format. Currently in the v0.3 ledger-tool slice; held in captured backlog as a candidate that may surface earlier if substrate accounting becomes a v0.2b need."
of-goal: goal:v0.3-userland-daily-driver-ready
of-milestone: milestone:v0.3-bundled-userland
kind-of-task: engineering
status: open
owned-by-office: office:engineering
assigned-to-personnel: null
priority: 3
estimated-effort-hours: null
actual-effort-hours: null
deadline-by-ord: null
depends-on-tasks: []
area: engineering
horizon: captured
authored-at: 2026-05-03
authority: "decisions/accounting-render-as-hledger.md"
candidate-milestone: milestones/v0.3-bundled-userland.md
---


## Description

A renderer that emits substrate accounting cells in hledger journal format per [decisions/accounting-render-as-hledger.md](../../decisions/accounting-render-as-hledger.md).

Currently scoped inside v0.3 as part of the ledger-tool slice (`t03-70` … `t03-74`); see [milestones/v0.3-bundled-userland.md](../../milestones/v0.3-bundled-userland.md) §"Ledger tool".
Filed here as a captured-horizon task record so that, per the placement discipline in [_conventions.md](../../_conventions.md), the unit is independently dispatchable if it gets pulled forward (e.g. v0.2b discovers a substrate-accounting need from the observability slice's "work-completed cells").

## Acceptance

- A renderer module exists that consumes substrate accounting cells and emits a syntactically valid hledger journal per the hledger plain-text format.
- Round-trip: re-parsing the emitted journal yields the same accounting cells (modulo non-content-bearing whitespace).
- A paired fixture covers a representative set of accounting cells (debit/credit, multi-currency, dated transactions).
- The renderer composes with the v0.3 ledger-tool slice (`t03-70` … `t03-74`) without re-design.

## Promotion conditions

Promote out of `backlog/captured/` to `tasks/engineering/` when either:

- v0.3 activates and the ledger-tool slice begins implementation (re-anchor `of-goal`/`of-milestone` to v0.3 records, set `horizon: doing`, append a progress cell).
- An earlier milestone discovers an accounting-cell-rendering need (re-anchor to that milestone, set `horizon: doing` or `soon`, append a progress cell).

Per [_conventions.md](../../_conventions.md) backlink discipline, leave a redirect at this captured path when the record moves.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:build-hledger-renderer, status, open, true)` — recorded 2026-05-03 on first authoring as a backlog-captured task.
- `(task:build-hledger-renderer, horizon, captured, true)` — recorded 2026-05-03.
- `(task:build-hledger-renderer, derived-from, decisions/accounting-render-as-hledger.md, true)` — recorded 2026-05-03.
