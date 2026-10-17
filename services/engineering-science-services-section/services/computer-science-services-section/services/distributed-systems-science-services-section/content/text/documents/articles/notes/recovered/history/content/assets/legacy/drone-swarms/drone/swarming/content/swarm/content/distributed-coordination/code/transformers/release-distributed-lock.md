---
type: morphism
class: coordination-operation
realizes: [distributed-lock]
depends-on:
  - distributed-lock-record
  - witness
  - modal-necessity-operator
  - bilattice-accessibility-relation
  - closure-monad-no-non-trivial-periodic-orbits
see-also:
  - acquire-distributed-lock
  - distributed-lock-as-residuated-authority-gate
---

# Release distributed lock

The substrate operation that *releases a held [distributed-lock](teaching/explanations/distributed-lock.md)*, freeing it for the next waiter (or making it generally available).

## Signature

`release-distributed-lock(lock-id, lock-token) → release-witness | (failure-witness)`

Inputs:

- **`lock-id`** — reference to the lock.
- **`lock-token`** — the token returned by [acquire](acquire-distributed-lock.md), proving holder.

Outputs:

- **`release-witness`** — records the release.
- **`failure-witness`** — if the token is invalid (lock already released, lease expired) or coordination fails.

## Operational semantics

1. Verify the cited lock-token matches the current holder.
2. Per the lock's coordination-protocol, propagate the release to participants (via quorum if required).
3. Write a *successor* witness to the holds-predication's witness chain, recording the released-state — the substrate does **not** retract the prior `holds(h, ℓ)` cell; it succeeds it with a `released-by(h, ℓ, lease-window)` witness on the conjugate predication. Per [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md), this conjugate-successor discipline is what the no-oscillation argument requires; it preserves the closure-2-monad inflationary regime per [closure-monad-no-non-trivial-periodic-orbits](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-monad-no-non-trivial-periodic-orbits.md). The query "is the lock currently held?" reads the cellwise $\bigvee_k$-merge of the holds-witness chain against the released-witness chain; the lease-modal $\Box_{R_{\mathrm{lease}}}$ check determines whether the holds-side is still modally supported.
4. Notify next waiter (per acquisition-policy).
5. Emit release-witness.

## Position in the platform

Release-distributed-lock is the *conjugate-predicate successor* to [acquire-distributed-lock](acquire-distributed-lock.md), not its destructive inverse. The substrate's discipline: acquire writes a holds-witness; release writes a released-witness on the conjugate predication; the substrate-recorded "is held?" query is the modal evaluation per [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md). Acquire/release should be paired; long-held locks should renew via lease, not by holding without renewal. The substrate retains the full witness chain for audit; "released" is a fact added to the record, not a fact removed from it.
