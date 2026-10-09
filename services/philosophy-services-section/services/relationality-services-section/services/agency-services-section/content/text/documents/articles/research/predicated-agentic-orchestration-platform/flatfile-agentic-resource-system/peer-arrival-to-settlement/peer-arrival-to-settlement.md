---
name: peer-arrival-to-settlement
description: "This narrative walks one inbound [federation envelope](../objects/federation-envelope-record.md) through every operator FARS commits to between *bytes-on-the-wire* and *settled-local-fiber*. The arc parallels the [`input-inference-output`](input-inference-output.md) narrative for ordinary substrate operations, but it crosses a [sovereign-node](../teaching/explanations/sovereign-node.md) boundary: the cells the receiver ends up holding originated at *another* node's substrate, were emitted as a signed envelope, traveled over some transport, and were admitted into the receiver's substrate under the receiver's own discipline."
type: narrative
depends-on: [federation-envelope-record, peer-record, admit-federation-envelope, merge-peer, settle, witness, bounded-vocabulary-handshake, algebra-as-protocol, content-hash-addressing]
see-also: [emit-federation-envelope, replay-from-peer, federation-convergence]
title: peer-arrival-to-settlement
---

# Peer arrival to settlement

This narrative walks one inbound [federation envelope](../objects/federation-envelope-record.md) through every operator FARS commits to between *bytes-on-the-wire* and *settled-local-fiber*.
The arc parallels the [`input-inference-output`](../input-inference-output/input-inference-output.md) narrative for ordinary substrate operations, but it crosses a [sovereign-node](../architecture/sovereign-node/sovereign-node.md) boundary: the cells the receiver ends up holding originated at *another* node's substrate, were emitted as a signed envelope, traveled over some transport, and were admitted into the receiver's substrate under the receiver's own discipline.

The walk is concrete: one peer ($A$), one receiver ($B$), one envelope ($e$) carrying three cells about one entity.
Every step names the operator, the substrate-record produced, the witness emitted, and the event appended to $B$'s log.
The reader who follows the walk should be able to take any inbound envelope at any FARS realization and trace it through the same sequence.

## Setting

$A$ and $B$ are two FARS sovereign nodes operating against their own [flatfile](../flatfile/flatfile.md) substrates.
They have previously completed the [bounded-vocabulary-handshake](../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md): $B$'s [peer-record](../code/structures/peer-record.md) for $A$ holds `agreed-vocabulary: [risk-tier, last-reviewed-by, review-status]`, `signing-key: <A's identity-key public material>`, `trust-grade: t`, `last-merged-ordinal: 42`. $A$'s peer-record for $B$ is symmetric.

$A$'s substrate has just emitted envelope $e$ (per [`emit-federation-envelope`](../code/transformers/emit-federation-envelope.md)).
The envelope's payload carries three cells — extracted by $A$'s local [`settle`](../code/transformers/settle.md) under $A$'s rule-system version — asserting:

```
entity: contracts/acme-2025-q1
cells:
  - {predicate: risk-tier, value: t, args: [tier-2]}
  - {predicate: last-reviewed-by, value: t, args: [office:legal]}
  - {predicate: review-status, value: t, args: [approved]}
```

$e$ has `from-peer-id: hash(A's identity-record)`, `to-peer-id: hash(B's identity-record)`, `ordinal: 43`, `signature.value: <A's ed25519 sig over canonical bytes>`, `payload.operator: settle`, `payload.rule-system-version: <hash of A's rule system>`, `sender-witness-hash: <hash of A's emission witness>`.

The envelope's bytes have arrived at $B$ over some transport (per [transport-tolerance-of-federation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/transport-tolerance-of-federation.md), the specific transport is irrelevant to what follows).

## Step 1 — Admission

$B$'s federation engine invokes [`admit-federation-envelope`](../code/transformers/admit-federation-envelope.md) with the envelope's bytes and the [transport-record](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/transport-record.md) the bytes arrived on.

The operator parses the bytes into a candidate `FederationEnvelopeRecord`.
Per [content-hash-addressing](../flatfile/content-hash-addressing/content-hash-addressing.md), $B$ recomputes the envelope's canonical content-hash and compares against the claimed `envelope-id`; they match. $B$ looks up $A$'s peer-record by `from-peer-id`; the peer-record exists with `trust-grade: t`. $B$ verifies the signature against $A$'s recorded `signing-key`; verification succeeds. $B$ checks that `ordinal: 43 > peer-record.last-merged-ordinal (42)`; the envelope is not a duplicate. $B$ checks each cell's predicate against `agreed-vocabulary`; all three (`risk-tier`, `last-reviewed-by`, `review-status`) are in the agreed set.

