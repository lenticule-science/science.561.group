---
type: morphism
class: concurrency-operation
realizes: [lock]
depends-on: [lock-record, witness, right-residuation-operator, twist-product-right-residual, predication-fiber-residuation, modal-necessity-operator]
see-also: [acquire, locks-as-cardinality-refined-modal-restriction]
---

# Release

The substrate operation that *releases* a [lock](teaching/explanations/lock.md) previously acquired via [acquire](acquire.md), making it available to the next waiter (per the lock's acquisition policy) or marking it free if no waiters are queued.

Structurally — per [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md) — `release` is the [right residuation operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/right-residuation-operator.md) $\mathrm{R}_{\mathbf{t}_h}(b') := \mathbf{t}_h \Rightarrow b'$ on the lock's [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_{p_L}$, adjoint under [predication-fiber-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-residuation.md) to the [acquire](acquire.md) operation's left-multiplication. The right-residual's uniqueness clause grounds the holder-only-release invariant: only $\mathrm{R}_{\mathbf{t}_h}$ inverts $\mathrm{L}_{\mathbf{t}_h}$, so a non-holder's release attempt does not retract the holder cell — it surfaces as `invalid-token-witness` (the modal-restriction $\Box_{R_L}$ check failing at the non-holder's world).

## Signature

`release(lock-token) → release-witness | invalid-token-witness`

Inputs:

- **`lock-token`** — the token returned by the matching [acquire](acquire.md).

Outputs:

- **`release-witness`** — records the release.
- **`invalid-token-witness`** — recorded if the token doesn't match the current holder (double-release, foreign-release, expired token).

## Operational semantics

1. Verify the token matches the lock's current holder; if not, emit invalid-token-witness and refuse.
2. Mark the lock free.
3. If waiters are queued, wake the next per the lock's acquisition policy ([acquire](acquire.md) handles the corresponding wake-up).
4. Emit release-witness.

Per [witness](../../../objects/witness.md), every release is recorded.

## Engineering invariants

- **Holder-only.** Only the holder (per its lock-token) can release.
- **Idempotent on free.** A second release with the same token is a no-op (invalid-token-witness recorded).
- **Witness-emitted.** Per [witness](../../../objects/witness.md), every release produces a witness.

## Position in the platform

Release is the substrate's *exclusive-access return primitive*. Per [lock](teaching/explanations/lock.md), `acquire` and `release` together form the substrate's mutual-exclusion discipline. Per [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md), it is the right-residuation half of the residuated adjunction on the lock fiber; the holder-only invariant above is the residual's uniqueness clause, and the substrate's awakening of the next waiter follows the lock-record's `acquisition-policy` ordering on the waiters' lorentzian-causal-settling per Part 4 of the theorem.
