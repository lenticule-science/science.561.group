---
name: "Trusty URI"
aliases: [trusty-uris]
description: "A trusty URI is a URI that embeds a cryptographic hash of the canonicalized content it identifies, so that the identifier itself lets any consumer verify a linked-data resource has not been altered without needing to trust the server hosting it, proposed by Kuhn and Dumontier at ESWC 2014 and deployed as the addressing scheme of the nanopublication server network documented by Kuhn et al. in PeerJ Computer Science (2021)."
date-created: 2026-08-22
instance-of: data-structure
references:
  kuhn2014:
    authors: ["Tobias Kuhn", "Michel Dumontier"]
    title: "Trusty URIs: Verifiable, Immutable, and Permanent Digital Artifacts for Linked Data"
    publication: "The Semantic Web: Trends and Challenges (ESWC 2014), Springer; arXiv:1401.5775"
    year: 2014
    url: "https://arxiv.org/abs/1401.5775"
  kuhn2021:
    authors: ["Tobias Kuhn", "Ruben Taelman", "Vincent Emonet", "Haris Antonatos", "Stian Soiland-Reyes", "Michel Dumontier"]
    title: "Semantic Micro-Contributions with Decentralized Nanopublication Services"
    publication: "PeerJ Computer Science 7:e387"
    year: 2021
    url: "https://peerj.com/articles/cs-387/"
---

A **trusty URI** embeds a cryptographic hash of a canonicalized representation of a digital artifact directly into that artifact's own identifier.
[Kuhn & Dumontier (ESWC 2014, arXiv:1401.5775)](https://arxiv.org/abs/1401.5775) propose the scheme for linked-data resources specifically: an RDF graph is canonicalized to a fixed serialization, hashed, and the hash is appended to the resource's URI, so that verifying content integrity requires only recomputing the hash from the retrieved content and comparing it against the identifier — no separate trust in the hosting server or a certificate chain is needed.

## Use in nanopublication networks

Trusty URIs are the addressing scheme the nanopublication ecosystem runs on.
[Kuhn et al. (PeerJ Computer Science, 2021)](https://peerj.com/articles/cs-387/) document a decentralized network of independent servers that replicate and serve nanopublications addressed this way, with no central publishing authority and no approval delay between submission and distribution.
For a claim-state vocabulary, the same property gives each claim-version a self-verifying, content-addressed name: a downstream copy of a claim can check, from the identifier alone, whether the content it holds matches what was originally published, and can detect that a claim has changed without re-contacting the original publisher — directly relevant to correction propagation as a graph event.

## See Also

- [named-graph](./named-graph.md) — the unit a trusty URI is typically used to address
- the [study of statement-level metadata engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-statement-level-metadata-engineering.md), §5 and §9
