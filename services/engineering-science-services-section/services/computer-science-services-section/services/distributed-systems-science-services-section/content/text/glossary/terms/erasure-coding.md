---
description: Dividing data into n fragments such that any sufficient subset k of them reconstructs the whole, providing redundancy against fragment loss without the linear storage cost of keeping n whole copies.
identity: erasure-coding
name: Erasure Coding
provenance:
  date-created: 2026-09-08
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  weatherspoon2002:
    authors:
      - Hakim Weatherspoon
      - John Kubiatowicz
    title: "Erasure Coding vs. Replication: A Quantitative Comparison"
    publication: 1st International Workshop on Peer-to-Peer Systems (IPTPS), Springer LNCS 2429
    year: 2002
    url: https://www.cs.cornell.edu/people/egs/iptpsarchive/www.cs.rice.edu/Conferences/IPTPS02/170.pdf
---
Erasure coding divides data into n fragments such that any sufficient subset k of them reconstructs the whole, so a system can lose up to n minus k fragments without losing the data, while storing far less than n whole copies would cost. This differs from replication by storing fragments rather than whole copies: no single fragment alone is readable, so reconstructing the data requires fetching k fragments from k different operators before any of it becomes usable, raising per-read latency and coordination cost relative to a replica that is immediately readable on its own.

Hakim Weatherspoon and John Kubiatowicz's [quantitative comparison](https://www.cs.cornell.edu/people/egs/iptpsarchive/www.cs.rice.edu/Conferences/IPTPS02/170.pdf) (IPTPS 2002, Springer LNCS 2429) found erasure-coded systems reach a given durability target using roughly an order of magnitude less storage and bandwidth than replicated systems reach the same target with, and that an erasure-coded system's mean time to an unrecoverable loss runs many orders of magnitude higher than a replicated system's at equal resource cost.

This is why production storage-provider markets such as Filecoin default to erasure coding for bulk data (sealing a sector into fragments a provider must keep proving it still holds) while keeping whole-copy replication for small, latency-sensitive metadata that must be read in full on every access. For a corpus a house wants resistant to removal, erasure coding buys more independent-operator redundancy per stored byte than replication does, at the cost of every read depending on several operators, not one, remaining reachable at once.
