---
name: bounded-vocabulary-handshake
description: "FARS's instantiation of the parent-theory shared-vocabulary-federation discipline: two FARS sovereign nodes, before exchanging structured federation envelopes, SHALL perform a vocabulary-handshake declaring the bounded subset of predicates each will admit from the other."
type: concept
class: federation-discipline
instantiates: [shared-vocabulary-federation]
depends-on: [content-hash-addressing, sovereign-node, federation-envelope-record, peer-record, frontmatter-as-presentation]
see-also: [admit-federation-envelope, federation-bridge, algebra-as-protocol]
title: bounded-vocabulary-handshake
---

# Bounded-vocabulary handshake

FARS's instantiation of the parent-theory [shared-vocabulary-federation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/shared-vocabulary-federation.md) discipline: two FARS [sovereign nodes](../architecture/sovereign-node/sovereign-node.md), before exchanging structured federation envelopes, SHALL perform a vocabulary-handshake declaring the *bounded subset* of predicates each will admit from the other.
The agreed bounded vocabulary is itself substrate content — recorded as predications on each node's [peer-record](../code/structures/peer-record.md) for the other.

The handshake's "bounded" qualifier is the FARS-specific commitment: a flatfile substrate's vocabulary is the union of every predicate appearing in any frontmatter key or body-link of any `.md` file under its root.
That union grows as the substrate is edited; pinning a *bounded subset* per peer is what lets two nodes federate without one's vocabulary growth forcing the other's vocabulary to grow.

## Why bounded

A FARS sovereign node's vocabulary is open-ended by design.
Per [frontmatter-as-presentation](../flatfile/frontmatter-as-presentation/frontmatter-as-presentation.md), any frontmatter key the closure-rule system knows how to interpret is a substrate predicate; an editor adding a new key to one entity (say, `risk-tier`) implicitly extends the substrate's vocabulary.
Without a bound, federation between two nodes would either (a) require both to admit every predicate either one ever emits — peer-controlled vocabulary growth, refused per [shared-vocabulary-federation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/shared-vocabulary-federation.md) — or (b) silently drop unrecognized predicates at admission, losing substrate content without surfacing the loss.

The bounded-vocabulary handshake makes the bound *explicit and per-link*.
Node $A$ federates with node $B$ over a vocabulary $V_{A \to B}$ (predicates $A$ will accept from $B$) and a vocabulary $V_{B \to A}$ (predicates $B$ will accept from $A$).
The two need not be the same.
Both are substrate content on the relevant peer-records.

## Handshake protocol

Per [shared-vocabulary-federation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/shared-vocabulary-federation.md)'s three phases, the FARS-substrate-specific shape:

### Phase 1: Vocabulary advertisement

Each node emits a `vocabulary-manifest` envelope (per [federation-envelope-record](../objects/federation-envelope-record.md) with `payload.kind: "vocabulary-manifest"`) listing the predicates it currently admits, each by its content-hash identity per [content-hash-addressing](../flatfile/content-hash-addressing/content-hash-addressing.md):

- **Predicate-id.** The canonical hash of the predicate's definition (the frontmatter key plus its declared schema).
  Two FARS nodes that admit the same predicate definition produce the same predicate-id; matching is by-content, not by-name.
- **Stability.** `stable` (the predicate is part of the node's committed vocabulary), `beta` (the predicate is recent and may change), or `experimental` (the predicate is provisional and may be retracted).
- **Source.** A reference to the substrate entity that defines the predicate (typically a definition note under `concepts/` or `objects/`).
  The reference lets the peer fetch the full definition if it does not already hold it.

### Phase 2: Intersection

Each node computes the intersection of its own admissible-vocabulary with the peer's advertised vocabulary.
The intersection is the *baseline agreed vocabulary* — predicates both nodes admit by content, requiring no translation.

### Phase 3: Mutual confirmation

Each node emits a `vocabulary-agreement` envelope listing the agreed vocabulary, signed by the node's identity-key (per [identity-key](../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-key.md)).
On both nodes' receipt of the peer's agreement, the peer-record's `agreed-vocabulary` field is set to the agreed predicate-ids and the federation link is *open for structured exchange*.

Until both nodes hold a recorded agreement, the peer-record's `agreed-vocabulary` is empty and `admit-federation-envelope` rejects all envelopes from that peer with a `bounded-vocabulary-handshake-not-complete` diagnostic on the `guard` channel.

## Vocabulary mismatch handling

When an envelope arrives carrying a predicate not in the agreed vocabulary, FARS's discipline (per [shared-vocabulary-federation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/shared-vocabulary-federation.md)'s catalog) admits four responses, declared per peer on the peer-record:

