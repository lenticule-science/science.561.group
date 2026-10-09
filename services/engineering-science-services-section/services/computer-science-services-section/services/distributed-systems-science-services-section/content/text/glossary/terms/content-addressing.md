---
description: Identifying and retrieving data by a cryptographic hash of its own bytes, so the identifier is a function of content rather than of network or filesystem location, letting any independent holder of the same bytes serve the same request.
identity: content-addressing
name: Content Addressing
date-created: 2026-09-08
provenance:
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  merkle1987:
    authors:
      - Ralph C. Merkle
    title: A Digital Signature Based on a Conventional Encryption Function
    publication: CRYPTO '87, Springer LNCS 293
    year: 1987
    url: https://link.springer.com/chapter/10.1007/3-540-48184-2_32
  benet2014:
    authors:
      - Juan Benet
    title: IPFS - Content Addressed, Versioned, P2P File System
    publication: arXiv:1407.3561
    year: 2014
    url: https://arxiv.org/abs/1407.3561
    note: unrefereed preprint, cited at preprint tier only
---
Content addressing identifies a piece of data by a cryptographic hash of the data's own bytes, so the identifier is a function of content rather than of where the bytes are currently stored. This is the inverse of location addressing, where an identifier such as a URL names a path on a specific server and reveals nothing about whether the bytes currently served at that path have changed.

Ralph Merkle's [hash-tree construction](https://link.springer.com/chapter/10.1007/3-540-48184-2_32) (CRYPTO '87, 1987) supplies the structural primitive: linking content blocks by the hashes of their children lets a whole tree of data — not just one block — be named by a single root hash, so a directory, a version history, or an entire dataset inherits the same content-addressing guarantee as an individual block. Juan Benet's [IPFS preprint](https://arxiv.org/abs/1407.3561) (arXiv:1407.3561, 2014, unrefereed) builds a content-addressed block store on exactly this generalized Merkle-tree structure, with the CID/multihash identifier format specified at the [CID specification](https://specs.ipfs.tech/cid/).

Because the identifier does not name a server, any independent operator holding the same bytes can answer the same request, so no single operator's removal of its copy changes what the identifier resolves to elsewhere — a consumer retrieving by content hash can verify, without trusting whichever operator happened to answer, that what arrived is exactly what was asked for. This is the precondition every mechanism in this section's distributed-hash-table, replication, erasure-coding, and pinning terms builds on: none of them can name a redundant copy as equivalent to another unless both copies carry the same content-derived identifier.
