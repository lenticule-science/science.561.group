---
title: "Federation trust"
description: "How the OS trusts peer nodes. Trust graphs as substrate cells. Capability flow across federation respects sovereignty. No federation node has authority over another's local state."
kind: spec
status: normative
version: "0.4"
---


The 561 confederacy is sovereign.
Each member operates their own OS instance; no node has authority over another's local state.
Federation trust is **bilateral and explicit**, expressed as substrate cells, enforced by capability discipline.

This spec is load-bearing for v0.4 (federation) and integrates with [federation-protocol.md](../network/federation-protocol.md), [capability-model.md](capability-model.md), and [signing-and-witnessing.md](signing-and-witnessing.md).

## Grounded in

- [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — federation-trust is $\Box_R$ at the federation accessibility sub-region of the substrate's one accessibility relation.
  The bilateral asymmetry, scoping, and revocation properties (§4) are the per-surface specialization of the unified authorization primitive.
  Per [decisions/authorization-is-modal-restriction.md](../../decisions/authorization-is-modal-restriction.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Peer records

A peer node is a substrate cell:

```json
{
  "kind": "peer",
  "id": "<sha256>",
  "slug": "peer:reach-around.561.local",
  "node-id": "reach-around",
  "base-uri": "https://reach-around.561.local",
  "public-key": "<base64-32-bytes>",
  "sig-algorithm": "ed25519",
  "first-contact-at-ord": 1234,
  "active": "True"
}
```

Peers are discovered out-of-band initially; the captain manually adds the peer's public key and base-URI on first contact.
Future: DNS-SD or DID-based discovery.

## 2. Trust graph

Trust is a fiber over peers:

```json
{
  "subject": "peer:reach-around.561.local",
  "predicate": "trusted-for",
  "object": "scope:operational-coordination",
  "value": "True"
}
```

Peers can be trusted for different scopes:

- `scope:operational-coordination` — task dispatch, status updates, ledger sync.
- `scope:knowledge` — library cells, documentation, monograph references.
- `scope:governance` — charter clauses, decisions, votes.
- `scope:matrix-room:<id>` — specific Matrix rooms.
- `scope:public` — anything published publicly (lowest trust).

Higher-trust scopes confer more capability across federation; lower-trust scopes are restrictive.

## 3. Capability flow across federation

When peer A's signed event arrives at peer B:

1. B verifies the signature against A's public key (per [signing-and-witnessing.md](signing-and-witnessing.md)).
2. B looks up A's federation capability fiber: the composition of `(peer:A, trusted-for, scope:X)` cells with $\odot$.
3. The event's effect on B's substrate is bounded by A's capability fiber via $\Rightarrow$.
4. If A's capability is insufficient for the event's scope, the event is rejected with `PCF_PEER_SCOPE_VIOLATION`.

This means: peer A cannot grant B authority over predicates outside A's federation capability scope.
Peer A cannot impersonate B's personnel.
Peer A's capability is bounded.

## 4. Trust graph properties

The trust graph is:

- **Bilateral.** A trusts B does not imply B trusts A.
  Both directions are independent substrate cells.
- **Scoped.** Trust is per-scope, not blanket.
  Peer A may be trusted for `scope:knowledge` but not `scope:governance`.
- **Revocable.** A `trusted-for` cell can be retracted; the new $f$-value flows through capability fiber composition; A's effective authority drops.
- **Federable.** Trust graphs themselves can be federated: "B trusts A; B publishes 'I trust A'; C may use that as evidence for trusting A."
  But C makes the final decision.
- **Auditable.** Every trust change is a signed event in the log.

## 5. Sovereignty rules

Per [federation-protocol.md](../network/federation-protocol.md) §2:

- Sovereignty is "no node has authoritative state over another node's records."
- A node MAY refuse to accept a peer's events.
  Refusal is structural, not exceptional.
- A node MAY scope which of a peer's events it absorbs.
- Cross-peer entity-name collisions produce $\top$-cells, surfacing the disagreement honestly.

These rules are enforced via:

- The peer's federation capability fiber bounds what the peer's events can affect locally.
- Reject events outside the peer's scope at receive time (`PCF_PEER_SCOPE_VIOLATION`).
- $\odot$-merge handles concurrent edits; $\top$ retains the disagreement.

## 6. Trust establishment workflow

When the captain adds a new peer:

1. Out-of-band: exchange public keys (in person, via signed message, via secure channel).
2. Captain creates `(peer:new-peer, public-key, ...)
  ` and `(peer:new-peer, base-uri, ...)
  ` cells.
3. Captain creates `(peer:new-peer, trusted-for, scope:X)` cells per the agreed scope.
4. The new peer reciprocates on their substrate.
5. Federation sync begins; both peers exchange signed events.

A new peer with no trust grants gets `scope:public` capabilities only — they can publish their events but B's substrate ignores most of them until trust expands.

## 7. Trust graph ledger

Every trust-graph change is signed and logged:

- `(peer:X, trusted-for, scope:Y, t)` event signed by the captain.
- Federation peers can pull this event (if scope:public) and update their own view of the captain's trust graph.
- Auditing: query `(captain, trusted, peer:X)` over time; see the full history.

## 8. Cross-implementation determinism

Both Python and Rust implementations:

- Compute byte-identical capability fibers from the same trust graph.
- Reject the same events with the same error codes.
- Maintain byte-identical merge results when both peers have the same view of the trust graph.

## 9. Errors

| Code | Meaning |
|---|---|
| `PCF_PEER_UNKNOWN` | Event signed by an entity not in the peer table. |
| `PCF_PEER_UNREACHABLE` | Network failure to peer. |
| `PCF_PEER_SCOPE_VIOLATION` | Event outside the peer's allowed scope. |
| `PCF_TRUST_REVOKED` | Trust grant retracted; event from peer rejected. |
| `PCF_TRUST_GRAPH_CYCLE` | Trust grants form an unintended cycle (warning, not error). |

## 10. Implementation

### Python (v0.4+)

- Peer records as pydantic `Peer` model.
- Trust grants as substrate cells; aggregation via $\odot$-merge.
- Federation receive in `network/federation.py` performs scope check before applying events.

### Rust (v0.4+)

- Same as above with serde-derived structs.

## 11. Conformance

Federation trust passes:

1. **Sovereignty.** Peer A's event affecting predicates outside A's trust scope is rejected.
2. **Bilateral asymmetry.** A trusts B for scope:X; B does not trust A for scope:X.
  A's events about scope:X are admitted by B; B's events about scope:X to A may be rejected.
  Test: configure asymmetric trust; verify events flow asymmetrically.
3. **Revocation.** Retracting a `trusted-for` cell drops A's effective authority within one heartbeat tick.
4. **$\top$ on disagreement.** A and B disagree on a cell; merge produces $\top$; both views retained.
5. **Public scope.** A peer with `scope:public` only can publish but not affect non-public predicates.

## 12. Plan 9 / Unix analogue

| Unix concept | Federation trust analogue |
|---|---|
| `~/.ssh/authorized_keys` | Peer public-key cells |
| Sudoers file | Trust-graph cells (`trusted-for`) |
| Kerberos cross-realm trust | Federation trust between confederacy peers |
| `gpg --keyserver` | Public-key federation |
| ActiveDirectory forest trust | Confederacy trust graph |