- **`reject`** — strictest.
  The envelope is refused at admission; the rejection is a `guard`-channel diagnostic event citing the unknown predicate.
- **`bridge`** — if a [federation-bridge](../../agent/federation/federation-bridge/federation-bridge.md) entity exists translating the foreign predicate to a known one, apply the bridge before admission.
  The bridge's fidelity (`exact`, `lossy`, `approximate`) is recorded in the resulting cells' provenance.
- **`quarantine`** — admit the envelope into a quarantine sub-region of the substrate (typically a `peers/<peer>/quarantine/` directory) without merging into the main substrate.
  Governance review per [governance-decision-modal-decidability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md) decides whether to extend the agreed vocabulary or to retain the quarantine.
- **`renegotiate`** — trigger a fresh handshake.
  The peer may have admitted a new predicate the receiver should also admit; rerunning the handshake updates both peer-records.

The choice per peer is itself substrate content; changing it requires emitting an event citing the change.

## Vocabulary growth

When a peer's advertised vocabulary includes a predicate the local node does *not* admit but might want to, the local node's governance per [governance-decision-modal-decidability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md) decides whether to admit it.
If approved:

1. The local node emits an `admit-predicate` event citing the predicate-id and the peer's manifest-id from which it was learned.
2. The closure-rule system version increments to include the new predicate's interpretation rules.
3. The handshake reruns; the agreed vocabulary now includes the new predicate.
4. Subsequent envelopes citing that predicate are admitted normally.

This is FARS's *organic vocabulary growth* mechanism — vocabulary spreads as nodes opt in to peers' predicates, not via a central standards body.

## What the discipline rules out

- **Implicit vocabulary admission.** A FARS realization that silently admits unknown predicates from federation peers (extending its vocabulary on the fly without governance) violates the discipline.
  Per [governance-decision-modal-decidability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md), vocabulary changes are governance-decidable events.
- **By-name predicate matching.** Per [content-hash-addressing](../flatfile/content-hash-addressing/content-hash-addressing.md) and [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), FARS matches predicates by canonical-form content-hash, not by frontmatter key name.
  Two nodes using the key `status` for predicates with different schemas SHALL NOT silently equate them.
- **Federation without prior handshake.** A FARS realization that admits envelopes from a peer with no recorded handshake violates the discipline.
  Per [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md), an unknown peer's accessibility is $\bot$; admitting their content would be admitting on $\bot$-trust without explicit policy.
- **Permanent agreed-vocabulary without revisitation.** A handshake is a substrate predication, but the agreed vocabulary is not infinitely durable: predicate definitions evolve, schemas drift, peers retire predicates.
  FARS realizations SHOULD periodically re-run the handshake (per a node-level policy on the peer-record); the rerun's output is the new agreed vocabulary.

## Position

Bounded-vocabulary handshake is FARS's *handshake-before-content* discipline.
Per [sovereign-node](../architecture/sovereign-node/sovereign-node.md), the receiving node owns the decision of what to admit; per this concept, the *vocabulary subset* of that decision is negotiated before any structured content flows.
The negotiation is itself substrate content (manifest envelopes, agreement envelopes, peer-record updates) — auditable, replayable, and revocable like any other substrate state.

The concept composes with [content-hash-addressing](../flatfile/content-hash-addressing/content-hash-addressing.md) (predicates are matched by content-hash), with [federation-envelope-record](../objects/federation-envelope-record.md) (the manifest and agreement are envelopes), with [peer-record](../code/structures/peer-record.md) (the agreed vocabulary is recorded there), and with [admit-federation-envelope](../code/transformers/admit-federation-envelope.md) (admission checks the agreed vocabulary).
