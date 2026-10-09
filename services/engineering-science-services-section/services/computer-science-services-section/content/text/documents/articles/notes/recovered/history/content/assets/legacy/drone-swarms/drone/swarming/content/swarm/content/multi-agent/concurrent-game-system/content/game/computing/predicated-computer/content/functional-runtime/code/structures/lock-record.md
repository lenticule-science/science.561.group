---
type: definition
class: substrate-entity
realizes: [lock]
depends-on: [lock, predication-cell, predication-fiber-algebra, witness]
see-also: [channel-record, locks-as-cardinality-refined-modal-restriction, distributed-lock-record]
---

# Lock record

A **lock record** is the substrate-entity formal definition of a [lock](teaching/explanations/lock.md): the predication-graph entity declaring a single-resource mutual-exclusion lock on a substrate. Structurally — per [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md) — the record names the lock's predicate $p_L$, fixes the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_{p_L}$ that holds the holder/waiter state, declares the cardinality refinement (at most one $\mathbf{t}$-holder cell), and declares the lock-accessibility relation $R_L$ that the substrate evaluates $\Box_{R_L}$ against when admitting protected operations.

A lock record is *single-substrate*: by Part 5 of [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md), the cardinality refinement fails $\vee_k$-confluence under federation merge, so cross-substrate exclusivity must escalate to a [distributed-lock-record](../../distributed-coordination-platform/objects/distributed-lock-record.md) backed by [consensus-as-h0-construction](../../distributed-coordination-platform/theorems/consensus-as-h0-construction.md). The two records live in distinct fibrations, not as refinements of one another.

## Structural fields

- **`id`** — kebab-case identifier; equivalently, the lock-predicate $p_L$ that names the fiber.
- **`description`** — one-line summary.
- **`resource`** — reference to the substrate entity, scope, or external resource the lock protects.
- **`holder`** — reference to the substrate operation, agent, or function-invocation context currently holding. Absent (the unit cell $\mathbf{1}$ in $A_{p_L}$) when the lock is free.
- **`acquired-at`** — substrate ordinal of the holder's acquisition.
- **`waiters`** — references to substrate operations queued for acquisition, in the order maintained by the acquisition-policy's lorentzian-causal-settling presentation (per Part 4 of [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md)).
- **`acquisition-policy`** — `fair` (per-substrate causal FIFO), `priority` (priority-then-ordinal lexicographic), `preemptive` (admits paraconsistent transient-$\top$ holder cells).
- **`timeout-policy`** — declaration of what happens when an acquisition wait exceeds a threshold; a per-deployment policy declaration, not a structural commitment.
- **`closure-kind`** — `lock`.

## Invariants

- **Single-holder-or-free.** At most one current holder; absent means free. Structurally, this is the cardinality refinement of Part 1 of [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md): the holder coordinate of $A_{p_L}$ admits at most one cell at $\mathbf{t}$ at any substrate ordinal, with simultaneous-acquire conflicts surfacing as transient $\top$-cells the substrate's adjudication resolves.
- **Holder-only release.** Only the current holder's lock-token can release; others' release attempts produce `invalid-token-witness`. Structurally, this is the residuation uniqueness of Part 2: the right residual $\mathrm{R}_{\mathbf{t}_h}$ is uniquely determined by the holder cell $\mathbf{t}_h$, so a non-holder's release does not invert the prior fusion.
- **Single-substrate.** A lock record's discipline is bounded to one substrate; cross-substrate exclusivity uses the [distributed-lock-record](../../distributed-coordination-platform/objects/distributed-lock-record.md) escalation per Part 5.
- **Substrate-resident.** Per [self-representation](../../teaching/explanations/self-representation.md), every field is a substrate entity. A lock with out-of-band holder/waiter state loses the modal-restriction, witness, and adjudication machinery the substrate provides.

## Operations

- *Create.* Inserting a lock-record establishes the lock with no holder. The creation produces a witness; subsequent acquire/release operations cite the lock-id.
- *Acquire.* See [acquire](../morphisms/acquire.md).
- *Release.* See [release](../morphisms/release.md).
- *Retire.* A lock can be retired; retired locks admit no new acquires and refuse pending waiters with a retirement-witness.

## Position in the platform

Lock records are the substrate's *single-substrate exclusive-access registry*. Per [lock](teaching/explanations/lock.md), they are the alternative to CRDT discipline for non-commutative operations on a single substrate. Per [locks-as-cardinality-refined-modal-restriction](../theorems/locks-as-cardinality-refined-modal-restriction.md), a lock record declares one fiber of the runtime's predication fibration with a cardinality refinement and a lock-modal accessibility relation; the structural distinction from a [channel-record](channel-record.md) is exactly this refinement, which forfeits the channel's federation-portability in exchange for mutual exclusion.
