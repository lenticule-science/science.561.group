---
source: [envelope, peer-record]
target: [witness]
name: merge-peer
description: "The morphism that admits an admitted federation envelope's cells into the local substrate by composing them with the local fiber per the substrate's value-domain and then settling under the local closure-rule system."
type: morphism
class: composed-operator
instantiates: [merge, replication]
depends-on: [federation-envelope-record, peer-record, compose, settle, witness, federation-convergence, algebra-as-protocol]
see-also: [admit-federation-envelope, replay-from-peer, emit-federation-envelope]
title: merge-peer
---


The morphism that admits an [admitted federation envelope](../objects/federation-envelope-record.md)'s cells into the local substrate by composing them with the local fiber per the substrate's value-domain and then settling under the local closure-rule system.
`merge-peer` is FARS's instantiation of the parent-theory [merge](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/merge.md) operator at the flatfile substrate, applied across a sovereign-node boundary; per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) and [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md), it is the substrate's own [`compose`](compose.md)-then-[`settle`](settle.md), with no protocol-specific merge logic added.

`merge-peer` is what makes [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) operational at FARS: two sovereign nodes that admit the same set of envelopes (in any order) end up at the same fiber state, because the operator is the substrate's own join-and-close — idempotent, commutative, associative, and monotone per the parent theorem.

## Signature

```
merge-peer(envelope, peer-record) → witness
```

Inputs:

- **`envelope`** — a [`FederationEnvelopeRecord`](../objects/federation-envelope-record.md) of `payload.kind: cells`.
  The envelope SHALL have already passed [`admit-federation-envelope`](admit-federation-envelope.md)'s checks (signature verification, vocabulary conformance, peer-record lookup); `merge-peer` does not re-verify them.
- **`peer-record`** — the [`PeerRecord`](../structures/peer-record.md) the envelope was admitted from.
  Used to record the merge in the peer-record's `last-merged-ordinal` and to attach peer-grade trust to the merged cells per [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md).

Outputs:

- **`witness`** — the [`Witness`](../objects/witness.md) recording the merge.
  The witness's `input_hashes.local-fiber` cites the local fiber's hash before merge; `input_hashes.envelope` cites the envelope's `envelope-id`; `output_hash` cites the post-settle fiber's hash.
  The witness chain leading to this merge includes the envelope's `sender-witness-hash` and `upstream-witness-hashes`, so an auditor can trace the merged content back through the sender's settle to its origin.

## Operational semantics

`merge-peer` SHALL proceed:

1. **Resolve operands.** For each cell in `envelope.payload.content`, ensure the cell's `entity`-address is currently held by the local substrate.
  If not, create a stub [`Note`](../objects/note.md) at the substrate's path-derivation for that entity (per the realization's path-policy) so the cell has a substrate-resident target.
  The stub is itself a substrate edit; per [event-sourcing](teaching/explanations/event-sourcing.md), it emits its own `apply-edit` event before the merge proceeds.
2. **Compose cells.** For each cell in the envelope, look up the local [`Fiber`](../structures/fiber.md) for the cell's `entity`.
  Apply [`compose`](compose.md) cell-by-cell: the local fiber's value at the cell's predicate-and-arguments is composed with the envelope's value via the bilattice's $\odot$ table.
  Concordant evidence sustains; discordant evidence produces $\top$ (per [`compose`](compose.md)'s table); $\bot$-on-absence is the unit.
  Provenance for the merged cell records both the local prior provenance and the envelope's provenance (envelope-id, sender-witness-hash, peer-record's trust-grade at admission).
3. **Settle locally.** Run [`settle`](settle.md) on each affected entity's fiber, under the receiver's *own* `rule-system-version` (NOT the sender's).
  Per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md) and [sovereign-node](../../architecture/sovereign-node/sovereign-node.md), the sender's rule-system-version is provenance, not a directive; the receiver re-settles under its own rules.
  Settling may fire closure rules that propagate the merged content to neighboring entities; those propagations follow the substrate's normal locality discipline.
4. **Update peer-record.** Set `peer-record.last-merged-ordinal := max(peer-record.last-merged-ordinal, envelope.ordinal)`.
  The update is itself a substrate edit per [`apply-edit`](apply-edit.md), emitting its own event.
5. **Emit merge-event.** [`emit-event`](emit-event.md) one event of `action: merge-peer`, `subject: peer-record.peer-id`, `actor: <local-federation-engine-agent-id>`, `channel: federation`, `origin: merge-peer-operator`, with payload containing the envelope-id, the affected entity-addresses, and the pre/post fiber hashes.
6. **Return witness.** The composite witness chain (envelope's sender-witness ⤳ admission witness ⤳ merge witness ⤳ post-settle witnesses on each affected entity) is the audit chain a downstream operator can cite when tracing the merged content's history.

## Normative invariants

Per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), `merge-peer` SHALL satisfy:

