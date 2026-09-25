---
type: concept
class: pattern
depends-on: [outpost, inbox]
see-also: [governance, scope]
title: Federation
description: The platform's pattern for connecting two or more predicated computers — or two or more scopes on the same computer — so that messages emitted from one outpost reach the other's inbox, and so that two settled predication-graph regions can…
---

# Federation

The platform's pattern for connecting two or more [predicated computers](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md) — or two or more [scopes](../../scope/scope.md) on the same computer — so that messages emitted from one [outpost](outpost.md) reach the other's [inbox](inbox.md), and so that two settled predication-graph regions can be combined via the substrate's [merge](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/merge.md).
Federation is the structural property that makes the platform support multi-tenant, multi-organization, and multi-deployment configurations without requiring a centralized coordinator.

Three engineering structures realize federation:

- **Routing predications.** Each outpost carries predications declaring which scopes (or which remote predicated computers) it routes to, what authentication is required, what canonical-form translation (if any) is performed at the boundary.
  The routing predications are the federation graph's edges.
- **Authentication via signed witnesses.** A federated message arriving at an inbox carries a [witness](../../teaching/explanations/witness.md) signed by the sending outpost's identity key.
  The recipient's inbox verifies the signature against the sender's known identity predications; messages without valid signatures are dropped at the inbox and recorded as drops in the [event log](../../../objects/event-log.md).
- **Merge-on-receive.** When a federated message includes a settled predication-graph fragment, the recipient applies merge to combine the fragment with the local store.
  The substrate-level convergence property guarantees that two recipients receiving the same set of fragments in different orders converge to the same state.
  (See [replication](../../../../../../../../../../content/text/documents/articles/notes/replication.md) for the substrate's convergence discipline.)

Federation is *not* the same as scope hierarchy.
A scope contained in another scope shares the same operator specifications by construction; the inner scope is compatible with the outer.
Two federated computers may run different operator specifications, and federation between them includes a *bridge* — a substrate entity that records a translation between the two specifications' vocabularies.
A bridge is itself a substrate entity (per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md)) and is signed by an authority both computers recognize.
Without a bridge, federation between mismatched specifications is rejected at the inbox.

The federation pattern resolves three engineering concerns at the substrate level:

- **Coordination across distributed instances.** Resolved by the substrate's merge: replicas converge by exchanging events and re-merging.
- **Trust boundaries.** Resolved by signed-witness authentication: each inbox declares which outposts it admits, by their identity predications.
- **Partition tolerance.** Resolved by the inbox's append-only discipline: messages queue at the outpost when the network is unavailable; on reconnection they are delivered in canonical-hash order, and the recipient applies them as ordinary substrate events.
