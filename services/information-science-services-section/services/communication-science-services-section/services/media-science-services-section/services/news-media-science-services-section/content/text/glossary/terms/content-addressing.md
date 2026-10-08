---
name: "Content Addressing"
description: "The practice of identifying and retrieving data by a cryptographic hash of its own bytes rather than by a network or filesystem location, exemplified by IPFS's content-addressed Merkle DAG (Benet 2014, arXiv preprint) and its CID/multihash identifier format, which makes an identifier invariant to where or how many copies of the data exist and complements rather than substitutes for an append-only transparency log."
date-created: 2026-08-22
aliases: ["content-addressed storage", "hash-addressed storage"]
instance-of: systems-pattern
---


Content addressing identifies a piece of data by a cryptographic hash of the data itself, so the identifier is a function of content rather than of where the data happens to be stored — the inverse of location addressing, where an identifier such as a URL names a path on a specific server and reveals nothing about whether the bytes at that path have changed.
Retrieving by content hash means a consumer can verify, without trusting the source, that what arrived is exactly what was asked for; retrieving by location means trusting whatever the addressed location currently serves.
This distinction is documented in practitioner terms in [IPFS's content-addressing concept docs](https://docs.ipfs.tech/concepts/content-addressing/); it was not found stated as the explicit subject of a peer-reviewed source in this study's pass, and is carried here at practitioner tier.

The reference implementation is Juan Benet's
["IPFS - Content Addressed, Versioned, P2P File System"](https://arxiv.org/abs/1407.3561)
(arXiv:1407.3561, 2014) — an unrefereed preprint, **[UNVERIFIED as peer-reviewed]**, cited here at preprint tier only — which builds a content-addressed block store on a generalized [Merkle DAG](./merkle-tree.md): every block's identifier is a hash of its contents plus the hashes of every block it links to, so linked data structures (file trees, version histories) inherit the same content-addressing guarantee as individual blocks.
The identifier format is specified in the [CID (Content Identifier) specification](https://specs.ipfs.tech/cid/) and the [multiformats/cid](https://github.com/multiformats/cid) project, both practitioner-maintained living specs rather than standards-track documents.

For the claim infrastructure, content addressing is a complement to, not a substitute for, a [transparency log](./transparency-log.md): a content-addressed hash proves a given evidence bundle or claim-state snapshot is the exact one referenced, while a transparency log proves an append to a claim's history happened and nothing was later removed. A correction event can use a content address to point at the precise prior claim state it supersedes, while the log itself proves the correction was recorded and not silently retracted. See the [study of transparency logs and verifiable data structures](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-transparency-logs-and-verifiable-data-structures.md) for the fuller mapping to bets 2 and 3.
