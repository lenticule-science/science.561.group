---
name: witness-routing
description: "The pattern by which the substrate's flat witness stream becomes a routable surface — selectable by channel (named event stream) and origin (producing office, hook, or process) — without the substrate adding any out-of-band routing layer."
type: concept
class: pattern
depends-on: [transaction-lens]
see-also: [dispatch, inbox, failure-diagnosis, learning, memory]
references:
  - "@561-group/predication-algebra-model event-log/channels.js"
  - "FARS analysis: messaging-and-events"
  - "FARS analysis: learning-and-feedback"
  - "AOP concept: failure-diagnosis"
  - "LPMud: ORIGIN_* tag pattern"
title: witness-routing
---

# Witness routing

The pattern by which the substrate's flat witness stream becomes a *routable* surface — selectable by *channel* (named event stream) and *origin* (producing office, hook, or process) — without the substrate adding any out-of-band routing layer.

The flat witness already records *what happened* (operator, target, before/after hash, details).
Two optional predicates extend it with routing information:

- **`channel`** — the named event stream this witness belongs to.
  From PAM's `event-log/channels.js` and the FARS messaging-and-events analysis: *"a channel decouples producer from consumer so new channels can be introduced without changing existing code."* FARS uses `substrate` (default content mutations), `dispatch` (work- matching events), and `learning` (failure-diagnosis and instinct- derivation events).
  Captains may declare additional channels freely; nothing in the substrate hard-codes the set.
- **`origin`** — the producing office, hook, or process.
  From LPMud's `ORIGIN_CALL_OTHER` / `ORIGIN_LOCAL` / `ORIGIN_DRIVER` tagging and the FARS messaging analysis: *"events should carry an origin predicate: which office, hook, or process caused this event.
  This makes the event stream debuggable — when something goes wrong in an autonomous session, you can trace any action to its source."*

Both default to `None` so historical witnesses round-trip unchanged and existing operators that don't yet thread routing predicates stay valid.
The wire format omits None-valued routing fields entirely; adding routing to a witness stream is a forward-compatible change.

## How the [transaction lens](../../event-sourcing/transaction-lens/transaction-lens.md) uses routing

When the lens projects a witness into a [posting](../../event-sourcing/transaction-lens/transaction-lens.md), the witness's `channel` and `origin` carry through to the posting as `witness_channel` and `witness_origin`.
The CLI exposes them as filters on every read surface:

```
pyfars ledger postings --channel learning      # only diagnosis postings
pyfars ledger tally --origin hook:post-commit  # what one hook produced
pyfars ledger balance --commodity TASKS        # task-flow stationarity only
pyfars ledger postings --operator diagnose     # all diagnostic events
```

The composition is AND: a captain can ask "what postings on the learning channel originated from the dispatcher process?" without post-processing JSON.

## Failure-diagnosis as a routed witness

The substrate's [failure-diagnosis](../../../failure-diagnosis/failure-diagnosis.md) discipline says a failure should record *why* in predication form, not just an opaque error code.
The `make_diagnosis_witness` helper emits a witness on the `learning` channel with `operator="diagnose"` and structured `details` carrying `failed_operator`, `diagnosed_cause`, and optional `suggested_response` — exactly the Reflexion pattern *verbal self-reflection stored as episodic memory, injected into the next attempt*.

The default ledger binding books `diagnose` witnesses as `expenses:diagnosis ← equity:capability` in the `DIAGNOSES` commodity.
The cost of having to diagnose is now visible in the ledger; a captain reading `pyfars ledger tally --channel learning` sees the operations-loop's diagnostic burden as accounting flow.

The diagnose witness's `details` schema is pinned (renaming any key is a breaking change for downstream consumers — ledger bindings, learning-loop indexers, instinct derivation):

| key                  | type   | required | meaning                          |
|----------------------|--------|----------|----------------------------------|
| `failed_operator`    | str    | yes      | operator name that failed        |
| `diagnosed_cause`    | str    | yes      | predication-form cause statement |
| `suggested_response` | str    | no       | candidate next move              |
| `related`            | object | no       | structured cross-references      |

## Coverage as the learning loop's first move

The AOP [learning](../../teaching/explanations/learning.md) concept describes the loop *observation → instinct → skill → tool*.
The lens's `coverage` report is the loop's first observation: which operators emit witnesses with no binding match.
The `pyfars ledger coverage --propose-binding OPERATOR` command derives a TOML binding stub for each unmapped operator — the placeholder becomes a captain-edit point, not a rediscovery exercise.
Each proposed binding is a candidate instinct, awaiting captain ratification into the chart-of-accounts.

## What this is *not*

It is not a message bus, a topic system, or a pub/sub layer — there is no separate routing infrastructure.
The witness already exists; the routing predicates are two additional fields on the existing record.
The substrate has gained a routable view, not a new substrate.
