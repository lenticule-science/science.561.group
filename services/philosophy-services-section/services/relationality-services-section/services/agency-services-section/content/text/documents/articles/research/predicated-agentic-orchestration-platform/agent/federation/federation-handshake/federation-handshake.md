---
type: morphism
class: operator
realizes: [federation]
depends-on: [federation, federation-graph]
see-also: [outpost, inbox]
title: Federation handshake
description: The operator that establishes a federation edge between an outpost on one platform and an inbox on another (or on a different scope of the same platform).
---

# Federation handshake

The operator that establishes a federation edge between an [outpost](teaching/explanations/outpost.md) on one platform and an [inbox](teaching/explanations/inbox.md) on another (or on a different scope of the same platform).
The handshake exchanges identity predications, agrees on a the substrate's closure machinery version (either a shared $V$ or a bridging declaration), and produces routing predications on both sides.

Procedure:

1. **Identity exchange.** The local outpost emits a registration message to the candidate inbox, signed with the local platform's identity key.
  The candidate inbox verifies the signature against its known-identity registry; if the local platform is not yet registered, the inbox's [governance](teaching/explanations/governance.md) rules decide whether to admit a new identity.
2. **Version negotiation.** The two sides compare their the substrate's closure machinery version $V$.
  If equal, federation is direct.
  If unequal, both sides query their bridge registry for a declared bridge between the two versions; if a bridge exists, federation is via the bridge.
3. **Routing-predication insertion.** Both sides insert routing predications: the outpost records "this outpost routes to this inbox under version $V$ (or via bridge $B$)"; the inbox records "this inbox accepts messages from this outpost under version $V$ (or via bridge $B$)."
4. **Witness emission.** Both sides emit [witness](../../teaching/explanations/witness.md) entries recording the handshake: the participating identities, the version (or bridge), the resulting routing predications, the canonical hashes.

Three engineering properties:

- **Symmetric.** Both sides agree on the federation; either side can refuse and the handshake fails.
  This is the engineering content of *federation is consensual*.
- **Bridge-explicit.** If the two platforms run different versions, the bridge is named — its canonical hash, its translation table — in the routing predications.
  There is no implicit bridging; either the bridge exists and is declared, or federation is rejected.
- **Auditable.** The handshake is recorded as predications and witnesses on both sides.
  An auditor with access to both [event logs](../../../objects/event-log.md) reconstructs the handshake byte-for-byte.

federation was sometimes treated as a network-protocol concern external to the platform.
The modern formulation makes it a first-class operator producing first-class structure in the predication graph.
The handshake is a substrate-level event, not a protocol-level event; the resulting federation edge is a substrate-level entity, not a network configuration.