The envelope passes admission. $B$ writes the canonical-JSON to `<B's-root>/.fars/federation/<A's-peer-id>/<envelope-id>.json`, reifying the envelope into $B$'s substrate per [reification](../../../../../teaching/explanations/reification.md). $B$ calls [`emit-event`](../code/transformers/emit-event.md) with:

```
action: federation-envelope-admitted
subject: <A's peer-id>
actor: <B's federation-engine-agent-id>
channel: federation
origin: admit-federation-envelope-operator
payload:
  envelope-id: <hash>
  ordinal: 43
  payload-kind: cells
  sender-witness-hash: <hash>
  peer-trust-grade-at-admission: t
  transport-record-id: <hash>
```

The admission [`Witness`](../objects/witness.md) is constructed: `operator: admit-federation-envelope`, `input_hashes: {envelope-bytes: <hash>, peer-record: <hash>, B-substrate: <hash>}`, `output_hash: <envelope-id>`, `rule_system_version: <B's current rule-system version hash>`, `fuel_consumed: <small constant for verification work>`.

The admission outcome is `admitted`.
Because `payload.kind: cells`, admission dispatches to [`merge-peer`](../code/transformers/merge-peer.md).

## Step 2 — Compose

`merge-peer` resolves the operands.
The cells are about `entity: contracts/acme-2025-q1`. $B$ checks whether this entity exists locally; suppose it does, with $B$'s current fiber holding:

```
entity: contracts/acme-2025-q1
cells:
  - {predicate: risk-tier, value: t, args: [tier-2]}
  - {predicate: review-status, value: f, args: [approved]}
```

(That is: $B$ already had a tier-2 risk classification matching $A$'s, but had recorded that the contract was *not* approved — perhaps a different reviewer at $B$ had marked it as such.)

`merge-peer` calls [`compose`](../morphisms/compose.md) cell-by-cell against $B$'s current fiber:

- `risk-tier=tier-2`: $B$'s fiber has $t$; envelope has $t$. $t \odot t = t$.
  The cell's value remains $t$.
  Provenance accumulates: $B$'s prior provenance (whatever original source asserted tier-2 at $B$) plus the envelope's provenance ($A$'s `envelope-id`, $A$'s `sender-witness-hash`, peer-trust-grade $t$).
- `last-reviewed-by=office:legal`: $B$'s fiber has $\bot$ (the cell is not present locally); envelope has $t$. $\bot \odot t = t$.
  The cell is added; the value is $t$; provenance is the envelope's alone.
- `review-status=approved`: $B$'s fiber has $f$; envelope has $t$. $t \odot f = \top$.
  The cell's new value is $\top$ — *contested*.
  Provenance accumulates both sources, recording the contestation as a substrate-visible fact.

The composed fiber is:

```
entity: contracts/acme-2025-q1
cells:
  - {predicate: risk-tier, value: t, args: [tier-2], provenance: [B-original, A-envelope-43]}
  - {predicate: last-reviewed-by, value: t, args: [office:legal], provenance: [A-envelope-43]}
  - {predicate: review-status, value: ⊤, args: [approved], provenance: [B-original, A-envelope-43]}
```

## Step 3 — Settle

`merge-peer` invokes [`settle`](../code/transformers/settle.md) on the affected entity under $B$'s *own* `rule-system-version` (per [algebra-as-protocol](../algebra-as-protocol/algebra-as-protocol.md), the sender's rule-system-version is provenance, not a directive). $B$'s closure rules fire:

- A rule that propagates `review-status` to the contract's parent project entity sees the $\top$-cell and propagates the contestation rather than the approval.
  The parent project's `last-known-contract-status` cell becomes $\top$.
- A rule that triggers a notification when a high-trust peer asserts a contradictory `review-status` matches.
  The rule's output is a new cell on a `notifications/` substrate entity carrying the diagnostic.
- A governance rule that flags contested cells on contract entities for review fires.
  A cell on a `governance-queue/` entity is added.

Settling reaches fixed-point after three rule-firings.
The post-settle fiber-state hashes are computed and recorded in the merge witness's `output_hash`.

## Step 4 — Update peer-record

`merge-peer` updates $A$'s peer-record at $B$: `last-merged-ordinal := 43`.
Per [`apply-edit`](../code/transformers/apply-edit.md), this is its own substrate edit, emitting an event:

```
action: apply-edit
subject: <A's peer-id>
actor: <B's federation-engine-agent-id>
channel: substrate-edit
origin: merge-peer-operator
payload:
  field: last-merged-ordinal
  prior-value: 42
  new-value: 43
```

## Step 5 — Emit merge event

`merge-peer` calls [`emit-event`](../code/transformers/emit-event.md):

