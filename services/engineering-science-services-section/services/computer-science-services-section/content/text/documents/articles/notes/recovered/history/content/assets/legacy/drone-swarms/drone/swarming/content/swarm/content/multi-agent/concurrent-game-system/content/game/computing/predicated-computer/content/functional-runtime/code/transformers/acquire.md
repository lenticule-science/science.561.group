---
type: morphism
class: concurrency-operation
realizes: [lock]
depends-on: [lock-record, witness, left-multiplication-operator, twist-product-fusion, modal-necessity-operator]
see-also: [release, locks-as-cardinality-refined-modal-restriction]
---

# Acquire

The substrate operation that *acquires* a [lock](teaching/explanations/lock.md), blocking the caller until the lock is held or the acquisition's timeout fires.

Structurally — per [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md) — `acquire` is the [left multiplication operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/left-multiplication-operator.md) $\mathrm{L}_{\mathbf{t}_h}(b) := \mathbf{t}_h \odot b$ on the lock's [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_{p_L}$, where $\mathbf{t}_h$ is the holder cell at $(h, \mathrm{resource})$ and $b$ is the prior fiber state. A successful acquire establishes $\mathbf{t}$ at the holder coordinate; an attempt against a held lock produces $\bot$ (the waiting verdict) at the acquirer's world, queueing the cell on the waiters' lorentzian-causal-settling. The acquisition-policy field of [lock-record](../objects/lock-record.md) is the chosen ordering of this settling per Part 4 of the theorem.

## Signature

`acquire(lock-record-id, timeout?) → (lock-token, acquire-witness) | (timeout-witness)`

Inputs:

- **`lock-record-id`** — reference to the lock being acquired.
- **`timeout`** — optional substrate-ordinal duration; absent means wait indefinitely.

Outputs:

- **`lock-token`** — on success, an opaque token the caller passes to [release](release.md).
- **`acquire-witness`** — records the acquisition.
- **`timeout-witness`** — records the timeout failure.

## Operational semantics

1. If the lock is free, mark it held by the caller; emit acquire-witness.
2. If the lock is held by another, queue the caller in the lock's waiters per the lock's acquisition-policy.
3. When the lock is released and the caller is at the head of the waiters queue (per `fair`) or has highest priority (per `priority`), the caller acquires.
4. If the acquisition wait exceeds the timeout, emit timeout-witness; the caller does not acquire.

Per [witness](../../../objects/witness.md), acquisition events are recorded; auditors can review lock-contention patterns.

## Engineering invariants

- **Mutual exclusion.** Only one holder at a time per the lock's discipline.
- **Witness-emitted.** Per [witness](../../../objects/witness.md), acquisitions and timeouts are auditable.
- **Acquisition-policy-respecting.** Per the lock's policy, fair / priority / preemptive acquisition is honored.

## Position in the platform

Acquire is the substrate's *exclusive-access primitive*. Per [lock](teaching/explanations/lock.md), locks are the alternative to CRDT discipline for non-commutative operations. Per [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md), it is the left-multiplication half of the same residuated adjunction that grounds [send-channel](send-channel.md), specialized to a fiber whose admissible-cell set carries the cardinality-refinement that distinguishes locks from channels. Cross-substrate acquire is not this morphism; it is the consensus-backed acquisition of the [distributed-coordination-platform](../../distributed-coordination-platform/_index.md), per Part 5 of the theorem.
