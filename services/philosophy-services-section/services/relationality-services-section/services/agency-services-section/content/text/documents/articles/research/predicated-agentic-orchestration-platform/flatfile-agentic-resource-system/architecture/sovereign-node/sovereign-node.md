---
name: sovereign-node
description: "FARS's commitment that one FARS realization is one sovereign node: a self-contained unit of substrate authority."
type: concept
class: federation-discipline
instantiates: [federation, predicated-computer]
depends-on: [flatfile, event-sourcing, content-hash-addressing, source-of-truth]
see-also: [peer-record, algebra-as-protocol, federation-trust-bilattice-graded, federation-envelope-record]
title: sovereign-node
---

# Sovereign node

FARS's commitment that *one FARS realization is one sovereign node*: a self-contained unit of substrate authority.
A sovereign node owns its own [flatfile](../../flatfile/flatfile.md) directory tree, its own [event log](event-sourcing.md), its own closure-rule system version, its own [`AgentRecord`](../objects/agent-record.md) population, and its own governance discipline.
Federation per [federation](../../teaching/explanations/federation.md) is *between* sovereign nodes, not *within* one.

Sovereign-node is FARS's instantiation of the AgOP-level [predicated-computer](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md): a predicated computer with its substrate fixed to flatfile, its value-domain fixed to the four-valued bilattice, its scheduler fixed to the heartbeat tick.
Two FARS sovereign nodes federating produce a *multi-node deployment* — they do not merge into a larger substrate; each remains the source-of-truth for its own content.

## What "sovereign" pins down

- **One event log per node.** A sovereign node has exactly one event log (per [event-sourcing](event-sourcing.md)).
  Events emitted at the node are appended to its log; events received from peers via [`admit-federation-envelope`](../../code/transformers/admit-federation-envelope.md) are appended to its log under a `federation-envelope` action with the peer's identity recorded as actor (per [`Event`](../objects/event.md)'s `actor` field).
  The receiving node's event log is *its own history*; the peer's contributions are entries in that history, not a separate stream.
- **One closure-rule system version active at any time.** Per [`settle`](../../code/transformers/settle.md)'s `rule_system_version` field, the node settles under one rule system version.
  Federation peers may run different rule-system versions; per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md), incoming envelopes are settled at the *receiver's* rule-system version, not the sender's.
- **One governance discipline.** The node's [`OfficeRecord`](../objects/office-record.md) population, its authorization predicates, its trust-graded peer accessibility relation (per [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md)) are all the node's substrate content.
  A peer's claim that an entity should be admitted is a *predication* the receiving node evaluates under its own governance — not a directive the receiver must obey.
- **One identity-record per node.** Per [identity-record](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-record.md), the node has one substrate-identity by which peers know it.
  The node's signing key (per [identity-key](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-key.md)) signs its outbound envelopes; peers verify against the node's published identity.

## Why this pins down the boundary

Without the sovereign-node discipline, "federation" would not be well-defined at the substrate level: two realizations could share a single event log (then they aren't peers, they're co-writers to one substrate); two realizations could share governance (then one's veto reaches into the other, which violates each side's authority); two realizations could share rule systems by reference (then a closure-rule edit at one node silently changes settlement at the other).

The sovereign-node concept rules each of those out.
Two FARS realizations are either (a) the *same* sovereign node — they share a substrate, an event log, a rule system version — or (b) *peers* — each owns its content, each runs its own settle, each accepts the other's content via federation envelopes evaluated at admission.
There is no in-between.

## Sovereignty under partition

A federation partition (the network between two peer nodes drops; a peer is offline; a peer is unreachable) does not affect either node's sovereignty.
Each node continues operating against its own substrate, its own closure rules, its own agents.
Outbound envelopes accumulate in the local event log under `federation-envelope` actions awaiting peer reachability (per [event-sourcing](event-sourcing.md)'s queueing semantics); on rejoin, the queued envelopes are delivered to the peer's `admit-federation-envelope` and merged into its substrate per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md).

This is the engineering content of *partition tolerance is structural*: the substrate's discipline does not depend on the network's reachability for any *local* operation.
Federation is an *additive* discipline on top of the local substrate's already-coherent operation.

## What sovereign-node is not

- **Not the same as a process.** A sovereign node is a substrate.
  A FARS realization MAY run as a single process, as a process pool serving the same substrate, as a cluster of processes coordinating reads against a shared filesystem — the *substrate identity* is the node, not the process.
  Two processes serving the same node act as one node for federation purposes.
- **Not the same as an organization.** A real-world organization may run several sovereign nodes (one per environment, one per team, one per geographic region).
  Each is its own sovereign node; the organization-level reconciliation is itself a federation between them.
- **Not bounded to one machine.** A sovereign node's flatfile substrate may live on one host's filesystem, or on a distributed filesystem (NFS, S3-mounted), or on a Git-versioned working tree shared across hosts.
  Multi-host realizations of one sovereign node SHALL coordinate so that all writes pass through the node's [`emit-event`](../../code/transformers/emit-event.md) and [`apply-edit`](../../code/transformers/apply-edit.md) discipline; concurrent writes that bypass that discipline produce substrate-invisible edits and SHALL be detected as coherence diagnostics.
- **Not a peer to a non-FARS substrate.** Cross-substrate federation (a flatfile FARS node federating with a Rust-engine node) is an AgOP-level concern outside this section's scope.
  FARS's federation discipline says how *flatfile-to-flatfile* sovereign nodes federate; the parent-theory's [federation-bridge](../../../agent/federation/federation-bridge/federation-bridge.md) handles the cross-substrate case.

## Position

Sovereign-node is FARS's *unit of federation*.
Every other federation concept in this section is parameterized over sovereign nodes: [peer-record](../../code/structures/peer-record.md) records *another* sovereign node from this node's perspective; [federation-envelope-record](../objects/federation-envelope-record.md) is what flows *between* sovereign nodes; [merge-peer](../../code/transformers/merge-peer.md) merges *another* node's content into this node's substrate; [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md) is the discipline that makes the federation-traffic structure substrate-algebra rather than ad-hoc protocol.

The concept composes with [governance](../../teaching/explanations/governance.md) (each sovereign node has its own; federation does not merge governance), with [scope](../../../scope/scope.md) (a federation peer is in a *foreign-peer* scope at this node's perspective), and with [agential-self-generation](../../../agent/agential-self-generation/agential-self-generation.md) (each sovereign node generates its own agent population; agents do not federate as agents but as predications about what an agent is).