```
action: merge-peer
subject: <A's peer-id>
actor: <B's federation-engine-agent-id>
channel: federation
origin: merge-peer-operator
payload:
  envelope-id: <hash>
  affected-entities: [contracts/acme-2025-q1, projects/acme, notifications/fed-1234, governance-queue/contested-1234]
  pre-fiber-hashes: {contracts/acme-2025-q1: <hash>}
  post-fiber-hashes: {contracts/acme-2025-q1: <hash>, projects/acme: <hash>, notifications/fed-1234: <hash>, governance-queue/contested-1234: <hash>}
```

The merge witness is returned as the operator's output.
The audit chain for this admission is now:

```
A's emission witness ⤳ envelope-43 ⤳ B's admission witness ⤳ B's merge witness ⤳ B's per-entity settle witnesses
```

An auditor at $B$ tracing the contested $\top$-cell on `contracts/acme-2025-q1.review-status` walks this chain back to $A$'s emission witness, then (with $A$'s cooperation) into $A$'s substrate to find what $A$ originally asserted and why.

## Step 6 — Downstream

The merge-event surfaces on $B$'s `federation` channel; the contested cell on `contracts/acme-2025-q1` surfaces on the substrate's standard read-discipline.
Subsequent operations at $B$ pick up the new state:

- A query against `contracts/acme-2025-q1.review-status` returns $\top$ (contested), with provenance citing both $B$'s original and $A$'s envelope.
- A governance agent (per [governance-decision-modal-decidability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md)) reads the `governance-queue/contested-1234` cell and may schedule a review session.
- A future settle on `contracts/acme-2025-q1` continues to surface the contestation until governance produces a substrate edit resolving it (e.g., $B$ adopts $A$'s view by emitting a local `review-status=approved` assertion that overrides the prior $f$, or $B$ raises a question to $A$ via an [`emit-federation-envelope`](../code/transformers/emit-federation-envelope.md) call carrying a different cell).

## What the walk demonstrates

The arc from envelope-bytes to settled-fiber crosses six operators ([`admit-federation-envelope`](../code/transformers/admit-federation-envelope.md), [`compose`](../morphisms/compose.md), [`settle`](../code/transformers/settle.md), [`apply-edit`](../code/transformers/apply-edit.md), [`emit-event`](../code/transformers/emit-event.md) at three points, [`merge-peer`](../code/transformers/merge-peer.md)) and produces five substrate-record kinds ([`FederationEnvelopeRecord`](../objects/federation-envelope-record.md), updated [`Note`](../objects/note.md)s, updated [`Fiber`](../code/structures/fiber.md)s, multiple [`Event`](../objects/event.md)s, multiple [`Witness`](../objects/witness.md)es).
Every step is in the local event log; every step's audit chain is verifiable from substrate content.

The walk demonstrates four properties FARS commits to:

1. **The wire carries algebra, not protocol.** The envelope's payload is `(operator, operand-hashes, cells)` per [algebra-as-protocol](../algebra-as-protocol/algebra-as-protocol.md); the receiver's job is to run the substrate's own algebra against its own state, not to interpret protocol verbs.
2. **The receiver is sovereign.** Every check that determines admission is the receiver's; the sender's claims are treated as predications the receiver evaluates under its own discipline.
  Per [sovereign-node](../architecture/sovereign-node/sovereign-node.md), the receiver remains source-of-truth for its own substrate.
3. **Contestation is substrate content.** When the merge produces a $\top$-cell, the contestation is *visible*, not *resolved-away*.
  Per the bilattice's discipline, $\top$ is a substrate value the receiver's governance acts on; the federation operator does not pretend agreement where none exists.
4. **The audit chain is end-to-end.** From $A$'s original local assertion (via $A$'s local witness chain) through $A$'s emission, through the wire, into $B$'s admission, into $B$'s merge, into $B$'s settle, the chain of witnesses is unbroken and traceable.
  An auditor can trace any cell at $B$ back to the substrate operation at $A$ that originated it (modulo $A$'s cooperation in serving the upstream witnesses).

The walk also shows what the federation discipline does *not* try to do: it does not produce agreement between $A$ and $B$ about `review-status` (the contestation persists as $\top$ until governance resolves it); it does not synchronize $A$'s and $B$'s rule systems (each settles under its own); it does not replicate $A$'s full substrate at $B$ (only the cells the envelope carried); it does not order admissions globally (per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), order is irrelevant for convergence).

What it does do is make $B$'s substrate strictly more informed (in the knowledge-order $\leq_k$): every cell $A$ asserted is now reflected at $B$, either as concordant evidence sustaining $B$'s prior view, as new information $B$ did not have, or as contested cells that surface for governance.
This is the *engineering content* of FARS federation: a substrate-level discipline that admits peer content under bilattice composition, settles under local rules, and surfaces every contestation for downstream resolution — the same discipline the parent theory's [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) theorem says any conformant federation substrate SHALL commit to.
