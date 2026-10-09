---
type: morphism
class: coordination-operation
realizes: [distributed-lock]
depends-on:
  - distributed-lock-record
  - propose-quorum-value
  - witness
  - right-residuation-operator
  - residuated-restriction-as-authority-gate
  - closure-2-monad-lax-idempotence
see-also:
  - release-distributed-lock
  - distributed-lock-as-residuated-authority-gate
---

# Acquire distributed lock

The substrate operation that *acquires a [distributed-lock](teaching/explanations/distributed-lock.md)*, blocking until the lock is held or the acquisition fails.

## Signature

`acquire-distributed-lock(lock-id, requested-by, lease-duration?) → (lock-token, acquire-witness) | (refusal-witness)`

Inputs:

- **`lock-id`** — reference to the [distributed-lock-record](../objects/distributed-lock-record.md).
- **`requested-by`** — the requesting substrate-instance.
- **`lease-duration`** — for lease-based locks, requested lease duration.

Outputs:

- **`lock-token`** — on success, opaque token for [release](release-distributed-lock.md).
- **`acquire-witness`** — records the acquisition.
- **`refusal-witness`** — on contention or partition, records the failure.

## Operational semantics

1. Per the lock's coordination-protocol, propose acquisition (typically via [propose-quorum-value](propose-quorum-value.md)) and obtain the round's authority element $\alpha_\ell^{(r)} \in \mathbf{FOUR}$.
2. **Dispatch on $\alpha_\ell^{(r)}$ *before* any write to the holds-fiber** (this branch is required by the load-bearing precondition of [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md)):
   - $\alpha_\ell^{(r)} = \mathbf t$ (and the lock is currently un-held under the lease-modal projection): write the residuation $\mathrm R_{\mathbf t}(\text{request-payload})$ as the next holds-witness on the holds-predication; emit the signed acquire-witness and lock-token.
   - $\alpha_\ell^{(r)} = \bot$ (undecided): emit refusal-witness; the substrate must re-run the round. Do *not* write to the holds-fiber.
   - $\alpha_\ell^{(r)} = \mathbf f$ (deny-row, which by the residuation table is uniformly $\mathbf t$-valued — *not* a denial in payload terms): emit refusal-witness; do *not* issue a lock-token. The prose-intuitive use of $\mathbf f$ as "this authority denies" is non-conformant per [residuated-restriction-as-authority-gate](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md), row 3.
   - $\alpha_\ell^{(r)} = \top$ (paraconsistent, residual is identity): emit refusal-witness, attach the $\top$-cell, and route to [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md). Do *not* issue a lock-token; per row 4, $\mathrm R_\top$ provides no gating.
3. If lock is held under the lease-modal projection (per [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md), clause "Lease check"), queue or reject per the acquisition-policy. Re-acquire by the current holder is the lax-idempotent identity (returns the prior token with extended witness chain).
4. For lease-based, the holder must renew before lease expires; otherwise the lease-modal $\Box_{R_{\mathrm{lease}}}$ projection ceases to support the holds-witness and the derived `current-holder` becomes absent.

## Engineering invariants

- **Mutual exclusion across substrates.** Per [distributed-lock](teaching/explanations/distributed-lock.md), at most one holder.
- **Lease-respected.** Per [distributed-lock-record](../objects/distributed-lock-record.md), lease expiration releases the lock.
- **Witnessed.** Per [witness](../../../objects/witness.md), acquisition events are auditable.

## Position in the platform

Acquire-distributed-lock is the substrate's *cross-substrate exclusive-access primitive*. Composes with [release-distributed-lock](release-distributed-lock.md).
