---
name: "Merkle Tree"
description: "A binary tree of cryptographic hashes, originating with Ralph Merkle's 1987 CRYPTO paper, in which every non-leaf node is the hash of its children so a single root hash commits to an entire dataset and any one leaf's membership can be proven with a logarithmic-length path, making it the structural primitive under tamper-evident logging, Certificate Transparency, generalized transparency logs, and content-addressed Merkle DAGs alike."
date-created: 2026-08-22
aliases: ["hash tree", "Merkle hash tree"]
instance-of: data-structure
---


A Merkle tree (or hash tree) is a tree of cryptographic hashes in which each leaf holds the hash of a data block and each interior node holds the hash of its children's concatenated hashes, so the single root hash commits to every leaf beneath it.
Its origin is Ralph Merkle's
["A Digital Signature Based on a Conventional Encryption Function"](https://link.springer.com/chapter/10.1007/3-540-48184-2_32),
CRYPTO '87 (Springer LNCS 293, 1987),
which introduced the structure to build a signature scheme whose security rests only on a conventional hash function rather than on number-theoretic hardness assumptions.

The property that makes the structure useful far beyond signatures is proof size: membership of any single leaf, or a claim that the tree's contents have not changed between two points in time, can be proven with a number of hashes logarithmic in the tree's size, rather than by revealing the whole dataset.
Scott Crosby and Dan Wallach's
["Efficient Data Structures for Tamper-Evident Logging"](https://www.usenix.org/conference/usenixsecurity09/technical-sessions/presentation/efficient-data-structures-tamper-evident)
(USENIX Security 2009)
turned this into a general history-tree pattern for tamper-evident logs kept by an untrusted operator and checked by auditors —
the pattern Certificate Transparency ([RFC 6962](https://www.rfc-editor.org/rfc/rfc6962.html); [RFC 9162](https://datatracker.ietf.org/doc/html/rfc9162)) later deployed at internet scale, and that generalized transparency-log systems such as [Trillian](https://github.com/google/trillian) and sigstore's [Rekor](https://github.com/sigstore/rekor) build on directly.
The same primitive, used to link content blocks rather than log entries, underlies content-addressed systems: IPFS's [Merkle DAG](https://arxiv.org/abs/1407.3561) hashes and links data blocks so any block's identity is a function of its content and everything it references.

See the [study of transparency logs and verifiable data structures](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-transparency-logs-and-verifiable-data-structures.md) for how this primitive maps to the claim infrastructure's per-claim conformance bet.
