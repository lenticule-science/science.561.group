---
description: A decentralized key-value lookup structure that partitions responsibility for a key space across every participating node according to a shared routing metric, so a node or piece of content can be located by identifier without a central directory.
identity: distributed-hash-table
name: Distributed Hash Table
date-created: 2026-09-08
provenance:
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  maymounkov2002:
    authors:
      - Petar Maymounkov
      - David Mazières
    title: "Kademlia: A Peer-to-Peer Information System Based on the XOR Metric"
    publication: 1st International Workshop on Peer-to-Peer Systems (IPTPS), Springer LNCS 2429
    year: 2002
    url: https://link.springer.com/chapter/10.1007/3-540-45748-8_5
---
A distributed hash table (DHT) partitions responsibility for a key space across every participating node according to a shared routing metric, so that looking up a key requires no central directory, only a bounded number of hops through nodes that each know a little about the whole space. Petar Maymounkov and David Mazières's [Kademlia](https://link.springer.com/chapter/10.1007/3-540-45748-8_5) (IPTPS 2002, Springer LNCS 2429) is the design most peer-to-peer stacks in production use: it routes lookups by an XOR-distance metric over node identifiers rather than by a coordinator, and every message a node exchanges also refines its own routing table, so the structure improves as it is used rather than depending on a maintained index a single operator runs.

This is a distinct concern from content addressing (which names *what* is being asked for by a hash of its bytes) and from replication or erasure coding (which decide *how many* independent copies or fragments of the named content exist). A DHT answers where a piece of content-addressed data currently lives, not whether a copy of it still exists anywhere, which is the separate question replication and erasure coding answer — a Kademlia lookup can complete correctly and still return no live holder if every holder has gone offline.

The consequence for censorship resistance is that a DHT's own resistance to a single compelled node is bounded by how many independent, honestly-behaving nodes are actually participating: an adversary who can populate enough fabricated identities into a victim's own routing table can substitute an eclipse attack for a legal or infrastructural takedown, which is why a DHT's stated threat model has to name identity-flooding, not just node compulsion, among what it claims resistance to.
