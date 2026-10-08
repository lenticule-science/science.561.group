---
name: continuous-learning-loop
description: "The substrate observes its own gaps, distills the recurring ones into lesson witnesses, and books those lessons as knowledge-asset flows."
type: concept
class: pattern
depends-on: [transaction-lens, witness-routing, bilattice-valued-witness]
see-also: [learning, instinct-record, failure-diagnosis]
references:
  - "AOP concept: learning"
  - "AOP concept: instinct-record"
  - "FARS analysis: learning-and-feedback"
title: continuous-learning-loop
---

# Continuous-learning loop

The substrate observes its own gaps, distills the recurring ones into *lesson* witnesses, and books those lessons as knowledge-asset flows.
The audit chain itself becomes the learning trace.

The AOP [learning](../../teaching/explanations/learning.md) concept names the sequence: **observation → instinct → skill → tool**.
The transaction lens supplies the first arrow with three composable steps:

## Step 1 — Observation: `coverage`

`pyfars ledger coverage` reports per-operator unmapped counts.
Each unmapped operator is a witness type the substrate is emitting that no binding catches: an *observation gap*.

## Step 2 — Distillation: `learn`

`pyfars ledger learn --threshold N` derives a *lesson witness* for every operator with at least N unmapped observations:

```python
make_lesson_witness(
    pattern="unmapped-operator:dispatch",
    suggested_action="add a binding for `dispatch` to .fars/ledger.toml",
    evidence_count=N,
)
```

The lesson lands on the `learning` channel under the `lesson` operator.
Its bilattice **evidence** axis is set from the count via `1 - 1/(1+N)`, so a lesson backed by 1 observation carries `evidence=0.5`, by 9 observations `evidence=0.9` — strength of backing is in the witness, not implicit.

By default `learn` is a dry-run (just *propose* lessons).
Pass `--record` and the lessons are appended to the event log as real witnesses — the substrate's knowledge of its own gaps becomes part of the audit chain, queryable like anything else.

## Step 3 — Asset capitalization: the default lesson binding

The default chart-of-accounts books `lesson` witnesses as:

```
DEBIT  assets:knowledge:lessons   (knowledge stock grew)
CREDIT equity:learning            (learning capacity spent)
COMMODITY LESSONS
```

After `pyfars ledger learn --record`, the captain can read:

```
pyfars ledger tally --commodity LESSONS --weight-by evidence
```

— and see the substrate's accumulated knowledge stock weighted by how strongly each lesson is backed.
The `equity:learning` credit balance shows how much learning capacity the operations loop has spent crystallizing observations into lessons.
This is the loop closing back on itself: learning is *measured*, not just done.

## What this enables

- **Coverage as a learning signal, not a chore.** Captains don't have to remember to add bindings; the substrate surfaces the recurring gaps as ledger-visible knowledge debt.
- **Time-travel learning audit.** `tally --commodity LESSONS --as-of T` shows what the substrate had learned by date T — exactly the question "did we know X when we made decision Y?"
- **Bilattice ranking.** The next step in the AOP loop — *instinct ratification* — picks lessons by `evidence ≥ θ` rather than by manual review.
  The threshold is a captain knob, not a hardcoded constant.

## Derivation families

Three pattern shapes are now distilled, each on the same lesson-witness substrate (no parallel ledger; same `LESSONS` commodity, same per-pattern idempotency):

1. **`unmapped-operator:<op>`** — operators emitting witnesses that no binding catches.
  The original family; the captain's coverage gap.
2. **`failure-cluster:<failed-op>:<cause>`** — recurring `diagnose` witnesses sharing a `(failed_operator, diagnosed_cause)` pair.
  When the same failure mode confirms ≥ N times, the substrate has crossed from incident to pattern.
  Source-witness timestamps carried on the lesson for traceability.
3. **`stationarity-leak:<commodity>:<account>`** — declared closure accounts whose net imbalance crosses threshold.
  Critical guard: only fires for accounts the captain *explicitly* declared in `[closure-accounts]`.
  The strict default (treating every account as closure when no declaration exists) is the right diagnostic for `balance` but would carpet-bomb meaningless lessons here, since stocks like `assets:knowledge:library` are *expected* to grow without bound.

The composer is `derive_all_lessons(witnesses, bindings, closure_accounts, *, threshold)` — every family runs against the same window, the union is returned, and the existing per-pattern idempotency filter (`existing_lesson_strengths`) handles all three uniformly because every lesson is keyed by its `pattern` string.

## What this is *not* (yet)

- Not automatic ratification: lessons are recorded as observations, not edits to `.fars/ledger.toml`.
  The captain still chooses which lessons become bindings (the `--propose-binding` stub assists).
- Not a closed taxonomy of patterns.
  Dispatch-mismatch (truth-vs- evidence divergence on dispatched work), low-truth-streak (operator whose witnesses repeatedly carry low truth), and truncation-block streaks (governance-channel sentinel firings recurring from the same producer) are obvious next derivations sharing the same `make_lesson_witness` shape.
- Not a replacement for the captain's judgment.
  The lessons are candidate instincts, awaiting ratification.
  The audit chain records the candidacy whether or not it ever ratifies.
