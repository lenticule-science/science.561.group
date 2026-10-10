---
type: morphism
class: transaction-operation
realizes: [transaction]
depends-on: [transaction, transaction-record, witness, settlement-determinism]
see-also: [begin-transaction, abort-transaction]
---

# Commit transaction

The substrate operation that *finalizes* a [transaction](teaching/explanations/transaction.md), atomically applying all pending updates to substrate state.

## Signature

`commit-transaction(transaction-record-id) → (committed-witness | conflict-witness)`

Inputs:

- **`transaction-record-id`** — reference to the transaction to commit.

Outputs:

- **`committed-witness`** — on success, all pending updates are applied; transaction state → committed.
- **`conflict-witness`** — on conflict (per the transaction's conflict-detection policy), commit fails and the transaction may retry, abort, or escalate.

## Operational semantics

1. *Conflict detection.* Per the transaction's policy, check whether any of the pending updates conflict with concurrent transactions or with substrate state changes since transaction begin.
2. *If no conflicts*, atomically apply all pending updates per [insertion](insertion.md). Per [settlement-determinism](../theorems/settlement-determinism.md), the commit produces a deterministic substrate-state change.
3. *If conflicts*, per the conflict-detection policy: optimistic-retry returns the conflict-witness for the caller to retry; pessimistic-lock would have prevented the conflict via [acquire](acquire.md); last-writer-wins applies the transaction's updates over the conflicting state.
4. *Witness emit.* Records the commit, the applied updates, and any conflict resolutions.

## Engineering invariants

- **Atomic.** Either all pending updates commit or none.
- **Deterministic.** Per [settlement-determinism](../theorems/settlement-determinism.md), commits are deterministic on inputs.
- **Witness-emitted.** Per [witness](../objects/witness.md), commit events are auditable.

## Position in the substrate

Commit-transaction is the substrate's *transaction-finalization primitive*. Per [transaction-atomicity](../theorems/transaction-atomicity.md), commit's atomicity is what gives transactions their guarantee.
