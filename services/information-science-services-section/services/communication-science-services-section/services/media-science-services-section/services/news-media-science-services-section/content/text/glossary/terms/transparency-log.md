---
name: "Transparency Log"
description: "An append-only, Merkle-tree-backed log run by an operator who cannot rewrite it undetected, cryptographically provable to any consumer via inclusion and consistency proofs, deployed first as Certificate Transparency under RFC 6962 and RFC 9162 and generalized since to software-signing (sigstore's Rekor, verified peer-reviewed at ACM CCS 2022) and key-binding (CONIKS, USENIX Security 2015) domains, and the pattern this program maps onto per-claim conformance."
date-created: 2026-08-22
aliases: ["append-only log", "tamper-evident log", "verifiable log"]
instance-of: systems-pattern
---


A transparency log is an append-only data structure, backed by a [Merkle tree](./merkle-tree.md), maintained by an operator that anyone can audit rather than trust: the log periodically publishes a signed root hash (a "tree head"), and any client can request an inclusion proof that a specific entry is present, or a consistency proof that an earlier tree head is a strict prefix of a later one, without downloading the whole log.
This turns "did the operator quietly remove or alter something" from a matter of trust into a matter of cryptographic proof, at logarithmic cost, as formalized by Scott Crosby and Dan Wallach's
["Efficient Data Structures for Tamper-Evident Logging"](https://www.usenix.org/conference/usenixsecurity09/technical-sessions/presentation/efficient-data-structures-tamper-evident)
(USENIX Security 2009).

The deployed instance is Certificate Transparency: [RFC 6962](https://www.rfc-editor.org/rfc/rfc6962.html) (Laurie, Langley & Kasper, 2013) and its successor [RFC 9162](https://datatracker.ietf.org/doc/html/rfc9162) (Laurie, Messeri & Stradling, 2021) specify public, append-only logs of issued TLS certificates, with the three-role model — log, monitor, auditor — set out in Ben Laurie's
["Certificate Transparency"](https://queue.acm.org/detail.cfm?id=2668154)
(ACM Queue, 2014).
The pattern has since been generalized beyond certificates: Google's [Trillian](https://github.com/google/trillian) provides a reusable transparent-log data store (practitioner-documented, now in maintenance mode in favor of Tessera per its own docs); sigstore's [Rekor](https://github.com/sigstore/rekor) applies the same pattern to software-artifact signing events, with the design formally described in the peer-reviewed
["Sigstore: Software Signing for Everybody"](https://dl.acm.org/doi/10.1145/3548606.3560596)
(Newman, Meyers & Torres-Arias, ACM CCS 2022); and CONIKS ([Melara et al., USENIX Security 2015](https://www.usenix.org/conference/usenixsecurity15/technical-sessions/presentation/melara)) extends it to end-user key bindings with efficient self-auditing of one's own entries.

For the claim infrastructure, a transparency log is the direct candidate substrate for **bet 3 (per-claim conformance)**: an append-only, publicly auditable log of claim states and corrections, CT-style, so a consumer can prove a publisher did not silently rewrite a claim's history.
Logging correction events into such a log also gives **bet 2 (correction propagation)** non-repudiation: a correction cannot be logged and later denied.
See the [study of transparency logs and verifiable data structures](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-transparency-logs-and-verifiable-data-structures.md) for the full mapping and its gaps, chief among them that no reviewed literature yet specifies a transparency-log schema for mutable claim *lifecycles* rather than append-only issuance or signing events.
