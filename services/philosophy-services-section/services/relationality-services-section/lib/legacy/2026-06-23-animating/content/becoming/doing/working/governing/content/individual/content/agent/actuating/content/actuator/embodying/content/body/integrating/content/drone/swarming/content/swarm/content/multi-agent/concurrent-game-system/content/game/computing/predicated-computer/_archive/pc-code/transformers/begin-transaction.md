---
type: morphism
class: transaction-operation
realizes: [transaction]
depends-on: [transaction, transaction-record, witness]
see-also: [commit-transaction, abort-transaction]
---

# Begin transaction

The substrate operation that *opens* a new [transaction](teaching/explanations/transaction.md), creating a [transaction-record](../objects/transaction-record.md) and beginning the staging period during which pending updates are accumulated.

## Signature

`begin-transaction(scope, isolation-level, conflict-policy) → (transaction-record, witness)`

Inputs:

- **`scope`** — references to the [scope(s)](teaching/explanations/scope.md) the transaction will touch.
- **`isolation-level`** — declared isolation level.
- **`conflict-policy`** — declared conflict-detection policy.

Outputs:

- **`transaction-record`** — the new transaction-record with state `pending`.
- **`witness`** — records the begin event.

## Operational semantics

1. Create a transaction-record with `state: pending`.
2. Subsequent updates within the transaction's context add to the pending-updates set.
3. The transaction's read-view is determined by the isolation-level; under `repeatable-read` and stronger, the transaction sees a snapshot of the substrate at begin-time.
4. Witness emit.

Per [settlement-determinism](../theorems/settlement-determinism.md), the begin event is deterministic.

## Position in the substrate

Begin-transaction is the substrate's *transaction-opening primitive*. Composes with [commit-transaction](commit-transaction.md) and [abort-transaction](abort-transaction.md) to bracket the transactional work.
