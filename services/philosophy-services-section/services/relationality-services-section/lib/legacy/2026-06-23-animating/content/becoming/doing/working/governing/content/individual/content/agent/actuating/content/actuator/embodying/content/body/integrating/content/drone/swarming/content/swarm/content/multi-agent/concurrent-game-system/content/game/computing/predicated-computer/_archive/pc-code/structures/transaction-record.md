---
type: definition
class: substrate-entity
realizes: [transaction]
depends-on: [transaction, witness, retraction]
see-also: [begin-transaction]
---

# Transaction record

A **transaction record** is the substrate-entity formal definition of a [transaction](teaching/explanations/transaction.md): the predication-graph entity declaring a multi-cell atomic update.

## Structural fields

- **`id`** — kebab-case identifier (typically derived from the initiating context + ordinal).
- **`description`** — one-line summary.
- **`pending-updates`** — references to the predication updates the transaction will perform on commit.
- **`isolation-level`** — `read-uncommitted`, `read-committed`, `repeatable-read`, `serializable`.
- **`state`** — `pending`, `prepared`, `committed`, `aborted`.
- **`began-at`** — substrate ordinal of begin-transaction.
- **`committed-at`** / **`aborted-at`** — substrate ordinal of commit / abort.
- **`conflict-detection-policy`** — `optimistic-retry`, `pessimistic-lock`, `last-writer-wins`.
- **`participating-scopes`** — references to scopes the transaction touches.
- **`closure-kind`** — `transaction`.

## Invariants

- **Atomic.** Either all pending-updates commit (state → committed) or none do (state → aborted).
- **State-monotone.** State transitions are `pending` → `prepared` → `committed` (or `pending` → `aborted`); regression is inadmissible.
- **Witness-recorded on completion.** Per [witness](../teaching/explanations/witness.md), commit or abort produces a witness.

## Position in the substrate

Transaction records are the substrate's *multi-cell-coherence registry*. Per [transaction-atomicity](../theorems/transaction-atomicity.md), the transaction discipline ensures multi-cell updates are all-or-nothing.
