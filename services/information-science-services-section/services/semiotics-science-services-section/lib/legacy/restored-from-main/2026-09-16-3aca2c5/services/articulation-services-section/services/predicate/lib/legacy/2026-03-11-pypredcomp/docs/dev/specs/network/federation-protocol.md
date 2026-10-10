---
title: "Federation protocol"
description: "Peer-to-peer record sync. Sovereign nodes coordinating through the bilattice algebra. The algebra IS the protocol."
kind: spec
status: normative
version: "0.1"
sources:
  - "operations/engineering/triage/operations/engineering/research/agentic-orchestration-platform/triage/fars-analyses/analyzing-fars-federation-and-distribution-across-research.md"
  - "operations/engineering/triage/operations/command/ideas/triage/{ unified-architecture-from-sender-identity, fars-faoh-mash-architecture-from-first-principles }.md"
---


Federation is sovereign nodes coordinating through a shared algebra. **The algebra IS the protocol.** No separate federation layer; the bilattice's $\odot$/$\Rightarrow$ operators and the predication-cell wire format compose unmodified across node boundaries.

## 1. The federation principle

The bilattice's knowledge join $\vee_k$ (which decomposes to $\odot$ on the witness-pair encoding) is a CRDT: commutative, associative, idempotent.
Two nodes that independently observe the same cell can merge their observations via $\vee_k$ without coordination, conflict-free.

Federation does not need:

- A consensus protocol.
- A global ordering.
- A leader/follower election.
- A separate merge resolver.

Federation does need:

- Content-hash addressing (so the same record on two nodes has the same id).
- Signed records (so receiving nodes can verify provenance).
- Per-cell merge via $\odot$ at substrate-receive time.
- Per-rule provenance preservation (so a peer's rule fires under its provenance, not anonymously).

## 2. Sovereign nodes

Each member of the 561 confederacy operates their own substrate node:

- Their own `$ROOT`.
- Their own event log.
- Their own closure-rule set (with overlap as agreed).
- Their own MCP / HTTP surface.

Sovereignty is not "everyone is equal"; sovereignty is "no node has authoritative state over another node's records."
Specifically:

- A node MAY refuse to accept a peer's events.
  Refusal is structural, not exceptional.
- A node MAY scope which of a peer's events it absorbs (some channels, some entity-types).
- A node MAY contribute records that name other peers' entities; those nodes can choose to absorb or not.
- Nothing in the protocol prevents two nodes from disagreeing — disagreement surfaces as $\top$ at the relevant cells.

## 3. Wire format

Federation messages are substrate events (per [event-log.md](event-log.md)) plus envelope metadata:

```json
{
  "event": <a canonical event from the peer's log>,
  "peer": "peer-node-id",
  "signature": "base64",
  "sig_alg": "ed25519",
  "received_at": "<wall-clock for instrumentation>"
}
```

The envelope wraps the event during transport; once verified, the inner event is appended to the receiving node's log with `peer = "<peer-node-id>"` set on its envelope.

## 4. Content-hash addressing

Every record's identity is `SHA-256(canonical_bytes)`.
Two nodes referencing the same record by id are referencing the *same record*.
There is no per-node UUID; there is no central allocator.

This means:

- Replicating a cell from peer A to peer B does not mint a new id.
  The id stays.
- A cell-record file at `$ROOT/cells/<pp>/<id>.json` on peer B is *byte-identical* to the same id on peer A.
- Federated rule records are likewise content-addressed.
- Federation peers can safely use Git-pull-style sync: "give me everything since `<event-id>`."

## 5. Sync protocol

### 5.1 Pull (long-poll)

Peer A pulls from peer B:

```
GET /federation/sync?since_event_id=<id>&until_event_id=<id-or-empty>
```

B responds with a stream of canonical events, in event-ordinal order, each wrapped in the federation envelope.
Long-poll: if A is up-to-date, the connection holds open until new events arrive.

### 5.2 Push

Peer A pushes to peer B:

```
POST /federation/push
body: array of federation envelopes
```

B verifies signatures; if valid and the events satisfy local invariants, appends them; otherwise rejects with `PCF_*` codes per envelope.

### 5.3 Bidirectional / WebSocket

For low-latency federation (e.g., live messaging), peers MAY open a WebSocket on `/federation/stream` and exchange events bidirectionally.
The protocol is the same envelope format.

### 5.4 Eventually consistent

Federation is eventually consistent.
There is no global lock, no consensus, no quorum.
Each node's view is its own view; periodic sync brings views into agreement on cells that didn't disagree, and into honest $\top$ on cells that did.

This is the right shape because:

- Confederacy members may operate from different jurisdictions, time zones, network partitions.
- Real-time consensus would require a leader; the confederacy has no leader.
- The bilattice handles divergence honestly — $\top$ is a real value, not a bug.

## 6. Signature verification

Each event is signed by its authoring entity.
The signature covers the canonical bytes of the event (without the envelope's `peer`/`signature` fields).

Default algorithm: Ed25519.
Other algorithms MAY be configured per-node.

A peer's public key is itself a substrate cell:

```
(peer:<peer-node-id>, public-key, "<base64>") = t
(peer:<peer-node-id>, sig-algorithm, "ed25519") = t
```

Receiving nodes verify the signature against the sender's public key.
Verification failure → `PCF_SIGNATURE_INVALID`.
Unsigned events MAY be accepted with reduced trust (configurable).

## 7. Merge semantics

When peer B receives an event from peer A whose `kind = "cell"`:

1. Validate envelope, signature.
2. Look up the cell's current value in B's substrate.
3. $\odot$-merge A's value with B's: new_value = a_value ⊙ b_value.
4. If new_value differs from b_value, append a `cell` event to B's log with the new value, `peer = "peer-A-id"`, and a `cell-merge` repair-log annotation.
5. Closure rules fire on the new value; settlement proceeds normally.

If the merge produces $\top$ (two sources, opposite directions):

- The cell value is $\top$.
  Neither source is "right"; both are retained.
- Downstream rules see $\top$ and act explicitly.
- The merge-resolution UI ([apps/governance.md](apps/governance.md)) presents the disagreement.

## 8. Peer scope

A receiving node may scope which of a peer's events it absorbs.
Scoping is a closure rule applied at receive time:

```
(peer:<peer>, scope-restriction, <predicate-pattern>) = ...
```

If the rule fires `f` on an event, the event is rejected (`PCF_PEER_SCOPE_VIOLATION`) without being applied.

Default scope is permissive: any signed event from a known peer is absorbed.
Restrictive scopes are configured per-deployment.

## 9. Discovery

Peer discovery is out-of-band initially:

- Captain manually configures peer entries (substrate cells in `(peer:<id>, base-uri, ...)
  `).
- Peers exchange their public keys on first connection.
- Trust is bilateral and explicit.

Future: a discovery interfacer (DNS-SD, DID-based) MAY be added; the substrate doesn't constrain it.

## 10. Errors

| Code | Meaning |
|---|---|
| `PCF_SIGNATURE_INVALID` | Event signature did not verify. |
| `PCF_PEER_UNREACHABLE` | Network failure to peer. |
| `PCF_PEER_UNKNOWN` | Event signed by an entity not in the peer table. |
| `PCF_PEER_SCOPE_VIOLATION` | Event outside the peer's allowed scope. |
| `PCF_MERGE_PREDICATE_GAP` | Peer references a predicate the local substrate doesn't define. |
| `PCF_MERGE_RULE_CONFLICT` | Same rule-id, different bytes between peers. |
| `PCF_PROTOCOL_VERSION_MISMATCH` | Peer's protocol version is incompatible. |

## 11. Bandwidth and selective sync

For ICS deployments (sensors writing thousands of events/sec), full mesh federation is impractical.
The substrate supports **selective sync**:

- Peer A subscribes only to events touching specific entities or predicates.
- B applies the filter at send time; only matching events are pushed.

The filter itself is a closure-rule pattern.
This is the same machinery as scope; the wire is the same.

## 12. The federation surface, summarized

| Operation | URL / Tool | Effect |
|---|---|---|
| Pull | `GET /federation/sync?since=<id>` | Stream events since id. |
| Push | `POST /federation/push` | Receive events. |
| Bidir | `GET /federation/stream` (WebSocket) | Exchange events. |
| Peer status | `GET /federation/peer/<id>` | Sync state, public key, scope. |
| MCP `peers` tool | listed in [mcp-surface.md](mcp-surface.md) | Same data. |
| MCP `sync_peer` tool | manual sync trigger | For ops. |

## 12.1. Algebraic contract

This protocol conforms to [`network-algebraic-contract.md`](network-algebraic-contract.md): every admit/reject is a $\Box_R^{\mathrm{net}}$ evaluation; per-peer rate envelopes compose under the substrate quantale; the federation handshake exchanges regime declarations and computes the regime meet (always defined on the total chain `strict ≤ scott-continuous ≤ transfinite-bounded ≤ aperiodic`; the meet is the weaker / more-restrictive envelope per [`process/multi-regime-session.md`](../process/multi-regime-session.md) §1).
Federation messages outside the agreed scope prefix are rejected with `PCC_FEDERATION_REGIME_MISMATCH` per `multi-regime-session.md` §4.
This protocol is the v0.1 instance of the contract and cites it by reference.

## 13. Why this matters

The 561 group is a confederacy.
Federation is not a feature; it is the substrate's commitment to confederacy as a *structural* fact.
Single-node operation is one configuration; the substrate is built so federated operation requires no rewrite, only configuration of peer entries and signature keys.
