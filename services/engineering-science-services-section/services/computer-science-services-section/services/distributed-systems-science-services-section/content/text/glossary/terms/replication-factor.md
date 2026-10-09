---
description: The number of independent whole copies a storage system maintains of a given piece of data, the simplest redundancy mechanism against the loss of any one copy, and the baseline erasure coding is measured against for equal storage and bandwidth cost.
identity: replication-factor
name: Replication Factor
date-created: 2026-09-08
provenance:
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
Replication factor is the number of independent whole copies a storage system maintains of a given piece of data — a replication factor of three means three operators each hold a complete, byte-identical copy. Replication differs from erasure coding by storing whole copies rather than fragments: each replica alone suffices to serve the data, at the cost of redundancy that scales linearly with the number of copies kept, since doubling the replication factor doubles the storage footprint.

Hakim Weatherspoon and John Kubiatowicz's [quantitative comparison](https://www.cs.cornell.edu/people/egs/iptpsarchive/www.cs.rice.edu/Conferences/IPTPS02/170.pdf) (IPTPS 2002, Springer LNCS 2429) found that, at equal storage and bandwidth budgets, an erasure-coded system reaches a durability target that a replicated system would need many more whole copies to match — erasure coding achieves a comparable mean-time-to-loss using roughly an order of magnitude less storage and bandwidth than replication does.

The practical consequence is that a replication factor remains the right choice where simplicity and low-latency single-copy reads matter more than storage efficiency — small, frequently-read metadata, or a small number of operators who each want a fully independent, immediately usable copy rather than a fragment that must be reconstructed from several others before it is readable.
