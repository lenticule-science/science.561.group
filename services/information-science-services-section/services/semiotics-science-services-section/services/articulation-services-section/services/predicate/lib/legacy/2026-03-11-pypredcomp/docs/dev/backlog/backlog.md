---
title: "Backlog"
description: "Horizon-graded backlog per _conventions.md. Tasks with horizon later/captured/done/abandoned live here (whether owned or unowned); only doing/soon items live under tasks/<area>/."
kind: index
---


The backlog holds work graded by horizon per [_conventions.md](../_conventions.md) §"Horizon vocabulary".
Per the placement discipline there, *every* task whose horizon is `later`, `captured`, `done`, or `abandoned` lives under `backlog/<horizon>/` regardless of whether it is owned by a goal/milestone — the only items that live under `tasks/<area>/` are those with horizon `doing` or `soon`.

## Horizon buckets

- **[soon/](soon/)** — next-milestone-shaped *unowned* candidates; scoped enough to be picked up at the next milestone planning pass.
  (Owned `soon` items live under `tasks/<area>/`.)
- **[later/](later/)** — medium-horizon (3–9 months); shape is clear, slot is not yet allocated.
  Owned and unowned alike.
- **[captured/](captured/)** — long-horizon (≥9 months); idea recorded so it isn't lost.
  Owned and unowned alike.
- **[done/](done/)** — terminal-state work that closed; preserved as a record.
  Owned items moved here from `tasks/<area>/` when status becomes `done` and a redirect remains at the old path.

Future records-only sweeps will create `abandoned/` on first such record per the same discipline.

## Distinction from `tasks/<area>/`

Items under [tasks/<area>/](../tasks/) are claimed by a goal/milestone *and* on the active cadence (horizon `doing` or `soon`).
Items under `backlog/` are off-cadence: either unclaimed (no `of-goal`) or on a future/past horizon.
This is the discipline `_conventions.md` requires; the [`fars-work-*`](../../../../../../../../.agents/skills/) tooling enforces it.

## Distinction from `references/triage-backlog-os-level.md`

The triage backlog is *raw input* — captain ideas yet to be classified.
The horizon-graded backlog under this directory is *classified candidate work* — material that has passed an initial records-only sweep and been graded by horizon.

## Theory grounding

The backlog is the *not-yet-dispatch-ready* face of the work hierarchy; per [predicated-work](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/_index.md):

- The horizon vocabulary (`captured` → `later` → `soon` → `doing`) is a [cadence-as-modal-frame](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/cadence-as-modal-frame.md) ladder: each horizon is the modal frame from which the next is reachable, and the dispatch-readiness predicate is monotone along this ladder.
  The `backlog/` ↔ `tasks/<area>/` boundary cuts the ladder exactly between `soon` and `doing`-or-`soon` claims — the operational form of [dispatch-readiness](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/dispatch-readiness.md).
- Graduation along the ladder (`captured → later → soon → doing`) is monotone in the dispatch-readiness order; the strict separation between graduated and not-yet-graduated states is [dispatch-readiness-regime-is-strict](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/dispatch-readiness-regime-is-strict.md).
  An item in `captured/` cannot be dispatched without first being re-classified along the ladder; this is the same strictness the `tasks/_index.md` placement rule cites.
- `done/` is the terminal state authorised by [completion-as-quiescence](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/completion-as-quiescence.md): an item is in `done/` iff its predicate column has quiesced.
  Preserving the record (rather than deleting it) is what licenses prior-state queries — the witness chain remains addressable for [witness-as-increment](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/witness-as-increment.md) replay even after the item closes.
- Graduating an item from `captured/` directly through the ladder to `tasks/<area>/` (rather than skipping levels) preserves the [cadence-as-modal-frame](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/cadence-as-modal-frame.md) discipline; the `fars-work-*` tooling cited above is the captain-side enforcement of the same monotonicity.
