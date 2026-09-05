---
type: question
status: open
explores: [federation-bridge, federation-envelope, predication-graph-store, conformance]
see-also: [federation-convergence, doctrine-fidelity-compositionality]
---

# Where should the bounded-vocabulary handshake protocol live in PC?

PC carries [federation-bridge](../objects/federation-bridge.md) — the substrate-record that translates predicates (and adjacent vocabulary) across a federation boundary. A bridge from $A$'s predicate $p_A$ to $B$'s predicate $p_B$ admits cells about $p_A$ from $A$ as cells about $p_B$ at $B$ (subject to bridge-discipline checks).

But PC does not specify the **protocol for establishing which bridges (or absence-of-bridges) two peers have agreed to** before substrate cells flow between them. The question this surfaces:

- **Should two federating substrates be required to handshake on their agreed predicate vocabulary** before any non-handshake `federation-envelope` carries cells? Without an explicit handshake, an envelope arriving at $B$ carrying a predicate $B$ does not recognize forces $B$ into a default policy (silently bridge if any bridge exists; reject if no bridge; quarantine for governance) that may or may not match the sender's expectation.
- **What is the substrate-record shape of the handshake?** Plausibly: each peer records (in its peer-record-equivalent for the other peer) an `agreed-vocabulary` field, populated by exchange of `vocabulary-manifest` envelopes (each peer publishes its full predicate vocabulary plus the federation-bridges it offers) and `vocabulary-agreement` envelopes (the intersection — the predicates both peers commit to admitting cells about, plus the bridges the receiver commits to applying).
- **What discipline does the handshake have to satisfy?** Plausibly: (a) explicitness — `agreed-vocabulary` is substrate-recorded on both sides, not implicit in transport-layer state; (b) revocability — either peer can emit a fresh `vocabulary-manifest` retracting predicates, with subsequent admissions rejected per the new vocabulary; (c) composability — a peer's `agreed-vocabulary` with peer $B$ is independent of its `agreed-vocabulary` with peer $C$; (d) governance-decidability — extending `agreed-vocabulary` is a substrate-visible decision per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md).

The flatfile sub-theory authored [bounded-vocabulary-handshake](theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/bounded-vocabulary-handshake.md) as a FARS-local concept. A future AgOP example over a different substrate would presumably need the same protocol (different substrates do not share predicate vocabularies by default any more than different flatfile nodes do); authoring it locally each time risks divergent disciplines.

The question is **whether the handshake protocol should be a PC concept** (alongside `federation-bridge` and `federation-envelope`), specifying the substrate-general shape of the handshake's manifest/agreement exchange and the discipline above. PC concepts are substrate-general and AgOP examples instantiate them at their substrate-specific record shapes; the handshake protocol fits this shape.

Alternatively, the handshake may be best filed at the AgOP layer (since federation across heterogeneous predicate vocabularies is more an agential-orchestration concern than a substrate-level one), or stay distributed across sub-theories with no parent (each sub-theory documents its handshake locally with cross-references).

A resolution would pick one of these three homes and either author the parent concept or document why no parent is wanted.
