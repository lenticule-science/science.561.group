---
type: definition
class: substrate-entity
realizes: [distributed-lock]
depends-on:
  - distributed-lock
  - identity-record
  - leader-record
  - quorum-record
  - witness
  - four-bilattice
  - bilattice-accessibility-relation
see-also:
  - lock-record
  - distributed-lock-as-residuated-authority-gate
---

# Distributed lock record

A **distributed lock record** is the substrate-entity formal definition of a [distributed-lock](teaching/explanations/distributed-lock.md): a substrate-recorded mutual-exclusion lock spanning multiple substrate-instances.

## Structural fields

- **`id`** — kebab-case identifier (typically the locked resource's hash or stable name).
- **`description`** — one-line summary.
- **`resource`** — reference to the substrate entity, scope, or external resource being locked.
- **`current-holder`** — *derived* (not destructively-mutated) reference to the [identity-record](../../../objects/identity-record.md) of the substrate-instance (and optionally agent) currently holding. Per [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md), this field is the cellwise $\bigvee_k$-merge of the lock's holds-witness chain restricted by the lease-modal $\Box_{R_{\mathrm{lease}}}$; it is *absent* when no holds-witness is currently lease-modally supported, not when the substrate has destructively cleared a prior fact. The full witness chain (acquires and conjugate releases) is retained for audit and for the no-oscillation guarantee.
- **`acquired-at`** — substrate ordinal of the most recent lease-modally-supported acquire-witness.
- **`lease-expires-at`** — for lease-based locks, the expiration ordinal of the current lease window — i.e., the boundary at which $R_{\mathrm{lease}}$ collapses to $\mathbf f$ per [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md).
- **`acquisition-policy`** — `fair-fifo`, `priority`, `preemptive`.
- **`coordination-protocol`** — references to the cited [quorum-record](quorum-record.md) or [leader-record](leader-record.md) underlying acquisition.
- **`waiters`** — references to substrate operations queued for acquisition.
- **`closure-kind`** — `distributed-lock`.

## Invariants

- **Single-holder-or-free.** At most one current-holder; absent means free.
- **Lease-respected.** For lease-based, the lock auto-releases at lease-expires-at unless renewed.
- **Substrate-recorded.** Per [self-representation](../../teaching/explanations/self-representation.md), lock state is queryable.

## Position in the platform

Distributed lock records are the substrate's *cross-substrate exclusive-access registry*. Per [distributed-lock](teaching/explanations/distributed-lock.md), they're more expensive than CRDT operations and reserved for genuinely-exclusive cross-substrate operations.
