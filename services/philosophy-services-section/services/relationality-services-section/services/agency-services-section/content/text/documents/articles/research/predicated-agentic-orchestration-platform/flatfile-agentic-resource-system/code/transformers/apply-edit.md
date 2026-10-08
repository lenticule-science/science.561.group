---
name: apply-edit
description: "The substrate-mutation operator: takes a candidate substrate change (create entity, modify entity's frontmatter, rename entity, retract entity), validates it against the substrate's shape and policy constraints, applies it to the entity store, emits the corresponding Event, and triggers the lifecycle cascade."
title: apply-edit
---

The substrate-mutation operator: takes a candidate substrate change (create entity, modify entity's frontmatter, rename entity, retract entity), validates it against the substrate's shape and policy constraints, applies it to the entity store, emits the corresponding `Event`, and triggers the lifecycle cascade.
`apply-edit` is the only morphism a conformant FARS realization SHALL use to mutate the entity store; direct file writes that bypass `apply-edit` are *substrate-invisible edits* per [event-sourcing](teaching/explanations/event-sourcing.md) and are non-conformant.

`apply-edit` is what realizes the file-first/event-first transition concretely: in *file-first* mode it writes the file then emits the event; in *event-first* mode it emits the event then projects to the file.
The morphism's signature and invariants are the same in both modes; only the order of write-vs-emit differs.

## Signature

```
apply-edit(candidate; rules, mode) → (note, event, witness)
```

Inputs:

- **`candidate`** — the proposed change.
  A structured record carrying the operation kind (`create`, `modify`, `rename`, `retract`), the target entity address, the new frontmatter (or frontmatter delta), the new body (or body delta), and the actor responsible.
- **`rules`** — the active closure-rule system at the candidate's scope.
  Used for validation-as-settlement and for the lifecycle cascade.
- **`mode`** — the edit mode: `file-first` or `event-first`.
  A realization MAY support either or both.
  The default is `file-first`.

Outputs:

- **`note`** — the resulting [`Note`](../objects/note.md) (post-edit), or `null` for a `retract` operation.
- **`event`** — the [`Event`](../objects/event.md) appended to the log.
- **`witness`** — the [`Witness`](../objects/witness.md) attached to the event.

## Operational semantics

`apply-edit` SHALL proceed in five phases, in order:

1. **Resolve and interpret.** Resolve the candidate's target address; if a current `Note` exists, [`load`](load.md) it.
  Construct the post-edit note (creating new content, applying the delta, or marking for retraction).
  [`interpret`](interpret.md) the post-edit note into a candidate fiber.

2. **Validate via settlement.** Per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md), settle the candidate fiber against the kind's shape predications and the scope's constraint predications.
  If the result contains $\top$- or $f$-cells (and the candidate does not carry a `force` flag), abort.
  Construct a diagnostic event on the `guard` channel naming the violated cells, emit it via [`emit-event`](emit-event.md), and return `(null, diagnostic-event, witness)` to the caller.
  The substrate is unchanged.

3. **Persist.** In `file-first` mode: atomically write the post-edit content to the entity store (POSIX rename for safety), then continue.
  In `event-first` mode: skip this phase; the file projection is produced from the event after step 4.

4. **Emit event.** Construct the `Event` with `action` from the operation kind (`create`, `modify`, `rename`, `retract`), `subject` from the target address, `actor` from the candidate, `channel: mutation`, `origin` from the calling operator's identity, and `payload` carrying the canonical hashes of the pre-edit and post-edit notes (or just the pre-edit hash for `retract`).
  Call [`emit-event`](emit-event.md), receive the witness.

5. **Cascade.** Trigger the lifecycle callbacks for the affected entity and any container the entity moved into or out of.
  The callbacks are themselves closure rules that fire on the `mutation`-channel event; per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the cascade is the substrate's own machinery (settle on the post-edit substrate plus the new event), not a privileged hook layer.
  Anomalies surfacing from the cascade — broken references, capability gaps, slug collisions — produce their own diagnostic events on the `analysis` channel.

In `event-first` mode, after step 4 the event-log reducer projects the event into the entity store: it constructs the post-edit note from the event's payload and atomically writes it.
The cascade in step 5 follows.

## Normative invariants

- **Single substrate edit per call.** One `apply-edit` produces exactly one `mutation`-channel event.
  Multi-edit operations (renaming an entity AND updating all inbound references) decompose into multiple `apply-edit` calls, each with its own event.
- **Validation-gated.** A candidate that fails validation-as-settlement SHALL NOT mutate the entity store.
  The substrate is unchanged on rejection.
- **Atomic per file.** The persistence phase SHALL be atomic at the per-file level.
  A partial write (the file written but the event not emitted, or the event emitted but the file not written) is non-conformance.
- **Event-emitting.** Every accepted candidate SHALL produce exactly one event.
  A successful `apply-edit` that fails to emit has lost the substrate's audit.
- **Cascade-triggering.** The lifecycle cascade SHALL run after persistence + emission.
  Closure rules that fire on the new event SHALL see the post-edit substrate state.
- **Replay-equivalent.** Replaying the emitted event from the pre-edit substrate state SHALL reproduce the post-edit state byte-for-byte (modulo declared elision).

## Failure modes

- **Validation failure** ($\top$ or $f$ cells from settlement against shape/constraint).
  Substrate unchanged.
  Diagnostic event on `guard` channel.
- **Persistence failure** (disk full, permissions error).
  In `file-first` mode after the file write succeeded but before event emission: the substrate is in a known-divergent state; the realization SHALL detect this on next coherence check and either reify the missing event or roll back the file.
  In `event-first` mode: the event is emitted but projection failed; replay reproduces the intended state on next read.
- **Cascade failure** (a closure rule in the cascade produces $\top$ that the substrate's repair catalog cannot resolve).
  The candidate IS already accepted; the cascade failure produces a diagnostic event on the `analysis` channel and (if the rule's severity is hard) escalates to the `guard` channel.
- **Force-flagged contradiction.** The candidate carries a `force` flag and the validation step produced $\top$.
  Per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md), the substrate accepts the candidate in its contradictory state.
  The contradicting predicates are recorded in the event's payload so they remain substrate-visible.

## What `apply-edit` is not

- **Not a file-write helper.** `apply-edit` is the substrate's mutation primitive.
  A realization that exposes a "just write this file" operator that bypasses `apply-edit` has un-coupled the entity store from the event log; subsequent operations cannot replay correctly.
- **Not a transaction manager.** `apply-edit` does one substrate edit.
  Multi-edit transactions (move-and-update-references, batch-rename) compose multiple `apply-edit` calls; the substrate's audit chain establishes their causal sequence.
  A realization that wants atomicity across multiple edits SHALL build it from a sequence of `apply-edit`s plus a *transaction* event that bookends the sequence.
- **Not a lock manager.** Concurrent edits to the same entity from different actors produce two events; the substrate's value-domain join $\vee_k$ produces the post-merge state.
  A realization that wants pessimistic locking SHALL build it as substrate predications (an `editing-lock` predicate the substrate's closure rules check before admitting `apply-edit`); the lock is itself substrate content.

## Position

`apply-edit` is the operator under which the substrate's *write side* is coherent.
Every other write-shaped operator — the planned edit operators (move, rename-fm-key, rewrite-fm-slug), the closure-rule applications that update entity fibers, the federation merges that admit peer events — reduces to a sequence of `apply-edit` calls.
The substrate's write-discipline IS `apply-edit`; the substrate's read-discipline is [`load`](load.md) plus [`interpret`](interpret.md); the substrate's inference-discipline is [`respond`](respond.md).
The three together cover everything the substrate does.
