---
title: "Fixture authoring is a paired task (t02-NNf)"
description: "Every v0.2 task ID t02-NN that ships normative substrate behaviour has a paired fixture-authoring task t02-NNf with its own conformance gate. Fixtures are not 'covered by the implementation task'; they are tracked, scheduled, and reviewed independently."
kind: decision
date: "2026-05-02"
status: committed
class: convenience
---

# Fixture authoring is a paired task

## What

For every v0.2 implementation task with ID `t02-NN`, the plan adds a paired **fixture-authoring** task with ID `t02-NNf` ("f" for "fixtures").
The paired task has its own:

- Title (e.g., "Authoring fixtures for t02-12 inter-session messaging").
- Owner (often but not always the same as the implementing task).
- Conformance gate (the fixtures, when run against the implementation, pass).
- Ship date (no later than the parent task's ship date; ideally one to two days earlier).

The pairing is **load-bearing**: the parent task `t02-NN` cannot ship until `t02-NNf` exists and passes against the parent's implementation.
Tasks are not "covered by the implementation"; they are independently tracked artefacts.

Concretely:

- The plan's task list shows `t02-NN` and `t02-NNf` as separate rows with separate status.
- The implementation MR for `t02-NN` includes a stub `t02-NNf` plan entry referencing the fixtures directory (say, `tests/fixtures/t02-NN/`).
- The fixtures MR (`t02-NNf`) authors the actual JSON / scenario files and adds the test runner wiring.
- Both tasks must show "passing" status before either is marked closed.

A task that ships **no normative substrate behaviour** (purely doc work, planning, decision-only) does not need a fixture-authoring pair; the plan annotates such tasks with `fixtures: none-required`.

## Why

The v0.1 cycle revealed a pattern: implementation tasks claimed to "include fixtures," but fixtures were authored under time pressure at the end of the implementation, often by the same person, often after the implementation had stabilised.
The result was *ratifying fixtures* — fixtures that pass because they were written against the implementation's actual behaviour, not against the spec's intended behaviour.
When a subsequent change broke the spec but not the fixtures (because the fixtures were spec-blind), the regression went undetected.

Three discipline gains from pairing:

1. **Fixtures author from the spec, not from the implementation.** Authoring fixtures as a separate task lets the author read the spec first and write fixtures that exercise the spec's claims.
  Coincidentally passing the implementation is the *result*, not the goal.
2. **Fixture authoring is sized.** Treating fixtures as part of the implementation hides their cost; a 3-day implementation often gets a 0.5-day fixture afterthought.
  Treating them as a paired task with its own estimate (~30–50% of implementation effort, often half a day to a day) lets the captain plan honestly.
3. **Cross-implementation diversity gets fixture coverage.** Per [decisions/trusting-trust-bootstrap-path.md](trusting-trust-bootstrap-path.md), the Python and Rust kernels are checked against each other via replay-diversity.
  A fixture that fails on one implementation but not the other is the cleanest possible diversity finding; tracking fixtures separately makes this routine.

The convention `t02-NNf` (parent ID + suffix `f`) is chosen so that fixtures sort adjacent to their parent in any task listing.
Other suffix schemes (`t02-NN-fixtures`, `t02-NN-test`) were considered; the single-letter `f` keeps the suffix stable across rename rounds.

The discipline does **not** require fixtures to pass at the moment the spec is authored — many specs are forward-looking and their fixtures are deferred.
It requires that *if a spec is implemented, its fixtures exist and pass before the milestone ships.*

## What it rules out

- **Implementation tasks claiming "fixtures included" without a paired t02-NNf row.** The pairing is structural, not a checkbox on the implementation row.
- **Freezing t02-NN with t02-NNf in "draft" or absent.** The ship target is conjoined.
- **A single t02-NNf covering multiple t02-NN tasks.** One-to-one pairing; if two implementations share fixtures, they share the *fixture directory*, not the task ID.
- **Fixture tasks owned by "anyone" or unassigned.** Every t02-NNf has a named owner, same convention as t02-NN.
- **Fixtures that ratify the implementation rather than exercising the spec.** A fixture file whose existence-rationale is "the implementation does this" rather than "the spec requires this" is non-conformant; review-time call-out.

## What it does not constrain

- **The fixture format.** JSON scenario files, pytest cases, Rust integration tests, or other formats — the fixture authoring task's owner picks the format appropriate to the implementation.
- **The fixtures directory layout.** [tests/fixtures/](../../../tests/fixtures/) is the conventional location; sub-organization is owner choice.
- **Whether fixtures must run on every CI build.** Run cadence is implementation choice; ship target requires last-pre-ship run is green.
- **The estimate ratio.** "30–50% of implementation effort" is a planning heuristic, not a binding ratio.
- **Fixture coverage metrics.** This decision requires fixture *existence and pass*; it does not require coverage percentages or branch-coverage bars.
- **Whether t02-NNf can be done before t02-NN.** Authoring fixtures from the spec before the implementation exists is *encouraged* (test-first); this decision permits but does not require it.

## Cross-references

- [decisions/v0.2-split-into-v0.2a-and-v0.2b.md](v0.2-split-into-v0.2a-and-v0.2b.md) — both v0.2a and v0.2b honour this pairing discipline.
- [decisions/trusting-trust-bootstrap-path.md](trusting-trust-bootstrap-path.md) — fixtures are the load-bearing artefact for cross-implementation replay-diversity.
- [specs/stdlib/_index.md](../specs/stdlib/_index.md) §"Per-verb fixture discipline" — the verb-level application of this decision.
- [decisions/decision-precedence.md](decision-precedence.md) — this is convenience-class (process discipline, not substrate behaviour).