- **Idempotent.** Applying `merge-peer` to the same envelope twice produces no further substrate change after the first application.
  Per the bilattice's discipline, $a \odot a = a$ for $a \in \{\bot, t, f, \top\}$; per [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md), envelopes are dedup'd at admission by `envelope-id`.
  The composition of these two facts realizes idempotence at the FARS substrate.
- **Commutative.** For two envelopes $E_1, E_2$ from a peer, `merge-peer(E_1) ; merge-peer(E_2)` produces the same final fiber state as `merge-peer(E_2) ; merge-peer(E_1)`.
  Per [`compose`](compose.md)'s commutativity ($a \odot b = b \odot a$ on the bilattice) extended pointwise to fibers, and per [`settle`](settle.md)'s confluence on the bilattice value-domain, the order of admission does not affect the post-settle state.
- **Associative.** For three envelopes $E_1, E_2, E_3$, `(merge-peer(E_1) ; merge-peer(E_2)) ; merge-peer(E_3)` produces the same fiber state as `merge-peer(E_1) ; (merge-peer(E_2) ; merge-peer(E_3))`.
  Per the bilattice's associativity, lifted to fibers, lifted across substrate-state via settle's confluence.
- **Monotonic.** For an envelope $E$, the post-merge fiber $F'$ satisfies $F \leq_k F'$ in the knowledge-order ($\leq_k$): merging an envelope can only add information, never remove it.
  Per the bilattice's $\leq_k$ structure ($\bot \leq_k t, \bot \leq_k f, t \leq_k \top, f \leq_k \top$), the $\odot$ operation is $\leq_k$-monotone; per [`settle`](settle.md), the closure operator $\mathrm{cl}_p$ is $\leq_k$-monotone; the composition is $\leq_k$-monotone.
  Retractions per [federation-envelope-record](../objects/federation-envelope-record.md)'s `retraction` kind are *separate envelopes* whose admission emits a retraction event; they do not violate this invariant for the `cells`-kind admission.

## Failure modes

- **Operand resolution failure.** A cell's `entity`-address cannot be created at the local substrate (filesystem permissions, naming-collision under a path-policy that forbids overwrites).
  Surface as a `guard`-channel diagnostic citing the failing cell; do not partially apply the merge.
- **Settle failure.** [`settle`](settle.md)'s budget is exhausted before fixed-point; the substrate enters a `partial-merge` state.
  Per [`settle`](settle.md)'s discipline, the partial state is recorded with a `settlement-budget-exhausted` event and the merge witness's `fuel_consumed` records the exhaustion.
  The merge is not retracted; the partial state is substrate-visible and governance per [governance-decision-modal-decidability](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md) decides whether to extend the budget and continue or to retract.
- **Closure-rule conflict producing widespread $\top$-cells.** The merged content settles to a substrate state with many $\top$ cells (contested predications).
  This is *not* a failure mode; it is a substrate-visible contestation surfaced for governance per [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md).
  The merge succeeded; the receiver's substrate now holds contested cells citing both local and peer-derived provenance.

## What `merge-peer` is not

- **Not a protocol-level merge.** Per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md), `merge-peer` does not implement protocol verbs (override, supersede, primary-wins).
  The substrate's own value-domain decides cell-level resolution; protocol verbs would re-implement what the bilattice already says.
- **Not a sender-state-replication.** The receiver does NOT end up with a copy of the sender's full substrate.
  The receiver ends up with its own substrate *augmented* by the cells the envelope carried, settled under the receiver's own rules.
  Per [sovereign-node](../../architecture/sovereign-node/sovereign-node.md), the receiver remains the source-of-truth for its own substrate; the merge admits new content into that substrate.
- **Not a one-time operation.** A peer that re-emits an envelope (after a network failure, after a perceived non-acknowledgment) re-invokes `merge-peer` on the receiver.
  Per the idempotence invariant, the second invocation is a no-op on substrate state but *does* emit a fresh merge-event; the event log records both attempts.
- **Not [`compose`](compose.md) directly.** `merge-peer` is `compose`-then-`settle`-then-event-emit.
  A bare [`compose`](compose.md) call against a federation envelope would update the fiber but not propagate the consequences; the closure rules would fire on the next local settle, but the federation-event would not be in the log.

## Position

`merge-peer` is the operational realization of FARS's federation discipline.
Per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md), it is exactly the substrate's existing algebra applied at the federation boundary; per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), the four invariants above are theorems, not engineering choices.
Per [flatfile-federation-equivalence](../../flatfile-federation-equivalence/flatfile-federation-equivalence.md), the FARS-substrate-specific instantiation produces the same fiber state as the parent-theory federation-convergence operator at the same value-domain, validating that the FARS realization is conformant.

The morphism composes with [`admit-federation-envelope`](admit-federation-envelope.md) (which precedes it in the admission pipeline), with [`emit-federation-envelope`](emit-federation-envelope.md) (the symmetric outbound operator), with [`replay-from-peer`](replay-from-peer.md) (which calls `merge-peer` per envelope in the replayed sequence), with [peer-record](../structures/peer-record.md) (which it updates), and with [`settle`](settle.md) (which it invokes on each affected entity).
